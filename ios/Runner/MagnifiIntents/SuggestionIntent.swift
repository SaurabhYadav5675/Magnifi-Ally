import AppIntents
import Foundation

@available(iOS 16, *)
struct SuggestionIntent: AppIntent {

    static var title: LocalizedStringResource = "Magnifi suggestions"
    static var description: IntentDescription =
        "List of prompts use can use to interact with magnifi ally"

    func perform() async throws -> some IntentResult & ShowsSnippetView & ProvidesDialog {

        let customView = await SuggestionView()
        return  .result(dialog: "Suggestions are as below, for more information, please check the Magnifi app. ", view: customView)
    }
}
