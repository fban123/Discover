
import UIKit
import PureLayout

extension TagsView: ConstructViewsProtocol {
    
    func createViews() {
        stackView = UIStackView()
        addSubview(stackView)
    }
    
    func styleViews() {
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 8
    }
    
    func defineLayoutForViews() {
        stackView.autoPinEdgesToSuperviewEdges()
    }
    
}
