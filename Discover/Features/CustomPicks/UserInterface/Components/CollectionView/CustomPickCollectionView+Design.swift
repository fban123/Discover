
import Foundation

extension CustomPickCollectionView: ConstructViewsProtocol {
    
    func createViews() {
        register(CustomPickCollectionViewCell.self,
            forCellWithReuseIdentifier: CustomPickCollectionViewCell.identifier)
    }
    
    func styleViews() {
        backgroundColor = .systemClear
        showsHorizontalScrollIndicator = false
        decelerationRate = .fast
        clipsToBounds = false
        bounces = false
    }
    
    func defineLayoutForViews() { }
        
}
