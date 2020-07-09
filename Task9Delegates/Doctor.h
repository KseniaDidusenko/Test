//
//  Doctor.h
//  Task9Delegates
//
//  Created by Admin on 27.10.17.
//  Copyright © 2017 Ksenia Didusenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

@interface Doctor : NSObject <PatientDelegate>

@property(strong , nonatomic) NSString* doctorName;
@property (strong, nonatomic) NSMutableDictionary *doctorReport;
-(NSString *) nameOfAcheOrgan:(int) organ;
-(void) reportFromDoctor;
@end
