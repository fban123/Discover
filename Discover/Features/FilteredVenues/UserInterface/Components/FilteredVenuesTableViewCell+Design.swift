//
//  FilteredVenuesTableViewCell+Design.swift
//  Discover
//
//  Created by FilipBan on 13/01/2021.
//

import UIKit
import PureLayout

extension FilteredVenuesTableViewCell: ConstructViewsProtocol {
    
    func createViews() {
        venueImageView = UIImageView()
        addSubview(venueImageView)
        
        let hotImageViewSize = CGSize(width: 20.0, height: 20.0)
        hotImageView = UIImageView(size: hotImageViewSize,
                                   cornersRadius: FilteredVenuesTableViewCell.cornerRadius / 2,
                                   image: .hotImageLightSmall)
        addSubview(hotImageView)
        
        titleLabel = UILabel()
        addSubview(titleLabel)
        
        addressLabel = UILabel()
        addSubview(addressLabel)
    }
    
    func styleViews() {
        backgroundColor = .systemWhite
        
        venueImageView.contentMode = .scaleToFill
        venueImageView.roundAllCorners(withRadius: FilteredVenuesTableViewCell.cornerRadius)
        venueImageView.clipsToBounds = true
        
        titleLabel.textColor = .systemBlack
        titleLabel.font = .systemBold14
        
        addressLabel.textColor = .systemGray
        addressLabel.numberOfLines = 0
        addressLabel.font = .system10
    }
    
    func defineLayoutForViews() {
        venueImageView.autoPinEdge(toSuperviewEdge: .top, withInset: FilteredVenuesTableViewCell.defaultMargin)
        venueImageView.autoPinEdge(toSuperviewEdge: .bottom, withInset: FilteredVenuesTableViewCell.defaultMargin)
        venueImageView.autoPinEdge(toSuperviewEdge: .leading, withInset: FilteredVenuesTableViewCell.defaultMargin)
        venueImageView.autoSetDimension(.width, toSize: 120.0)
        venueImageView.autoSetDimension(.height, toSize: 75.0)
        
        hotImageView.autoPinEdge(toSuperviewEdge: .leading, withInset: FilteredVenuesTableViewCell.defaultMargin / 2)
        hotImageView.autoPinEdge(.top, to: .top, of: venueImageView, withOffset: FilteredVenuesTableViewCell.defaultMargin / 2)
        
        titleLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: FilteredVenuesTableViewCell.defaultMargin)
        titleLabel.autoPinEdge(.leading, to: .trailing, of: venueImageView, withOffset: FilteredVenuesTableViewCell.defaultMargin)
        
        addressLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: FilteredVenuesTableViewCell.defaultMargin)
        addressLabel.autoPinEdge(.leading, to: .trailing, of: venueImageView, withOffset: FilteredVenuesTableViewCell.defaultMargin)
        addressLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: FilteredVenuesTableViewCell.defaultMargin)
    }
    
}
