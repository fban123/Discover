
import UIKit

extension HomeViewController: ConstructViewsProtocol {
    
    func createViews() {
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        bestCoffeeView = CustomPickView()
        scrollView.addSubview(bestCoffeeView)

        liveGigsView = CustomPickView()
        scrollView.addSubview(liveGigsView)
    }
    
    func styleViews() {
        view.backgroundColor = .systemWhite
    }
    
    func defineLayoutForViews() {
        scrollView.autoPinEdgesToSuperviewEdges()
        
        bestCoffeeView.autoPinEdge(.leading, to: .leading, of: view)
        bestCoffeeView.autoPinEdge(.trailing, to: .trailing, of: view)
        bestCoffeeView.autoPinEdge(toSuperviewEdge: .top, withInset: HomeViewController.defaultMargin)
        
        liveGigsView.autoPinEdge(.leading, to: .leading, of: view)
        liveGigsView.autoPinEdge(.trailing, to: .trailing, of: view)
        liveGigsView.autoPinEdge(.top, to: .bottom, of: bestCoffeeView, withOffset: HomeViewController.defaultMargin * 2)
        liveGigsView.autoPinEdge(toSuperviewEdge: .bottom, withInset: HomeViewController.defaultMargin)
    }
    
    func syleNavigationBar() {
        navigationItem.title = LocalizableStrings.navTitle.localized
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemWhite,
                                                                   NSAttributedString.Key.font: UIFont.systemBold18]
        navigationController?.navigationBar.barTintColor = .lightBlue
        navigationController?.navigationBar.tintColor = .systemWhite
    }
    
}
