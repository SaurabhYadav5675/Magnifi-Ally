import Foundation
import SwiftUI

struct SuggestionView: View {

    let suggetsions = [
        "Get analysis from Mangnifi ally",
        "Get Stock Details",
        "Mangnifi ally support",
        "Show magnifi ally watchlist",
    ]

    @available(iOS 13.0.0, *)
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(suggetsions, id: \.self) { title in
                SuggestionButton(message: title)

            }
        }
        .padding(.vertical, 10)
        .padding(.leading, -100)
    }
}

@available(iOS 13.0.0, *)
struct SuggestionButton: View {
    var message: String

    var body: some View {
        Button(action: {
            Task {
                if #available(iOS 16, *) {
                    await triggerIntent(for: message)
                } else {
                    print("can't trigeering ");
                    // Fallback on earlier versions
                }
            }
        }) {
            HStack(spacing: 5) {
                Image(systemName: "star.fill")  // Use a star icon
                    .foregroundColor(Color(hex: 0x7A6225))  // Change the icon color
                Text(message).font(.system(size: 14, weight: .medium))
                    .padding(.leading, -0)
                    .foregroundColor(Color(hex: 0x7A6225))  // Change the text color
            }
            .frame(height: 25)
            .padding(5)
            .background(Color.clear)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(hex: 0x7A6225), lineWidth: 1)  // Green border
            )
        }
        .buttonStyle(PlainButtonStyle())
    }

    @available(iOS 16, *)
    func triggerIntent(for title: String) async {
        do {
            switch title {
            case "Get analysis from Mangnifi ally":
                let analysisIntent = AnalysisIntent()
                let _ = try await analysisIntent.perform()

            case "Mangnifi ally support":
                let secondIntent = SupportIntent()
                let _ = try await secondIntent.perform()

            case "Show magnifi ally watchlist":
                let watlistIntent = WatchlistIntent()
                let _ = try await watlistIntent.perform()
            default:
                print("No intent found for title: \(title)")
            }
        } catch {
            print("Error triggering intent: \(error)")
        }
    }
}
