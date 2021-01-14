
import UIKit
import PureLayout

extension CustomPickCollectionViewCell: ConstructViewsProtocol {
    
    func createViews() {
        venueImageView = UIImageView()
        addSubview(venueImageView)
        
        let hotImageViewSize = CGSize(width: 90.0, height: 30.0)
        hotImageView = UIImageView(size: hotImageViewSize,
                                   cornersRadius: CustomPickCollectionViewCell.cornerRadius,
                                   image: .hotImageDark)
        
        addSubview(hotImageView)
        
        containerView = UIView()
        addSubview(containerView)
        
        titleLabel = UILabel()
        containerView.addSubview(titleLabel)
        
        captionLabel = UILabel()
        containerView.addSubview(captionLabel)
    }
    
    func styleViews() {
        roundAllCorners(withRadius: CustomPickCollectionViewCell.cornerRadius)
        
        venueImageView.contentMode = .scaleToFill
        venueImageView.roundTopCorners(withRadius: CustomPickCollectionViewCell.cornerRadius)
        venueImageView.clipsToBounds = true
        
        containerView.roundBottomCorners(withRadius: CustomPickCollectionViewCell.cornerRadius)
        containerView.backgroundColor = .systemWhite
        containerView.dropShadow()
        
        titleLabel.textColor = .systemBlack
        titleLabel.font = .systemBold14
        
        captionLabel.textColor = .systemGray
        captionLabel.font = .system10
    }
    
    func defineLayoutForViews() {
        venueImageView.autoPinEdge(toSuperviewEdge: .top)
        venueImageView.autoPinEdge(toSuperviewEdge: .leading, withInset: CustomPickCollectionViewCell.defaultMargin * 1.5)
        venueImageView.autoPinEdge(toSuperviewEdge: .trailing)
        venueImageView.autoSetDimension(.height, toSize: CustomPickCollectionViewCell.cellDefaultSize.height * 0.7)
        
        hotImageView.autoPinEdge(toSuperviewSafeArea: .top, withInset: CustomPickCollectionViewCell.defaultMargin)
        hotImageView.autoPinEdge(toSuperviewSafeArea: .leading)
        
        containerView.autoPinEdge(.top, to: .bottom, of: venueImageView)
        containerView.autoPinEdge(.leading, to: .leading, of: venueImageView)
        containerView.autoPinEdge(.trailing, to: .trailing, of: venueImageView)
        containerView.autoPinEdge(toSuperviewEdge: .bottom)
        
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: CustomPickCollectionViewCell.defaultMargin)
        titleLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: CustomPickCollectionViewCell.defaultMargin)
        
        captionLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: CustomPickCollectionViewCell.defaultMargin)
        captionLabel.autoPinEdge(.leading, to: .leading, of: titleLabel)
    }
    
}
