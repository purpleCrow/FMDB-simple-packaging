//
//  WDZ_Student.h
//  02--FMDB的简单封装
//


#import <Foundation/Foundation.h>

@interface WDZ_Student : NSObject

//名字
@property (nonatomic,copy) NSString * name;

//班级名
@property (nonatomic,copy) NSString * className;

//年龄
@property (nonatomic,strong) NSNumber * age;

//地址
@property (nonatomic,copy) NSString * address;

//成绩
@property (nonatomic,strong) NSNumber * score;

-(instancetype)initWithName:(NSString *)name andClassName:(NSString *)className andAge:(NSNumber *)age andAddress:(NSString *)address andScore:(NSNumber *)score;

-(void)show;

@end
