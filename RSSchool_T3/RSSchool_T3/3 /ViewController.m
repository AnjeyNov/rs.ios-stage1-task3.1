#import "ViewController.h"

@interface ViewController(){
    BOOL errorFlag;
}

- (void)setupUI;
- (BOOL)checkError;
- (NSString *)hexStringFromColor:(UIColor *)color;
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;

@end


@implementation ViewController

#pragma mark -

// MARK: - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    errorFlag = NO;
    
    [self setupUI];
    self.view.accessibilityIdentifier = @"mainView";
    textFieldRed.accessibilityIdentifier = @"textFieldRed";
    textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    buttonProcess.accessibilityIdentifier = @"buttonProcess";
    labelRed.accessibilityIdentifier = @"labelRed";
    labelGreen.accessibilityIdentifier = @"labelGreen";
    labelBlue.accessibilityIdentifier = @"labelBlue";
    labelResultColor.accessibilityIdentifier = @"labelResultColor";
    viewResultColor.accessibilityIdentifier = @"viewResultColor";

}

- (void)dealloc {
    [labelResultColor release];
    [labelRed release];
    [labelGreen release];
    [labelBlue release];
    [viewResultColor release];
    [textFieldRed release];
    [textFieldGreen release];
    [textFieldBlue release];
    [buttonProcess release];
    [super dealloc];
}

- (void)buttonProcessPressed {
    [textFieldRed resignFirstResponder];
    [textFieldBlue resignFirstResponder];
    [textFieldGreen resignFirstResponder];
     
    NSLog(@"Button tapped");
    if([self checkError]) {
        [labelResultColor setText:@"Error"];
        errorFlag = YES;
        return;
    }
    NSInteger red = [[textFieldRed text] intValue];
    NSInteger green = [[textFieldGreen text] intValue];
    NSInteger blue = [[textFieldBlue text] intValue];
    [textFieldRed setText:@""];
    [textFieldGreen setText:@""];
    [textFieldBlue setText:@""];

    UIColor *color = [UIColor colorWithRed:(CGFloat)red/255
                                     green:(CGFloat)green/255
                                      blue:(CGFloat)blue/255
                                     alpha:1.0];
    
    [viewResultColor setBackgroundColor:color];
    
    [labelResultColor setText:[self hexStringFromColor:color]];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [labelResultColor setText:@"Color"];
    [viewResultColor setBackgroundColor:UIColor.blackColor];
    if(errorFlag) {
        errorFlag = NO;
    }
    //[textField becomeFirstResponder];
    return YES;
}

- (BOOL)checkError {
    NSString *red = textFieldRed.text;
    NSString *green = textFieldGreen.text;
    NSString *blue = textFieldBlue.text;
    
    if(red.length == 0) {
        return YES;
    }
    if(green.length == 0) {
        return YES;
    }
    if(blue.length == 0) {
        return YES;
    }
    
    if(![textFieldRed.text isEqual:[NSString stringWithFormat:@"%d", red.intValue]] ){
        return YES;
    }
    if(![textFieldGreen.text isEqual:[NSString stringWithFormat:@"%d", green.intValue]]){
        return YES;
    }
    if(![textFieldBlue.text isEqual:[NSString stringWithFormat:@"%d", blue.intValue]]){
        return YES;
    }
    
    
    if(red.intValue > 255 || red.intValue < 0){
        return YES;
    }
    if(green.intValue > 255 || green.intValue < 0){
        return YES;
    }
    if(blue.intValue > 255 || blue.intValue < 0){
        return YES;
    }
    
    return NO;
}

- (void)setupUI {
    CGFloat heigh = 30.0;
    CGFloat viewWidth = self.view.frame.size.width;
    
    labelResultColor = [[UILabel alloc] initWithFrame:CGRectMake(20,
                                                                 100,
                                                                 100,
                                                                 heigh)];
    [labelResultColor setText:@"Color"];
    [self.view addSubview:labelResultColor];
        
    viewResultColor = [[UIView alloc] initWithFrame:CGRectMake(130,
                                                               100,
                                                               viewWidth - 150,
                                                               heigh)];
    viewResultColor.backgroundColor = UIColor.blackColor;
    [self.view addSubview:viewResultColor];

    labelRed = [[UILabel alloc] initWithFrame:CGRectMake(20,
                                                         viewResultColor.frame.origin.y + heigh + 10,
                                                         80,
                                                         heigh)];
    labelRed.text = @"RED";
    [self.view addSubview:labelRed];

    textFieldRed = [[UITextField alloc] initWithFrame:CGRectMake(labelRed.frame.origin.x + labelRed.frame.size.width + 10,
                                                                 labelRed.frame.origin.y,
                                                                 viewWidth - labelRed.frame.origin.x - labelRed.frame.size.width - 30,
                                                                 heigh)];
    textFieldRed.placeholder = @"0..255";
    textFieldRed.borderStyle = UITextBorderStyleRoundedRect;
    [textFieldRed setDelegate:self];
    [self.view addSubview:textFieldRed];

labelGreen = [[UILabel alloc] initWithFrame:CGRectMake(20,
                                                           labelRed.frame.origin.y + heigh + 10,
                                                           80,
                                                           heigh)];
    labelGreen.text = @"GREEN";
    [self.view addSubview:labelGreen];

    textFieldGreen = [[UITextField alloc] initWithFrame:CGRectMake(textFieldRed.frame.origin.x,
                                                                   labelGreen.frame.origin.y,
                                                                   textFieldRed.frame.size.width,
                                                                   heigh)];
    textFieldGreen.placeholder = @"0..255";
    textFieldGreen.borderStyle = UITextBorderStyleRoundedRect;
    [textFieldGreen setDelegate:self];
    [self.view addSubview:textFieldGreen];
    
    labelBlue = [[UILabel alloc] initWithFrame:CGRectMake(20,
                                                          labelGreen.frame.origin.y + heigh + 10,
                                                          80,
                                                          heigh)];
    labelBlue.text = @"BLUE";
    [self.view addSubview:labelBlue];

    textFieldBlue = [[UITextField alloc] initWithFrame:CGRectMake(textFieldGreen.frame.origin.x,
                                                                   labelBlue.frame.origin.y,
                                                                   textFieldGreen.frame.size.width,
                                                                   heigh)];
    textFieldBlue.placeholder = @"0..255";
    textFieldBlue.borderStyle = UITextBorderStyleRoundedRect;
    [textFieldBlue setDelegate:self];
    [self.view addSubview:textFieldBlue];
    
    buttonProcess = [[UIButton alloc] initWithFrame:CGRectMake(viewWidth / 2 - 50,
                                                               labelBlue.frame.origin.y + heigh + 20,
                                                               100,
                                                               heigh)];
    //buttonProcess.titleLabel.text = @"Process";
    [buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    [buttonProcess setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
    [buttonProcess addTarget:self action:@selector(buttonProcessPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonProcess];
}

- (NSString *)hexStringFromColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    NSString *hexString=[NSString stringWithFormat:@"0x%02X%02X%02X", (int)(r*255), (int)(g*255), (int)(b*255)];
    return hexString;
}
@end
