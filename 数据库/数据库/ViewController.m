//
//  ViewController.m
//  数据库
//
//  Created by 黄启明 on 16/5/16.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
#import "FMDB.h"

@interface ViewController ()

@property (nonatomic, assign) sqlite3 *db;

@property (nonatomic, strong) FMDatabase *database;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    FMDB
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:@"dataFMDB.sqlite"];
    FMDatabase *database = [FMDatabase databaseWithPath:path];
    self.database = database;
    BOOL success = [database open];
    if (success) {
        NSLog(@"数据库创建成功");
        BOOL successT = [self.database executeUpdate:@"CREAT TABLE IF NOT EXISTS t_student (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL,age INTEGER NOT NULL,score REAL DEFAULT 60.0)"];
        if (successT) {
            NSLog(@"创建表成功");
        }else{
            NSLog(@"创建表失败");
        }
    }else{
        NSLog(@"数据库创建失败");
    }
    
/*
    //创建数据库文件 c语言的API 调用函数 传递参数 完成事情
    
    //打开数据库 不存在就创建并打开 保存为什么名字
    //file 全路径 沙盒 document
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"data.sqlite"];
    NSLog(@"%@",path);
    int success = sqlite3_open(path.UTF8String,&_db);
    if (success == SQLITE_OK) {
        NSLog(@"数据库创建成功");
    }else{
        NSLog(@"数据库创建失败");
    }
    //创建表（指定字段）
    NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS t_student (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL,age  INTEGER NOT NULL,score REAl DEFAULT 60.0)"];
    char *err = nil;
    //非查询语句都是用这个函数
    int successT = sqlite3_exec(_db,sql.UTF8String,NULL,NULL,&err);
    if (successT == SQLITE_OK) {
        NSLog(@"创建表成功");
    }else{
        NSLog(@"创建表失败");
    }
    //增加，删除，修改，查找
*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//100人随机
//删除 - 90 以上的
//修改 - <60 改成 59.9
//查询 - 18到22
- (IBAction)addClick {
    for (int i = 0; i < 100; i++) {
        NSString *name = [NSString stringWithFormat:@"xiaoli_%d",i];
        NSString *sql = [NSString stringWithFormat:@"INSERT INTO   t_student(name,age,score) VALUES ('%@',%d,%.2f)",name,arc4random_uniform(15)+15,arc4random_uniform(7000)/100.0+30];
        BOOL success = [self.database executeUpdate:sql];
        if (success) {
            NSLog(@"添加数据成功");
        }else{
            NSLog(@"添加数据失败");
        }
//        INSERT INTO t_student(name,age,score) VALUES ('mingyuexin-3',15,62.70);
/*
        int success = sqlite3_exec(_db, sql.UTF8String, NULL, NULL, NULL);

        if (success == SQLITE_OK) {
            NSLog(@"添加数据成功");
        }else{
            NSLog(@"添加数据失败");
        }
*/
    }
}
- (IBAction)deleateClick {
    BOOL success = [self.database executeUpdate:@"DELEATE FROM t_student WHERE score > 90"];
    if (success) {
        NSLog(@"删除数据成功");
    }else{
        NSLog(@"添删除数据失败");
    }
/*
    NSString *sql = [NSString stringWithFormat:@"DELETE  FROM t_student WHERE score > 90"];
    //        INSERT INTO t_student(name,age,score) VALUES ('mingyuexin-3',15,62.70);
    int sucess = sqlite3_exec(_db, sql.UTF8String, NULL, NULL, NULL);
    
    if (sucess == SQLITE_OK) {
        NSLog(@"删除数据成功");
    }else{
        NSLog(@"添删除数据失败");
    }
*/
}
- (IBAction)updateClick {
/*
    NSString *sql = [NSString stringWithFormat:@"UPDATE t_student SET score = 59.9 WHERE score < 60"];
    //        INSERT INTO t_student(name,age,score) VALUES ('mingyuexin-3',15,62.70);
    int sucess = sqlite3_exec(_db, sql.UTF8String, NULL, NULL, NULL);
    
    if (sucess == SQLITE_OK) {
        NSLog(@"修改数据成功");
    }else{
        NSLog(@"修改除数据失败");
    }
*/
}
- (IBAction)selectClick {
    //查询语句
//    sqlite3 *db,            /* 数据库句柄 */
//    const char *zSql,       /* SQL 语句, UTF-8 encoded */
//    int nByte,              /* sql语句的最大长度 -1 不限制长度 */
//    sqlite3_stmt **ppStmt,  /* 输出: Statement 句柄 获取最终的数据 */
//    const char **pzTail     输出:保留参数
    NSString *sql = [NSString stringWithFormat:@"SELECT name,age,score FROM t_student WHERE age > 18 AND age < 22"];
    FMResultSet *result = [self.database executeQuery:sql];
    while ([result next]) {
        NSString *name = [result stringForColumnIndex:1];
        int age = [result intForColumnIndex:2];
        double score = [result doubleForColumnIndex:3];
        NSLog(@"%@,%d,%.2f",name,age,score);
    }
/*
 //期望结果保存在stmt中
    sqlite3_stmt *stmt = nil;
    //准备查询  其实 把查询结果保存到stmt指针区域中
    int sucess = sqlite3_prepare_v2(_db, sql.UTF8String, -1, &stmt, NULL);
    //一步步获取每一条数据
    if (sucess == SQLITE_OK) {
        while(sqlite3_step(stmt) == SQLITE_ROW){//拿一条数据 等于代表数据拿出成功
            //id name age score
            const char *name = (const char *)sqlite3_column_text(stmt,0);
            int age = sqlite3_column_int(stmt,1);
            double score = sqlite3_column_double(stmt,2);
            NSLog(@"%@,%d,%.2f",[NSString stringWithUTF8String:name],age,score);
        }
    }else{
        NSLog(@"失败");
    }
*/
}

@end
