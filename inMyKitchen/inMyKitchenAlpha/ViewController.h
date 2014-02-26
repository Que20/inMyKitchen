//
//  ViewController.h
//  inMyKitchenAlpha
//
//  Created by Kevin Maarek on 24/11/2013.
//  Copyright (c) 2013 Kevin Maarek. All rights reserved.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property(nonatomic, retain) UIColor *barTintColor;
@property (strong, nonatomic) IBOutlet UINavigationItem *navigationBar;
@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (weak, nonatomic) IBOutlet UIButton *ingredientsBtn;
@property (weak, nonatomic) IBOutlet UIButton *recettesBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableRecent;

@end
