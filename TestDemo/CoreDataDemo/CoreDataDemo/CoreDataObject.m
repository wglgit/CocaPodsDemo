//
//  CoreDataObject.m
//  CoreDataDemo
//
//  Created by wgl7569 on 15-1-15.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//
#import "CoreDataObject.h"
@implementation CoreDataObject
@synthesize managedObjectContext,managedObjectModel,persistentStoreCoordinator;
- (void)saveContext{
    NSError *error;
    NSManagedObjectContext *context =self.managedObjectContext;
    if (context){
        if ([context hasChanges] &&![context save:&error]){
            NSLog(@"%@,%@",error,[error userInfo]);
        }
    }
}
-(NSManagedObjectContext *)managedObjectContext{
    if (managedObjectContext != nil){
        return managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator =[self persistentStoreCoordinator];
    if (coordinator != nil){
        managedObjectContext = [[NSManagedObjectContext alloc]init];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext;
}
-(NSManagedObjectModel *)managedObjectModel{
    if (managedObjectModel){
        return managedObjectModel;
    }
    managedObjectModel  = [NSManagedObjectModel mergedModelFromBundles:nil];
    return managedObjectModel;
    
}
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator{
    if (persistentStoreCoordinator){
        return persistentStoreCoordinator;
    }
    NSLog(@"%@",NSHomeDirectory());
    NSURL *storeUrl = [[self applicationDocumentsDirectory]URLByAppendingPathComponent:@"NewsModel.sqlite"];
    NSLog(@"%@",storeUrl);
    NSError *error;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:[self managedObjectModel]];
    if(![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]){
        NSLog(@"%@,%@",error,[error userInfo]);
        abort();
    }
    return persistentStoreCoordinator;
}
-(NSURL *)applicationDocumentsDirectory{
    return [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
}
- (void)insertCoreData:(NSMutableArray *)dataArray{
    NSManagedObjectContext *context =[self managedObjectContext];
    for (NSDictionary *dict in dataArray){
        News *newsInfo =(News *)[NSEntityDescription insertNewObjectForEntityForName:@"NewEntity" inManagedObjectContext:context];
        newsInfo.title = [dict objectForKey:@"title"];
        newsInfo.content = [dict objectForKey:@"content"];
//        [newsInfo setValue:info.title forKey:@"tiitle"];
//        [newsInfo setValue:info.content forKey:@"content"];
        NSError *error;
        if (![context save:&error]){
            NSLog(@"%@",[error localizedDescription]);
        }
    }
}
-(NSMutableArray *)selectData:(int)pageSize andOffset:(int)currentPage{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    [fetchRequest  setFetchBatchSize:pageSize];
    NSError *error;
//    [fetchRequest setFetchLimit:currentPage];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"NewEntity" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *array = [context executeFetchRequest:fetchRequest error:&error];
    NSMutableArray *resultArray = [NSMutableArray array];
    NSLog(@"%@",resultArray);
    for (News *info in array){
        [resultArray addObject:info];
    }
    return resultArray;
    
}
-(void)deleteData{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"NewEntity" inManagedObjectContext:context];
    [fetchRequest setIncludesPropertyValues:YES];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *array = [context executeFetchRequest:fetchRequest error:&error];
    NSLog(@"%@",array);
    if (!error&&array&&[array count]){
        for (NSManagedObject *obj in array){
            [context deleteObject:obj];
        }
        if (![context save:&error]){
            NSLog(@"%@",[error localizedDescription]);
        }
    }
}
-(void)updateData:(NSString *)newsId withIsLook:(NSString *)isLook{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title like[cd]%@",newsId];
    NSFetchRequest *fetchRquest = [[NSFetchRequest alloc]init];
    [fetchRquest setEntity:[NSEntityDescription entityForName:@"NewEntity" inManagedObjectContext:context]];
    [fetchRquest setPredicate:predicate];
    NSError *error;
    NSArray *array = [context executeFetchRequest:fetchRquest error:&error];
    NSLog(@"%@",array);
    for (News *info in array){
//        info.content = isLook;
    }
    if ([context save:&error]){
        NSLog(@"-_-");
    }
    
}
@end
