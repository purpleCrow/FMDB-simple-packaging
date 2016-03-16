//
//  WDZFMDBMagager.h
//  02--FMDB的简单封装
//


#import <Foundation/Foundation.h>
@class FMDatabase;
@class WDZ_Student;

@interface WDZFMDBMagager : NSObject

//保证Manager在整个工程中是唯一，唯一对应一个数据看
+(WDZFMDBMagager *)defaultFMDBManager;


//1.插入数据
-(void)insertStudent:(WDZ_Student *)stu;

//2.按学生姓名删除数据
-(void)deleteStudentWithName:(NSString *)name;

//3.删除所有学生
-(void)deleteAllStudent;

//4.修改指定学生的成绩
-(void)updataScore:(NSNumber *)score WithStudentName:(NSString *)name;

//5.获取指定班的所有学生信息
-(NSArray *)getAllStudentsWithClass:(NSString *)className;

//6.获取指定学生的信息
-(WDZ_Student *)getStudentInfoWithName:(NSString *)name;

//7.获取所有学生的信息
-(NSArray *)getAllStudentInfo;

//8.获取指定行后的指定个数的学生信息
-(NSArray *)getAllStudentInfoWithPageSize:(NSNumber *)pagesize andstartIdx:(NSNumber *)startIdx;

@end
