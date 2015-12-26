//
//  PSImagePicker.m
//  PSImagePickerExample
//
//  Created by Pan on 15/12/26.
//  Copyright © 2015年 Sheng Pan. All rights reserved.
//

#import "PSImagePicker.h"

NSInteger const CameraIndex = 0;
NSInteger const PhotoLibraryIndex = 1;
NSTimeInterval const DismissAnimationInterval = 0.5;

@interface PSImagePicker ()<UIActionSheetDelegate,
                            UIImagePickerControllerDelegate,
                            UINavigationControllerDelegate>

@property (strong, nonatomic, readonly) UIViewController *presentingController;
@property (strong, nonatomic) UIImagePickerController *picker;

@end

@implementation PSImagePicker

- (instancetype)initWithViewController:(UIViewController *)viewController
{
    self = [super init];
    if (self)
    {
        NSAssert(viewController, @"Please use NS_DESIGNATED_INITIALIZER--initWithViewController: and the viewController can not be nil");
        _presentingController = viewController;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithViewController:nil];
}

#pragma mark - Public

- (void)showOptions
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil
                                                       delegate:self
                                              cancelButtonTitle:@"取消"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"拍照", @"相册中选取照片", nil];
    [sheet showInView:self.presentingController.view];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == CameraIndex)
    {
        [self pickImageWithCamera];
    }
    else if (buttonIndex == PhotoLibraryIndex)
    {
        [self pickImageWithPhotoLibrary];
    }
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
    //将代理方法安排到dismiss动画完成后触发，便于delegate利用image更新界面。
    [self performSelector:@selector(finishPickingImage:)  withObject:img afterDelay:DismissAnimationInterval];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Private
-(void)pickImageFromSource:(UIImagePickerControllerSourceType)sourceType
{
    self.picker.sourceType = sourceType;
    [self.presentingController presentViewController:self.picker animated:YES completion:nil];
}

- (void)finishPickingImage:(UIImage *)img
{
    if ([self.delegate respondsToSelector:@selector(didFinishPickingImage:)])
    {
        [self.delegate didFinishPickingImage:img];
    }
}

-(void)pickImageWithCamera
{
#if TARGET_IPHONE_SIMULATOR
    NSAssert(TARGET_IPHONE_SIMULATOR, @"Can not pick image with camera on simulator.Please use it on iOS device");
#else
    [self pickImageFromSource:UIImagePickerControllerSourceTypeCamera];
#endif
}

-(void)pickImageWithPhotoLibrary
{
    [self pickImageFromSource:UIImagePickerControllerSourceTypePhotoLibrary];
}

#pragma mark - Getter & Setter

- (UIImagePickerController *)picker
{
    if (!_picker)
    {
        _picker = [[UIImagePickerController alloc] init];
        _picker.allowsEditing = YES;
        _picker.delegate = self;
    }
    return _picker;
}

@end
