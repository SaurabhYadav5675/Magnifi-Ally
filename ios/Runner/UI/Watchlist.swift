import SwiftUI

@available(iOS 13.0, *)
struct WatchlistItemView: View {
    var watchlist: [WatchlistItem]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(watchlist, id: \.id) { watchListItem in
                    TickerItem(watchListItem: watchListItem)
                }
                .padding(.horizontal, 10)
                .background(Color.clear)
            }
        }
        .frame(height: 300)
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
                    .font(.system(size: 14, weight: .medium))
                Spacer()
                
                Text( (String(format: "%.2f", watchListItem.price)))
                    .font(.system(size: 14, weight: .medium))
            }.padding(.vertical, -3)
            
            HStack {
                Text(watchListItem.name)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color(.systemGray)) // Replace with your color
                
                Spacer()
                
                HStack {
                    Image(systemName: todaysGains == 0 ? "arrow.up" : (todaysGains < 0 ? "arrow.down" : "arrow.up"))
                        .foregroundColor(todaysGains == 0 ? Color(.systemGray) : (todaysGains < 0 ? Color.red : Color.green))
                        .font(.system(size: 10))
                    
                    Text("\(todaysGains == 0 ? "" : (todaysGains < 0 ? "" : "+"))\(String(format: "%.2f", todaysGains))%")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(todaysGains == 0 ? Color(.systemGray) : (todaysGains < 0 ? Color.red : Color.green))
                }
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .background(Color.clear)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.blue.opacity(0.2), lineWidth: 1)
        )
    }
}
//
//@available(iOS 13.0, *)
//struct ContentView_Previews: PreviewProvider {
//
//
//    static var previews: some View {
//        @State  var watchlist = [
//            WatchlistItem(id: 1, ticker: "AAPL", name: "Apple Inc.",legalName: "", type: "",sponsorLogoUrl: "", price: 145.0, change: 1.25),
//            WatchlistItem(id: 2, ticker: "GOOG", name: "Google",legalName: "",type: "", sponsorLogoUrl: "", price: 2750.0, change: -2.45)
//        ]
//        WatchlistItemView(watchlist: watchlist)
//    }
//}
