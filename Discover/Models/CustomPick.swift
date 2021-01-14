
import Foundation

struct CustomPick: Decodable, Hashable {
    
    let title: String
    let tags: [Tag]
    let venues: [VenueDetails]
    
    init(from decoder: Decoder) throws {
        let codingKeys = try decoder.container(keyedBy: CodingKeys.self)
        title = try codingKeys.decode(String.self, forKey: .title)
        tags = try codingKeys.decode([Tag].self, forKey: .tags)
        venues = try codingKeys.decode([VenueDetails].self, forKey: .venues)
        
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case tags
        case venues = "items"
    }
    
}
