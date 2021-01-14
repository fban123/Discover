
import RxSwift
import RxGesture
import RxCocoa

class TagsView: UIView {
    
    private let disposeBag = DisposeBag()
    private let tagTappedSubject = PublishSubject<Tag>()
    var tagTapped: Observable<Tag> {
        tagTappedSubject.asObservable()
    }
    
    var stackView: UIStackView!

    init() {
        super.init(frame: CGRect.zero)
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTags(tags: [Tag]) {
        tags.forEach { tag in
            let tagView = TagView()
            tagView.setupTag(tag: tag)

            tagView
                .rx
                .tapGesture()
                .when(.recognized)
                .map { _ in tag }
                .bind(to: tagTappedSubject)
                .disposed(by: disposeBag)

            stackView.addArrangedSubview(tagView)
        }
    }
    
}
