//
//  CustomTableViewCell1.m
//  Seemo
//
//  Created by Rana on 1/23/17.
//  Copyright © 2017 com.btraccl. All rights reserved.
//

#import "CustomTableViewCell1.h"

@implementation CustomTableViewCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _countOutlet.layer.cornerRadius = 3;
    _countOutlet.layer.masksToBounds = YES;
    _countOutlet.layer.borderColor = [UIColor colorWithRed:0.059 green:0.420 blue:0.757 alpha:1.00].CGColor;
    _countOutlet.layer.borderWidth = 1.5f;
    
    _monthOutlet.layer.cornerRadius = 3;
    _monthOutlet.layer.masksToBounds = YES;
    _monthOutlet.layer.borderColor = [UIColor colorWithRed:0.059 green:0.420 blue:0.757 alpha:1.00].CGColor;
    _monthOutlet.layer.borderWidth = 1.5f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
