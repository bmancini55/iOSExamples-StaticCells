//
//  TableViewController.m
//  StaticCells
//
//  Created by Brian Mancini on 9/28/14.
//  Copyright (c) 2014 iOSExamples. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController()

@property (strong, nonatomic) UITableViewCell *firstNameCell;
@property (strong, nonatomic) UITableViewCell *lastNameCell;
@property (strong, nonatomic) UITableViewCell *shareCell;

@property (strong, nonatomic) UITextField *firstNameText;
@property (strong, nonatomic) UITextField *lastNameText;

@end

@implementation TableViewController

- (void)loadView
{
    [super loadView];
    
    // set the title
    self.title = @"User Options";

    // construct first name cell, section 0, row 0
    self.firstNameCell = [[UITableViewCell alloc] init];
    self.firstNameCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
    self.firstNameText = [[UITextField alloc]initWithFrame:CGRectInset(self.firstNameCell.contentView.bounds, 15, 0)];
    self.firstNameText.placeholder = @"First Name";
    [self.firstNameCell addSubview:self.firstNameText];
    
    // construct last name cell, section 0, row 1
    self.lastNameCell = [[UITableViewCell alloc] init];
    self.lastNameCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
    self.lastNameText = [[UITextField alloc]initWithFrame:CGRectInset(self.lastNameCell.contentView.bounds, 15, 0)];
    self.lastNameText.placeholder = @"Last Name";
    [self.lastNameCell addSubview:self.lastNameText];
    
    // construct share cell, section 1, row 00
    self.shareCell = [[UITableViewCell alloc]init];
    self.shareCell.textLabel.text = @"Share with Friends";
    self.shareCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
    self.shareCell.accessoryType = UITableViewCellAccessoryCheckmark;
}

#pragma Table View Data Source

// Return the number of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

// Return the number of rows for each section in your static table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch(section)
    {
        case 0:  return 2;  // section 0 has 2 rows
        case 1:  return 1;  // section 1 has 1 row
        default: return 0;
    };
}

// Return the row for the corresponding section and row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch(indexPath.section)
    {
        case 0:
        switch(indexPath.row)
        {
            case 0: return self.firstNameCell;  // section 0, row 0 is the first name
            case 1: return self.lastNameCell;   // section 0, row 1 is the last name
        }
        case 1:
        switch(indexPath.row)
        {
            case 0: return self.shareCell;      // section 1, row 0 is the share option
        }
    }
    return nil;
}

#pragma Table View Delegate

// Customize the section headings for each section
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch(section)
    {
        case 0: return @"Profile";
        case 1: return @"Social";
    }
    return nil;
}


// Configure the row selection code for any cells that you want to customize the row selection
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 1 && indexPath.row == 0) {
        
        // deselect row
        [tableView deselectRowAtIndexPath:indexPath animated:false];
        
        // toggle check mark
        if(self.shareCell.accessoryType == UITableViewCellAccessoryNone)
            self.shareCell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            self.shareCell.accessoryType = UITableViewCellAccessoryNone;
    }
}

@end
