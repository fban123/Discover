
import UIKit

class CustomPickCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CustomPickCollectionViewCell.self)
    
    static let defaultMargin: CGFloat = 8
    static let cornerRadius: CGFloat = 8
    static var cellDefaultSize: CGSize {
        return CGSize(width: 280.0, height: 220.0)
    }
        
    var venueImageView: UIImageView!
    var titleLabel: UILabel!
    var captionLabel: UILabel!
    var hotImageView: UIImageView!
    var containerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createViews()
        defineLayoutForViews()
        styleViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewModel(_ viewModel: VenueViewModel) {
        venueImageView.setImage(from: viewModel.image)
        titleLabel.text = viewModel.title
        captionLabel.text = viewModel.caption
        hotImageView.isHidden = viewModel.isHot ? false : true
    }
    
}
