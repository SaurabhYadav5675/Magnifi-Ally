import Foundation

struct WatchlistItem: Identifiable, Codable {
    let id: Int
    let ticker: String
    let name: String
    let legalName: String
    let type: String
    let sponsorLogoUrl: String?
    let price: Double
    let change: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case ticker
        case name
        case legalName
        case type
        case sponsorLogoUrl
        case price
        case change
    }
}
