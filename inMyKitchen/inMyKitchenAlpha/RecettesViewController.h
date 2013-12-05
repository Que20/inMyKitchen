//
//  RecettesViewController.h
//  inMyKitchen
//
//  Created by Kevin Maarek on 28/11/2013.
//  Copyright (c) 2013 Kevin Maarek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecettesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *nbIngredients;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray* content;
@end
