inMyKitchen
===========

iOS 7 Application

Notes 25/11/13 :
  - Gestion de l'entrée du UIAlert qui récupere un ingrédient :
    <code>
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents directory
    NSError *error;
    BOOL succeed = [myString writeToFile:[documentsDirectory stringByAppendingPathComponent:@"myfile.txt"] atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (!succeed){
        // Handle error here
    }
    </code>
    L'ajoute à un fichier txt dans le repertoir home de l'application.
  - Ingrédient TableView qui ne marche pas avec le NSArray de test !
  - Display du contenu du fichier txt (ingrédient séparés par des ";").
