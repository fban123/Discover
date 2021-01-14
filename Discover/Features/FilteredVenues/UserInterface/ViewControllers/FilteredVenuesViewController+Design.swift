//
//  FilteredVenuesViewController+Design.swift
//  Discover
//
//  Created by FilipBan on 13/01/2021.
//

import PureLayout

extension FilteredVenuesViewController: ConstructViewsProtocol {
    
    func createViews() {
        tableView = UITableView()
        tableView.register(FilteredVenuesTableViewCell.self, forCellReuseIdentifier: FilteredVenuesTableViewCell.identifier)
        view.addSubview(tableView)
    }
    
    func styleViews() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
    }
    
    func defineLayoutForViews() {
        tableView.autoPinEdgesToSuperviewEdges()
    }
    
}
