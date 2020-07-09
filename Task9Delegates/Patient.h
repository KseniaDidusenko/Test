//
//  Patient.h
//  Task9Delegates
//
//  Created by Admin on 26.10.17.
//  Copyright © 2017 Ksenia Didusenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreGraphics/CoreGraphics.h"

typedef enum{
    Head,
    Leg,
    Stomach,
    Heart,
    Arm
}PatientOrgan;

@protocol PatientDelegate;

@interface Patient : NSObject

@property(strong, nonatomic) NSString* name;
@property(assign, nonatomic) CGFloat temperature;
@property(assign, nonatomic) BOOL headache;
@property(assign, nonatomic) BOOL pressure;
@property(assign, nonatomic) BOOL doctorRating;
@property(weak , nonatomic) id <PatientDelegate> delegate;

-(BOOL) howAreYou;
-(void) takePill;
-(void) makeInjection;
-(void) patientBecameWorse;


@end



@protocol PatientDelegate <NSObject>
@required
-(void) patient:(Patient*) patient hasQuestion:(NSString*) question;
-(void) patientfeelBad:(Patient*) patient;
-(void) patientBodyPain:(Patient*) patient;

@property(strong , nonatomic) NSString* doctorName;
@end
