//
//  AppDelegate.swift
//  SwapKitapp
//
//  Created by Bibizhan on 10.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import SideMenu
let appDelegate = UIApplication.shared.delegate as! AppDelegate
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var menu: UISideMenuNavigationController?
    var menuViewController:SideMenuViewController!
    var menuManager:SideMenuManager!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        configureWindow()
        configureMenu()
        FirebaseApp.configure()
        Database.database().isPersistenceEnabled = true
//        Database.database().reference().setValue(nil)
        return true
    }
    
    func configureWindow(){
        
        let navigationController = UINavigationController(rootViewController: PageViewController())
        window = UIWindow(frame: UIScreen.main.bounds)
        navigationController.isNavigationBarHidden = true
        window!.rootViewController = navigationController
        window?.backgroundColor = .white
        window!.makeKeyAndVisible()
    }
    
    func configureMenu(){
        menuViewController = SideMenuViewController()
        menu = UISideMenuNavigationController(rootViewController:menuViewController)
        menu?.leftSide = true
        
        menuManager = SideMenuManager.default
        menuManager.menuLeftNavigationController = menu
        menuManager.menuFadeStatusBar = false
        menuManager.menuPresentMode = .menuSlideIn
        menuManager.menuPushStyle = .replace
        menuManager.menuWidth = screenWidth * 0.75
        menuManager.menuEnableSwipeGestures = true
        menuManager.menuAlwaysAnimate = true
        
       if let nVc = window?.rootViewController as? UINavigationController {
            menuManager.menuAddPanGestureToPresent(toView: nVc.navigationBar)
            menuManager.menuAddScreenEdgePanGesturesToPresent(toView: nVc.view, forMenu: .left)
        }
        
    }
    
    func configureAppearance() {
        //UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.black,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20)
        ]
        
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-100, 0), for:UIBarMetrics.default)
        UINavigationBar.appearance().isOpaque = true
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().shadowImage = UIImage()
        UIApplication.shared.statusBarStyle = .lightContent
    }
    

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "SwapKitapp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

