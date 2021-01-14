
import Foundation

extension AppRouter: DashboardRouterProtocol {
    
    func showVenueDetailsScreen(with id: Int) {
        let venueDetailsViewController = container.resolve(VenueDetailsViewController.self, args: id)
        
        pushViewController(venueDetailsViewController)
    }
    
    func showFilteredVenues(by name: String) {
        let filteredVenuesViewController = container.resolve(FilteredVenuesViewController.self, args: name)
        
        pushViewController(filteredVenuesViewController)
    }
    
}
