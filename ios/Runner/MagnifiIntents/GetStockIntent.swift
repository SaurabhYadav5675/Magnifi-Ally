import AppIntents
import Foundation

@available(iOS 16, *)
struct GetStockIntent: AppIntent {

    static var title: LocalizedStringResource = "Magnifi stocks"
    static var description: IntentDescription =
        "Allows users to get detailed information about a specific stock, such as price, volume, or other fundamentals"

    @IntentParameter(title: "stockName", requestValueDialog: "what's your query")
    var stockName: String

    func perform() async throws -> some IntentResult & ProvidesDialog {

        let responseResult: String

        do {
            responseResult = try await FlutetrMethodHandler().callSendMessage(message: stockName)
            print("Response from Flutter: \(responseResult)")
        } catch {
            responseResult = "oppse error occured"
            print("Error calling Flutter method: \(error.localizedDescription)")
            throw error
        }
        return .result(dialog: "Hello user, \(responseResult)")

    }
}
