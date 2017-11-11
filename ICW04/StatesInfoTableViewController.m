//
//  StatesInfoTableViewController.m
//  ICW04
//
//  Created by Dona varghese on 11/8/17.
//  Copyright © 2017 Dona varghese. All rights reserved.
//

#import "StatesInfoTableViewController.h"
#import "pLIstStatesTableViewCell.h"
@interface StatesInfoTableViewController ()

@property (nonatomic, strong)NSDictionary* states;
    @property (nonatomic, strong)NSArray* keys;
@property (nonatomic, strong)NSArray* statesNames;
@end

@implementation StatesInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // get the path to the pList from the Bundle
    NSString* path = [[NSBundle mainBundle]pathForResource:@"USStates" ofType:@"plist"];
    
     self.states = [NSDictionary dictionaryWithContentsOfFile:path];
     self.keys = [[self.states allKeys]sortedArrayUsingSelector:@selector(compare:)];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // return number of section
    return [self.keys count];
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString* key = self.keys[section];
    
    // for each key get an array
    NSArray* keyValues = self.states[key];
    return [keyValues count];
}
    
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"statesCell";
    
    pLIstStatesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSString* key = self.keys[indexPath.section];
    NSArray* keyValues = self.states[key];
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // Draw top border only on first cell
    if (indexPath.row == 0) {
        UIView *topLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 2)];
        topLineView.backgroundColor = [UIColor blackColor];
        [cell.contentView addSubview:topLineView];
    }
    
    UIView *bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, cell.bounds.size.height, self.view.bounds.size.width, 2)];
    bottomLineView.backgroundColor = [UIColor blackColor];
    [cell.contentView addSubview:bottomLineView];

  
    self.tableView.rowHeight = 260;
    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"Flags/american-flag-large.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ]; 
    cell.statesName.text = keyValues[indexPath.row][@"stateName"];
    cell.motto.text = keyValues[indexPath.row][@"motto"];
    cell.capital.text = keyValues[indexPath.row][@"capital"];
    cell.joinDate.text = keyValues[indexPath.row][@"joinDate"];
    cell.population.text = keyValues[indexPath.row][@"population"];
    cell.stateImage.image = [UIImage imageNamed:keyValues[indexPath.row][@"imagePath"]];

    return cell;
  
}



    
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.keys;
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
