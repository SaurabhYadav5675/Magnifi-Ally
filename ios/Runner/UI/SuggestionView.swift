import Foundation
import SwiftUI

struct SuggestionView: View {

    @available(iOS 13.0.0, *)
    var body: some View {
        Text("Get analysis from magnifi ally").font(
            .system(size: 14, weight: .medium))
        Text("Get Stock Details").font(.system(size: 14, weight: .medium))
        Text("Mangnifi ally support").font(.system(size: 14, weight: .medium))
        Text("Show magnifi ally watchlist").font(
            .system(size: 14, weight: .medium))
        Button(action: {
                    // Action when button is tapped
                    print("Button tapped")
                }) {
                    Text("testing ffj")
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                        .foregroundColor(.green) // Text color
                        .frame(maxWidth: .infinity) // Make button full width
                }
                .background(Color.white) // Background color
                .cornerRadius(20) // Rounded corners
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.green, lineWidth: 2) // Green border
                )
        Text("Show magnifi ally watchlist last").font(
            .system(size: 14, weight: .medium))
    }
}
