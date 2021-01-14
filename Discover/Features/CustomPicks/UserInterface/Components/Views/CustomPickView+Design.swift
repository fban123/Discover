
import PureLayout
import UIKit

extension CustomPickView: ConstructViewsProtocol {
    
    func createViews() {
        titleLabel = UILabel()
        addSubview(titleLabel)
        
        collectionView = CustomPickCollectionView()
        addSubview(collectionView)
        
        tagsView = TagsView()
        addSubview(tagsView)
    }
    
    func styleViews() {
        titleLabel.font = .systemBold24
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func defineLayoutForViews() {
        titleLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: CustomPickView.defaultMargin)
        titleLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: CustomPickView.defaultMargin)
        
        collectionView.autoPinEdge(toSuperviewEdge: .leading)
        collectionView.autoPinEdge(toSuperviewEdge: .trailing)
        collectionView.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: CustomPickView.defaultMargin)
        collectionView.autoSetDimension(.height, toSize: CustomPickCollectionViewCell.cellDefaultSize.height + 1)
        
        tagsView.autoPinEdge(.top, to: .bottom, of: collectionView, withOffset: CustomPickView.defaultMargin * 1.5)
        tagsView.autoPinEdge(toSuperviewEdge: .leading, withInset: CustomPickView.defaultMargin)
        tagsView.autoPinEdge(toSuperviewEdge: .trailing, withInset: CustomPickView.defaultMargin)
        tagsView.autoPinEdge(toSuperviewEdge: .bottom, withInset: CustomPickView.defaultMargin)
    }
    
}
