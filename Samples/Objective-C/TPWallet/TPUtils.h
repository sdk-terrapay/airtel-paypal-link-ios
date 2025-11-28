//
//  TPUtils.h
//  TPWallet
//
//  Created by Sunku Sneha on 06/05/25.
//

#import <UIKit/UIKit.h>

@interface TPUtils : NSObject

+ (UIViewController *)fetchVCWithBoardName:(NSString *)boardName identifier:(NSString *)identifier;
+ (void)setUpAppConfigurations;
@end
