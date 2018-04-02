//
//  ViewController.m
//  语言国际化
//
//  Created by Mac on 2018/3/31.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "NSBundle+Language.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;

@property (weak, nonatomic) IBOutlet UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *title = NSLocalizedString(@"click",nil);
    [self.btn setTitle:title forState:UIControlStateNormal];
    
    NSString *title1 = NSLocalizedString(@"select",nil);
    [self.selectBtn setTitle:title1 forState:UIControlStateNormal];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 280, 60, 20)];
    label.text = NSLocalizedString(@"like", nil);
    [self.view addSubview:label];
}
- (IBAction)clickEvent:(id)sender {
    [self changeLanguageTo:@"zh-Hans"];
}

- (IBAction)selectBtnEvent:(id)sender {
    [self changeLanguageTo:@"en"];
}
- (void)changeLanguageTo:(NSString *)language {
    // 设置语言
    [NSBundle setLanguage:language];
    
    // 然后将设置好的语言存储好，下次进来直接加载
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:@"myLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    ViewController *VC = [[ViewController alloc] init];
    [UIApplication sharedApplication].keyWindow.backgroundColor = [UIColor whiteColor];
    [UIApplication sharedApplication].keyWindow.rootViewController = VC;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
