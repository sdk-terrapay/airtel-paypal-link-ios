## 📦 TerraPaySDK

TerraPaySDK is a lightweight and customizable SDK that allows seamless integration of TerraPay wallet services into your iOS app. It provides support for linking PayPal wallet, top-up and withdrawal flows with configurable UI elements like wallet branding and color themes.

## 🚀 Features

- Set wallet metadata like name, logo, and user info.
- Configure UI labels and brand colors.
- Launch SDK with a single entry point.
- Easily embeddable into any iOS app.

## 📲 Requirements
- iOS 13.0+
- Swift 5+
- Xcode 14+

## 🔧 Steps to Add a Framework:

1. Download or Locate the Framework Ensure you have the "TerraPaySDK.xcframework" file ready.
2. Drag and Drop into Xcode
    - Open your Xcode project.
    - Drag the "TerraPaySDK.xcframework" file into your project’s Project Navigator (left panel).
    - Choose "Copy items if needed" to ensure the framework is embedded properly.
3. Add Framework to Linked Libraries
    - Click on your project in the Project Navigator.
    - Navigate to "General" > "Frameworks, Libraries, and Embedded Content".
    - Click the "+" button and select "TerraPaySDK.xcframework".
4. Verify Build Settings
    - Go to your project’s Build Settings tab.
    - Search for "Framework Search Paths" and ensure the framework’s directory is included.   
5. Embed & Sign
    - In "General" > "Frameworks, Libraries, and Embedded Content", set the framework to "Embed & Sign".
6. Import the Framework in Code
    - Use import FrameworkName in Swift or Objective-C or SwiftUI to access the framework’s APIs.

## 🛠️ Usage

### Swift
<details>
<summary>**Click to expand Swift code**</summary>

#### 1. Import the SDK

```swift
import TerraPaySDK
```

#### 2. Initialize and Launch the SDK

```swift
let sdk = TerraPaySDK(controller: self) // Parameter controller: The presenting view controller.
sdk.msisdn = "1234567890" // Mobile number linked to the wallet/account.
sdk.email = "user@example.com" // Email linked to the wallet/account.
sdk.walletName = "MyWallet"
sdk.walletLogo = UIImage(named: "logo")?.pngData() // Optional wallet logo to display within the SDK.
sdk.primaryColor = "1A73E8" // Primary branding color (hex string).
sdk.secondaryColor = "34A853" // Secondary branding color (hex string).
sdk.topUpLabel = "Add Money" // Custom label text for top-up operations.
sdk.withdrawLabel = "Get Money" // Custom label text for withdrawal operations.
sdk.launch()
```

#### 3. Configure url scheme

URL Shemes needs to be configured as "tpwallet" under URL Types and add below code in AppDelegate.swift file.

```swift
func application(_ application: UIApplication,
open url: URL,
options: [UIApplication.OpenURLOptionsKey: Any] = [:] ) -> Bool {
NotificationCenter.default.post(name: NSNotification.Name(rawValue: "terrapayConnectedRedirectNotification"), object: url)
return true
}
```
</details>

### Objective-C
<details> 
<summary>**Click to expand Objective-C code**</summary>

#### 1. Import the SDK

```objc
import "TerraPaySDK/TerraPaySDK-Swift.h"
```

#### 2. Initialize and Launch the SDK

```objc
TerraPaySDK *sdk = [[TerraPaySDK alloc] initWithController: self];
sdk.msisdn = @"+254792474540";
sdk.primaryColor = @"EC1B24";
sdk.secondaryColor = @"FFFFFF";
sdk.walletLogo = UIImagePNGRepresentation([UIImage imageNamed:@"logo"]);
sdk.walletName = @"Airtel Money Wallet";
sdk.topUpLabel = @"Top-up";
sdk.withdrawLabel = @"Withdrawal";
[sdk launch];
```

#### 3. Configure url scheme

URL Shemes needs to be configured as "tpwallet" under URL Types and add below code in AppDelegate.m file.

```objc
- (BOOL)application:(UIApplication *)application
openURL:(NSURL *)url
options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
[[NSNotificationCenter defaultCenter] postNotificationName:@"terrapayConnectedRedirectNotification"
object:url];
return YES;
}
```
</details>

### SwiftUI

<details> 
<summary>**Click to expand SwiftUI code**</summary>

#### 1. Import the SDK

```swift
import TerraPaySDK
```

#### 2. Initialize and Launch the SDK

```swift
let sdk = TerraPaySDK(controller: self) // Parameter controller: The presenting view controller.
sdk.msisdn = "1234567890" // Mobile number linked to the wallet/account.
sdk.email = "user@example.com" // Email linked to the wallet/account.
sdk.walletName = "MyWallet"
sdk.walletLogo = UIImage(named: "logo")?.pngData() // Optional wallet logo to display within the SDK.
sdk.primaryColor = "1A73E8" // Primary branding color (hex string).
sdk.secondaryColor = "34A853" // Secondary branding color (hex string).
sdk.topUpLabel = "Add Money" // Custom label text for top-up operations.
sdk.withdrawLabel = "Get Money" // Custom label text for withdrawal operations.
sdk.launch()
```
#### 3. Configure url scheme

URL Shemes needs to be configured as "tpwallet" under URL Types and add below code in View file.

```swift
    struct ContentView: View {
        var body: some View {
            Text("Hello, SwiftUI!")
                .onOpenURL { url in
                    NotificationCenter.default.post(name: NSNotification.Name("terrapayConnectedRedirectNotification"), object: url)
                }
        }
    }
```

</details>

## 📁 Project Structure

```
TerraPaySDK/
├── Sample/
│   └── Objective-C/
│   └── Swift/
│   └── SwiftUI/
├── Sources/
│   └── TerraPaySDK.xcframework
├── Package.swift
└── README.md
```


## 🔐 License

This SDK is proprietary and intended for internal or authorized use only. For licensing, please contact TerraPay.

## 📬 Contact

For support or inquiries, email: technology_mobile_apps@terrapay.com

