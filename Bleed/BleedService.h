//
//  BleedService.h
//  Bleed
//
//  Created by Ernesto Freyre on 25/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface BleedService : NSObject <CBPeripheralManagerDelegate>

-(void)setupService;


@end
