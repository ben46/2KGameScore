//
//  Score.h
//  2KGameScore
//
//  Created by Zhouzhuoqian https://github.com/ben46 on 14-8-12.
//  Copyright (c) 2014年 Hangzhou Tuobian Network Technology LTD.,CO. All rights reserved.
//

#import "JSONModel.h"

@interface Score : JSONModel

/**
 *  输的比分
 */

@property (assign, nonatomic) NSInteger       loseScore;

/**
 *  赢的比分
 */
@property (assign, nonatomic) NSInteger       winScore;
/**
 *  比赛时间
 */
@property (assign, nonatomic) NSTimeInterval       createAt;

/**
 *  输掉的人
 */
@property (strong, nonatomic) NSString       *winner;

/**
 *  赢的人
 */
@property (strong, nonatomic) NSString       *loser;

/**
 *  赢的队伍名称
 */

@property (strong, nonatomic) NSString       *winnerTeam;

/**
 *  输掉的队伍名称
 */
@property (strong, nonatomic) NSString       *loserTeam;




@end
