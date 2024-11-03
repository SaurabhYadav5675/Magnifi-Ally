import SwiftUI

@available(iOS 13.0, *)
struct WatchlistItemView: View {
    var watchlist: [WatchlistItem] // Replace WatchlistItem with your model

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(watchlist, id: \.id) { watchListItem in
                    let todaysGains = Double(watchListItem.change) ?? 0.0

                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(watchListItem.ticker)
                                .font(.system(size: 14, weight: .medium))

                            Spacer()

                            if let logoURL = watchListItem.sponsorLogoUrl, !logoURL.isEmpty {
                                if #available(iOS 15.0, *) {
                                    AsyncImage(url: URL(string: logoURL)) { image in
                                        image
                                            .resizable()
                                            .frame(width: 90, height: 30)
                                            .clipped()
                                    } placeholder: {
                                        EmptyView()
                                    }
                                } else {
                                    // Fallback on earlier versions
                                }
                            }

                            Text("\(watchListItem.price)")
                                .font(.system(size: 14, weight: .medium))
                        }

                        HStack {
                            Text(watchListItem.name ?? "")
                                .lineLimit(2)
                                .truncationMode(.tail)
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(Color(.systemGray)) // Replace with your color

                            Spacer()

                            HStack {
                                Image(systemName: todaysGains == 0 ? "arrow.up.circle" : (todaysGains < 0 ? "arrow.down.circle" : "arrow.up.circle"))
                                    .foregroundColor(todaysGains == 0 ? Color(.systemGray) : (todaysGains < 0 ? Color.red : Color.green))
                                    .font(.system(size: 25))

                                Text("\(todaysGains == 0 ? "" : (todaysGains < 0 ? "" : "+"))\(String(format: "%.2f", todaysGains))%")
                                    .fontWeight(.medium)
                                    .foregroundColor(todaysGains == 0 ? Color(.systemGray) : (todaysGains < 0 ? Color.red : Color.green))
                            }
                        }
                        Divider()
                            .background(Color(.systemGray4)) // Replace with your divider color
                            .frame(height: 0.5)
                    }
                    .padding(.horizontal, 10)
                }
            }
            .padding(.vertical, 8)
        }
    }
}
