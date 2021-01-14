
import Kingfisher
import UIKit

extension UIImageView {
    
    convenience init(size: CGSize, cornersRadius: CGFloat, image: BundleImage) {
        self.init()
        
        contentMode = .scaleToFill
        clipsToBounds = true
        isHidden = true
        roundAllCorners(withRadius: cornersRadius)
        
        setImage(from: .local(image: image))
        
        autoSetDimensions(to: size)
    }
    
}

extension UIImageView {
    
    func setImage(from source: ImageSource?) {
        guard let source = source else {
            self.image = nil
            return
        }
        switch source {
        case .local(let image):
            let resource: Resource? = nil
            self.kf.setImage(with: resource)
            self.image = UIImage(with: image)
        case .remote(let url):
            let url = URL(string: url)
            self.kf.indicatorType = .activity
            self.kf.setImage(with: url)
        }
    }
    
}
