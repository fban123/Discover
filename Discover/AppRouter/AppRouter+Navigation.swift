
import UIKit

extension AppRouter {
    
    func presentViewController(_ viewController: UIViewController) {
        presentViewController(viewController, in: rootNavigationController)
    }
    
    func presentViewController(_ viewController: UIViewController, in navigationController: UINavigationController?) {
        navigationController?.present(viewController, animated: true, completion: nil)
    }
    
    func pushViewController(_ viewController: UIViewController) {
        pushViewController(viewController, in: rootNavigationController)
    }
    
    func pushViewController(_ viewController: UIViewController, in navigationController: UINavigationController?) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func setViewController(_ viewController: UIViewController) {
        setViewController(viewController, in: rootNavigationController)
    }
    
    func setViewController(_ viewController: UIViewController, in navigationController: UINavigationController?) {
        guard isCurrentViewControllerStackNotEqual(to: [viewController], in: navigationController) else { return }
        
        navigationController?.setViewControllers([viewController], animated: true)
    }
    
    func setViewControllers(_ viewControllers: [UIViewController]) {
        setViewControllers(viewControllers, in: rootNavigationController)
    }
    
    func setViewControllers(_ viewControllers: [UIViewController], in navigationController: UINavigationController?) {
        guard isCurrentViewControllerStackNotEqual(to: viewControllers, in: navigationController) else { return }
        
        navigationController?.setViewControllers(viewControllers, animated: true)
    }
    
    func dismissPresentedViewController() {
        dismissPresentedViewController(in: rootNavigationController)
    }
    
    func dismissPresentedViewController(in navigationController: UINavigationController?) {
        navigationController?.presentedViewController?.dismiss(animated: true, completion: nil)
    }
    
    func popViewController() {
        popViewController(in: rootNavigationController)
    }
    
    func popViewController(in navigationController: UINavigationController?) {
        navigationController?.popViewController(animated: true)
    }
    
    func popToRootViewController() {
        popToRootViewController(in: rootNavigationController)
    }
    
    func popToRootViewController(in navigationController: UINavigationController?) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func showNativeModal(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .overCurrentContext
        presentViewController(viewController)
    }
    
    func closeNativeModal() {
        guard let currentVc = rootNavigationController?.viewControllers.last,
              let modalVc = currentVc.presentedViewController
        else { return }
        
        modalVc.dismiss(animated: true)
    }
    
    private func isCurrentViewControllerStackNotEqual(to viewControllers: [UIViewController],
                                                      in navigationController: UINavigationController?) -> Bool {
        let currentViewControllers = navigationController?.viewControllers ?? []
        guard currentViewControllers.count == viewControllers.count else { return true }
        
        for index in currentViewControllers.indices {
            let currentType = type(of: currentViewControllers[index])
            let futureType = type(of: viewControllers[index])
            if currentType != futureType {
                return true
            }
        }
        return false
    }
    
}

