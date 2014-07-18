//
//  ICViewController.h
//  ImageCreater
//
//  Created by Developer on 03/04/14.
//  Copyright (c) 2014 Neerav. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    DeviceTypeiPhone3Inch,
    DeviceTypeiPhone3InchRatina,
    DeviceTypeiPhone4InchRatina,
    DeviceTypeiPad,
    DeviceTypeiPadRatina
}DeviceType;

@interface ICViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *sizeSelectionButtons;

- (IBAction)sizeSelectionButtonTouched:(id)sender;


@end

/*
 brijbhushan.singh20@gmail.com
 parihar1967
 */