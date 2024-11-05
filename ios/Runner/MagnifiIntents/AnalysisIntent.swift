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
        var responseResult: String=""
        
        do {
            let methodResponse = try await FlutetrMethodHandler()
                .callSendMessage(message: query)
            
            if let jsonData = methodResponse.data(using: .utf8) {
                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                        
                        if let data = jsonObject["data"] as? [String: Any] {
                            if let text = data["text"] as? String {
                                responseResult=text
                            }
                            
                            if let metaData = data["metaData"] as? String {
                                print("Meta Data: \(metaData)")
                            }
                        }
                    }
                } catch {
                    responseResult="Unable to parse query please try again."
                }
            }
            
        } catch {
            responseResult = "oppse error occured"
            throw error
        }
        return .result(dialog: "\(responseResult)")
    }
}
