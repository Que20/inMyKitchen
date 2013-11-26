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
    if([self.test length]!= 0){
        [self writeATEndOfFile:self.test];
        [self writeATEndOfFile:@";"];
        [self viewDidLoad];
        NSLog(@"Ingrédient ajouté");
    }else{
        [self viewDidLoad];
        NSLog(@"Annulé");
    }
    
}

-(void)clearFile{
     NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
     NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents directory
     NSError *error;
     BOOL succeed = [@"" writeToFile:[documentsDirectory stringByAppendingPathComponent:@"ingredientsList.txt"] atomically:YES encoding:NSUTF8StringEncoding error:&error];
     if (!succeed){
         NSLog(@"Erreur");
     }else{
         NSLog(@"Fichié vidé");
     }
}

-(void)writeATEndOfFile:(NSString *)appendedStr{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"%@/ingredientsList.txt", documentsDirectory];
    NSString *writedStr = [[NSString alloc]initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
    writedStr = [writedStr stringByAppendingFormat:appendedStr];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:fileName]){
        [[NSFileManager defaultManager] removeItemAtPath:fileName error:nil];
    }
    [writedStr writeToFile:fileName atomically:YES encoding:NSStringEncodingConversionAllowLossy error:nil];
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
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"%@/ingredientsList.txt", documentsDirectory];
    NSString *writedStr = [[NSString alloc]initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
    ingredients = [writedStr componentsSeparatedByString:@";"];
    NSLog(@"%@",ingredients);
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
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
            cell.accessoryType = UITableViewCellStyleDefault;
        }
    }
    cell.textLabel.text = [ingredients objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}

- (IBAction)add:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ingrédient" message:@"Ajout" delegate:self cancelButtonTitle:@"Annuler" otherButtonTitles:@"OK", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alert show];
    
}
- (IBAction)remove:(id)sender {
    [self clearFile];
    [self viewDidLoad];
}

@end
