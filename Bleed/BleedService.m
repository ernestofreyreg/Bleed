//
//  BleedService.m
//  Bleed
//
//  Created by Ernesto Freyre on 25/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import "BleedService.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface BleedService() <CBPeripheralManagerDelegate>
{
    CBPeripheralManager     *manager;
    CBMutableService        *bleedService;
    CBMutableCharacteristic *bleedCharacteristic;
}
@end

@implementation BleedService

-(id)init
{
    self = [super init];
    if (self) {
        manager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
    }
    return self;
}

-(void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    switch (peripheral.state) {
        case CBPeripheralManagerStatePoweredOn:
            NSLog(@"CBPeripheralManager power on");
            [self setupService];
            break;
            
        default:
            NSLog(@"CBPeripheralManager changed state %d", peripheral.state);
            break;
    }
}

-(void)setupService
{
    NSString * kBleedServiceUUIDString = @"1C39E049-0478-438A-A264-C5CF8BFA84B3";
    NSString * kBleedCharacteristicUUIDString = @"64E81E8A-E256-46B8-A526-ECD84E6555DE";
    
    CBUUID * bleedServiceUUID = [CBUUID UUIDWithString:kBleedServiceUUIDString];
    CBUUID * bleedCharacteristicUUID = [CBUUID UUIDWithString:kBleedCharacteristicUUIDString];
    
    bleedCharacteristic = [[CBMutableCharacteristic alloc] initWithType:bleedCharacteristicUUID properties:CBCharacteristicPropertyRead value:nil permissions:CBAttributePermissionsReadable];
    
    bleedService = [[CBMutableService alloc] initWithType:bleedServiceUUID primary:YES];
    
    bleedService.characteristics = [NSArray arrayWithObject:bleedCharacteristic];
    
    [manager addService:bleedService];
}



-(void)peripheralManager:(CBPeripheralManager *)peripheral central:(CBCentral *)central didSubscribeToCharacteristic:(CBCharacteristic *)characteristic
{
    // Repeat until data chunks finallized
    
    NSData *data = [@"Hola Bleed" dataUsingEncoding:NSUTF8StringEncoding];
    [manager updateValue:data forCharacteristic:bleedCharacteristic onSubscribedCentrals:nil];
    
    NSData *eom = [@"ENVAL" dataUsingEncoding:NSUTF8StringEncoding];
    [manager updateValue:eom forCharacteristic:bleedCharacteristic onSubscribedCentrals:nil];
}

- (void)peripheralManager:(CBPeripheralManager *)peripheral didAddService:(CBService *)service error:(NSError *)error{
    NSLog(@"Added Service");
    NSString * kBleedServiceUUIDString = @"1C39E049-0478-438A-A264-C5CF8BFA84B3";
    
    NSDictionary *advertisingData = @{CBAdvertisementDataLocalNameKey : @"BleedApp", CBAdvertisementDataServiceUUIDsKey : @[[CBUUID UUIDWithString:kBleedServiceUUIDString]]};
    
    [peripheral startAdvertising:advertisingData];
}



- (void)peripheralManagerDidStartAdvertising:(CBPeripheralManager *)peripheral error:(NSError *)error{
    NSLog(@"Started advertising");
}

-(void)peripheralManager:(CBPeripheralManager *)peripheral didReceiveReadRequest:(CBATTRequest *)request
{
    NSLog(@"Read request");
    request.value = [@"Hola" dataUsingEncoding:NSUTF8StringEncoding];
    [manager respondToRequest:request withResult:CBATTErrorSuccess];
}

-(void)peripheralManager:(CBPeripheralManager *)peripheral didReceiveWriteRequests:(NSArray *)requests
{
    NSLog(@"Write request");
}

//-(void)peripheralManager:(CBPeripheralManager *)peripheral central:(CBCentral *)central didSubscribeToCharacteristic:(CBCharacteristic *)characteristic
//{
//    NSLog(@"Subscribed to Characteristic");
//}




@end
