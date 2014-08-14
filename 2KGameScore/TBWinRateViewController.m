//
//  TBWinRateViewController.m
//  2KGameScore
//
//  Created by Zhouzhuoqian https://github.com/ben46 on 14-8-14.
//  Copyright (c) 2014年 Hangzhou Tuobian Network Technology LTD.,CO. All rights reserved.
//

#import "TBWinRateViewController.h"
#import "FMDBHelper.h"
#import "Score.h"

@interface TBWinRateViewController ()
@property (strong, nonatomic) NSMutableArray       *list;

@end

@implementation TBWinRateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSMutableArray *)list{
    if(!_list) {
        _list = [NSMutableArray array];
    }
    return _list;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    __weak typeof(self)weakSelf = self;
    
    [[FMDBHelper sharedInstance] JM_executeStatements:@"select distinct winner from Score"
                                                block:^(NSDictionary *dict) {
                                                    
                                                    NSString *user = [dict objectForKey:@"winner"];
                                                    [self.list addObject:@{@"user":user,
                                                                           @"rate":@([self calRate:user])
                                                                           }];
                                                    
                                                    [weakSelf.tableView reloadData];
                                                    
                                                    return 0;
    }];
    
}

- (CGFloat)calRate:(NSString *)winnerName
{
    
    NSArray *wins = [Score JM_whereCol:@"winner" isEqualTo:winnerName];
    NSArray *loses = [Score JM_whereCol:@"loser" isEqualTo:winnerName];
    CGFloat rate = wins.count / (CGFloat)(wins.count + loses.count) * 100;

    return rate;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"WinRateCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSString *user = [[self.list objectAtIndex:indexPath.row] objectForKey:@"user"];
    cell.textLabel.text = [user JM_decodeFromPercentEscapeString];
    NSNumber *num = [[self.list objectAtIndex:indexPath.row] objectForKey:@"rate"];
    NSString *detail =[NSString stringWithFormat:@"%.0f$    胜率", [num floatValue]];
    cell.detailTextLabel.text =detail;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
@end
