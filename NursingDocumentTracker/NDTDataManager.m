//
//  NDTDataManager.m
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 3/23/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTDataManager.h"

@interface NDTDataManager()

@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic,strong) NSPersistentStoreCoordinator *persistentStorecoordinator;

//@property (nonatomic,strong) NSDictionary *dictionary;

@end


@implementation NDTDataManager


-(BOOL)addUserWithData:(NDTUser *)user
{
    if ([self isAlreadyRegistered:user]){
        return NO;
    }
    NSManagedObjectContext *context = self.managedObjectContext;
    
    //attempt to save user information
    NDTUser *userToStore = [NSEntityDescription insertNewObjectForEntityForName:@"Users" inManagedObjectContext:context];
    userToStore.username = user.username;
    userToStore.password = user.password;
    
    NSError *error;
    if (![context save:&error]) {
        //errror
        return NO;
    }
    
    return YES;
}

-(BOOL)isAlreadyRegistered:(NDTUser *)user
{
    NSManagedObjectContext *context = self.managedObjectContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Users" inManagedObjectContext:context];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"username == %@ AND password == %@", user.username, user.password];
    
    fetchRequest.entity = entity;
    NSError *error;
    NSArray *fetchedResults = [context executeFetchRequest:fetchRequest error:&error];
    
    return [fetchedResults count] > 0;
}

-(NSArray *)allUsers
{
    NSManagedObjectContext *context = self.managedObjectContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Users" inManagedObjectContext:context];
    fetchRequest.entity = entity;
    NSError *error;
    NSArray *fetchedResults = [context executeFetchRequest:fetchRequest error:&error];
    
    return fetchedResults;
}

-(NSManagedObjectContext *)managedObjectContext
{
    if (!_managedObjectContext) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        _managedObjectContext.persistentStoreCoordinator = self.persistentStorecoordinator;

    }
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
    return _persistentStorecoordinator;
}

- (NSURL *)applicationDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
}

@end

