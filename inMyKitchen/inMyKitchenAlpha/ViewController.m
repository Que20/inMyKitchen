//
//  ViewController.m
//  inMyKitchenAlpha
//
//  Created by Kevin Maarek on 24/11/2013.
//  Copyright (c) 2013 Kevin Maarek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSArray *tableData;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    tableData = [self content];
	self.recettesBtn.showsTouchWhenHighlighted = YES;
    self.ingredientsBtn.showsTouchWhenHighlighted = YES;
}

- (NSArray *) content{
    if(!tableData){
        NSString* path = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
        tableData = [[NSArray alloc] initWithContentsOfFile:path];
    }
    return tableData;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [[tableData objectAtIndex:indexPath.row] valueForKey:@"Nom"];
    
    NSString *urlString = [[tableData objectAtIndex:indexPath.row] valueForKey:@"Image"];
    NSData* imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlString]];
    cell.imageView.image = [UIImage imageWithData: imageData];

    return cell;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
