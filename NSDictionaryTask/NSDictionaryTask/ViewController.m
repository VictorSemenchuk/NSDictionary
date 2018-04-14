//
//  ViewController.m
//  NSDictionaryTask
//
//  Created by Victor Macintosh on 14/04/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MARK: Create NSDictionary using literal declaration.
    NSDictionary *dictionary = @{
                                 @"Full name" : @"John Appleseed",
                                 @"Address" : @"1 Infinite Loop, Cupertino, CA, USA",
                                 @"Phone" : @"1–800–854–3680"
                                 };
    //MARK: Make it mutable and add several new entries.
    NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    mutableDictionary[@"Email"] = @"johnappleseed@icloud.com";
    mutableDictionary[@"Post"] = @"95014";
    
    //MARK: Sort it in an ascending and descending order.
    NSArray *keysForSotring = [mutableDictionary allKeys];
    
    //Sort in an ascending order
    NSArray *orderedAscendingKeys = [keysForSotring sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj1 compare:obj2];
    }];
    NSLog(@"> Dictionary in an descending order:");
    for(NSString *key in orderedAscendingKeys) {
        NSLog(@"Key: %@; value: %@", key, mutableDictionary[key]);
    }
    
    //Sort in an descending order
    NSArray *orderedDescendingKeys = [keysForSotring sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj2 compare:obj1];
    }];
    NSLog(@"> Dictionary in an descending order:");
    for(NSString *key in orderedDescendingKeys) {
        NSLog(@"Key: %@; value: %@", key, mutableDictionary[key]);
    }
    
    //MARK: Check whether required value is contained in the dictionary.
    NSString *requiredValue = @"John Appleseed";
    NSArray *valuesArray = [mutableDictionary allValues];
    [valuesArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:requiredValue]) {
            NSLog(@"> Required values exists");
            *stop = YES;
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
