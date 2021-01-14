
import Foundation

struct VenueLocation: Decodable, Hashable {
    
    let lat: Double
    let lon: Double
    
    init(_ lat: Double,_ lon: Double) {
        self.lat = lat
        self.lon = lon
    }
    
}
