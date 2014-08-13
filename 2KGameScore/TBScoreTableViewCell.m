//
//  TBScoreTableViewCell.m
//  2KGameScore
//
//  Created by Zhouzhuoqian https://github.com/ben46 on 14-8-12.
//  Copyright (c) 2014年 Hangzhou Tuobian Network Technology LTD.,CO. All rights reserved.
//

#import "TBScoreTableViewCell.h"
#import "Score.h"

@implementation TBScoreTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)heightForCell
{
    return 97;
}


- (void)fillWithScore:(Score *)score;
{
    
    [self.winnerLabel setText:[NSString stringWithFormat:@"%@(%@)", score.winner, score.winnerTeam]];
    [self.loserLabel setText:[NSString stringWithFormat:@"%@(%@)", score.loser, score.loserTeam]];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"MM月dd日";

    [self.timeLabel setText:[df stringFromDate:[NSDate dateWithTimeIntervalSince1970:score.createAt]]];
    
    [self.winScoreLabel setText:[NSString stringWithFormat:@"%d", score.winScore]];
    [self.loseScoreLabel setText:[NSString stringWithFormat:@"%d", score.loseScore]];
    
}

@end
