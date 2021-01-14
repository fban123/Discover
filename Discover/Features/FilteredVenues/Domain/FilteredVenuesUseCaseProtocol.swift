
import RxSwift

protocol FilteredVenuesUseCaseProtocol {
    
    func getVenues(filter: String) -> Observable<[VenueDetails]>
    
}
