
import UIKit
import RxSwift

class CustomPickView: UIView {
    
    static let defaultMargin: CGFloat = 16.0
    
    var titleLabel: UILabel!
    var collectionView: CustomPickCollectionView!
    var tagsView: TagsView!
    
    init() {
        super.init(frame: CGRect.zero)
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewModel(_ viewModel: CustomPickViewModel ) {
        titleLabel.text = viewModel.title
        collectionView.setItems(viewModel.venues)
        tagsView.setupTags(tags: viewModel.tags)
    }
    
}
