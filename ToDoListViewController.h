//
//  ToDoListViewController.h
//  ToDoList
//
//  Created by Johann Bernez on 05/07/2014.
//  Copyright (c) 2014 Johann Bernez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"

@interface ToDoListViewController : UITableViewController

@property NSMutableArray *toDoItems;

// pouet
-(IBAction)unwindToDoList:(UIStoryboardSegue *) segue;
@end
