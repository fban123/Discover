
import RxSwift

class CustomPickUseCase: CustomPickUseCaseProtocol {
    
    private let repository: VenueDashboardRepositoryProtocol!
    
    init(repository: VenueDashboardRepositoryProtocol) {
        self.repository = repository
    }
    
    lazy var bestCoffee: Observable<CustomPick> = {
        repository
            .getBestCoffee()
            .subscribeOnUtility()
    }()
    
    lazy var liveGigs: Observable<CustomPick> = {
        repository
            .getLiveGigs()
            .subscribeOnUtility()
    }()
    
}
