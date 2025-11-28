## 📦 TerraPaySDK

TerraPaySDK is a lightweight and customizable SDK that allows seamless integration of TerraPay wallet services into your iOS app. It provides support for linking PayPal wallet, top-up and withdrawal flows with configurable UI elements like wallet branding and color themes.

## 🚀 Features

- Set wallet metadata like name, logo, and user info.
- Configure UI labels and brand colors.
- Launch SDK with a single entry point.
- Easily embeddable into any iOS app.

## 📲 Requirements
- iOS 13.0+
- Swift 6+
- Xcode 15+

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

<br>
<br>
<br>
<br>
<br>
<br>
<br>

## 🛠️ Usage

```swift
## config params validation as below
- dialCode             (Required) Must match the pattern ^\+\d+$
- msisdn               (Required) Must contain only digits; length validated against country-specific rules.
- walletName           (Required) Must not be empty.
- currency             (Required) Must be a valid ISO 4217 currency code.
- countryCode          (Required) Must be a valid ISO 3166-1 alpha-2 country code.
- primaryColor         (Required) Must be a valid 6-digit hex code (e.g., EC1B24).
- secondaryColor       (Required) Must be a valid 6-digit hex code (e.g., FFFFFF).
- email                (Optional) Must be a valid email address if provided.
- topUpLabel           (Optional) Title for the deposit button.
- withdrawLabel        (Optional) Title for the withdraw button.
- termsConditionsUrl   (Optional) URL for terms and conditions.
```

### Swift

#### 1. Import the SDK

```swift
import TerraPaySDK
```

#### 2. Initialize and Launch the SDK

```swift
let config = TerrapaySDKConfig(controller: self,
                                       dialCode: "+254",
                                       msisdn: "792474540",
                                       walletName: "Airtel Money Wallet",
                                       currency: "KES",
                                       countryCode: "KE",
                                       primaryColor: "EC1B24",
                                       secondaryColor: "FFFFFF",
                                       email: "test@test.com",
                                       topUpLabel: "Top-Up",
                                       withdrawLabel: "Withdraw",
                                       termsConditionsUrl: "")
        
TerraPayClient.shared.launch(with: config) { result, error in
    switch result {
    case .success: print("SDK launched successfully")
    case .cancelled: print("User cancelled")
    case .failure: print("Error: \(error?.message ?? "")")
    @unknown default: fatalError()
    }
}
```

#### 3. Configure url scheme

URL Shemes needs to be configured as "tpwallet" under URL Types. 

// Add below code in AppDelegate.swift file

```swift
func application(_ application: UIApplication,
                 open url: URL,
                 options: [UIApplication.OpenURLOptionsKey: Any] = [:] ) -> Bool {
            
    TerraPayClient.shared.handleRedirect(url: url)
    return true
}
```

### Objective-C

#### 1. Import the SDK

```objc
#import "TerraPaySDK/TerraPaySDK-Swift.h"
```

#### 2. Initialize and Launch the SDK

```objc
TerrapaySDKConfig *config = [[TerrapaySDKConfig alloc] initWithController:self
                                                                     dialCode:@"+254"
                                                                       msisdn:@"792474540"
                                                                   walletName:@"Airtel Money Wallet"
                                                                     currency:@"KES"
                                                                  countryCode:@"KE"
                                                                 primaryColor:@"EC1B24"
                                                               secondaryColor:@"FFFFFF"
                                                                        email:@"test@test.com"
                                                                   topUpLabel:@"Top Up"
                                                                withdrawLabel:@"Withdraw"
                                                           termsConditionsUrl:@""];
    
    
[[TerraPayClient shared] launchWith:config completionHandler:^(TerraPayResultType result, TerraPayErrorInfo *error) {
    switch (result) {
        case TerraPayResultTypeSuccess:
            NSLog(@"SDK launched successfully");
            break;
        case TerraPayResultTypeCancelled:
            NSLog(@"User cancelled");
            break;
        case TerraPayResultTypeFailure:
            NSLog(@"Error Code: %@", error.code);
            NSLog(@"Error Message: %@", error.message);
            break;
    }
}];
```

#### 3. Configure url scheme

URL Shemes needs to be configured as "tpwallet" under URL Types. 

// Add below code in AppDelegate.m file

```objc
#import "TerraPaySDK/TerraPaySDK-Swift.h"

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    
    [[TerraPayClient shared] handleRedirectWithUrl:url];
    return YES;
}
```

### SwiftUI

#### 1. Import the SDK

```SwiftUI
import TerraPaySDK
```

#### 2. Initialize and Launch the SDK

```SwiftUI
let config = TerrapaySDKConfig(controller: viewcontroller,
                                dialCode: "+254",
                                msisdn: "792474540",
                                walletName: "Airtel Money Wallet",
                                currency: "KES",
                                countryCode: "KE",
                                primaryColor: "EC1B24",
                                secondaryColor: "FFFFFF",
                                email: "test@test.com",
                                topUpLabel: "Top-Up",
                                withdrawLabel: "Withdraw",
                                termsConditionsUrl: "")

TerraPayClient.shared.launch(with: config) { result, error in
    switch result {
    case .success: print("SDK launched successfully")
    case .cancelled: print("User cancelled")
    case .failure: print("Error: \(error?.message ?? "")")
    @unknown default: fatalError()
    }
}
```
#### 3. Configure url scheme

URL Shemes needs to be configured as "tpwallet" under URL Types. 

// Add below code in View file

```SwiftUI
    struct ContentView: View {
        var body: some View {
            Text("Hello, SwiftUI!")
                .onOpenURL { url in
                    TerraPayClient.shared.handleRedirect(url: url)
                }
        }
    }
```



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

