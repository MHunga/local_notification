import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    if #available(iOS 10.0, *) { 
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
     let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "com.example.my_app/timezone",
                                        binaryMessenger: controller.binaryMessenger)
    channel.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        if ("getTimeZoneName" == call.method) {
            result(TimeZone.current.identifier)
        }
    })
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
