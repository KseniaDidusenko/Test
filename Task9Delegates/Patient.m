//
//  Patient.m
//  Task9Delegates
//
//  Created by Admin on 26.10.17.
//  Copyright © 2017 Ksenia Didusenko. All rights reserved.
//

#import "Patient.h"

@implementation Patient


-(BOOL) howAreYou{
    
    BOOL iFeelGood=NO;//arc4random() % 2;
    
    if (!iFeelGood) {
        [self.delegate patientfeelBad:self];//передаем ссылку на себя
        [self.delegate patientBodyPain:self];
    }
    return iFeelGood;
}
-(void) takePill{
    NSLog(@" %@ takes a pill", self.name);
    
}
-(void) makeInjection{
    
    NSLog(@" %@ make a shot", self.name);
}

-(void) patientBecameWorse{
    if (!self.headache) {
        self.headache= TRUE;
    } else if (!self.pressure){
        self.pressure=TRUE;
    } else{
        self.temperature=+2;
    }
    
    NSLog(@" patient %@ became worse" , self.name);
    [self.delegate patientfeelBad:self];
    
    
}


@end
