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
// Je syntetise des propertys déclarées dans le header du fichier (RecettesViewController.h)
// à ne pas confondre avec self.nomDeLaProperty qui la rends simplement accessible
@synthesize tableView, content = _content;

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
    NSString* txtlbl;
    txtlbl = [NSString stringWithFormat:@"Vous avez %d ingrédients",[self ingredientsCounter]-1];
    self.nbIngredients.text = txtlbl;
    [self getIngredients];
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
- (int) ingredientsCounter{
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
    return [self.content count];
}
// Autogénéré obligatoire pour une tableview
// Fonction chargée de créer chaque cellule : renvoie la cellule de type UITableViewCell
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
// Fonction qui récupere les ingrédients à afficher en cellule
// !! à prendre en compte dans cellForRowAtIndexPath !!
- (int) getIngredients{
    int i = 0, j = 0, k = 0;
    int cptr = 0;
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
                }
            }
        }
    }
    return cptr;
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
