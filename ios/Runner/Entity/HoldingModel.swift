

import Foundation

struct HoldingItems: Codable {
    let quantity: Int
    let buyPrice: Double
    let _id: String
    let companyName: String
    let totalValue: Double
    let sponsorLogoUrl: String
    let ticker: String
    let createdAt:String
    let action:String
    
    enum CodingKeys: String, CodingKey {
        case quantity
        case buyPrice
        case _id
        case companyName
        case totalValue
        case sponsorLogoUrl
        case ticker
        case createdAt
        case action
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode each property normally
        quantity = try container.decode(Int.self, forKey: .quantity)
        buyPrice = try container.decode(Double.self, forKey: .buyPrice)
        companyName = try container.decode(String.self, forKey: .companyName)
        totalValue = try container.decode(Double.self, forKey: .totalValue)
        sponsorLogoUrl = try container.decode(String.self, forKey: .sponsorLogoUrl)
        ticker = try container.decode(String.self, forKey: .ticker)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        action = try container.decode(String.self, forKey: .action)
        
        
        if let stringId = try? container.decode(String.self, forKey: ._id) {
            _id = stringId
        } else if let intId = try? container.decode(Int.self, forKey: ._id) {
            _id = String(intId)
        } else {
            _id = ""
        }
    }
}
