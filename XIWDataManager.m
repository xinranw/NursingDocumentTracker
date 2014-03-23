//
//  XIWDataManager.m
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 3/23/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "XIWDataManager.h"

@interface XIWDataManager()

@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic,strong) NSPersistentStoreCoordinator *persistentStorecoordinator;

//@property (nonatomic,strong) NSDictionary *dictionary;

@end


@implementation XIWDataManager


-(BOOL)addUserWithData:(XIWUserObject *)user
{
    if (![self checkIfAlreadyRegistered:user]) {
        NSManagedObjectContext *context = self.managedObjectContext;
        
        //something to save to context
        Users *userToStore = [NSEntityDescription insertNewObjectForEntityForName:@"Users" inManagedObjectContext:context];
        NSLog(@"HERE1");
        userToStore.username = user.username;
        userToStore.password = user.password;
        NSLog(@"HERE2");

        NSError *error;
        if (![context save:&error]) {
            //errror
            return NO;
        }
        NSLog(@"1");

        return YES;
    }
    NSLog(@"2");
    return NO;
}

-(BOOL)checkIfAlreadyRegistered:(XIWUserObject *)user
{
    NSManagedObjectContext *context = self.managedObjectContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Users" inManagedObjectContext:context];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"username == %@ AND password == %@", user.username, user.password];
    
    fetchRequest.entity = entity;
    NSError *error;
    NSArray *fetchedResults = [context executeFetchRequest:fetchRequest error:&error];
    
    NSLog(@"3");
    return [fetchedResults count] > 0;
}

-(NSArray *)allUsers
{
    NSLog(@"H#asdf");
    NSManagedObjectContext *context = self.managedObjectContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Users" inManagedObjectContext:context];
    fetchRequest.entity = entity;
    NSError *error;
    NSArray *fetchedResults = [context executeFetchRequest:fetchRequest error:&error];
    
    NSLog(@"4");
    return fetchedResults;
}

-(NSManagedObjectContext *)managedObjectContext
{
    if (!_managedObjectContext) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        _managedObjectContext.persistentStoreCoordinator = self.persistentStorecoordinator;

    }
    NSLog(@"5");
    return _managedObjectContext;
}

//create data model in GUI. this is what data is supposed to look like
- (NSManagedObjectModel *)managedObjectModel
{
    if (!_managedObjectModel) {
        //grab data from app and load into model
        NSURL *storeURL = [[NSBundle mainBundle] URLForResource:@"UserModel" withExtension:@"momd"];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:storeURL];
    }
    NSLog(@"6");
    return _managedObjectModel;
}

//create sqlite database
- (NSPersistentStoreCoordinator *)persistentStorecoordinator
{

    if (!_persistentStorecoordinator) {
        NSURL *storeURL = [[self applicationDirectory] URLByAppendingPathComponent:@"Users.sqlite"];
        
        NSError *error;
        _persistentStorecoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        [_persistentStorecoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
    }
    NSLog(@"7");
    return _persistentStorecoordinator;
}

- (NSURL *)applicationDirectory
{
    NSLog(@"8");
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
}

@end

