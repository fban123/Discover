
import UIKit
import RxDataSources
import RxSwift
import RxCocoa

class CustomPickCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    
    typealias CustomPickDataSource = RxCollectionViewSectionedReloadDataSource<Section<VenueViewModel>>
    
    private let disposeBag = DisposeBag()
    private let items = BehaviorRelay<[VenueViewModel]>(value: [])
    private var collectionViewDataSource: CustomPickDataSource!
    
    
    public convenience init() {
        let flowLayout = CenterCellCollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CustomPickCollectionViewCell.cellDefaultSize
        flowLayout.minimumLineSpacing = 16.0
        
        self.init(frame: .zero, collectionViewLayout: flowLayout)
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        createViews()
        styleViews()
        defineLayoutForViews()
        bindViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setItems(_ items: [VenueViewModel]) {
        self.items.accept(items)
    }
    
    private func bindViews() {
        collectionViewDataSource = CustomPickDataSource(configureCell: { (dataSource, collectionView, indexPath, viewModel) -> UICollectionViewCell in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomPickCollectionViewCell.identifier, for: indexPath) as? CustomPickCollectionViewCell
            else {
                return CustomPickCollectionViewCell()
            }
            
            cell.setViewModel(viewModel)
            
            return cell
        })
        
        self
            .rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        items
            .asObservable()
            .mapToSection()
            .bind(to: self.rx.items(dataSource: collectionViewDataSource))
            .disposed(by: disposeBag)
    }
    
}
