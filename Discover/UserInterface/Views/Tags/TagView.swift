
import UIKit

class TagView: UIView {
    
    var label: UILabel!
    
    init() {
        super.init(frame: CGRect.zero)
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTag(tag: Tag) {
        label.text = tag.name
        label.backgroundColor = UIColor(from: tag.color)
    }
    
}
