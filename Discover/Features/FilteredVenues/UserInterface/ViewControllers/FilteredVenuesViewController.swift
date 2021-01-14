//
//  FilteredVenuesViewController.swift
//  Discover
//
//  Created by FilipBan on 13/01/2021.
//

import UIKit
import RxSwift
import RxDataSources

class FilteredVenuesViewController: UIViewController {
    
    typealias FilteredVenuesDataSource = RxTableViewSectionedReloadDataSource<Section<VenueViewModel>>
    
    private let disposeBag = DisposeBag()
    private var presenter: FilteredVenuesPresenter!
    private var tableViewDataSource: FilteredVenuesDataSource!
    
    var tableView: UITableView!
    
    convenience init(presenter: FilteredVenuesPresenter) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createViews()
        styleViews()
        bindViews()
        defineLayoutForViews()
    }
    
    private func bindViews() {
        
        tableView
            .rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        tableViewDataSource = FilteredVenuesDataSource(configureCell: { (dataSource, tableView, indexPath, viewModel) -> UITableViewCell in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FilteredVenuesTableViewCell.identifier, for: indexPath) as? FilteredVenuesTableViewCell
            else {
                return FilteredVenuesTableViewCell()
            }
            
            cell.setViewModel(viewModel)
            
            return cell
        })
                
        presenter
            .venues
            .mapToSection()
            .bind(to: tableView.rx.items(dataSource: tableViewDataSource))
            .disposed(by: disposeBag)
        
        
        tableView
            .rx
            .modelSelected(VenueViewModel.self)
            .subscribe(onNext: { [weak self] selected in
                self?.presenter
                    .handleVenueItemSelected(with: selected.id)
            })
            .disposed(by: disposeBag)
    }
    
}

extension FilteredVenuesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let filterCategory = presenter.headerFilterCategory
        let headerView = FilteredVenuesHeaderView()
        headerView.setFilterCategoryLabel(filterCategory)
        return headerView
    }
    
}
