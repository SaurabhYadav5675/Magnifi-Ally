
import Foundation
import AppIntents

@available(iOS 16, *)
struct PortfolioIntent: AppIntent , WidgetConfigurationIntent{
    
    static var title: LocalizedStringResource = "Magnifi portfolio"
    static var description = IntentDescription("Allows users to get portfolio details");
    
    
    func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
        
        var responseResult: String=""
        
        do {
            let methodResponse = try await FlutetrMethodHandler()
                .callSendMessage(message: "show my portfolio")
            
            if let jsonData = methodResponse.data(using: .utf8) {
                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                        
                        if let data = jsonObject["data"] as? [String: Any] {
                            if let text = data["text"] as? String {
                                responseResult=text
                            }
                            
                            if let metaData = data["metaData"] as? [Any], !metaData.isEmpty {
                                let jsonData = try JSONSerialization.data(withJSONObject: metaData, options: [])
                                let holdingItems = try JSONDecoder().decode([HoldingItems].self, from: jsonData)
                                
                                let customView =  PortfolioItemView(holdings:holdingItems)
                                
                                return .result(dialog: "\(responseResult) ",view: customView)
                            }
                        }
                    }
                } catch let error as FlutterError {
                    // Handle FlutterError specifically
                    print("Flutter error occurred: \(error)")
                } catch let error as Swift.Error {
                    print("Failed to decode JSON: \(error)")
                    responseResult="Unable to parse query please try again."
                }
            }
            
        } catch let error as FlutterError {
            // Handle FlutterError specifically
            print("Flutter error occurred: \(error)")
        } catch let error as Swift.Error {
            responseResult = "oppse error occured"
            throw error
        }
        return .result(dialog: "\(responseResult)")
        
    }
}


