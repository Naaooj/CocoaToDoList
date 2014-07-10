//
//  AddToDoItemViewController.m
//  ToDoList
//
//  Created by Johann Bernez on 05/07/2014.
//  Copyright (c) 2014 Johann Bernez. All rights reserved.
//

#import "AddToDoItemViewController.h"

@interface AddToDoItemViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end


@implementation AddToDoItemViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) {
        return;
    }
    
    if (self.textField.text.length > 0) {
        self.toDoItem = [[ToDoItem alloc] init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;
    }
}

@end
