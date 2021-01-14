
struct VenueDetails: Decodable, Hashable {
    
    let id: Int
    let caption: String
    let photoURL: String
    let primaryTagName: String
    let primaryTags: [Tag]
    let secondaryTags: [Tag]
    let address: String
    let opened: Bool
    let telephone: String
    let shareLink: String
    let cityName: String
    let location: VenueLocation
    let isHot: Bool
    let smokingArea: Bool
    let workingHours: [VenueWorkingHour]
    let gallery: [PhotoDetails]
    let name: String
    let description: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        caption = try values.decode(String.self, forKey: .caption)
        photoURL = try values.decode(String.self, forKey: .photoURL)
        primaryTagName = try values.decode(String.self, forKey: .primaryTagName)
        let tags = try values.nestedContainer(keyedBy: TagsCodingKeys.self, forKey: .allTags)
        primaryTags = try tags.decode([Tag].self, forKey: .primaryTags)
        secondaryTags = try tags.decode([Tag].self, forKey: .secondaryTags)
        address = try values.decode(String.self, forKey: .address)
        opened = try values.decode(Bool.self, forKey: .opened)
        telephone = try values.decode(String.self, forKey: .telephone)
        shareLink = try values.decode(String.self, forKey: .shareLink)
        cityName = try values.decode(String.self, forKey: .cityName)
        let lat = try values.decode(Double.self, forKey: .lat)
        let lon = try values.decode(Double.self, forKey: .lon)
        location = VenueLocation(lat, lon)
        isHot = (try values.decode(Int.self, forKey: .bat)) == 1 ? true : false
        smokingArea = (try values.decode(Int.self, forKey: .smokingArea)) == 1 ? true : false
        workingHours = try values.decode([VenueWorkingHour].self, forKey: .workingHours)
        gallery = try values.decode([PhotoDetails].self, forKey: .gallery)
        name = try values.decode(String.self, forKey: .name)
        description = try values.decode(String.self, forKey: .description)
        
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case caption = "subtitle"
        case photoURL = "picture_url"
        case primaryTagName = "primary_tag_group"
        case allTags
        case address
        case opened
        case telephone
        case shareLink = "share_link"
        case cityName = "city"
        case lat
        case lon
        case bat
        case smokingArea = "smoking_area"
        case workingHours = "working_hours"
        case gallery
        case name
        case description
    }
    
    enum TagsCodingKeys: String, CodingKey {
        case primaryTags
        case secondaryTags
    }
    
    static func == (lhs: VenueDetails, rhs: VenueDetails) -> Bool {
        lhs.name == rhs.name
    }
    
}
