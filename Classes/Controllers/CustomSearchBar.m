//
//  CustomSearchBar.m
//  TwitterFon
//
//  Created by kaz on 11/25/08.
//  Copyright 2008 naan studio. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CustomSearchBar.h"
#import "DebugUtils.h"

@implementation CustomSearchBar

@synthesize locationButton;

- (id)initWithFrame:(CGRect)frame delegate:(id)delegate 
{
    if (self = [super initWithFrame:frame]) {
        
        self.delegate = delegate;

        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.font = [UIFont systemFontOfSize:14];
        
        UIImage *image = [UIImage imageNamed:@"CustomSearchField.png"];
        inputField = [[image stretchableImageWithLeftCapWidth:17 topCapHeight:0] retain];

        // location button
        locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [locationButton setImage:[UIImage imageNamed:@"location_small.png"] forState:UIControlStateNormal];
        [locationButton addTarget:delegate action:@selector(customSearchBarLocationButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.leftView = locationButton;
        self.leftViewMode = UITextFieldViewModeAlways;
        
        UIButton *bookmark = [UIButton buttonWithType:UIButtonTypeCustom];
        [bookmark setImage:[UIImage imageNamed:@"Bookmarks.png"] forState:UIControlStateNormal];
        [bookmark setImage:[UIImage imageNamed:@"BookmarksPressed.png"] forState:UIControlStateHighlighted];
        [bookmark addTarget:delegate action:@selector(customSearchBarBookmarkButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        self.rightView = bookmark;
        self.rightViewMode = UITextFieldViewModeUnlessEditing;
        
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
    CGRect r= CGRectMake(5, 6, 209, 31);
    [inputField drawInRect:r];
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectMake(35, 14, 145, 17);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectMake(35, 14, 145, 17);
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    bounds.origin.x += 2;
    bounds.size.width = 37;
    return bounds;
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds
{
    return CGRectMake(bounds.size.width - 46, 8, 40, 29);
}

- (CGRect)clearButtonRectForBounds:(CGRect)bounds
{
    return CGRectMake(bounds.size.width - 31, 13, 19, 19);
}

- (void)dealloc {
    [inputField autorelease];
    [super dealloc];
}


@end