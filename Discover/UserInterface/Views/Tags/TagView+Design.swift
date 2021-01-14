
import UIKit

extension TagView: ConstructViewsProtocol {
    
    func createViews() {
        label = UILabel()
        addSubview(label)
    }
    
    func styleViews() {
        roundAllCorners(withRadius: 10)
        clipsToBounds = true
                
        label.textAlignment = .center
        label.font = .system12
        label.textColor = .systemBlack
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
    }
    
    func defineLayoutForViews() {
        label.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2))
        label.autoSetDimension(.height, toSize: 40)
    }
    
}
