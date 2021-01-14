
import RxDataSources

struct VenueViewModel: IdentifiableType, Equatable {
    
    let id: Int
    let image: ImageSource
    let title: String
    let caption: String
    let address: String
    let isHot: Bool
    
    public var identity: Int {
        id
    }

}
