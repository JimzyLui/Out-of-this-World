//
//  OWSpaceDataViewController.h
//  Out of this World
//
//  Created by Jimzy Lui on 10/24/2013.
//  Copyright (c) 2013 Jimzy Lui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWSpaceObject.h"

@interface OWSpaceDataViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) OWSpaceObject *spaceObject;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@end
