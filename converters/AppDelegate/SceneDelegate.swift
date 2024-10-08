//
//  SceneDelegate.swift
//  converters
//
//  Created by Rodrigo Amora on 05/06/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    enum AppShortCutKey: String{
        case temperatureKey = "temperatureKey"
        case distanceKey = "distanceKey"
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        self.createUITabBarItem(selectedIndex: 0)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if let tipo = AppShortCutKey(rawValue: shortcutItem.type) {
            switch tipo {
                case .temperatureKey:
                    createUITabBarItem(selectedIndex: 0)
                break

                case .distanceKey:
                    createUITabBarItem(selectedIndex: 1)
                break
            }
        }
    }
    
    private func createUITabBarItem(selectedIndex: Int) {
        let temperatueTabItem = UITabBarItem()
        temperatueTabItem.title = String(localized: "temperature")
        temperatueTabItem.image = UIImage(named: "icon-home")
        
        let temperatureViewController = TemperatureViewController()
        temperatureViewController.tabBarItem = temperatueTabItem
        
        let distanceTabItem = UITabBarItem()
        distanceTabItem.title = String(localized: "distance")
        distanceTabItem.image = UIImage(named: "icon-recept")
        
        let distanceViewController = DistanceViewController()
        distanceViewController.tabBarItem = distanceTabItem
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [temperatureViewController, distanceViewController]
        
        switch(selectedIndex) {
            case 0:
                tabBarController.selectedViewController = temperatureViewController
                break

            case 1:
                tabBarController.selectedViewController = distanceViewController
                break

            default:
                tabBarController.selectedViewController = temperatureViewController
                break
        }
        
        
        let navigationController = UINavigationController(rootViewController: tabBarController)
        
        window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()
    }
    
}

