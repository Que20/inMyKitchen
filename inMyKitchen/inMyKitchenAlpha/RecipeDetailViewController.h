//
//  RecipeDetailViewController.h
//  inmykitchen
//
//  Created by Kevin Maarek on 23/02/2014.
//  Copyright (c) 2014 Kevin Maarek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *recipeText;
@property (weak, nonatomic) IBOutlet UILabel *recipeLabel;
@property (nonatomic, strong) NSString *recipeName;
@property (weak, nonatomic) IBOutlet UIImageView *recipeImage;
@property (strong, nonatomic) NSArray* content;
@end
