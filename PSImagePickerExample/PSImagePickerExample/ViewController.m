//
//  ViewController.m
//  PSImagePickerExample
//
//  Created by Pan on 15/12/26.
//  Copyright © 2015年 Sheng Pan. All rights reserved.
//

#import "ViewController.h"
#import "PSImagePicker.h"

@interface ViewController ()<PSImagePickerDelegate>

@property (nonatomic, weak) IBOutlet UIButton *avatarButton;
@property (nonatomic, strong) PSImagePicker *imagePicker;

- (IBAction)touchAvatarButton:(UIButton *)sender;
@end

@implementation ViewController

#pragma mark - IBAction

- (void)touchAvatarButton:(UIButton *)sender
{
    [self.imagePicker showOptions];
}

#pragma mark -PSImagePickerDelegate

- (void)didFinishPickingImage:(UIImage *)image
{
    [self.avatarButton setImage:image forState:UIControlStateNormal];
}

#pragma mark - Getter & Setter

- (PSImagePicker *)imagePicker
{
    if (!_imagePicker)
    {
        _imagePicker = [[PSImagePicker alloc] initWithViewController:self];
        _imagePicker.delegate = self;
    }
    return _imagePicker;
}
@end
