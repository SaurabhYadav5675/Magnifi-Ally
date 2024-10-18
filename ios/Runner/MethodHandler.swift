import Foundation
import Flutter

class FlutetrMethodHandler {
    @available(iOS 13.0.0, *)
    func callSendMessage() async throws -> String {
        
        let flutterViewController = await UIApplication.shared.keyWindow?.rootViewController as? FlutterViewController
        
        if (flutterViewController != nil){
            let channel = await FlutterMethodChannel(name:"com.tifin.magnifi_ally/action", binaryMessenger: flutterViewController!.binaryMessenger);
            
            return try await withCheckedThrowingContinuation { continuation in
                channel.invokeMethod("send_message", arguments: nil){ result in
                    if let error = result as? FlutterError {
                        continuation.resume(throwing: error as! any Error)
                    } else if let response = result as? String {
                        continuation.resume(returning: response)
                    }
                    else{
                        continuation.resume(throwing: NSError(domain: "MethodChannelError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid response"]))
                    }
                    
                }
            }
        }else{
            return "Opps, unable to fetch data";
        }
    }
}

