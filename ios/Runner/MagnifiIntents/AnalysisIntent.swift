import AppIntents
import Foundation

@available(iOS 16, *)
struct AnalysisIntent: AppIntent {

    static var title: LocalizedStringResource = "Stock analysis"
    static var description: IntentDescription =
        "Get detailed examination of stocks"

    @IntentParameter(title: "query", requestValueDialog: "what's your query")
    var query: String

    func perform() async throws -> some IntentResult & ProvidesDialog {
        let responseResult: String

        do {
            let methodResponse = try await FlutetrMethodHandler()
                .callSendMessage(message: query)
            responseResult = getResponseText(from: methodResponse).joined(
                separator: " ")
        } catch {
            responseResult = "oppse error occured"
            throw error
        }
        return .result(dialog: "\(responseResult)")
    }
}
