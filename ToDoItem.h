//
//  ToDoItem.h
//  ToDoList
//
//  Created by Johann Bernez on 05/07/2014.
//  Copyright (c) 2014 Johann Bernez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString  *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
