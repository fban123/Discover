
import RxSwift
import Alamofire

public class BaseAPIClient {
    
    private let queue = DispatchQueue(label: "api.queue", qos: .utility, attributes: .concurrent)
    private let baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    public func get<T: Decodable>(path: String, resultType: T.Type) -> Single<T> {
        return executeAndReturn(path: path, method: .get, resultType: resultType)
    }
    
    private func executeAndReturn<T: Decodable>(path: String, method: HTTPMethod, resultType: T.Type) -> Single<T> {
        return Single.create { [weak self] observer in
            guard let self = self else {
                observer(.error(ApiError.general))
                return Disposables.create()
            }
            self.buildRequest(path: path, method: method)
                .validate(statusCode: 200..<300)
                .responseJSON(queue: self.queue) { response in
                    if let error = response.error {
                        print("Got error: \(error)")
                        observer(.error(error))
                    } else if let data = self.parse(data: response.data, resultType: resultType) {
                        observer(.success(data))
                    } else {
                        observer(.error(ApiError.noData))
                    }
                }
            return Disposables.create()
        }
    }
    
    private func buildRequest(path: String, method: HTTPMethod) -> DataRequest {
        let url = baseUrl + path
        print("\(method.rawValue) - \(url)")
        return AF.request(url, method: method)
    }
    
    private func parse<T: Decodable>(data: Data?, resultType: T.Type) -> T? {
        guard let data = data else {
            print("Data does not exist...")
            return nil
        }
        do {
            return try JSONDecoder().decode(resultType, from: data)
        } catch {
            print("Unexpected error on decoding data to \(resultType.self)! (\(error)")
            return nil
        }
    }
    
}
