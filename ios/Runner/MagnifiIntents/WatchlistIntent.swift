
import Foundation
import AppIntents

@available(iOS 16, *)
struct WatchlistIntent: AppIntent , WidgetConfigurationIntent{

    static var title: LocalizedStringResource = "Magnifi Watchlist"
    static var description = IntentDescription("Allows users to operate watchlist section");

    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        let responseResult: String

        do {
            // Await the result of the Flutter method
            let methodResponse = try await FlutetrMethodHandler().showWatchList()
            print("Data11 getting \(methodResponse)")
            responseResult="getting response from watchlist"
        } catch {
            responseResult = "oppse error occured"
            throw error
        }
        return .result(dialog: "\(responseResult)")
    }
}


