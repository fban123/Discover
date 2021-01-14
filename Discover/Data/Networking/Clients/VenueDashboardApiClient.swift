
import Alamofire
import RxSwift

class VenueDashboardApiClient: VenueDashboardApiClientProtocol {

    private let baseClient: BaseAPIClient

    init(baseClient: BaseAPIClient) {
        self.baseClient = baseClient
    }

    var networkResponse: Single<VenueDashboardResponse> {
        baseClient.get(path: NetworkAPIConstants.basePath, resultType: VenueDashboardResponse.self)
    }

}
