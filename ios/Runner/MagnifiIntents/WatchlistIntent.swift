
import Foundation
import AppIntents

@available(iOS 16, *)
struct WatchlistIntent: AppIntent , WidgetConfigurationIntent{

    static var title: LocalizedStringResource = "Magnifi Watchlist"
    static var description = IntentDescription("Allows users to operate watchlist section");

    
    func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {

        do {
            // Await the result of the Flutter method
            let methodResponse = try await FlutetrMethodHandler().showWatchList()
            let jsonData = methodResponse.data(using: .utf8)!
            let watchlistItems = loadWatchlistItems(from: jsonData)
            // Load watchlist items from JSON data
                  if let watchlistItems = loadWatchlistItems(from: jsonData) {
                
                    
                      
                      // Pass watchlistItems to watListView
                      let customView = await WatchlistItemView(watchlist: watchlistItems)
                      
                      return .result(dialog: "Suggestions are as below, for more information, please check the Magnifi app.", view: customView)
                  } else {
                      throw NSError(domain: "DataError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to load watchlist items"])
                  }
        } catch {
            throw error
        }
    }
    
    func loadWatchlistItems(from data: Data) -> [WatchlistItem]? {
        let decoder = JSONDecoder()
        do {
            let watchlistItems = try decoder.decode([WatchlistItem].self, from: data)
            return watchlistItems
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}


