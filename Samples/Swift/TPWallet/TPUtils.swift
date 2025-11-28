//
//  TPUtils.swift
//  TPWallet
//
//  Created by Sneha Sunku on 21/06/24.
//

import Foundation
import UIKit

enum TPLinkType {
    case none
    case confirm
    case success
    case withdraw
    case deposit
}

enum TPResponseStatus: String {
    case linkedSuccess = "4000"
    case linkInProgress = "4001"
    case linkedAlready = "4002"
    case balanceSuccess = "4100"
    case depositSuccess = "4300"
    case withdraSuccess = "4200"
}

struct TPUtils {
    
    static var bundle: Bundle {
        let bundle = Bundle(identifier: "com.terrapay.wallet")
        return bundle!
    }
    
    static var appDelegate: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
    
    static var currentTimeStamp: String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: currentDate)
    }
    
    static func colorWithHexString(hex: String) -> UIColor? {
        
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if (cString.count) != 6 {
            return UIColor.gray
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func setUpAppConfigurations() {        
        UINavigationBar.appearance().tintColor = .navigationLeft
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    static func fetchVC(boardName: String?, identifier: String?) -> UIViewController? {
        if let boardName = boardName, let identifier = identifier {
            let storyBoard = UIStoryboard(name: boardName, bundle: nil)
            let viewController = storyBoard.instantiateViewController(withIdentifier: identifier)
            return viewController
        }
        return nil
    }
    
    static func fetchTabVCWith(boardName: String?, identifier: String?) -> UITabBarController? {
        if let boardName = boardName, let identifier = identifier {
            let storyBoard = UIStoryboard(name: boardName, bundle: nil)
            let viewController = storyBoard.instantiateViewController(withIdentifier: identifier)
            return viewController as? UITabBarController
        }
        return nil
    }
    
    static func getQueryItems(_ urlString: String) -> [String: String] {
        var queryItems: [String: String] = [:]
        let components: NSURLComponents? = getURLComponents(urlString)
        for item in components?.queryItems ?? [] {
            queryItems[item.name] = item.value?.removingPercentEncoding
        }
        return queryItems
    }
    
    static func getURLComponents(_ urlString: String?) -> NSURLComponents? {
        var components: NSURLComponents?
        let linkUrl = URL(string: urlString?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "")
        if let linkUrl = linkUrl {
            components = NSURLComponents(url: linkUrl, resolvingAgainstBaseURL: true)
        }
        return components
    }
}
