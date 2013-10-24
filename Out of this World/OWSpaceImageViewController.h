//
//  OWSpaceImageViewController.h
//  Out of this World
//
//  Created by Jimzy Lui on 10/22/2013.
//  Copyright (c) 2013 Jimzy Lui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWSpaceObject.h"

@interface OWSpaceImageViewController : UIViewController<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property(strong,nonatomic)UIImageView *imageView;
@property(strong,nonatomic)OWSpaceObject *spaceObject;

@end
