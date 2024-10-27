
import Foundation
import AppIntents

@available(iOS 16, *)
struct WatchlistIntent: AppIntent , WidgetConfigurationIntent{

    static var title: LocalizedStringResource = "Magnifi Watchlist"
    static var description = IntentDescription("Allows users to operate watchlist section");

    @IntentParameter(title: "actionName", requestValueDialog: "what action")
    var actionName: String
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        let responseResult: String

        do {
            // Await the result of the Flutter method
           let methodResponse = try await FlutetrMethodHandler().callSendMessage(message: actionName)
            responseResult=getResponseText(from:methodResponse).joined(separator: " ")
        } catch {
            responseResult = "oppse error occured"
            throw error
        }
        return .result(dialog: "\(responseResult)")
    }
}


