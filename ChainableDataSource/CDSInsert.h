//
//  CDSInsert.h
//  ChainableDataSource
//
//  Created by Amadour Griffais on 04/09/2016.
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

#import "CDSTransform.h"

/**
 Inserts the content of the first section of the second data source into the first data source, at a specified indexPath.
 Can be useful for example to display an ad banner at a specific position.
 */
@interface CDSInsert : CDSTransform

@property (nonatomic, strong) NSIndexPath* insertionIndexPath;
@property (nonatomic, assign) BOOL insertAtEndIfNeeded; //Set to YES so that insertion happens at the last possible slot if the specified index path does not exist in the main data source.

@end
