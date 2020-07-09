//
//  BadDoctor.h
//  Task9Delegates
//
//  Created by Admin on 01.11.17.
//  Copyright © 2017 Ksenia Didusenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"
@interface BadDoctor : NSObject <PatientDelegate>
@property(strong , nonatomic) NSString* doctorName;
-(void) takeMixture;
-(void) doAcupuncture;
-(void) tellMantra;

@end
