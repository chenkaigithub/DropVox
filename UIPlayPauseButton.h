//
//  UIPlayPauseButton.h
//  DropVox
//
//  Created by Niels Joubert on 12/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIPlayPauseButton : UIButton {
	UIImage* _btn_play;
	UIImage* _btn_play_pressed;
	UIImage* _btn_pause;
	UIImage* _btn_pause_pressed;	
}
+(id)buttonWithType:(UIButtonType)buttonType;
- (id)initWithFrame:(CGRect)frame playButton:(UIImage*) btn_play playButtonPressed:(UIImage*) btn_play_pressed pauseButton:(UIImage*) btn_pause pauseButtonPressed:(UIImage*) btn_pausePressed;
@end
