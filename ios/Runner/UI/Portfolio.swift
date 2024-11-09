import SwiftUI

@available(iOS 13.0, *)
struct PortfolioItemView: View {
    var holdings: [HoldingItems]
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(holdings, id: \._id) { holdingsItem in
                PortfolioTicker(holdingsItem: holdingsItem)
            }
            .padding(.horizontal, 10)
            .background(Color.clear)
        }
        .padding(.horizontal,10)
        .padding(.vertical,10)
        
    }
}

@available(iOS 13.0, *)
struct PortfolioTicker: View {
    var holdingsItem: HoldingItems
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(holdingsItem.ticker)
                    .font(.system(size: 14, weight: .medium))
                
                Spacer()
                
                
                Text("Quantity: \(holdingsItem.quantity) ")
                    .lineLimit(2)
                    .truncationMode(.middle)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color.black)
                
                
            }.padding(.vertical, -2)
            
            
            HStack {
                Text(holdingsItem.companyName)
                    .font(.system(size: 14, weight: .medium))
                
                Spacer()
                
                
                Text("Buy at: $\(String(format: "%.2f", holdingsItem.buyPrice))")
                    .lineLimit(2)
                    .truncationMode(.middle)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color.black)
            }.padding(.vertical, -2)
            
            HStack {
                Text(holdingsItem.createdAt)
                    .font(.system(size: 14, weight: .medium))
                
                Spacer()
                
                
                Text("Total: $\(String(format: "%.2f", holdingsItem.totalValue))")
                    .lineLimit(2)
                    .truncationMode(.middle)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color.black)
            }.padding(.vertical, -2)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .background(Color.clear)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.blue.opacity(0.3), lineWidth: 1.2)
        )
    }
}

//@available(iOS 13.0, *)
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        let jsonData = """
//              {
//                  "quantity": 2,
//                  "buyPrice": 324.82,
//                  "totalValue": 649.64,
//                  "_id": "672e5bebc7781ea35d9a52da",
//                  "companyName": "Tesla Inc",
//                  "ticker": "TSLA",
//                  "sponsorLogoUrl": "https://assets.parqet.com/logos/symbol/TSLA?format=svg",
//                  "createdAt": "2024-11-08T18:43:55.326Z",
//                  "updatedAt": "2024-11-08T18:43:55.326Z",
//                  "__v": 0,
//                  "action": "buy"
//              }
//              """.data(using: .utf8)!
//
//        // Decode the mock JSON data into a HoldingItems object
//        let decoder = JSONDecoder()
//        let holdingItem: HoldingItems
//        do {
//            holdingItem = try decoder.decode(HoldingItems.self, from: jsonData)
//        } catch {
//            fatalError("Failed to decode HoldingItems: \(error)")
//        }
//
//        // Pass the decoded HoldingItems object into the view
//        return HoldingTicker(holdingsItem: holdingItem)
//    }
//}