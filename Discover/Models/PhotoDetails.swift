
import Foundation

struct PhotoDetails: Decodable, Hashable {
    
    let photoURL: String
    let lastUpdated: Double
    
    enum CodingKeys: String, CodingKey {
        case photoURL = "picture"
        case lastUpdated = "updated_at"
    }
    
}
