//
//  ViewController.m
//  TestAESEncrypt
//
//  Created by Hutong on 22/01/2018.
//  Copyright © 2018 Hutong. All rights reserved.
//

#import "ViewController.h"
#import "HTCustomizedAESencrypt.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    libHTAESencrypt * test = [libHTAESencrypt new];
    NSString *teststring = [libHTAESencrypt encrypt:@"wwwwfsf"];
    NSLog(@"xx%@", teststring);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
