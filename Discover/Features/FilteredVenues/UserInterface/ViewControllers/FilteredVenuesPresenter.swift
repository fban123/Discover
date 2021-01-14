
import RxSwift
import RxCocoa

class FilteredVenuesPresenter {
    
    private let filteredVenuesUseCase: FilteredVenuesUseCaseProtocol!
    private let router: DashboardRouterProtocol!
    private let venuesFilter: String!
    
    init(filteredVenuesUseCase: FilteredVenuesUseCaseProtocol,
         router: DashboardRouterProtocol,
         venuesFilter: String) {
        self.filteredVenuesUseCase = filteredVenuesUseCase
        self.router = router
        self.venuesFilter = venuesFilter
    }
    
    var venues: Observable<[VenueViewModel]> {
        filteredVenuesUseCase
            .getVenues(filter: venuesFilter)
            .compactMap { [weak self] venues in
                return self?.mapToViewModel(venues)
            }
            .withPresenterThreading()
    }
    
    var headerFilterCategory: String {
        return venuesFilter
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
    
    func handleVenueItemSelected(with id: Int) {
        router.showVenueDetailsScreen(with: id)
    }
    
}
