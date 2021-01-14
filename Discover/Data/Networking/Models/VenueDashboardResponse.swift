
import Foundation

struct VenueDashboardResponse: Decodable {
    let customPicks: [CustomPick]
    let trending: [VenueDetails]
    
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        let data = try response.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)
        customPicks = try data.decode([CustomPick].self, forKey: .customPicks)
        trending = try data.decode([VenueDetails].self, forKey: .trending)
    }
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    enum DataCodingKeys: String, CodingKey {
        case customPicks
        case trending
    }
}
