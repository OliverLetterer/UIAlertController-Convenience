/*
 UIAlertController (Convenience)
 Copyright (c) 2014 Oliver Letterer <oliver.letterer@gmail.com>, Sparrow-Labs

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "UIAlertController+ConvenienceAPI.h"

@implementation UIAlertController (ConvenienceAPI)

+ (instancetype)actionSheetControllerWithTitle:(NSString *)title
{
    return [self alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
}

+ (instancetype)alertViewControllerWithTitle:(NSString *)title
{
    return [self alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
}

+ (instancetype)alertViewControllerWithTitle:(NSString *)title message:(NSString *)message
{
    return [self alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
}

- (UIAlertAction *)addButtonWithTitle:(NSString *)title action:(void (^)(UIAlertAction *action))handler
{
    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:handler];
    [self addAction:action];
    return action;
}

- (UIAlertAction *)addCancelButton
{
    return [self addCancelButtonWithTitle:NSLocalizedString(@"Cancel", @"")];
}

- (UIAlertAction *)addCancelButtonWithTitle:(NSString *)title
{
    return [self addCancelButtonWithTitle:title action:NULL];
}

- (UIAlertAction *)addCancelButtonWithTitle:(NSString *)title action:(void (^)(UIAlertAction *action))handler
{
    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleCancel handler:handler];
    [self addAction:action];
    return action;
}

- (UIAlertAction *)addDestructiveButtonWithTitle:(NSString *)title action:(void (^)(UIAlertAction *action))handler
{
    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDestructive handler:handler];
    [self addAction:action];
    return action;
}

- (void)addUsernameTextFieldWithConfigurationHandler:(void (^)(UITextField *textField))configurationHandler
{
    [self addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.keyboardAppearance = UIKeyboardAppearanceDefault;

        if (configurationHandler) {
            configurationHandler(textField);
        }
    }];
}

- (void)addEMailTextFieldWithConfigurationHandler:(void (^)(UITextField *textField))configurationHandler
{
    [self addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeEmailAddress;
        textField.keyboardAppearance = UIKeyboardAppearanceDefault;

        if (configurationHandler) {
            configurationHandler(textField);
        }
    }];
}

- (void)addPasswordTextFieldWithConfigurationHandler:(void (^)(UITextField *textField))configurationHandler
{
    [self addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.secureTextEntry = YES;
        textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.keyboardAppearance = UIKeyboardAppearanceDefault;

        if (configurationHandler) {
            configurationHandler(textField);
        }
    }];
}

@end



@implementation UIViewController (UIAlertControllerConvenienceAPI)

- (void)presentActionSheet:(UIAlertController *)actionSheet fromBarButtonItem:(UIBarButtonItem *)barButtonItem animated:(BOOL)animated completion:(dispatch_block_t)completion
{
    NSParameterAssert(actionSheet.preferredStyle == UIAlertControllerStyleActionSheet);

    actionSheet.popoverPresentationController.barButtonItem = barButtonItem;
    [self presentViewController:actionSheet animated:animated completion:completion];
}

- (void)presentActionSheet:(UIAlertController *)actionSheet inView:(UIView *)view animated:(BOOL)animated completion:(dispatch_block_t)completion
{
    CGPoint center = CGPointMake(CGRectGetMidX(view.bounds), CGRectGetMidY(view.bounds));
    CGRect frame = CGRectMake(center.x, center.y, 1.0, 1.0);

    [self presentActionSheet:actionSheet fromRect:frame inView:view animated:animated completion:completion];
}

- (void)presentActionSheet:(UIAlertController *)actionSheet fromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completion:(dispatch_block_t)completion
{
    NSParameterAssert(actionSheet.preferredStyle == UIAlertControllerStyleActionSheet);

    actionSheet.popoverPresentationController.sourceRect = rect;
    actionSheet.popoverPresentationController.sourceView = view;
    [self presentViewController:actionSheet animated:animated completion:completion];
}

@end
