//
//  ToDoItem.h
//  toDoList
//
//  Created by Calvin Raveenthran on 2015-07-31.
//  Copyright (c) 2015 Calvin Raveenthran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;


@end
