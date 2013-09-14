//
//  TBCircularSlider.h
//  TB_CircularSlider
//
//  Created by Yari Dareglia on 1/12/13.
//  Copyright (c) 2013 Yari Dareglia. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Parameters **/
#define TB_SLIDER_SIZE 250                          //The width and the heigth of the slider
#define TB_BACKGROUND_WIDTH 35                      //The width of the dark background
#define TB_LINE_WIDTH 20                            //The width of the active area (the gradient) and the width of the handle
#define TB_FONTSIZE 65                              //The size of the textfield font
#define TB_FONTFAMILY @"HelveticaNeue-UltraLight"  //The font family of the textfield font

@interface TBCircularSlider : UIControl
@property (nonatomic,assign) int angle;
@property (nonatomic,assign) int value;
@end
