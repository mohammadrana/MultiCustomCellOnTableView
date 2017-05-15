//
//  ViewController.h
//  MultiCustomCellOnTableView
//
//  Created by Rana on 1/24/17.
//  Copyright © 2017 Rana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

