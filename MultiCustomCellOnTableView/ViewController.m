//
//  ViewController.m
//  MultiCustomCellOnTableView
//
//  Created by Rana on 1/24/17.
//  Copyright © 2017 Rana. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell1.h"
#import "CustomTableViewCell2.h"

@interface ViewController ()
{
    NSMutableArray *packageArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    self.navigationItem.title = @"Multiple Cell";
    
    packageArray = [[NSMutableArray alloc] initWithObjects:@"Business", @"Business Pro", @"Gold", @"Diamond",@"Business", @"Business Pro", @"Gold", @"Diamond", nil];
    
    [self initializeTableCell];
}

- (void) initializeTableCell{
    static NSString *CellIdentifier1 = @"CustomTableViewCell1";
    static NSString *CellIdentifier2 = @"CustomTableViewCell2";
    
    UINib *nib = [UINib nibWithNibName:@"CustomTableViewCell1" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CellIdentifier1];
    
    nib = [UINib nibWithNibName:@"CustomTableViewCell2" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CellIdentifier2];
    
    //self.contentView.hidden = YES;
    //[self loadData];
}

#pragma  mark ::::: TableViewDelegate  ::::
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [packageArray count];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // cell height
    // Space cell's height
    if (indexPath.row % 2 == 1) {
        return 140.0f;
    }
    
    // Content cell's height
    else {
        return 60.0f;
    }
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:YES];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}


// If the tableView Cell is selected
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    PaymentSelection *vc = [[PaymentSelection alloc] init];
    //    [self.navigationController pushViewController: vc animated:YES];
}

// For deleteing any row from the table
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle) editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Do some code here
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView  editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Detemine if it's in editing mode
    if (self.editing)
    {
        return UITableViewCellEditingStyleDelete; //enable when editing mode is on
    }
    
    return UITableViewCellEditingStyleNone;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier1 = @"CustomTableViewCell1";
    static NSString *CellIdentifier2 = @"CustomTableViewCell2";
    
    // Space Cell
    if (indexPath.row % 2 == 1) {
        CustomTableViewCell1 *cell = (CustomTableViewCell1 *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.minusBtnOutlet.tag = indexPath.row;
        cell.plusBtnOutlet.tag = indexPath.row;
        [cell.minusBtnOutlet addTarget:self action:@selector(minusBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.plusBtnOutlet addTarget:self action:@selector(pluseBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.packageName.text = [packageArray objectAtIndex:indexPath.row];
        
        return cell;
    }
    
    // Content cell
    else {
        CustomTableViewCell2 *cell = (CustomTableViewCell2 *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
        // Configure cell
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.packageName.text = [packageArray objectAtIndex:indexPath.row];
        cell.logoImage.image = [UIImage imageNamed:@"images"];
        
        cell.logoImage.clipsToBounds = YES;
        cell.logoImage.layer.cornerRadius = cell.logoImage.bounds.size.height/2;
        cell.logoImage.layer.borderColor = [UIColor colorWithRed:0.059 green:0.420 blue:0.757 alpha:1.00].CGColor;
        cell.logoImage.layer.borderWidth = 1.5f;
        
        
        return cell;
    }

}

- (void) minusBtnAction:(UIButton *) btn{
    NSLog(@"minusBtnAction %ld", (long)btn.tag);
    int value = 0;
    
    for (NSIndexPath *path in [self.tableView indexPathsForVisibleRows]) {
        CustomTableViewCell1 *tableViewCell = (CustomTableViewCell1 *)[self.tableView cellForRowAtIndexPath:path];
        //NSLog(@"path.section  %lu path.row  %lu path.subRow  %lu", (long)path.section, (long)path.row, (long)path.subRow);
        
        if (path.row == btn.tag) {
            for (UIView *subview in tableViewCell.subviews){
                for (UIView *subsubview in subview.subviews){
                    //NSLog(@"subsubview  %@", subsubview);
                    for (UIView *subsubsubview in subsubview.subviews){
                        for (UIView *sview in subsubsubview.subviews){
                            //NSLog(@"sview  %@", sview);
                            if ([sview isKindOfClass:[UILabel class]]) {
                                UILabel *lbl = (UILabel*)sview;
                                //NSLog(@"sview label  %@", sview);
                                if (lbl.tag == 1) {
                                    //NSLog(@"lbl label  %@", lbl);
                                    value = lbl.text.intValue;
                                    NSLog(@"value   %d", value);
                                    if (value > 0) {
                                        value = value - 1;
                                        lbl.text = [NSString stringWithFormat:@"%d", value];
                                    }
                                }
                                if (lbl.tag == 2) {
                                    //NSLog(@"lbl label  %@", lbl);
                                    //NSLog(@"value   %d", value);
                                    NSLog(@"lbl.tag  %ld", (long)lbl.tag);
                                    if (value > 1) {
                                        lbl.text = @"Months";
                                    }
                                    else{
                                        lbl.text = @"Month";
                                    }
                                }
                                if (lbl.tag == 3) {
                                    //NSLog(@"lbl label  %@", lbl);
                                    NSLog(@"value :::  %d", value);
                                    int amount = 900 * value;
                                    NSLog(@"lbl.tag  %ld", (long)lbl.tag);
                                    NSLog(@"amount  %d", amount);
                                    lbl.text = [NSString stringWithFormat:@"BDT %d", amount];
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

- (void) pluseBtnAction:(UIButton *) btn{
    NSLog(@"pluseBtnAction %ld", (long)btn.tag);
    int value = 0;
    for (NSIndexPath *path in [self.tableView indexPathsForVisibleRows]) {
        CustomTableViewCell1 *tableViewCell = (CustomTableViewCell1 *)[self.tableView cellForRowAtIndexPath:path];
        //NSLog(@"path.section  %lu path.row  %lu path.subRow  %lu", (long)path.section, (long)path.row, (long)path.subRow);
        if (path.row == btn.tag) {
            for (UIView *subview in tableViewCell.subviews){
                for (UIView *subsubview in subview.subviews){
                    //NSLog(@"subsubview  %@", subsubview);
                    for (UIView *subsubsubview in subsubview.subviews){
                        for (UIView *sview in subsubsubview.subviews){
                            //NSLog(@"sview  %@", sview);
                            if ([sview isKindOfClass:[UILabel class]]) {
                                UILabel *lbl = (UILabel*)sview;
                                //NSLog(@"sview label  %@", sview);
                                if (lbl.tag == 1) {
                                    //NSLog(@"lbl label  %@", lbl);
                                    value = lbl.text.intValue;
                                    if (value < 10) {
                                        value = value + 1;
                                        lbl.text = [NSString stringWithFormat:@"%d", value];
                                    }
                                    else{
                                        value = 10;
                                    }
                                }
                                if (lbl.tag == 2) {
                                    //NSLog(@"lbl label  %@", lbl);
                                    if (value > 1) {
                                        lbl.text = @"Months";
                                    }
                                    else{
                                        lbl.text = @"Month";
                                    }
                                }
                                if (lbl.tag == 3) {
                                    //NSLog(@"lbl label  %@", lbl);
                                    int amount = 900 * value;
                                    lbl.text = [NSString stringWithFormat:@"BDT %d", amount];
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
