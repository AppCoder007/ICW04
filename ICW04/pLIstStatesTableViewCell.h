//
//  pLIstStatesTableViewCell.h
//  ICW04
//
//  Created by Dona varghese on 11/10/17.
//  Copyright © 2017 Dona varghese. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface pLIstStatesTableViewCell :UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *statesName;
@property (weak, nonatomic) IBOutlet UILabel *motto;
@property (weak, nonatomic) IBOutlet UILabel *capital;
@property (weak, nonatomic) IBOutlet UILabel *population;
@property (weak, nonatomic) IBOutlet UILabel *joinDate;
@property (weak, nonatomic) IBOutlet UIImageView *stateImage;
@end
