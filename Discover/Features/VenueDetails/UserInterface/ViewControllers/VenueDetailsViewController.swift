
import RxSwift
import RxCocoa

class VenueDetailsViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private var presenter: VenueDetailsPresenter!
    
    static let defaultMargin: CGFloat = 30.0
    
    var scrollView: UIScrollView!
    var venueImageView: UIImageView!
    var hotImageView: UIImageView!
    var titleLabel: UILabel!
    var captionLabel: UILabel!
    var tagsView: TagsView!
    
    convenience init(presenter: VenueDetailsPresenter) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        styleViews()
        defineLayoutForViews()
        bindViews()
    }
    
    private func bindViews() {
        presenter
            .venueDetails
            .map { venue -> ImageSource in
                .remote(url: venue.gallery[0].photoURL)
            }
            .bind { [weak self] in
                self?.venueImageView.setImage(from: $0)
            }
            .disposed(by: disposeBag)
        
        presenter
            .venueDetails
            .map { $0.isHot }
            .bind { [weak self] in
                self?.hotImageView.isHidden = !$0
            }
            .disposed(by: disposeBag)
        
        presenter
            .venueDetails
            .map { $0.name }
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        presenter
            .venueDetails
            .map { $0.caption }
            .bind(to: captionLabel.rx.text)
            .disposed(by: disposeBag)
        
        presenter
            .venueDetails
            .map { $0.primaryTags }
            .bind { [weak self] tags in
                self?.tagsView.setupTags(tags: tags)
            }
            .disposed(by: disposeBag)
        
        tagsView
            .tagTapped
            .subscribe(onNext: { [weak self] selected in
                self?.presenter
                    .handleTagTapped(with: selected.name)
            })
            .disposed(by: disposeBag)
    }
    
}
