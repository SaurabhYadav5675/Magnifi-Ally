import AppIntents
import Foundation

@available(iOS 16, *)
struct SupportIntent: AppIntent {

    static var title: LocalizedStringResource = "Magnifi support"
    static var description: IntentDescription =
        "help & support"

    func perform() async throws -> some IntentResult & ProvidesDialog {

        return .result(
            dialog:
                "The team at Magnifi is ready to lend a hand.Please email support@magnifi.com and we will help you reach the right person."
        )
    }
}
