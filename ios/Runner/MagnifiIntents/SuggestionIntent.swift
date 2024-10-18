import AppIntents
import Foundation

@available(iOS 16, *)
struct SuggestionIntent: AppIntent {

    static var title: LocalizedStringResource = "Magnifi suggestions"
    static var description: IntentDescription =
        "List of prompts use can use to interact with magnifi ally"

    func perform() async throws -> some IntentResult & ProvidesDialog {

        let responseMessage =
            "**Show magnifi ally stock news \n **show magnifi ally watchlist \n **Get Stock Details \n **Mangnifi ally support"

        return .result(
            dialog:
                "Suggestions are as below \n\n\(responseMessage) For more information, please check the Magnifi app."
        )
    }
}
