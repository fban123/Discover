//
//  FilteredVenuesHeaderView.swift
//  Discover
//
//  Created by FilipBan on 13/01/2021.
//

import UIKit

class FilteredVenuesHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = String(describing: FilteredVenuesHeaderView.self)
    
    var filterCategoryLabel: UILabel!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setFilterCategoryLabel(_ filter: String) {
        filterCategoryLabel.text = String.localizedStringWithFormat(LocalizableStrings.headerTitle.localized, filter)
    }
    
}
