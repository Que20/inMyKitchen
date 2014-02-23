//
//  RecettesViewController.m
//  inMyKitchen
//
//  Created by Kevin Maarek on 28/11/2013.
//  Copyright (c) 2013 Kevin Maarek. All rights reserved.
//
#import "RecipeDetailViewController.h"
#import "RecipeViewController.h"

@interface RecettesViewController ()

@end

@implementation RecettesViewController
// Je syntetise des propertys déclarées dans le header du fichier (RecettesViewController.h)
// à ne pas confondre avec self.nomDeLaProperty qui la rends simplement accessible
@synthesize tableView, content = _content; //tableau à créer

// autogénéré powa \o/
- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
// Fonction qui fait office de main à la vue
- (void) viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // met à jour le label "Vous avez X ingrédients
    NSInteger testKiki = [self getIngredients];
    NSString* txtlbl;
    txtlbl = [NSString stringWithFormat:@"Vous avez %d ingrédients",(int)[self ingredientsCounter]-1];
    self.nbIngredients.text = txtlbl;
    // LA LIGNE QUI VA SUIVRE EST HARD CORE
    //NSString* Hello = [[[self.content objectAtIndex:1] valueForKey:@"Ingredients"] objectAtIndex:1];
    //NSLog(@"%@",Hello);
    // ET ELLE MARCHE !
}
- (void) didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// Fonction qui récupère le contenu du Plist pour en faire un tableau
- (NSArray *) content{
    if(!_content){
        NSString* path = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
        _content = [[NSArray alloc] initWithContentsOfFile:path];
    }
    return _content;
}
// Fonction qui compte les ingredients
// !! à optimiser !!
- (NSInteger) ingredientsCounter{
    NSArray* ingredients;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"%@/ingredientsList.txt", documentsDirectory];
    NSString *writedStr = [[NSString alloc]initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
    ingredients = [writedStr componentsSeparatedByString:@";"];
    return [ingredients count];
}
// Autogénéré obligatoire pour une tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    return 1;
}
// Autogénéré obligatoire pour une tableview
- (NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of cell ([data count])
    [self getIngredientsQue20];
    return [self.toDisplay count];
}
// Autogénéré obligatoire pour une tableview
// Fonction chargée de créer chaque cellule : renvoie la cellule de type UITableViewCell
/**
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
    cell.textLabel.text = [self.toDisplay objectAtIndex:indexPath.row];
    //cell.imageView.image = [UIimage imageNamed:@"img.jpg"];
    return cell;
}
**/

- (UITableViewCell *)tableView:(UITableView *)tableViewX cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    
    UITableViewCell *cell = [tableViewX dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [self.toDisplay objectAtIndex:indexPath.row];
    return cell;
}

NSInteger arrondirSuperieur(float value){
    float roundedup = ceil(value);
    return roundedup;
}

float pourcentage(NSInteger value){
    return (60*value)/100;
}

- (void) getIngredientsQue20{
    int i,j,k;
    int cptr = 0;
<<<<<<< HEAD:inMyKitchen/inMyKitchenAlpha/RecipeViewController.m
    NSMutableArray* tmpToDisplay = [[NSMutableArray alloc] initWithCapacity:1];
    for(i = 0; i < [self.content count]; i++){
        NSArray* receipe = [[self.content objectAtIndex:i] valueForKey:@"Ingredients"];
        NSArray* fridge = [self getUser];
        for (j = 0; j < [receipe count]; j++){
            cptr = 0;
            for (k = 0; k < [fridge count]; k++){
                NSString* receipeItem = [[receipe objectAtIndex:j] lowercaseString];
                NSString* fridgeItem = [[fridge objectAtIndex:k] lowercaseString];
                NSLog(@"%@ vs %@",receipeItem,fridgeItem);
                if([receipeItem isEqualToString:fridgeItem]){
                    cptr ++;
                    break;
=======
    id obj;
    NSArray* user = [self getUser];
    // for de parcours du contenu de content (le fichier plist)
    for(i = 0; i < [self.content count]; i++){
        obj = [self.content objectAtIndex:i];
        // récupération de "Ingrédient"
        NSArray* list = [obj valueForKey:@"Ingredients"]; // !! Le contenu s'affiche bien dans la console, mais le debug ne montre rien !!
        NSLog(@"%@",list);
        // for de parcour de list, la liste des ingrédients de chaque item du plist
        for(k = 0; k < [list count]; k++){
            NSString* sousItem = [list objectAtIndex:k];
            // NSLog(@"%@",sousItem); // => log bien les ingrédients !!!
            // for de parcour de la liste des ingrédients entrés par l'user
            for(j = 0; j < [user count]; j++){
                // si un ingrédient entré par l'user et présent dans la liste d'ungredients d'un item
                // l'opérateur "==" est OK pour la comparaison de NSStrings
                if(sousItem == [user objectAtIndex:j]){
                    // on incrémente le compteur
                    cptr++;
                    NSLog(@"%d",cptr);
                    // calcul du match
                    // if on est dans le match
                    // ajout au tableau global à générer
                        // parcours de à generer
                        // ajout au tableau
>>>>>>> a55b674136e786d2c5b2311ee91939683e6e0081:inMyKitchen/inMyKitchenAlpha/RecettesViewController.m
                }
            }
        }
        
        if(cptr >= arrondirSuperieur(pourcentage([receipe count]))){
            [tmpToDisplay addObject:[[self.content objectAtIndex:i] valueForKey:@"Nom"]];
        }
        
        NSLog(@"%@ : %d : %d",[[self.content objectAtIndex:i] valueForKey:@"Nom"],arrondirSuperieur(pourcentage([receipe count])),cptr);
    }
    self.toDisplay = [[NSArray alloc] initWithArray:tmpToDisplay];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        RecipeDetailViewController *destViewController = segue.destinationViewController;
        destViewController.recipeName = [self.toDisplay objectAtIndex:indexPath.row];
    }
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


@end
