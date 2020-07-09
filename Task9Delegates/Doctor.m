//
//  Doctor.m
//  Task9Delegates
//
//  Created by Admin on 27.10.17.
//  Copyright © 2017 Ksenia Didusenko. All rights reserved.
//

#import "Doctor.h"
#import "Patient.h"
@implementation Doctor

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.doctorReport=[[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark - PatientDelegate
-(void) patientfeelBad:(Patient*) patient{
    
    NSLog(@" Patient %@ feels bad" , patient.name);
    
    if( patient.temperature > 37.f && patient.temperature <= 39.f && patient.headache){
        [patient takePill];
    } else if( patient.temperature > 37.f && patient.temperature <= 39.f && patient.pressure){
            [patient takePill];
    } else if (patient.temperature > 39.f && patient.headache && patient.pressure){
        [patient makeInjection];
    } else if (patient.temperature <= 37.f && patient.headache && patient.pressure){
        [patient takePill];
    } else if (patient.temperature > 39.f && patient.headache){
        [patient makeInjection];
    } else if (patient.temperature > 39.f && patient.pressure){
        [patient makeInjection];
    } else{
        NSLog(@" patient %@ should rest" , patient.name);
    }
}
-(void) patient:(Patient*) patient hasQuestion:(NSString*) question{
    NSLog(@" patient %@ has a question: %@" , patient.name, question);
}

-(void) patientBodyPain:(Patient*) patient{
    
    
    PatientOrgan organ;
    organ=arc4random()%6;
    NSNumber * nameOrgan = [[NSNumber alloc] init];
    
    NSLog(@" Patient %@ had pain in %@" , patient.name, [self nameOfAcheOrgan:organ]);
    switch (organ) {
        case Head:
            NSLog(@"Doctor take a pill from headache to patient %@", patient.name);
            nameOrgan= [NSNumber numberWithInt:organ];
            [self.doctorReport setObject:nameOrgan forKey:patient.name];
            break;
        case Leg:
            NSLog(@"Doctor make injection from pain in leg to patient %@", patient.name);
            nameOrgan= [NSNumber numberWithInt:organ];
            [self.doctorReport setObject:nameOrgan forKey:patient.name];
            break;
        case Stomach:
            NSLog(@"Doctor take a pill from stomachache to patient %@", patient.name);
            nameOrgan= [NSNumber numberWithInt:organ];
            [self.doctorReport setObject:nameOrgan forKey:patient.name];
            break;
        case Heart:
            NSLog(@"Doctor take a pill from heart ache to patient %@", patient.name);
            nameOrgan= [NSNumber numberWithInt:organ];
            [self.doctorReport setObject:nameOrgan forKey:patient.name];
            break;
        case Arm:
            NSLog(@"Doctor band arm to patient %@", patient.name);
            nameOrgan= [NSNumber numberWithInt:organ];
            [self.doctorReport setObject:nameOrgan forKey:patient.name];
            break;
            
        default:
            NSLog(@"Doctor told  %@  to rest", patient.name);
            
            break;
    }
}


-(void) reportFromDoctor{
    
   /* NSArray *sortedKeys = [[_doctorReport allKeys] sortedArrayUsingSelector: @selector(compare:)];
    NSMutableArray *sortedValues = [NSMutableArray array];
    for (NSString *key in sortedKeys){
        [sortedValues addObject: [_doctorReport objectForKey: key]];
        
    }
    
    
    
    for (NSString *key in sortedKeys){
        sortedValues = [_doctorReport objectForKey: key];
        NSLog(@"Patient %@ came with pain in %@ ", key, sortedValues);


    }*/
    
    
    
       NSArray *sortedKeys = [_doctorReport keysSortedByValueUsingComparator:^NSComparisonResult(id   obj1, id   obj2) {
     return [obj1 compare:obj2];
     }];
     NSLog(@"Report: ");
     for (id key in sortedKeys){
     NSLog(@"Patient %@ came with pain in %@ ", key, [self nameOfAcheOrgan:[[self.doctorReport objectForKey: key ] integerValue ]]);
     
     
     }
    
    
    
    
    
}

-(NSString *) nameOfAcheOrgan:(int) acheOrgan{
    
    switch (acheOrgan) {
        case Head:
            return @"head";
            break;
        case Leg:
            return @"leg";
            break;
        case Stomach:
            return @"stomach";
            break;
        case Heart:
            return @"heart";
            break;
        case Arm:
            return @"arm";
            break;
        default:
            return @"No pain";
    }
}


@end


