//
//  IngredientsViewController.m
//  inMyKitchenAlpha
//
//  Created by Kevin Maarek on 24/11/2013.
//  Copyright (c) 2013 Kevin Maarek. All rights reserved.
//

#import "IngredientsViewController.h"

@interface IngredientsViewController (){
    NSArray *ingredients;
}

@end

@implementation IngredientsViewController

@synthesize tableView;

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    self.test = [[alertView textFieldAtIndex:0] text];
    NSLog(@"%@",self.test);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    ingredients = [[NSArray alloc] initWithObjects: @"Farine", @"Sucre", @"Lait", @"Chocolat", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger) numberOfSectionInTableView:(UITableView*) tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section{
    return [ingredients count];
}

- (UITableViewCell *)tableView:(UITableView *)tableViewX cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableViewX dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    cell.textLabel.text = [ingredients objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void) tableview : (UITableView *) tableView didSelectAtIndexPath:(NSIndexPath *) indexpath{
    NSLog(@"row %d",indexpath.row);
}

- (IBAction)add:(id)sender {
    /**UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@" " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
	CGRect frame = CGRectMake(14, 45, 255, 23);
	self.textField = [[UITextField alloc] initWithFrame:frame];
	self.textField.placeholder = @"Name";
	self.textField.backgroundColor = [UIColor blackColor];
	self.textField.autocorrectionType = UITextAutocorrectionTypeDefault;
	self.textField.keyboardType = UIKeyboardTypeAlphabet;
	self.textField.returnKeyType = UIReturnKeyDone;
	self.textField.clearButtonMode = UITextFieldViewModeWhileEditing; // has 'x' button to the right
	[alertView addSubview:self.textField];
	[alertView show];
     ---
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ingrédient" message:@"Nouvel ingrédient" delegate:nil cancelButtonTitle:@"Annuler" otherButtonTitles:@"Ajouter", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alert show];
    [[alert textFieldAtIndex:0] resignFirstResponder];**/
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ingrédient" message:@"Ajout" delegate:self cancelButtonTitle:@"Annuler" otherButtonTitles:@"OK", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alert show];
    
}


@end
