//
//  SGUPersonMessageViewController.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/6/5.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUPersonMessageViewController.h"
#import "SGUPersonMessageView.h"

@interface SGUPersonMessageViewController ()

@property (nonatomic, strong) SGUPersonMessageView *personMessageView;

@end

@implementation SGUPersonMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _personMessageView = [[SGUPersonMessageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_personMessageView];
  
    
    UIImage *originImage = [UIImage imageNamed:@"5.jpg"];
    NSData *data = UIImageJPEGRepresentation(originImage, 1.0f);
    NSString *encodeImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    NSString *url =@"http://192.168.43.92:8081/es/information";
    NSDictionary *param = @{@"idCard":@"610321200001093447",@"nation":@"汉",@"tel":@"18391741628",@"img":encodeImageStr};
    NSLog(@"%@", param[@"nation"]);
    if ([APIClient networkType] > 0) {
        [APIClient requestURL:url httpMethod:POST contentType:nil params:param response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
            switch (requestStatusCode) {
                case ApiRequestOK:
                    NSLog(@"%@---lala---", JSON);
                    break;
                    
                default:
                    break;
            }
        }];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
