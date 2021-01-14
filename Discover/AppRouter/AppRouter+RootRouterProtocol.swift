
extension AppRouter: RootRouterProtocol {

    func goToHomePage() {
        let homeViewController: HomeViewController = container.resolve()

        setViewController(homeViewController)
    }

}
