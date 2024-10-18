import AppIntents
import Flutter
import Foundation
import UIKit

@available(iOS 16, *)
struct GreetingIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Hello Magnifi"
    static var description: IntentDescription =
    "Allows users to get detailed information about a specific stock, such as price, volume, or other fundamentals"
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        return .result(
            dialog:
                "Welcome to magnifi, I'm your personal investing assistant.I can help by providing tips for general market events, securities in your watchlist and details related to your account."
        )
    }
}
