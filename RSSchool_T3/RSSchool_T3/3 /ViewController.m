#import "ViewController.h"

@interface ViewController ()

- (void)setupUI;
- (BOOL)check;

@end


@implementation ViewController

#pragma mark -

// MARK: - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
//    self.view.accessibilityIdentifier = @"mainView";
//    textFieldRed.accessibilityIdentifier = @"textFieldRed";
//    textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
//    textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
//    buttonProcess.accessibilityIdentifier = @"buttonProcess";
//    labelRed.accessibilityIdentifier = @"labelRed";
//    labelGreen.accessibilityIdentifier = @"labelGreen";
//    labelBlue.accessibilityIdentifier = @"labelBlue";
//    labelResultColor.accessibilityIdentifier = @"labelResultColor";
//    viewResultColor.accessibilityIdentifier = @"viewResultColor";
//
}

- (void)dealloc {
//    [labelResultColor release];
//    [labelRed release];
//    [labelGreen release];
//    [labelBlue release];
//    [viewResultColor release];
//    [textFieldRed release];
//    [textFieldGreen release];
//    [textFieldBlue release];
//    [buttonProcess release];
//    [super dealloc];
}
- (void)buttonProcessPressed {
    NSLog(@"Button tapped");
    if(![self check]) {
        
    }
//    NSInteger red = [[textFieldRed text] intValue];
//    NSInteger green = [[textFieldGreen text] intValue];
//    NSInteger blue = [[textFieldBlue text] intValue];
//    
}

-(BOOL)check {
    NSString *red = textFieldRed.text;
    NSString *green = textFieldGreen.text;
    NSString *blue = textFieldBlue.text;
    
    if(red.length == 0) {
        return NO;
    }
    if(green.length == 0) {
        return NO;
    }
    if(blue.length == 0) {
        return NO;
    }
    return 0;
}

-(void)setupUI {
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
@end

