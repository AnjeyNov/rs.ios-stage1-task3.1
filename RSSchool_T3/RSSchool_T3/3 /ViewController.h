#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate> {
    //UIView* view;
    UITextField* textFieldRed;
    UITextField* textFieldGreen;
    UITextField* textFieldBlue;
    UIButton* buttonProcess;
    UILabel* labelRed;
    UILabel* labelGreen;
    UILabel* labelBlue;
    UILabel* labelResultColor;
    UIView* viewResultColor;
}

@end

