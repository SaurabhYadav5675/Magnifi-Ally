import Flutter
import UIKit
import Intents

@main
@objc class AppDelegate: FlutterAppDelegate {
    
    var flutterController:FlutterViewController?
    
    override func application(
      _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
        flutterController=(window.rootViewController as! FlutterViewController)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
//    override func application(
//        _ application: UIApplication,
//        continue userActivity: NSUserActivity,
//        restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void
//    ) -> Bool {
//        GeneratedPluginRegistrant.register(with: self)
//        flutterController=(window.rootViewController as! FlutterViewController)
//        
//        INPreferences.requestSiriAuthorization { (status) in
//            switch status{
//            case .authorized:
//                print("Siri access granted");
//            case .denied,
//                    .notDetermined,
//                    .restricted:
//                print("Siri access denied");
//            default:
//                print("Siri access restricted");
//            }
//        }
//        return true;
//    }
}
    
