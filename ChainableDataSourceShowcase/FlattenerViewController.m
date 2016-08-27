//
//  FlattenerViewController.m
//  ChainableDataSource
//
//  Created by Amadour Griffais on 22/09/2016.
//  Copyright 2016 Dashlane
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "FlattenerViewController.h"

#import <ChainableDataSource/ChainableDataSource.h>
#import "FruitCellDataSource.h"
#import "AppDelegate.h"

@interface FlattenerViewController ()

@property (nonatomic, strong) CDSCellDataSource* cellDataSource;

@end

@implementation FlattenerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSFetchedResultsController* frc = [(AppDelegate*)[[UIApplication sharedApplication] delegate] fruitsByInitialFetchedResultsController];
    
    self.cellDataSource = [FruitCellDataSource new];
    
    CDSFetchWrapper* fetchWrapper = [CDSFetchWrapper dataSourceWithFetchedResultsController:frc];
    
    CDSFlattener* flattener = [CDSFlattener transformFromDataSource:fetchWrapper];
    flattener.sectionName = @"All the fetched fruits";

    self.cellDataSource.dataSource = flattener;
    
    self.tableView.dataSource = self.cellDataSource;
    self.tableView.delegate = self.cellDataSource;
    self.cellDataSource.cds_updateDelegate = self.tableView;
}

@end
