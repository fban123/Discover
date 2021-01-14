
import RxSwift

protocol VenueDashboardRepositoryProtocol {
    
    func getBestCoffee() -> Observable<CustomPick>
    
    func getLiveGigs() -> Observable<CustomPick>
    
    func getVenues() -> Observable<[VenueDetails]>
}
