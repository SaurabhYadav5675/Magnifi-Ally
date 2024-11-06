import Foundation

struct WatchlistItem: Codable {
    let changePercentage: Double
    let diff: Double
    let id: String
    let name: String
    let price: Double
    let sponsorLogoUrl: String
    let ticker: String
}
