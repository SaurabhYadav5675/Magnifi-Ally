import Foundation

struct WatchlistItem: Codable {
    let changePercentage: Double
    let diff: Double
    let id: String
    let name: String
    let price: Double
    let sponsorLogoUrl: String
    let ticker: String
    
    enum CodingKeys: String, CodingKey {
        case changePercentage
        case diff
        case id
        case name
        case price
        case sponsorLogoUrl
        case ticker
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode each property normally
        changePercentage = try container.decode(Double.self, forKey: .changePercentage)
        diff = try container.decode(Double.self, forKey: .diff)
        name = try container.decode(String.self, forKey: .name)
        price = try container.decode(Double.self, forKey: .price)
        sponsorLogoUrl = try container.decode(String.self, forKey: .sponsorLogoUrl)
        ticker = try container.decode(String.self, forKey: .ticker)
        
        
        if let stringId = try? container.decode(String.self, forKey: .id) {
            id = stringId
        } else if let intId = try? container.decode(Int.self, forKey: .id) {
            id = String(intId)
        } else {
            id = ""
        }
    }
}
