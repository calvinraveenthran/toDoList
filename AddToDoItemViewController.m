//
//  AddToDoItemViewController.m
//  toDoList
//
//  Created by Calvin Raveenthran on 2015-07-18.
//  Copyright (c) 2015 Calvin Raveenthran. All rights reserved.
//

#import "AddToDoItemViewController.h"

@interface AddToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddToDoItemViewController


//prepareForSegue
//Checks if the save button was initiated &
//if the text field isnt empty and creates
//a toDo item where unwindToDoList is able to acced the item
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //check if it was canceled or saved
    if (sender != self.saveButton) return;
    
    //create a toDoItem and return it
    if (self.textField.text.length > 0) {
        self.toDoItem = [[ToDoItem alloc] init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
