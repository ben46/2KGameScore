//
//  TBAddScoreViewController.m
//  2KGameScore
//
//  Created by Zhouzhuoqian https://github.com/ben46 on 14-8-12.
//  Copyright (c) 2014年 Hangzhou Tuobian Network Technology LTD.,CO. All rights reserved.
//

#import "TBAddScoreViewController.h"
#import "Score.h"

@interface TBAddScoreViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *winnerTF;
@property (weak, nonatomic) IBOutlet UITextField *loserTF;
@property (weak, nonatomic) IBOutlet UITextField *loserScoreTF;
@property (weak, nonatomic) IBOutlet UITextField *loserTeamTF;
@property (weak, nonatomic) IBOutlet UITextField *winnerScoreTF;
@property (weak, nonatomic) IBOutlet UITextField *winnerTeamTF;

@end

@implementation TBAddScoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    [self.addButton.titleLabel setShadowOffset:CGSizeZero];
    [self.addButton setTitleShadowColor:[UIColor clearColor] forState:UIControlStateNormal];
    [self.addButton setTitleColor:kTBTintColor forState:UIControlStateNormal];
    
    NSArray *arr = [Score JM_allOrderBy:@"createAt desc"];
    
    if(arr.count){
        
        Score *score = [arr objectAtIndex:0];
        self.winnerTeamTF.text = score.winnerTeam;
        self.loserTeamTF.text = score.loserTeam;
        
        self.winnerTF.text = score.winner;
        self.loserTF.text = score.loser;
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonTouched:(id)sender {
    
    Score *score = [[Score alloc] init];
    
    score.winnerTeam = self.winnerTeamTF.text;
    score.loserTeam = self.loserTeamTF.text;
    
    score.winner = self.winnerTF.text;
    score.loser = self.loserTF.text;
    
    score.winScore = [self.winnerScoreTF.text integerValue];
    score.loseScore = [self.loserScoreTF.text integerValue];
    score.createAt = [NSDate date].timeIntervalSince1970;
    
    [score JM_save];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField;           // became first responder
{
    [textField setText:@""];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text
{
    
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        
        return NO;
    }
    
    return YES;

}

@end
