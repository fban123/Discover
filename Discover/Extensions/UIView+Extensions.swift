
import UIKit

extension UIView {
    
    func roundTopCorners(withRadius radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMinXMinYCorner,
                               .layerMaxXMinYCorner]
    }
    
    func roundBottomCorners(withRadius radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMaxXMaxYCorner,
                               .layerMinXMaxYCorner]
    }
    
    func roundAllCorners(withRadius radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMinXMinYCorner,
                               .layerMaxXMinYCorner,
                               .layerMaxXMaxYCorner,
                               .layerMinXMaxYCorner]
    }
    
}

extension UIView {
    
    func dropShadow(color: UIColor = .systemBlack,
                           offSet: CGSize = CGSize(width: 0, height: 21),
                           radius: CGFloat = 25,
                           opacity: Float = 0.15) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
    }
    
}
