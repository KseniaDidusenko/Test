//
//  BadDoctor.m
//  Task9Delegates
//
//  Created by Admin on 01.11.17.
//  Copyright © 2017 Ksenia Didusenko. All rights reserved.
//

#import "BadDoctor.h"

@implementation BadDoctor

#pragma mark - PatientDelegate
-(void) patientfeelBad:(Patient*) patient{
    
    NSLog(@" Patient %@ feels bad" , patient.name);
    
    if( patient.temperature > 37.f && patient.temperature <= 39.f && patient.headache){
        [self takeMixture];
    } else if( patient.temperature > 37.f && patient.temperature <= 39.f && patient.pressure && patient.headache){
        [self tellMantra];
    } else if( patient.temperature > 37.f && patient.temperature <= 39.f && patient.pressure){
        [self tellMantra];
    } else if (patient.temperature >= 39.f && patient.headache && patient.pressure){
        [self takeMixture];
    } else if (patient.temperature <= 37.f && patient.headache && patient.pressure){
        [self doAcupuncture];
    } else if (patient.temperature >= 39.f && patient.headache){
        [self takeMixture];
    } else{
        NSLog(@" patient %@ should rest" , patient.name);
    }
}
-(void) patient:(Patient*) patient hasQuestion:(NSString*) question{
    NSLog(@" patient %@ has a question: %@" , patient.name, question);
}
-(void) takeMixture {
    NSLog(@" Patient  take mixture");
}

-(void) doAcupuncture {
    NSLog(@" Patient  do Acupuncture");
}

-(void) tellMantra {
    NSLog(@" Patient  tellM antra");
}

-(void) patientBodyPain:(Patient*) patient{
    
}
    
@end
