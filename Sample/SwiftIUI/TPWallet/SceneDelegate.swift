//
//  SceneDelegate.swift
//  TPWallet
//
//  Created by Sunku Sneha on 06/05/25.
//

import Foundation
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "terrapayConnectedRedirectNotification"), object: URLContexts.first?.url)
    }

}
