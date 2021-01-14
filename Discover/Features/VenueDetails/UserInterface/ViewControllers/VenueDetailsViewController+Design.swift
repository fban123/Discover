
import UIKit
import PureLayout

extension VenueDetailsViewController: ConstructViewsProtocol {
    
    func createViews() {
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        venueImageView = UIImageView()
        scrollView.addSubview(venueImageView)
        
        let size = CGSize(width: 90.0, height: 30.0)
        hotImageView = UIImageView(size: size, cornersRadius: 8.0, image: .hotImageLight)
        scrollView.addSubview(hotImageView)
        
        titleLabel = UILabel()
        scrollView.addSubview(titleLabel)
        
        captionLabel = UILabel()
        scrollView.addSubview(captionLabel)
        
        tagsView = TagsView()
        scrollView.addSubview(tagsView)
    }
    
    func styleViews() {
        view.backgroundColor = .systemWhite
        
        titleLabel.font = .systemBold24
        
        captionLabel.font = .system14
    }
    
    func defineLayoutForViews() {
        scrollView.autoPinEdgesToSuperviewEdges()
        
        venueImageView.autoPinEdge(toSuperviewSafeArea: .top)
        venueImageView.autoPinEdge(.leading, to: .leading, of: view)
        venueImageView.autoPinEdge(.trailing, to: .trailing, of: view)
        venueImageView.autoSetDimension(.height, toSize: 300)
        
        hotImageView.autoPinEdge(.bottom, to: .bottom, of: venueImageView, withOffset: -VenueDetailsViewController.defaultMargin)
        hotImageView.autoPinEdge(.trailing, to: .trailing, of: venueImageView, withOffset: -VenueDetailsViewController.defaultMargin)

        titleLabel.autoPinEdge(.top, to: .bottom, of: venueImageView, withOffset: VenueDetailsViewController.defaultMargin)
        titleLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: VenueDetailsViewController.defaultMargin)
        
        captionLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: VenueDetailsViewController.defaultMargin)
        captionLabel.autoPinEdge(.leading, to: .leading, of: titleLabel)
        
        tagsView.autoPinEdge(.top, to: .bottom, of: captionLabel, withOffset: VenueDetailsViewController.defaultMargin)
        tagsView.autoPinEdge(.leading, to: .leading, of: view, withOffset: VenueDetailsViewController.defaultMargin * 0.5)
        tagsView.autoPinEdge(.trailing, to: .trailing, of: view, withOffset: -VenueDetailsViewController.defaultMargin * 0.5)
    }
    
}
