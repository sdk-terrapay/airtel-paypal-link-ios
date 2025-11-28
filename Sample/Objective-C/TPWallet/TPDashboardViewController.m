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
    TerraPaySDK *sdk = [[TerraPaySDK alloc] initWithController: self];
    sdk.msisdn = @"+254792474540";
    sdk.primaryColor = @"EC1B24";
    sdk.secondaryColor = @"FFFFFF";
    sdk.walletLogo = UIImagePNGRepresentation([UIImage imageNamed:@"logo"]);
    sdk.walletName = @"Airtel Money Wallet";
    sdk.topUpLabel = @"Top-up";
    sdk.withdrawLabel = @"Withdrawal";
    [sdk launch];
}

@end
