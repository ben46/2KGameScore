//
//  TBScoreTableViewController.m
//  2KGameScore
//
//  Created by Zhouzhuoqian https://github.com/ben46 on 14-8-12.
//  Copyright (c) 2014年 Hangzhou Tuobian Network Technology LTD.,CO. All rights reserved.
//

#import "TBScoreTableViewController.h"
#import "TBScoreTableViewCell.h"
#import "Score.h"
#import "TBAddScoreViewController.h"

@interface TBScoreTableViewController ()

@property (strong, nonatomic) NSArray       *list;


@end

@implementation TBScoreTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    self.title = @"拓边2K战绩榜";
    
    UIButton *btn = [self createButtonForback];
    [btn setTitle:@"Add" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(addButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barbtnitm = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barbtnitm;
    
}

- (UIButton *)createButtonForback {
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(0, 0, 45, 45);
    [btn setTitleColor:kTBTintColor forState:UIControlStateNormal];
    return btn;
    
}

- (void)addButtonTouched:(id)sender
{
    
    TBAddScoreViewController *vc = [[TBAddScoreViewController alloc] initWithNibName:@"TBAddScoreViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.list = nil;
    [self.tableView reloadData];
}

#pragma mark - properties

- (NSArray *)list{
    if(!_list) {
        _list = [Score JM_allOrderBy:@"winScore desc"];
    }
    return _list;
        
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [TBScoreTableViewCell heightForCell];
}

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
    static NSString *cellIdentifier = @"TBScoreTableViewCell";
    TBScoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([TBScoreTableViewCell class]) owner:nil options:nil] lastObject];
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    [cell fillWithScore:[self.list objectAtIndex:indexPath.row]];

    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


@end
