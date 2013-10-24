//
//  OWOuterSpaceTableViewController.m
//  Out of this World
//
//  Created by Jimzy Lui on 10/20/2013.
//  Copyright (c) 2013 Jimzy Lui. All rights reserved.
//

#import "OWOuterSpaceTableViewController.h"
#import "AstronomicalData.h"
#import "OWSpaceObject.h"
#import "OWSpaceImageViewController.h"
#import "OWSpaceDataViewController.h"

@interface OWOuterSpaceTableViewController ()

@end

@implementation OWOuterSpaceTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    /*
    Old way:
    self.planets = [[NSMutableArray alloc]init];
    
    NSString *planet1 = @"Mercury";
    NSString *planet2 = @"Venus";
    NSString *planet3 = @"Earth";
    NSString *planet4 = @"Mars";
    NSString *planet5 = @"Jupiter";
    NSString *planet6 = @"Saturn";
    NSString *planet7 = @"Uranus";
    NSString *planet8 = @"Neptune";
    
    [self.planets addObject:planet1];
    [self.planets addObject:planet2];
    [self.planets addObject:planet3];
    [self.planets addObject:planet4];
    [self.planets addObject:planet5];
    [self.planets addObject:planet6];
    [self.planets addObject:planet7];
    [self.planets addObject:planet8];
    */
    /*
    //better way:
    NSString *planet1 = @"Mercury";
    NSString *planet2 = @"Venus";
    NSString *planet3 = @"Earth";
    NSString *planet4 = @"Mars";
    NSString *planet5 = @"Jupiter";
    NSString *planet6 = @"Saturn";
    NSString *planet7 = @"Uranus";
    NSString *planet8 = @"Neptune";
    
    self.planets = [[NSMutableArray alloc] initWithObjects:planet1,planet2,planet3,planet4,planet5,planet6,planet7,planet8, nil];
     */
    //best/final way
    self.planets = [[NSMutableArray alloc]init];
    
    for (NSMutableDictionary *planetData in[AstronomicalData allKnownPlanets]){
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg",planetData[PLANET_NAME]];
        OWSpaceObject *planet = [[OWSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
    }

    
    /*
    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc]init];
    NSString *firstColor = @"red";
    [myDictionary setObject:firstColor forKey:@"firetruck color"];
    [myDictionary setObject:@"blue" forKey:@"ocean color"];
    [myDictionary setObject:@"yellow" forKey:@"star color"];
    NSLog(@"%@",myDictionary);
    
    NSString *blueString = [myDictionary objectForKey:@"ocean color"];
    NSLog(@"%@",blueString);  */
    
    /*NSNumber *myNumber = [NSNumber numberWithInt:5];  //or do shorthand --> NSNumber *myNumber = @5
    NSLog(@"%@",myNumber);
    NSNumber *floatNumber = [NSNumber numberWithFloat:3.14];
    NSLog(@"%@",floatNumber); */
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //NSLog(@"%@", sender);
    if([sender isKindOfClass:[UITableViewCell class]]){
        if([segue.destinationViewController isKindOfClass:[OWSpaceImageViewController class]]){
            OWSpaceImageViewController *nextVC = segue.destinationViewController;
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            //index into our array of objects
            OWSpaceObject *selectedObject = self.planets[path.row];
            nextVC.spaceObject = selectedObject;
            /* don't set properties here or it won't display.  It has to be done inside the viewDidLoad method.
               Reason:  IBOutlet properties aren't available to use until after the view is loaded in our
               OWSpaceImageViewController. The planet image will not appear.*/
            //example of bad code: described above:
            //nextViewController.imageView.image = selectedObject.spaceImage;
        }
    }
    
    //Setting up introspection for #3 VC
    if([sender isKindOfClass:[NSIndexPath class]])
    {
        if([segue.destinationViewController isKindOfClass:[OWSpaceDataViewController class]])  //don't forgot to #import that class
        {
            //set the dest VC
            OWSpaceDataViewController *targetVC = segue.destinationViewController;
            //find the point of ref where we clicked
            NSIndexPath *path = sender;
            //set the object related to where we clicked & pass it to the 3rd VC
            OWSpaceObject *selectedObject = self.planets[path.row];
            targetVC.spaceObject = selectedObject;
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if(section ==0){
        return self.planets.count;
    }else{
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    OWSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
    //NSLog(@"Cell row pressed: %i", indexPath.row);
    cell.textLabel.text = planet.name;
    cell.detailTextLabel.text = planet.nickname;
    cell.imageView.image = planet.spaceImage;
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    /*cell.textLabel.text = //[NSString stringWithFormat:@"Section %i Row %i",indexPath.section,indexPath.row];
    [self.planets objectAtIndex:indexPath.row];
    
    if(indexPath.section == 0){
        cell.backgroundColor = [UIColor redColor];
    }else{
        cell.backgroundColor = [UIColor yellowColor];
    }*/
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */
#pragma mark - UITableView Delegate
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"accessory button is working properly %i",indexPath.row);
    //NSLog(@"accessory button is working properly %li",(long) indexPath.row);
    [self performSegueWithIdentifier:@"push to space data" sender:indexPath];   //the ider comes from what we named the segue in storyboard
    
}
@end
