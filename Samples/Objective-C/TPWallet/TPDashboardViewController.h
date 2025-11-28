//
//  ViewController.h
//  TPWallet
//
//  Created by Giri babu on 06/05/25.
//

#import <UIKit/UIKit.h>

@interface TPDashboardViewController : UIViewController {
    
    __weak IBOutlet UILabel *lblMSISDN;
    __weak IBOutlet UILabel *lblUsername;
    __weak IBOutlet UILabel *lblBalance;
    
}

- (IBAction)launchTerraPaySDK:(id)sender;

@end

