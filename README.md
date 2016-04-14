# PSImagePicker (中文在后)

[![Pod Version](https://img.shields.io/cocoapods/v/PSImagePicker.svg?style=flat)](http://cocoapods.org/pods/PSImagePicker)
[![License](https://img.shields.io/cocoapods/l/PSImagePicker.svg?style=flat)](http://cocoapods.org/pods/PSImagePicker) 
[![Platform](https://img.shields.io/cocoapods/p/PSImagePicker.svg?style=flat)](http://cocoapods.org/pods/PSImagePicker)

A convenience image picker. Pick ONE image from camera or PhotoLibrary fast and make your ViewController code clean.


###Preview 
![image](https://raw.githubusercontent.com/DeveloperPans/PSImagePicker/master/PSImagePicker.gif)

### Getting Start

#####`Recommend` Import with cocoapods
Add follow line in your podfile.

```ruby
pod 'PSImagePicker'  
```   
#####Import manually
Download zip and unarchiver.Drag 'PSImagePicker' folder into your project.


### Usage
**Make a lazy initlazer and set delegate.**

 
 ```objective-c
 @property (nonatomic, strong) PSImagePicker *imagePicker;

 
- (PSImagePicker *)imagePicker
{
    if (!_imagePicker)
    {
        _imagePicker = [[PSImagePicker alloc] initWithViewController:self];
        _imagePicker.delegate = self;
    }
    return _imagePicker;
}
 ```
 
**Show options.**

```objective-c
- (void)touchAvatarButton:(UIButton *)sender
{
    [self.imagePicker showOptions];
}

```

**Do anything you want with picked image.**

```objective-c

#pragma mark -PSImagePickerDelegate

- (void)didFinishPickingImage:(UIImage *)image
{
    [self.avatarButton setImage:image forState:UIControlStateNormal];
    //upload image to server etc.
    ...
    ...
}

```


###Notice：
1. You can only initailize with design initialzer:`initWithViewController:`.Otherwise,it will throw a exception.
2. It would do nothing if you pick image with camera on simulator.

For more，download and see in demo。

==============================中文分割线==========================

# PSImagePicker 
一个方便的小组件，用来快速从相册、相机中获取一张照片。快速集成，方便使用。适用于上传头像等功能。注意：一次仅取**一张**图片。

###预览 
![image](https://raw.githubusercontent.com/DeveloperPans/PSImagePicker/master/PSImagePicker.gif)

### 导入

#####`推荐` 通过Cocoapods导入
在你的Podfile文件中加入如下一行

```ruby
pod 'PSImagePicker'
```

#####手动导入
下载zip并解压。将PSImagePicker文件夹拖入你的Xcode工程中。


### 使用方法
**推荐使用懒加载初始化，并设置代理.**
 
```objective-c
 @property (nonatomic, strong) PSImagePicker *imagePicker;

 
- (PSImagePicker *)imagePicker
{
    if (!_imagePicker)
    {
        _imagePicker = [[PSImagePicker alloc] initWithViewController:self];
        _imagePicker.delegate = self;
    }
    return _imagePicker;
}
 ```
**一句话拉起imagePicker.**

```objective-c
- (void)touchAvatarButton:(UIButton *)sender
{
    [self.imagePicker showOptions];
}

```

**代理中返回一张图片.**

```objective-c
#pragma mark -PSImagePickerDelegate

- (void)didFinishPickingImage:(UIImage *)image
{
    //将图片设为头像
    [self.avatarButton setImage:image forState:UIControlStateNormal];
    //上传图片到服务器等等..
    ...
    ...
}

```


###Notice：
1. 必须使用Design Initialzer `initWithViewController:`来初始化PSImagePicker,且传入的viewController不能为nil.不然程序会抛出异常。
2. 如果你在模拟器上用摄像头取图片，不会有任何反应。

更多信息请查看源码。
