//
//  TBScoreTableViewCell.h
//  2KGameScore
//
//  Created by Zhouzhuoqian https://github.com/ben46 on 14-8-12.
//  Copyright (c) 2014年 Hangzhou Tuobian Network Technology LTD.,CO. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Score;
@interface TBScoreTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;
@property (weak, nonatomic) IBOutlet UILabel *loserLabel;
@property (weak, nonatomic) IBOutlet UILabel *winScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *loseScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

+ (CGFloat)heightForCell;

- (void)fillWithScore:(Score *)score;

@end
