
import UIKit
import RxDataSources
import RxSwift
import RxCocoa
import PureLayout

class HomeViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private var presenter: HomePresenter!
    
    static let defaultMargin: CGFloat = 16.0
    
    var scrollView: UIScrollView!
    var bestCoffeeView: CustomPickView!
    var liveGigsView: CustomPickView!
    
    convenience init(presenter: HomePresenter) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        syleNavigationBar()
        createViews()
        styleViews()
        defineLayoutForViews()
        bindBestCoffeeViews()
        bindLiveGigsViews()
    }
    
    private func bindBestCoffeeViews() {
        presenter
            .bestCoffee
            .subscribe(onNext: { [weak self] in
                self?.bestCoffeeView.setViewModel($0)
            })
            .disposed(by: disposeBag)
        
        bestCoffeeView.tagsView
            .tagTapped
            .subscribe(onNext: { [weak self] selected in
                self?.presenter
                    .handleTagTapped(with: selected.name)
            })
            .disposed(by: disposeBag)
        
        bestCoffeeView.collectionView
            .rx
            .modelSelected(VenueViewModel.self)
            .subscribe(onNext: { [weak self] selected in
                self?.presenter
                    .handleCustomPickItemSelected(with: selected.id)
            })
            .disposed(by: disposeBag)
    }
    
    private func bindLiveGigsViews() {
        presenter
            .liveGigs
            .subscribe(onNext: { [weak self] in
                self?.liveGigsView.setViewModel($0)
            })
            .disposed(by: disposeBag)
        
        liveGigsView.tagsView
            .tagTapped
            .subscribe(onNext: { [weak self] selected in
                self?.presenter
                    .handleTagTapped(with: selected.name)
            })
            .disposed(by: disposeBag)
        
        liveGigsView.collectionView
            .rx
            .modelSelected(VenueViewModel.self)
            .subscribe(onNext: { [weak self] selected in
                self?.presenter
                    .handleCustomPickItemSelected(with: selected.id)
            })
            .disposed(by: disposeBag)
    }
    
}



