//
//  ViewController.m
//  App1
//
//  Created by yangrui on 2020/3/13.
//  Copyright © 2020 yangrui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *field;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

// com.oricoled.ca.lettin.LettinWidget
// com.oricoled.ca.lettin
// group.com.oricoled.ca.lettin
- (IBAction)fetch:(id)sender {
  
    [self fetchWay2];
}
- (IBAction)update:(id)sender {
    
    [self updateWay2];
}


-(void)fetchWay1{
    //获取App Group的共享目录
    NSURL *groupURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.com.oricoled.ca.lettin"];
    NSURL *fileURL = [groupURL URLByAppendingPathComponent:@"appGroup.txt"];
    
    NSString *str = [NSString stringWithContentsOfURL:fileURL encoding:NSUTF8StringEncoding error:nil];
     self.field.text = str;
}

-(void)updateWay1{
    
    //更新 App Group的共享目录
    NSURL *groupURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.com.oricoled.ca.lettin"];
    NSURL *fileURL = [groupURL URLByAppendingPathComponent:@"appGroup.txt"];
    
    //写入文件
    [self.field.text writeToURL:fileURL atomically:YES encoding:NSUTF8StringEncoding error:nil];
}


-(void)fetchWay2{
    //获取App Group的共享 数据
    NSUserDefaults *def =  [[NSUserDefaults alloc] initWithSuiteName:@"group.com.oricoled.ca.lettin"];
    
    NSString *str = [def valueForKey:@"txt"];
    self.field.text = str;
}

-(void)updateWay2{
    
    //更新 App Group的共享数据
    NSUserDefaults *def =  [[NSUserDefaults alloc] initWithSuiteName:@"group.com.oricoled.ca.lettin"];
    [def setValue:self.field.text forKey:@"txt"];
    [def synchronize];
}

@end
