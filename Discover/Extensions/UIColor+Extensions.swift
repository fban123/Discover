
import UIKit

extension UIColor {
    
    static let systemClear: UIColor = .clear
    static let systemBlack: UIColor = .black
    static let systemWhite: UIColor = .white
    
    static let lightBlue: UIColor = UIColor(from: "#2596be")
    
}

extension UIColor {
            
    public convenience init(from hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString.remove(at: hex.startIndex)
        }
        if cString.count != 6 {
            self.init(.gray)
            return
        }
        var hexNumber: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&hexNumber)

        let r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hexNumber & 0x0000FF) / 255.0
        let a = CGFloat(1.0)
        
        self.init(red: r, green: g, blue: b, alpha: a)
        return
    }
    
}
