//
//  ViewController.m
//  02--FMDB的简单封装
//


#import "ViewController.h"
#import "WDZFMDBMagager.h"
#import "WDZ_Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建数据库对象
    WDZFMDBMagager * manager=[WDZFMDBMagager defaultFMDBManager];
    
    WDZ_Student * stu=[[WDZ_Student alloc] init];
    stu.name=@"xiaoming";
    stu.age=@22;
    stu.address=@"yihuanlu";
    stu.className=@"iOS1508";
    stu.score=@90;
    
    WDZ_Student * stu1=[[WDZ_Student alloc] initWithName:@"xiaoxiao" andClassName:@"ios1508" andAge:@23 andAddress:@"erhuanlu" andScore:@70];
    
//    [manager insertStudent:stu];
//    [manager insertStudent:stu1];
//    [manager deleteStudentWithName:@"xiaoming"];
    
//    [manager updataScore:@100 WithStudentName:@"xiaohong"];

//    NSArray * arr1=[manager getAllStudentsWithClass:@"iOS1508"];
//    for (WDZ_Student * stu in arr1) {
//        [stu show];
//    }
    
//    WDZ_Student * student=[manager getStudentInfoWithName:@"xiaoxiao"];
//    [student show];
    
    NSArray * arr2=[manager getAllStudentInfo];
    for (WDZ_Student * stu in arr2) {
        [stu show];
    }
    
    
//    NSArray * arr=[manager getAllStudentInfoWithPageSize:@3 andstartIdx:@1];
//    for (WDZ_Student * stu in arr) {
//        [stu show];
//    }
}



@end
