
import UIKit
import Resolver

class AppRouter: NSObject, UINavigationControllerDelegate {

    let container: Resolver
    private weak var navigationController: UINavigationController?

    var rootNavigationController: UINavigationController? {
        navigationController
    }

    init(container: Resolver, rootNavigationController: UINavigationController) {
        self.container = container
        self.navigationController = rootNavigationController
    }

    func start(in window: UIWindow) {
        navigationController?.delegate = self
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        goToHomePage()
    }

}
