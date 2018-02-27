//
//  ViewController.m
//  TestAESEncrypt
//
//  Created by Hutong on 22/01/2018.
//  Copyright © 2018 Hutong. All rights reserved.
//

#import "ViewController.h"
#import "HTCustomizedAESencrypt.h"
#import "HTPublicPaymentPassword.h"

@interface ViewController ()<PasswordAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    libHTAESencrypt * test = [libHTAESencrypt new];
    NSString *teststring = [libHTAESencrypt encrypt:@"wwwwfsf"];
    NSLog(@"xx%@", teststring);
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)test:(id)sender {
    PasswordAlertView *_alertView =[[PasswordAlertView alloc]initWithType:PasswordAlertViewType_withoutlabels];
    
    _alertView.delegate = self;
    _alertView.titleLable.text = @"test";
    _alertView.trasferLable.text = @"eeeeeee";
    _alertView.moneyLable.text = @"11";
    _alertView.tipsLalbe.text = @"支付有误，请核对后重新支付！";
    [_alertView show];
}


- (void)runMe
{
    NSString *hexKey = @"2034F6E32958647FDFF75D265B455EBF40C80E6D597092B3A802B3E5863F878C";
    NSString *cipherText = nil;
    NSString *hexIV = nil;
    
    cipherText = @"9/0FGE21YYBl8NvlCp1Ft8j1V7BiIpCIlNa/zbYwL5LWyemd/7QEu0tkVz9/f0JG";
    hexIV = @"AD0ACC568C88C116D57B273D98FB92C0";
    [self decodeAndPrintCipherBase64Data:cipherText usingHexKey:hexKey hexIV:hexIV];
    
    cipherText = @"S6flMkdMeC77p/7pokXZkHT0is7Lp57Zgkokg/O99puZloTB/ZUzp0FwH8sWFekg";
    hexIV = @"0F0AFF0F0AFF0F0AFF0F0AFF0F0AFF00";
    [self decodeAndPrintCipherBase64Data:cipherText usingHexKey:hexKey hexIV:hexIV];
    
    NSString *plainText = @"Thank you Mr Warrender, Reinforcements have arrived! Send biscuits";
    hexIV = @"010932650CDD998833CC0AFF9AFF00FF";
    [self encodeAndPrintPlainText:plainText usingHexKey:hexKey hexIV:hexIV];
}

- (void)decodeAndPrintCipherBase64Data:(NSString *)cipherText
                           usingHexKey:(NSString *)hexKey
                                 hexIV:(NSString *)hexIV
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:cipherText options:0];
    NSAssert(data != nil, @"Couldn't base64 decode cipher text");
    
    NSData *decryptedPayload = [data originalDataWithHexKey:hexKey
                                                      hexIV:hexIV];
    
    if (decryptedPayload) {
        NSString *plainText = [[NSString alloc] initWithData:decryptedPayload encoding:NSUTF8StringEncoding];
        NSLog(@"Decrypted Result: %@", plainText);
    }
}

- (void)encodeAndPrintPlainText:(NSString *)plainText
                    usingHexKey:(NSString *)hexKey
                          hexIV:(NSString *)hexIV
{
    NSData *data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *encryptedPayload = [data encryptedDataWithHexKey:hexKey
                                                       hexIV:hexIV];
    
    if (encryptedPayload) {
        NSString *cipherText = [encryptedPayload base64EncodedStringWithOptions:0];
        NSLog(@"Encryped Result: %@", cipherText);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//点击了确定按钮  或者是完成了6位密码的输入
-(void)PasswordAlertViewCompleteInputWith:(NSString*)password{
    
}
//点击了取消按钮
-(void)PasswordAlertViewDidClickCancleButton{
    
}
//点击了忘记密码按钮
-(void)PasswordAlertViewDidClickForgetButton{
    
}


@end
