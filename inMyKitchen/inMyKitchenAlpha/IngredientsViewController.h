//
//  IngredientsViewController.h
//  inMyKitchenAlpha
//
//  Created by Kevin Maarek on 24/11/2013.
//  Copyright (c) 2013 Kevin Maarek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IngredientsViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (strong, nonatomic) NSString *test;
- (IBAction)add:(id)sender;
- (IBAction)remove:(id)sender;

@end
