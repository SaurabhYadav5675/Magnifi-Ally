import AppIntents
import Foundation

@available(iOS 16, *)
struct AnalysisIntent: AppIntent {
    
    // static var title: LocalizedStringResource = "Hello Magnifi"
    static var title: LocalizedStringResource = "AskMagnifi"
    static var description: IntentDescription =
    "Get detailed examination of stocks"
    
    @IntentParameter(title: "query", requestValueDialog: "What's your Query?")
    var query: String
    
    func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
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
                            
                            if let metaData = data["metaData"] as? [Any], !metaData.isEmpty {
                                let jsonData = try JSONSerialization.data(withJSONObject: metaData, options: [])
                                let type=data["type"] as? String;
                                if(type=="stock"){
                                    let watchlistItems = try JSONDecoder().decode([WatchlistItem].self, from: jsonData)
                                    
                                    let customView =  WatchlistItemView(watchlist: watchlistItems)
                                    
                                    return .result(dialog: "\(responseResult) ",view: customView)
                                }else{
                                    if metaData.count > 1 {
                                        let holdingItems = try JSONDecoder().decode([HoldingItems].self, from: jsonData)
                                        
                                        let customView =  PortfolioItemView(holdings:holdingItems)
                                        
                                        return .result(dialog: "\(responseResult) ",view: customView)
                                    }else{
                                        let holdingItems = try JSONDecoder().decode([HoldingItems].self, from: jsonData)
                                        
                                        let customView =  HoldingItemView(holdings:holdingItems)
                                        
                                        return .result(dialog: "\(responseResult) ",view: customView)
                                        
                                    }
                                }
                            }
                        }
                    }
                } catch {
                    print("data parsing error occurred: \(error)")
                    responseResult="Unable to parse query please try again."
                }
            }
            
        } catch let error as FlutterError {
            // Handle FlutterError specifically
            print("Flutter error occurred: \(error)")
        } catch let error as Swift.Error {
            print("Failed to decode JSON: \(error)")
            responseResult="oppse error occured"
        }
        return .result(dialog: "\(responseResult)")
    }
}
