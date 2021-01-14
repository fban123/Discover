
import RxSwift

protocol VenueDetailsUseCaseProtocol {
    
    func getVenueDetails(with id: Int) -> Observable<VenueDetails>
    
}
