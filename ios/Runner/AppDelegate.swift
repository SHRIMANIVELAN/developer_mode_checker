import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
          let devModeChannel = FlutterMethodChannel(name: "samples.flutter.dev/devModeStatus",
                                                    binaryMessenger: controller.binaryMessenger)
      devModeChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            // This method is invoked on the UI thread.
          guard call.method == "getDevModeStatus" else {
              result(FlutterMethodNotImplemented)
              return
            }
          self.getDevModeStatus(result: result)
          })
      GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func getDevModeStatus(result: FlutterResult) {
        var isDeveloperModeEnabled:Bool?
     #if DEBUG
        isDeveloperModeEnabled = true
     #else
        isDeveloperModeEnabled = false
     #endif
        result(isDeveloperModeEnabled)
    }
    
    



}
