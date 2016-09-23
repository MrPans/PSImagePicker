//
//  PSImagePicker.h
//  PSImagePickerExample
//
//  Created by Pan on 15/12/26.
//  Copyright © 2015年 Sheng Pan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PSImagePickerDelegate <NSObject>

NS_ASSUME_NONNULL_BEGIN

/**
 *  选取好照片了
 *
 *  @param image 选择好的照片
 */
- (void)didFinishPickingImage:(UIImage *)image;

@end

@interface PSImagePicker : NSObject

@property (weak, nonatomic, nullable) id<PSImagePickerDelegate> delegate;

- (instancetype)initWithViewController:(UIViewController *)viewController NS_DESIGNATED_INITIALIZER;

/**
 *  弹出选择菜单，目前只支持 拍照 / 相册
 */
- (void)showOptions;

NS_ASSUME_NONNULL_END

@end
