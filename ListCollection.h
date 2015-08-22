//
//  ListCollection.h
//  toDoList
//
//  Created by Calvin Raveenthran on 2015-08-22.
//  Copyright (c) 2015 Calvin Raveenthran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoItem.h"

@interface ListCollection : NSObject

@property NSString *listTitle;
@property BOOL completed;
@property (readonly) NSDate *creationDate;
@property NSInteger listID;
@property NSMutableArray *toDoItems;

@end
