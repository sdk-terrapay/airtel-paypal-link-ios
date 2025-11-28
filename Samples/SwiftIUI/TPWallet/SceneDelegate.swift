//
//  SceneDelegate.swift
//  TPWallet
//
//  Created by Sunku Sneha on 06/05/25.
//

import Foundation
import UIKit
import TerraPaySDK

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else { return }
        TerraPayClient.shared.handleRedirect(url: url)
    }
}
