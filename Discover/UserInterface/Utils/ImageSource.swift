
import Foundation

enum ImageSource: Equatable {
    
    case local(image: BundleImage)
    case remote(url: String)
    
}
