//
//  CoreDataObject.h
//  CoreDataDemo
//
//  Created by wgl7569 on 15-1-15.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "News.h"
@interface CoreDataObject : NSObject
@property (nonatomic , readonly ,strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic , readonly ,strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic , readonly ,strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
- (void) saveContext;
- (NSURL *) applicationDocumentsDirectory;
- (void) insertCoreData :(NSMutableArray *)dataArray;
- (NSMutableArray *)selectData :(int)pageSize andOffset :(int)currentPage;
- (void) deleteData;
- (void) updateData :(NSString *)newsId withIsLook:(NSString *)isLook;
@end
