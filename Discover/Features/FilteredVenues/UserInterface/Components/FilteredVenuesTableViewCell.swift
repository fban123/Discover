//
//  FilteredVenuesTableViewCell.swift
//  Discover
//
//  Created by FilipBan on 13/01/2021.
//

import UIKit

class FilteredVenuesTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: FilteredVenuesTableViewCell.self)
    
    static let defaultMargin: CGFloat = 16
    static let cornerRadius: CGFloat = 8
    
    var venueImageView: UIImageView!
    var titleLabel: UILabel!
    var addressLabel: UILabel!
    var hotImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewModel(_ viewModel: VenueViewModel) {
        venueImageView.setImage(from: viewModel.image)
        titleLabel.text = viewModel.title
        addressLabel.text = viewModel.address
        hotImageView.isHidden = viewModel.isHot ? false : true
    }
}
