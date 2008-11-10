//
//  SearchViewController.h
//  TwitterFon
//
//  Created by kaz on 10/24/08.
//  Copyright 2008 naan studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrendsDataSource.h"
#import "SearchHistoryDataSource.h"
#import "TimelineViewDataSource.h"
#import "LocationManager.h"
#import "SearchMessageView.h"
#import "SearchView.h"

@interface SearchViewController : UITableViewController <UISearchBarDelegate> {
    UISearchBar*                searchBar;
    TrendsDataSource*           trends;
    TimelineViewDataSource*     search;
    SearchHistoryDataSource*    history;
    LocationManager*            location;
    IBOutlet SearchMessageView* messageView;
    IBOutlet SearchView*        searchView;
}

- (void)search:(NSString*)query;
- (void)reloadTable;

@end