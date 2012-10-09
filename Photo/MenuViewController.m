//
//  MenuViewController.m
//  Photo
//
//  Created by Patrick Santana on 5/10/12.
//  Copyright 2012 Photo
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


#import "MenuViewController.h"
#import "IIViewDeckController.h"

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:nibName bundle:nibBundle];
    if (self){
        // needs update menu
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(eventHandler:)
                                                     name:kNotificationNeededsUpdate
                                                   object:nil ];
        
        self.tableView.backgroundColor = [[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Background.png"]] autorelease];
        
        // color separator
        self.tableView.separatorColor = UIColorFromRGB(0xC8BEA0);
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.scrollsToTop = NO;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0){
        // your photos menu
        return 5;
    }else{
        // settings
        return 5;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0){
        // your photos menu
        return NSLocalizedString(@"Your Photos", @"Used to title your photos in Menu");
    }else{
        // settings
        return NSLocalizedString(@"Settings", @"Used to title Settings in Menu");
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if ( indexPath.section == 0){
        // your photos menu
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = NSLocalizedString(@"Home", @"Menu - title for Home");
                break;
            case 1:
                cell.textLabel.text = NSLocalizedString(@"Gallery", @"Menu - title for Gallery");
                break;
            case 2:
                cell.textLabel.text = NSLocalizedString(@"Albums", @"Menu - title for Albums");
                break;
            case 3:
                cell.textLabel.text = NSLocalizedString(@"Tags", @"Menu - title for Tags");
                break;
            case 4:
                cell.textLabel.text = NSLocalizedString(@"Sync", @"Menu - title for Sync");
                break;
            default:
                cell.textLabel.text = @"not defined";
                break;
        }
    }else{
        // settings
        AuthenticationService *authentication = [[AuthenticationService alloc]init];
        
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = NSLocalizedString(@"Account", @"Menu - title for Account");
                break;
            case 1:
                cell.textLabel.text = ([authentication isLogged] ? NSLocalizedString(@"Log out", @"Menu - title for Log out") : NSLocalizedString(@"Login", @"Menu - title for Login"));
                break;
            case 2:
                cell.textLabel.text = NSLocalizedString(@"Upgrade", @"Menu - title for Upgrade");
                break;
            case 3:
                cell.textLabel.text = NSLocalizedString(@"Properties", @"Menu - title for Properties");
                break;
            case 4:
                cell.textLabel.text = NSLocalizedString(@"About Us", @"Menu - title for About Us");
                break;
            default:
                cell.textLabel.text = @"not defined";
                break;
        }
    }
    
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
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
        
        
        
        if ([controller.centerController isKindOfClass:[UINavigationController class]]) {
            UITableViewController* cc = (UITableViewController*)((UINavigationController*)controller.centerController).topViewController;
            cc.navigationItem.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
            
            // temporary login page
            if ( indexPath.section == 1 && indexPath.row == 1){
                
                AuthenticationService *authentication = [[AuthenticationService alloc]init];
                if ([authentication isLogged]){
                    // do the log out
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Are you sure?", @"Message when logging out") message:nil delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel",@"General") otherButtonTitles:NSLocalizedString(@"Log out",@"General"),nil] ;
                    [alert show];
                }else{
                    AuthenticationViewController *controller = [[AuthenticationViewController alloc]initWithNibName:@"AuthenticationViewController" bundle:nil];
                    [cc presentViewController:controller animated:YES completion:nil];
                }
            }else if ( indexPath.section == 0 && indexPath.row == 3){
                // Tags
                UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[[TagViewController alloc] init]];
                nav.title=[tableView cellForRowAtIndexPath:indexPath].textLabel.text;
                controller.centerController = nav;
            }
            
            if ([cc respondsToSelector:@selector(tableView)]) {
                [cc.tableView deselectRowAtIndexPath:[cc.tableView indexPathForSelectedRow] animated:NO];
            }
        }
        
        [NSThread sleepForTimeInterval:(300+arc4random()%700)/1000000.0]; // mimic delay... not really necessary
    }];
}


- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1){
        
#ifdef DEVELOPMENT_ENABLED
        NSLog(@"Log out");
#endif
        
        AuthenticationService *service = [[AuthenticationService alloc]init];
        [service logout];
        [self.tableView reloadData];
    }
}

- (void) eventHandler: (NSNotification *) notification{
#ifdef DEVELOPMENT_ENABLED
    NSLog(@"###### Event triggered: %@", notification);
#endif
    
    if ([notification.name isEqualToString:kNotificationNeededsUpdate]){
        [self.tableView reloadData];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end