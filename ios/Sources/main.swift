// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

import FirebaseCore


@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?


    func application(_ application: UIApplication,

    didFinishLaunchingWithOptions launchOptions:

        [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()

        return true

    }

}
