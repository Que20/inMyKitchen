inMyKitchen
===========

iOS 7 Application

Notes 25/11/13 :
  - Gestion de l'entrée du UIAlert qui récupere un ingrédient :<br>
    <code>
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); <br>
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents directory <br>
    NSError *error; <br>
    BOOL succeed = [myString writeToFile:[documentsDirectory stringByAppendingPathComponent:@"myfile.txt"] atomically:YES encoding:NSUTF8StringEncoding error:&error];<br>
    if (!succeed){<br>
    		// Handle error here<br>
    }<br>
    </code>
    L'ajoute à un fichier txt dans le repertoir home de l'application.
  - Ingrédient TableView qui ne marche pas avec le NSArray de test !
  - Display du contenu du fichier txt (ingrédient séparés par des ";").
    `
    NSString *fileContents = [NSString stringWithContentsOfFile:@"myfile.txt"];  
    NSArray *lines = [fileContents componentsSeparatedByString:@"\n"];  
    `
