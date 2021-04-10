//
//  AppCoordinator.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import SwiftUI
import CoreData

class AppCoordinator {
    
    private(set) var window: UIWindow?
    private var scene: UIScene
    private var managedContext: NSManagedObjectContext
    
    init(scene: UIScene, managedContext: NSManagedObjectContext) {
        self.scene = scene
        self.managedContext = managedContext
    }

    func start() {
        let contentView = ContentView()
            .environment(\.managedObjectContext, managedContext)
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
}
