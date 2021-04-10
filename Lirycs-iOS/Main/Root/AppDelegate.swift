//
//  AppDelegate.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    lazy var databaseManager = DatabaseManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppState.shared.databaseManager = databaseManager
        AppState.shared.databaseManager.prepare(modelName: "Song")
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        databaseManager.saveContext()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        databaseManager.saveContext()
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

