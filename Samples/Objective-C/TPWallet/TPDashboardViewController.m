//
//  TPDashboardViewController.m
//  TPWallet
//
//  Created by Giri babu on 06/05/25.
//

#import "TPDashboardViewController.h"
#import "TerraPaySDK/TerraPaySDK-Swift.h"

@interface TPDashboardViewController ()

@end

@implementation TPDashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUIElements];
    
}

-(void)setupUIElements {
    lblMSISDN.text = @"+254792474540";
    lblBalance.text = @"10000.00 KES";
    lblUsername.text = @"Hi, George Mbugua!";
    
    UIImage *originalImage = [UIImage imageNamed:@"airtel"];
    UIImage *templateImage = [originalImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:templateImage];
    imgView.tintColor = [UIColor whiteColor];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = imgView;
}

- (IBAction)launchTerraPaySDK:(id)sender {
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
}

@end
