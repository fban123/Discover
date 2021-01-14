
import RxSwift

protocol CustomPickUseCaseProtocol {
    
    var bestCoffee: Observable<CustomPick> { get }
    
    var liveGigs: Observable<CustomPick> { get }

}
