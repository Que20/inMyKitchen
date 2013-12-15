//
//  RecettesViewController.m
//  inMyKitchen
//
//  Created by Kevin Maarek on 28/11/2013.
//  Copyright (c) 2013 Kevin Maarek. All rights reserved.
//

#import "RecettesViewController.h"

@interface RecettesViewController ()

@end

@implementation RecettesViewController

@synthesize tableView, content = _content;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString* txtlbl;
    txtlbl = [NSString stringWithFormat:@"Vous avez %d ingrédients",[self ingredientsCounter]-1];
    self.nbIngredients.text = txtlbl;
    [self getIngredients];
}
- (void) didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSArray *) content{
    if(!_content){
        NSString* path = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
        _content = [[NSArray alloc] initWithContentsOfFile:path];
    }
    return _content;
}
- (int) ingredientsCounter{
    NSArray* ingredients;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"%@/ingredientsList.txt", documentsDirectory];
    NSString *writedStr = [[NSString alloc]initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
    ingredients = [writedStr componentsSeparatedByString:@";"];
    return [ingredients count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    return 1;
}
- (NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of cell ([data count])
    return [self.content count];
}
- (UITableViewCell *)tableView:(UITableView *)tableViewX cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableViewX dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellStyleDefault;
        }
    }
    // Return the cell details : text and image
    cell.textLabel.text = [[self.content objectAtIndex:indexPath.row] valueForKey:@"Nom"];
    //cell.imageView.image = [UIimage imageNamed:@"img.jpg"];
    return cell;
}
- (NSArray *) getIngredients{
    int i = 0;
    id obj;
    NSArray* list;
    NSArray* user = [ self getUser ];
    
    for(i = 0; i < [self.content count]; i++){
        obj = [self.content objectAtIndex:i];
        list = [obj valueForKey:@"Ingredients"];
        
        NSLog(@"%@",list);
    }
    return list;
}

- (NSArray *) getUser{
    NSArray *uIngredients;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"%@/ingredientsList.txt", documentsDirectory];
    NSString *writedStr = [[NSString alloc]initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
    uIngredients = [writedStr componentsSeparatedByString:@";"];
    return uIngredients;
}
=======



>>>>>>> af8666ee11f1050c4555cf824936e7a64650a701

@end
