//
//  CustomTableViewController.m
//  HeaderWithArrowDemo
//
//  Created by Derek Yang on 05/16/12.
//  Copyright (c) 2012 Derek Yang. All rights reserved.
//

#import "CustomTableViewController.h"
#import "HeaderView.h"
#import "ReviewCell.h"

#define HEADER_HEIGHT 68

@implementation CustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Hard coded here for demo purpose
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Hard coded here for demo purpose
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    ReviewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[ReviewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    // Configure the cell.
    cell.image = [UIImage imageNamed:@"veggie-noodles.jpg"];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, HEADER_HEIGHT)];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return HEADER_HEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ReviewCell cellHeight];
}

@end
