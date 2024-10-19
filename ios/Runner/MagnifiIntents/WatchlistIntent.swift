
import Foundation
import AppIntents

@available(iOS 16, *)
struct WatchlistIntent: AppIntent , WidgetConfigurationIntent{

    static var title: LocalizedStringResource = "Magnifi Watchlist"
    static var description = IntentDescription("Allows users to operate watchlist section");

    @IntentParameter(title: "action", requestValueDialog: "what action")
    var action: String
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        print("Data11 working for AddWatchlist \(action)");
        let responseResult: String

        do {
            // Await the result of the Flutter method
            responseResult = try await FlutetrMethodHandler().callSendMessage(message: action)
            print("Response from Flutter: \(responseResult)")
        } catch {
            responseResult = "oppse error occured"
            print("Error calling Flutter method: \(error.localizedDescription)")
            throw error
        }
        return .result(dialog: "Hello user, \(responseResult)")
    }
}


