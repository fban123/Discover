
import RxSwift
import RxCocoa

class HomePresenter {
    
    private let customPickUseCase: CustomPickUseCaseProtocol!
    private let router: DashboardRouterProtocol!
    
    init(customPickUseCase: CustomPickUseCaseProtocol,
         router: DashboardRouterProtocol) {
        self.customPickUseCase = customPickUseCase
        self.router = router
    }
    
    var bestCoffee: Observable<CustomPickViewModel> {
        customPickUseCase
            .bestCoffee
            .compactMap { [weak self] bestCoffee in
                return self?.mapToViewModel(bestCoffee)
            }
            .withPresenterThreading()
    }
    
    var liveGigs: Observable<CustomPickViewModel> {
        customPickUseCase
            .liveGigs
            .compactMap { [weak self] liveGigs in
                return self?.mapToViewModel(liveGigs)
            }
            .withPresenterThreading()
    }
    
    private func mapToViewModel(_ customPick: CustomPick) -> CustomPickViewModel {
        let venues = mapToViewModel(customPick.venues)
        return CustomPickViewModel(title: customPick.title,
                            venues: venues,
                            tags: customPick.tags)
        
    }
    
    private func mapToViewModel(_ venues: [VenueDetails]) -> [VenueViewModel] {
        venues
            .map {
                VenueViewModel(id: $0.id,
                               image: .remote(url: $0.photoURL),
                               title: $0.name,
                               caption: $0.caption,
                               address: $0.address,
                               isHot: $0.isHot)
            }
    }
    
    func handleCustomPickItemSelected(with id: Int) {
        router.showVenueDetailsScreen(with: id)
    }
    
    func handleTagTapped(with name: String) {
        router.showFilteredVenues(by: name)
    }
    
}
