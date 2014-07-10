//
//  ToDoListViewController.m
//  ToDoList
//
//  Created by Johann Bernez on 05/07/2014.
//  Copyright (c) 2014 Johann Bernez. All rights reserved.
//

#import "ToDoListViewController.h"

@interface ToDoListViewController ()

@end

@implementation ToDoListViewController

- (IBAction)unwindToDoList:(UIStoryboardSegue *)segue
{
//    NSString *s1 = @"Hello";
//    NSString *s2 = @"World";
//    NSArray *testArray = @[s1, s2];
//    NSString *get = [testArray objectAtIndex:1];
//    NSLog(@"Get objet at index 1 : %@", get);

//    if ( isKindOfClass:[AddToDoItemViewController class]]) {
        AddToDoItemViewController *source = [segue sourceViewController];
        if (source.toDoItem != nil) {
            ToDoItem *toAdd = source.toDoItem;
            [self.toDoItems addObject:toAdd];
            [self.tableView reloadData];
        }
    
//    }
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    // Initializing data for the application
    self.toDoItems = [[NSMutableArray alloc] init];
    
    [self loadInitialData];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 2.0;
//    longPress.delegate = self;
    [self.tableView addGestureRecognizer:longPress];
//    [longPress release];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadInitialData
{
    ToDoItem *i1 = [[ToDoItem alloc] init];
    i1.itemName = @"Tondre la pelouse";
    [self.toDoItems addObject:i1];
    
    ToDoItem *i2 = [[ToDoItem alloc] init];
    i2.itemName = @"Chercher un pc";
    [self.toDoItems addObject:i2];
    
    ToDoItem *i3 = [[ToDoItem alloc] init];
    i3.itemName = @"Glander";
    [self.toDoItems addObject:i3];
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)recognizer
{
 
    CGPoint touchPoint = [recognizer locationInView:self.tableView];
    NSIndexPath *path = [self.tableView indexPathForRowAtPoint:touchPoint];
    if (path != nil) {
        NSLog(@"Long press");
        if (recognizer.state == UIGestureRecognizerStateEnded) {
            NSLog(@"Ended");
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    ToDoItem *item = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = item.itemName;
    
    if (item.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ToDoItem *item = [self.toDoItems objectAtIndex:indexPath.row];
    item.completed = !item.completed;
    
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
