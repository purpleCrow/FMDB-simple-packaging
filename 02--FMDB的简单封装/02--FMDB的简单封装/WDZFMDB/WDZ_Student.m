//
//  WDZ_Student.m
//  02--FMDB的简单封装
//


#import "WDZ_Student.h"

@implementation WDZ_Student

-(instancetype)initWithName:(NSString *)name andClassName:(NSString *)className andAge:(NSNumber *)age andAddress:(NSString *)address andScore:(NSNumber *)score{
    if (self=[super init]) {
        _name=name;
        _className=className;
        _age=age;
        _address=address;
        _score=score;
    }
    return self;
}

-(void)show{
    NSLog(@"%@--%@--%@--%@--%@",self.name,self.className,self.address,self.age,self.score);
}

@end
