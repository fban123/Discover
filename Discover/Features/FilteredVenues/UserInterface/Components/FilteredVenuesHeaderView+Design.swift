//
//  FilteredVenuesHeaderView+Design.swift
//  Discover
//
//  Created by FilipBan on 13/01/2021.
//

import UIKit

extension FilteredVenuesHeaderView: ConstructViewsProtocol {
    
    func createViews() {
        filterCategoryLabel = UILabel()
        addSubview(filterCategoryLabel)
    }
    
    func styleViews() {
        contentView.backgroundColor = UIColor.systemWhite.withAlphaComponent(0.8)
        filterCategoryLabel.font = .system14
        filterCategoryLabel.textColor = .systemGray
    }
    
    func defineLayoutForViews() {
        filterCategoryLabel.autoPinEdgesToSuperviewSafeArea(with: UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 0))
    }
    
}
