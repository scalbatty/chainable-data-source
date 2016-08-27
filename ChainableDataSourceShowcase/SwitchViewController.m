//
//  SwitchViewController.m
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

#import "SwitchViewController.h"

#import <ChainableDataSource/ChainableDataSource.h>
#import "FruitCellDataSource.h"

@interface SwitchViewController ()

@property (nonatomic, strong) CDSCellDataSource* cellDataSource;
@property (nonatomic, weak) CDSSwitch* switchDataSource;

@end

@implementation SwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray* fruits = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"fruits" withExtension:@"plist"]];
    
    self.switchDataSource = [CDSSwitch transformFromDataSource:fruits];
    
    self.cellDataSource = [FruitCellDataSource new];
    self.cellDataSource.dataSource = self.switchDataSource;
    
    self.tableView.dataSource = self.cellDataSource;
    self.tableView.delegate = self.cellDataSource;
    self.cellDataSource.cds_updateDelegate = self.tableView;
}

- (IBAction)toggleSwitch:(id)sender
{
    BOOL isOn = [sender isKindOfClass:[UISwitch class]] && [(UISwitch*)sender isOn];
    self.switchDataSource.disabled = !isOn;
}

@end
