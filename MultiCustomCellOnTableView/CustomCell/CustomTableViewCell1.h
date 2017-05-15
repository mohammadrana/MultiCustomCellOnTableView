//
//  CustomTableViewCell1.h
//  Seemo
//
//  Created by Rana on 1/23/17.
//  Copyright © 2017 com.btraccl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell1 : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *countOutlet;
@property (weak, nonatomic) IBOutlet UILabel *monthOutlet;
@property (weak, nonatomic) IBOutlet UILabel *priceOutlet;
@property (weak, nonatomic) IBOutlet UILabel *packageValidationOutlet;
@property (weak, nonatomic) IBOutlet UIButton *minusBtnOutlet;
@property (weak, nonatomic) IBOutlet UIButton *plusBtnOutlet;
@property (weak, nonatomic) IBOutlet UILabel *packageName;


@end
