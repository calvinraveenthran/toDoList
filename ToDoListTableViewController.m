//
//  ToDoListTableViewController.m
//  toDoList
//
//  Created by Calvin Raveenthran on 2015-07-20.
//  Copyright (c) 2015 Calvin Raveenthran. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "AddToDoItemViewController.h"
#import "ToDoItem.h"
#import "ListCollection.h"

@interface ToDoListTableViewController ()

@property NSMutableArray *toDoItems;

@end

@implementation ToDoListTableViewController


//viewDidLoad
//When the table view controller is loaded, we first,
//load an array of toDoItems (can be of any object)
//load an edit button
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.toDoItems = [[NSMutableArray alloc] init];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

//numberOfSectionsinTableView
//asks the data source to return the number of sections in the
//table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

//numberOfRowsInSection
//asks the data source to return the number of rows in each
//section
//Expects an int for a section and returns an int for the rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.toDoItems count];
}

//cellForRowAtIndexPath
//Focussed on the row that is tapped and proceeds to edit it.
//expects an index path and returns the cell in the list.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell...
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    
    //Set a checkmark for items that are listed as completed
    if (toDoItem.completed) { cell.accessoryType = UITableViewCellAccessoryCheckmark;} else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

//canEditRowAtIndexPath
//Allows a row in the table view to be editted.
//expects an index to a row and returns a bool.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//commitEditingStyle
//Basically it checks if any editting style is initiated at an index path
//proceeds to commit action indicated in the code
//it expects an editing style and an index path & reloads table view
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //remove the deleted object from your data source.
    //when editting style is delete
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDoItems removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData]; // tell table to refresh now
    }
}

//didSelectRowAtIndexPath
//when you tap a cell, the method either completes or vice versa
//methos also reloads table view like commitEdittingStyle
//expects an index row and reloads the table
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //do not animate te selected row
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    //mark as completed and reloas the table
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//unwindToList
//This is initiated when an item is either added ot canceled
//in the add item to view list.
//it expects a segue and within that segue is a todoitem object
//it sees if it is initiated and saves it.
- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    
    AddToDoItemViewController *source = [segue sourceViewController];
    ToDoItem *item = source.toDoItem;
    if (item != nil) {
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
    
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