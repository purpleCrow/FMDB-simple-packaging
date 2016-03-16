//
//  WDZFMDBMagager.m
//  02--FMDB的简单封装
//


#import "WDZFMDBMagager.h"
#import "FMDatabase.h"
#import "WDZ_Student.h"

@interface WDZFMDBMagager(){
    FMDatabase * _db;
}

@end

@implementation WDZFMDBMagager


#pragma mark - 创建manager
-(instancetype)init{
    if (self=[super init]) {
        //在这儿要创建一个数据库，并且打开
        NSString * path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/user.db"];
        _db=[[FMDatabase alloc] initWithPath:path];
        NSLog(@"%@",path);
        BOOL ret=[_db open];
        if (ret) {
            NSLog(@"数据库创建/打开成功");
            //创建表
            [self creatStudentTable];
        }else{
            NSLog(@"数据库创建/打开失败");
        }
    }
    return self;
}

//单例方法,保证只创建一个数据库
+(WDZFMDBMagager *)defaultFMDBManager{
    static WDZFMDBMagager * _manager;
    if (_manager==nil) {
        _manager=[[WDZFMDBMagager alloc] init];
    }
    return _manager;
}

#pragma mark - 数据库操作
-(void)creatStudentTable{
    //1.创建sql语句
    NSString * sql=@"CREATE TABLE IF NOT EXISTS t_student(id integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL,age integer DEFAULT 18,score real,address text,className text);";
    
    //2.执行sql语句
    BOOL ret=[_db executeUpdate:sql];
    if (ret) {
        NSLog(@"创建表成功");
    }else{
        NSLog(@"创建表失败");
    }
}

//增删改查的前提是有一张对应的表，有表的前提是有一个打开的数据库
-(void)insertStudent:(WDZ_Student *)stu{
    //1.创建sql语句
    NSString * sql=@"INSERT INTO t_student(name,age,score,address,className) VALUES (?,?,?,?,?);";
    
    //2.执行sql语句
    BOOL ret=[_db executeUpdate:sql,stu.name,stu.age,stu.score,stu.address,stu.className];
    if (ret) {
        NSLog(@"数据插入成功");
    }else{
        NSLog(@"数据插入失败");
    }
}

//2.按学生姓名删除数据
-(void)deleteStudentWithName:(NSString *)name{
    //1.创建sql语句
    NSString * sql=@"DELETE FROM t_student WHERE name=?;";
    
    BOOL ret=[_db executeUpdate:sql,name];
    if (ret) {
        NSLog(@"删除数据成功");
    }else{
        NSLog(@"删除数据失败");
    }
    
}

//3.删除所有学生
-(void)deleteAllStudent{
    NSString * sql=@"DELETE FROM t_student";
    
    BOOL ret=[_db executeUpdate:sql];
    if (ret) {
        NSLog(@"删除所有数据成功");
    }
    else{
        NSLog(@"删除所有数据失败");
    }
}

//4.修改指定学生的成绩
-(void)updataScore:(NSNumber *)score WithStudentName:(NSString *)name{
    
    NSString * sql=@"UPDATE t_student SET score=? WHERE name=?;";
    
    BOOL ret=[_db executeUpdate:sql,score,name];
    if (ret) {
        NSLog(@"修改成功");
    }else{
        NSLog(@"修改失败");
    }
}

//5.获取指定班的所有学生信息
-(NSArray *)getAllStudentsWithClass:(NSString *)className{
    
    NSString * sql=@"SELECT * FROM t_student WHERE className=?;";
    
    FMResultSet * set=[_db executeQuery:sql,className];
    
    NSMutableArray * mArray=[[NSMutableArray alloc] init];
    
    while([set next]) {
        WDZ_Student * stu=[[WDZ_Student alloc] initWithName:[set objectForColumnName:@"name"] andClassName:[set objectForColumnName:@"className"] andAge:[set objectForColumnName:@"age"] andAddress:[set objectForColumnName:@"address"] andScore:[set objectForColumnName:@"score"]];
        
        [mArray addObject:stu];
    }
    
    return mArray;
}

//6.获取指定学生的信息
-(WDZ_Student *)getStudentInfoWithName:(NSString *)name{
    
    NSString * sql=@"SELECT * FROM t_student WHERE name=?;";
    
    FMResultSet * set=[_db executeQuery:sql,name];
    
    WDZ_Student * student;
    
    while ([set next]) {
        student=[[WDZ_Student alloc] initWithName:[set objectForColumnName:@"name"] andClassName:[set objectForColumnName:@"className"] andAge:[set objectForColumnName:@"age"] andAddress:[set objectForColumnName:@"address"] andScore:[set objectForColumnName:@"score"]];
        
    }
    
    return student;
}

//7.获取所有学生的信息
-(NSArray *)getAllStudentInfo{
    
    NSString * sql=@"SELECT * FROM t_student";
    
    FMResultSet * set=[_db executeQuery:sql];
    
    NSMutableArray * mArray=[[NSMutableArray alloc] init];
    
    while ([set next]) {
        
        WDZ_Student * student=[[WDZ_Student alloc] initWithName:[set objectForColumnName:@"name"] andClassName:[set objectForColumnName:@"className"] andAge:[set objectForColumnName:@"age"] andAddress:[set objectForColumnName:@"address"] andScore:[set objectForColumnName:@"score"]];
        
        [mArray addObject:student];
    }
    
    return mArray;
}
//8.获取指定行后的指定个数的学生信息
-(NSArray *)getAllStudentInfoWithPageSize:(NSNumber *)pagesize andstartIdx:(NSNumber *)startIdx{
    //LIMIT后边，第一个数是开始查询的标号，第二数是每次查询的个数
    NSString * sql=@"SELECT * FROM t_student LIMIT ?,?;";
    
    FMResultSet * set=[_db executeQuery:sql,startIdx,pagesize];
    
    NSMutableArray * mArray=[[NSMutableArray alloc] init];
    
    while ([set next]) {
        WDZ_Student * stu=[[WDZ_Student alloc] initWithName:[set objectForColumnName:@"name"] andClassName:[set objectForColumnName:@"className"] andAge:[set objectForColumnName:@"age"] andAddress:[set objectForColumnName:@"address"] andScore:[set objectForColumnName:@"score"]];
        [mArray addObject:stu];
    }
    
    return mArray;
}

@end
