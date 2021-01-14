
import Reachability
import Resolver

class APPDIContainer {
    
    lazy var appRouter: AppRouter = {
        return container.resolve()
    }()
    
    private lazy var container: Resolver = {
        let container = Resolver()
        registerAppDependencies(in: container)
        return container
    }()
    
    private func registerAppDependencies(in container: Resolver) {
        registerUrls(in: container)
        registerRouters(in: container)
        registerClients(in: container)
        registerServices(in: container)
        registerRepositories(in: container)
        registerUseCases(in: container)
        registerPresenters(in: container)
        registerViewControllers(in: container)
    }
    
    private func registerUrls(in container: Resolver) {
        container
            .register(String.self, name: AppDependencies.apiBaseUrl.rawValue) {
                NetworkAPIConstants.baseUrl
            }
            .scope(Resolver.application)
    }
    
    private func registerRouters(in container: Resolver) {
        container
            .register(name: AppDependencies.rootNavigationController.rawValue) {
                UINavigationController()
            }
            .scope(Resolver.application)
        
        container
            .register { _ -> AppRouter in
                let rootNavigationController = self.container.resolveRootNavigationController()
                return AppRouter(container: container, rootNavigationController: rootNavigationController)
            }
            .scope(Resolver.application)
        
        container
            .register(DashboardRouterProtocol.self) {
                let appRouter: AppRouter = container.resolve()
                return appRouter
            }
            .scope(Resolver.application)
    }
    
    private func registerClients(in container: Resolver) {
        container
            .register(BaseAPIClient.self, name: AppDependencies.apiBaseClient.rawValue) {
                let baseUrl = container.resolve(String.self, name: AppDependencies.apiBaseUrl.rawValue)
                return BaseAPIClient(baseUrl: baseUrl)
            }
            .scope(Resolver.application)
        
        container
            .register(VenueDashboardApiClientProtocol.self) {
                let baseClient: BaseAPIClient = container.resolveApiClient()
                return VenueDashboardApiClient(baseClient: baseClient)
            }
            .scope(Resolver.application)
    }
    
    private func registerServices(in container: Resolver) {
        container
            .register { _ -> Reachability? in
                do {
                    return try Reachability()
                } catch let error {
                    print("Unable to start notifier: \(error.localizedDescription)")
                    return nil
                }
            }
            .scope(Resolver.unique)
    }
    
    private func registerRepositories(in container: Resolver) {
        container
            .register(VenueDashboardRepositoryProtocol.self) {
                return VenueDashboardRepository(networkClient: container.resolve(),
                                                reachability: container.optional())
            }
            .scope(Resolver.application)
    }
    
    
    private func registerUseCases(in container: Resolver) {
        container
            .register(CustomPickUseCaseProtocol.self) {
                return CustomPickUseCase(repository: container.resolve())
            }
            .scope(Resolver.application)
        
        container
            .register(FilteredVenuesUseCaseProtocol.self) {
                return FilteredVenuesUseCase(repository: container.resolve())
            }
            .scope(Resolver.unique)
        
        container
            .register(VenueDetailsUseCaseProtocol.self) {
                return VenueDetailsUseCase(repository: container.resolve())
            }
            .scope(Resolver.unique)
    }
    
    private func registerPresenters(in container: Resolver) {
        container
            .register { HomePresenter(customPickUseCase: container.resolve(),
                                      router: container.resolve())}
            .scope(Resolver.unique)
        
        container
            .register { (_, arg) -> VenueDetailsPresenter? in
                guard let id = arg as? Int else { return nil }
                return VenueDetailsPresenter(venueDetailsUseCase: container.resolve(), router: container.resolve(), venueId: id)
            }
            .scope(Resolver.unique)
        
        container
            .register { (_, arg) -> FilteredVenuesPresenter? in
                guard let venuesFilter = arg as? String else { return nil }
                return FilteredVenuesPresenter(filteredVenuesUseCase: container.resolve(),router: container.resolve(), venuesFilter: venuesFilter)
            }
            .scope(Resolver.unique)
    }
    
    private func registerViewControllers(in container: Resolver) {
        container
            .register { HomeViewController(presenter: container.resolve()) }
            .scope(Resolver.unique)
        
        container
            .register { (_, arg) -> VenueDetailsViewController? in
                guard let venueId = arg as? Int else { return nil }
                
                let presenter = container.resolve(VenueDetailsPresenter.self, args: venueId)
                return VenueDetailsViewController(presenter: presenter)
            }
            .scope(Resolver.unique)
        
        container
            .register { (_, arg) -> FilteredVenuesViewController? in
                guard let venuesFilter = arg as? String else { return nil }
                
                let presenter = container.resolve(FilteredVenuesPresenter.self, args: venuesFilter)
                return FilteredVenuesViewController(presenter: presenter)
            }
            .scope(Resolver.unique)
    }
    
}

public extension Resolver {
    
    func resolveRootNavigationController() -> UINavigationController {
        resolve(UINavigationController.self, name: AppDependencies.rootNavigationController.rawValue)
    }
    
    func resolveApiClient() -> BaseAPIClient {
        resolve(BaseAPIClient.self, name: AppDependencies.apiBaseClient.rawValue)
    }
    
}

public enum AppDependencies: String {
    
    case rootNavigationController
    case apiBaseClient
    case apiBaseUrl
    
}
