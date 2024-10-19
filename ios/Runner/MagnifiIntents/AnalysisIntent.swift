import Foundation
import AppIntents

@available(iOS 16, *)
struct AnalysisIntent: AppIntent{
  
    static var title: LocalizedStringResource="Stock analysis"
    static var description: IntentDescription = "Get detailed examination of stocks";
    
    @IntentParameter(title: "query", requestValueDialog: "what's your query")
    var query: String

    func perform() async throws -> some IntentResult & ProvidesDialog {
        let responseResult: String

        do {
            responseResult = try await FlutetrMethodHandler().callSendMessage(message: query)
            print("Response from Flutter: \(responseResult)")
        } catch {
            responseResult = "oppse error occured"
            print("Error calling Flutter method: \(error.localizedDescription)")
            throw error
        }
        return .result(dialog: "Hello user, \(responseResult)")
    }
}
