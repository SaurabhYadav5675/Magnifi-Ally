import SwiftUI

@available(iOS 13.0, *)
struct WatchlistItemView: View {
    var watchlist: [WatchlistItem]
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(watchlist, id: \.id) { watchListItem in
                TickerItem(watchListItem: watchListItem)
            }
            .padding(.horizontal, 10)
            .background(Color.clear)
        }
        .padding(.horizontal,8)
        .padding(.vertical,10)
        
    }
}

@available(iOS 13.0, *)
struct TickerItem: View {
    var watchListItem: WatchlistItem
    
    
    var body: some View {
        let todaysGains = Double(watchListItem.changePercentage)
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(watchListItem.ticker)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(.white))
                Text(watchListItem.companyName)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color(.systemGray))
                
                Spacer()
                
                Text("Magnifi")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color.white).padding(.horizontal,-4)
                Text("(Tifin)")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(.systemGray))
            }.padding(.vertical, 1)
            
            HStack {
                Text("$\(String(format: "%.2f", watchListItem.price))")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(Color.white)
                Spacer()
                
                HStack {
                    Image(systemName: todaysGains == 0 ? "arrow.up" : (todaysGains < 0 ? "arrow.down" : "arrow.up"))
                        .foregroundColor(todaysGains == 0 ? Color(.systemGray) : (todaysGains < 0 ? Color.red : Color.green))
                        .font(.system(size: 12))
                    
                    Text("\(todaysGains == 0 ? "" : (todaysGains < 0 ? "" : "+"))\(String(format: "%.2f", todaysGains))%")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(todaysGains == 0 ? Color(.systemGray) : (todaysGains < 0 ? Color.red : Color.green))
                }
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 9)
        .background(Color.black)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.blue.opacity(0.2), lineWidth: 1)
        )
    }
}

//@available(iOS 13.0, *)
//struct ContentView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        let jsonData = """
//                 {
//                                 "id": "672f29237ead6bc61b701749",
//                                 "ticker": "META",
//                                 "companyName": "Meta Platforms Inc",
//                                 "sponsorLogoUrl": "https://assets.parqet.com/logos/symbol/META?format.svg",
//                                 "price": 588.46,
//                                 "diff": -2.3600000000000136,
//                                 "changePercentage": -0.3988507689707645
//                             }
//                 """.data(using: .utf8)!
//        
//        // Decode the mock JSON data into a HoldingItems object
//        let decoder = JSONDecoder()
//        let holdingItem: WatchlistItem
//        do {
//            holdingItem = try decoder.decode(WatchlistItem.self, from: jsonData)
//        } catch {
//            fatalError("Failed to decode HoldingItems: \(error)")
//        }
//        
//        return TickerItem(watchListItem: holdingItem)
//    }
//}
