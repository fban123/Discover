
import RxSwift

protocol VenueDashboardApiClientProtocol {
    
    var networkResponse: Single<VenueDashboardResponse>  { get }
    
}
