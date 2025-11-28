//
//  AppDelegate.swift
//  TPWallet
//
//  Created by Sneha Sunku on 21/06/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var dashboardVC: TPDashboardViewController?    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        TPNetworkManager().initialize()
        TPUtils.setUpAppConfigurations()
        
        if let dashboardVc = TPUtils.fetchVC(boardName: "Main", identifier: TPDashboardViewController.identifier) {
            self.window?.rootViewController = UINavigationController(rootViewController: dashboardVc)
        }
            
        return true
    }
    
    func application(_ application: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:] ) -> Bool {        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "terrapayConnectedRedirectNotification"), object: url)
        return true
    }
}
