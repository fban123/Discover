
import RxSwift

class VenueDetailsUseCase: VenueDetailsUseCaseProtocol {
        
    private let repository: VenueDashboardRepositoryProtocol!
    
    init(repository: VenueDashboardRepositoryProtocol) {
        self.repository = repository
    }
    
    func getVenueDetails(with id: Int) -> Observable<VenueDetails> {
        repository
            .getVenues()
            .asObservable()
            .map {
                $0.filter {
                    $0.id == id
                }
            }
            .compactMap { $0.first }
            .subscribeOnUtility()
    }
    
}
