
import Reachability
import RxSwift
import RxCocoa

class VenueDashboardRepository: VenueDashboardRepositoryProtocol {
    
    private let networkClient: VenueDashboardApiClientProtocol!
    private let reachability: Reachability?
    
    private let venuesBehaviorRelay = BehaviorRelay<Set<VenueDetails>>(value: Set<VenueDetails>())
    private let bestCoffeePublishSubject = PublishSubject<CustomPick>()
    private let liveGigsPublishSubject = PublishSubject<CustomPick>()
    private let disposeBag = DisposeBag()
    
    init(networkClient: VenueDashboardApiClientProtocol,
         reachability: Reachability?) {
        self.networkClient = networkClient
        self.reachability = reachability
        getData()
    }
        
    func getBestCoffee() -> Observable<CustomPick> {
        return bestCoffeePublishSubject
            .shareAndSubscribeOnUtility()
    }
    
    func getLiveGigs() -> Observable<CustomPick> {
        return liveGigsPublishSubject
            .shareAndSubscribeOnUtility()
    }
    
    func getVenues() -> Observable<[VenueDetails]> {
        return venuesBehaviorRelay
            .map { Array($0).sorted { $0.name < $1.name } }
            .shareAndSubscribeOnUtility()
    }
    
    private func getData() {
        switch reachability?.connection {
        case .unavailable:
            print("No Internet")
        default:
            networkClient
                .networkResponse
                .asObservable()
                .subscribeOnUtility()
                .subscribe(onNext: { [weak self] in
                    let customPicksVenues = $0.customPicks.map { $0.venues }.flatMap { $0 }
                    let trendingVenues = $0.trending
                    self?.venuesBehaviorRelay.accept(Set(customPicksVenues + trendingVenues))
                    $0.customPicks.forEach { [weak self] customPick in
                        if customPick.title == CustomPickTitle.bestCoffee.rawValue {
                            self?.bestCoffeePublishSubject.onNext(customPick)
                        } else if customPick.title == CustomPickTitle.liveGigs.rawValue {
                            self?.liveGigsPublishSubject.onNext(customPick)
                        }
                    }
                })
                .disposed(by: disposeBag)
        }
    }
    
}

enum CustomPickTitle: String {
    case bestCoffee = "Best coffee"
    case liveGigs = "Live gigs"
}
