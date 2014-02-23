//
//  RecipeDetailViewController.m
//  inmykitchen
//
//  Created by Kevin Maarek on 23/02/2014.
//  Copyright (c) 2014 Kevin Maarek. All rights reserved.
//

#import "RecipeDetailViewController.h"

@interface RecipeDetailViewController ()

@end

@implementation RecipeDetailViewController
@synthesize content = _content;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSArray *) content{
    if(!_content){
        NSString* path = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
        _content = [[NSArray alloc] initWithContentsOfFile:path];
    }
    return _content;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _content = [self content];
    self.recipeLabel.text = self.recipeName;
    for (int i = 0; i < [self.content count]; i++) {
        if([self.recipeName isEqualToString:[[self.content objectAtIndex:i] valueForKey:@"Nom"]]){
            self.recipeText.text = [[self.content objectAtIndex:i] valueForKey:@"Recette"];
            NSString *urlString = [[self.content objectAtIndex:i] valueForKey:@"Image"];
            NSData* imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlString]];
            self.recipeImage.image = [UIImage imageWithData: imageData];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
