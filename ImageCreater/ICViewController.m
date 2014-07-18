//
//  ICViewController.m
//  ImageCreater
//
//  Created by Developer on 03/04/14.
//  Copyright (c) 2014 Neerav. All rights reserved.
//

#import "ICViewController.h"

@interface ICViewController ()

@end

@implementation ICViewController

#pragma mark - edge Percentage in respect to iPad Ratina

//iPad
const float iPadWidthPercentage = 50.0f;
const float iPadHeightPercentage = 50.0f;

//iPad ratina
const float iPadRatinaWidthPercentage = 50.0f;
const float iPadRatinaHeightPercentage = 50.0f;

//iPhone
const float iPhoneWidthPercentage = 23.4375f;
const float iPhoneHeightPercentage = 20.84f;

//iPhone ratina
const float iPhoneRatinaWidthPercentage = 46.875f;
const float iPhoneRatinaHeightPercentage = 41.67f;

//iPhone 4 Inch Ratina
const float iPhoneRatina4InchWidthPercentage = 55.46875f;
const float iPhoneRatina4InchHeightPercentage = 41.67f;

DeviceType selectedDeviceTypeToResize [5];

#pragma mark - View Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Resizing Management
- (CGSize) getSize : (CGSize) imageSize forDevice : (DeviceType) deviceType{
    CGSize size = CGSizeZero;
    switch (deviceType) {
        case DeviceTypeiPhone3Inch:
            size.width = (imageSize.width * iPhoneWidthPercentage) / 100.0f;
            size.height = (imageSize.height * iPhoneHeightPercentage) / 100.0f;
            break;
        case DeviceTypeiPhone3InchRatina:
            size.width = (imageSize.width * iPhoneRatinaWidthPercentage) / 100.0f;
            size.height = (imageSize.height * iPhoneRatinaHeightPercentage) / 100.0f;

            break;
        case DeviceTypeiPhone4InchRatina:
            size.width = (imageSize.width * iPhoneRatina4InchWidthPercentage) / 100.0f;
            size.height = (imageSize.height * iPhoneRatina4InchHeightPercentage) / 100.0f;
            
            break;
        case DeviceTypeiPad:
            size.width = (imageSize.width * iPadWidthPercentage) / 100.0f;
            size.height = (imageSize.height * iPadHeightPercentage) / 100.0f;
            
            break;
        case DeviceTypeiPadRatina:
            size.width = (imageSize.width * iPadRatinaWidthPercentage) / 100.0f;
            size.height = (imageSize.height * iPadRatinaHeightPercentage) / 100.0f;
            
            break;
            
        default:
            break;
    }
    return size;
}

- (UIImage *) resizeImage : (UIImage *) image for : (DeviceType) deviceType{
    //get required size
    CGSize newImageSize = [self getSize:image.size forDevice:deviceType];

    //resize image
    UIGraphicsBeginImageContext(newImageSize);
    [image drawInRect:CGRectMake(0, 0, newImageSize.width, newImageSize.height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return destImage;
}

- (NSArray *) resizeImages : (NSArray *) imagePaths forDevice : (DeviceType) deviceType{
    NSMutableArray *resizedImages = [NSMutableArray array];
    for (NSString *imagePath in imagePaths) {
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        image = [self resizeImage:image for:deviceType];
    }
    return resizedImages;
}

#pragma mark - Support
- (NSArray *) getAllFilePathFromFolder : (NSString *) folderPath{
    NSMutableArray *filePaths = [NSMutableArray array];
    NSArray *fileNames = [[NSFileManager defaultManager] subpathsAtPath:folderPath];
    NSLog(@"fileNames = %@", fileNames);
    return filePaths;
}

- (void) createDirectory:(NSString *) directoryName atPath : (NSString*) path{
    NSString *finalPath = [path stringByAppendingPathComponent:directoryName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:finalPath]){
        [[NSFileManager defaultManager] createDirectoryAtPath:finalPath withIntermediateDirectories:YES attributes:Nil error:nil];
    }
        
}

#pragma mark - Application's directories
- (NSString *) pathForFile : (NSString *) fileName{
    return [[self applicationDocumentsDirectory] stringByAppendingPathComponent:fileName];
}

// Returns the URL to the application's Documents directory.
- (NSString *)applicationDocumentsDirectory {
    return [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] stringValue];
}

- (NSString *)systemDesktopDirectory {
    return [[[[NSFileManager defaultManager] URLsForDirectory:NSDesktopDirectory inDomains:NSUserDomainMask] lastObject] stringValue];
}

- (NSString *) applicationWorkDirectoryPath{
    return [[self applicationWorkDirectoryPath] stringByAppendingPathComponent:@"ImageCreater"];
}

- (NSString *) folderPath : (DeviceType) deviceType{
    switch (deviceType) {
        case DeviceTypeiPhone3Inch:
            return [[self applicationWorkDirectoryPath] stringByAppendingPathComponent:@"iPhoneImageFolder"];
            
            break;
            
        case DeviceTypeiPhone3InchRatina:
            return [[self applicationWorkDirectoryPath] stringByAppendingPathComponent:@"iPhoneRatinaImageFolder"];
            
            break;
            
        case DeviceTypeiPhone4InchRatina:
            return [[self applicationWorkDirectoryPath] stringByAppendingPathComponent:@"iPhone4InchRatinaImageFolder"];
            
            break;
            
        case DeviceTypeiPad:
            return [[self applicationWorkDirectoryPath] stringByAppendingPathComponent:@"iPadImageFolder"];
            
            break;
            
        case DeviceTypeiPadRatina:
            return [[self applicationWorkDirectoryPath] stringByAppendingPathComponent:@"iPadRatinaImageFolder"];
            
            break;
            
        default:
            break;
    }
    return nil;
}

#pragma mark - IBActions
- (IBAction)sizeSelectionButtonTouched:(id)sender {
    UIButton *button = (UIButton *) sender;
    [button setSelected:![button isSelected]];
}

- (IBAction)resizeImageButtonTouched:(id)sender {
    NSArray *filePaths = [self folderPath:DeviceTypeiPadRatina];
    
    for (UIButton *button in _sizeSelectionButtons) {
        if ([button isSelected]) {
            
        }
    }
}


@end