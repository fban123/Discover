
import RxCocoa
import RxSwift

class VenueDetailsPresenter {
        
    private let venueId: Int!
    private let venueDetailsUseCase: VenueDetailsUseCaseProtocol!
    private let router: DashboardRouterProtocol!
    
    init(venueDetailsUseCase: VenueDetailsUseCaseProtocol, router: DashboardRouterProtocol, venueId: Int) {
        self.venueDetailsUseCase = venueDetailsUseCase
        self.router = router
        self.venueId = venueId
    }
    
    var venueDetails: Observable<VenueDetails> {
        venueDetailsUseCase
            .getVenueDetails(with: venueId)
            .withPresenterThreading()
    }
    
    func handleTagTapped(with name: String) {
        router.showFilteredVenues(by: name)
    }
    
}
