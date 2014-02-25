//
//  TouchedProtocol.h
//  Bleed
//
//  Created by Ernesto Freyre on 24/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol TouchedProtocolDelegate <NSObject>

@required
-(void)tapEvent;
@end

@interface TouchedProtocol : NSObject {
    
    id<TouchedProtocolDelegate> delegate;
}

@property (nonatomic, assign) id delegate;

- (void)tapEvent;


@end
