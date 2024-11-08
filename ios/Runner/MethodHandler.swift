import Foundation
import Flutter

@available(iOS 13.0.0, *)
class FlutetrMethodHandler {
    func callSendMessage(message:String) async throws -> String {
        // Safely unwrap the Flutter view controller
        guard let flutterViewController = await UIApplication.shared.keyWindow?.rootViewController as? FlutterViewController else {
            print("FlutterViewController not found")
            throw NSError(domain: "FlutterError", code: -1, userInfo: [NSLocalizedDescriptionKey: "FlutterViewController not found"])
        }
        let channel = await FlutterMethodChannel(name: "com.tifin.magnifi_ally/action", binaryMessenger: flutterViewController.binaryMessenger)
        
        return try await withCheckedThrowingContinuation { continuation in
        
            channel.invokeMethod("send_message", arguments: message) { result in
                // Error handling for Flutter side
                if let error = result as? FlutterError {
                    // Handle Flutter specific error
                    continuation.resume(throwing: NSError(domain: "FlutterError", code:-1,userInfo: [NSLocalizedDescriptionKey: error.message ?? "Unknown error"]))
                } else if let response = result as? String {
                    // Handle the valid response
                    continuation.resume(returning: response)
                } else {
                    // Handle invalid response type
                    continuation.resume(throwing: NSError(domain: "MethodChannelError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid response from Flutter"]))
                }
            }
        }
        
    }

}

