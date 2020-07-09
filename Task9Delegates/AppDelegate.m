//
//  AppDelegate.m
//  Task9Delegates
//
//  Created by Admin on 26.10.17.
//  Copyright © 2017 Ksenia Didusenko. All rights reserved.
//

#import "AppDelegate.h"
#import "Doctor.h"
#import "Patient.h"
#import "BadDoctor.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    Patient* patient1= [[Patient alloc] init];
    patient1.name=@"Vova";
    patient1.temperature=36.6f;
    patient1.headache=TRUE;
    patient1.pressure=TRUE;
    
    Patient* patient2= [[Patient alloc] init];
    patient2.name= @"Petya";
    patient2.temperature=40.2f;
    patient2.headache=FALSE;
    patient2.pressure=TRUE;
    
    Patient* patient3= [[Patient alloc] init];
    patient3.name= @"Dima";
    patient3.temperature=37.1f;
    patient3.headache=TRUE;
    patient3.pressure=FALSE;
    
    Patient* patient4= [[Patient alloc] init];
    patient4.name= @"Mike";
    patient4.temperature=37.f;
    patient4.headache=FALSE;
    patient4.pressure=FALSE;
    
    Patient* patient5= [[Patient alloc] init];
    patient5.name= @"Stas";
    patient5.temperature=39.1f;
    patient5.headache=TRUE;
    patient5.pressure=FALSE;
    
    Patient* patient6= [[Patient alloc] init];
    patient6.name= @"Kate";
    patient6.temperature=40.f;
    patient6.headache=TRUE;
    patient6.pressure=FALSE;
    
    Doctor* doctor= [[Doctor alloc] init];
    doctor.doctorName=@"Good doctor";
    BadDoctor * badDoctor = [[BadDoctor alloc ] init];
    badDoctor.doctorName=@"Bad doctor";
    
    //patient treating
    NSArray *patientQueue = [NSArray arrayWithObjects:patient1, patient2, patient3, patient4,patient5,patient6,nil];
    BOOL  healthIndicator= FALSE;
    for (id somePatient in patientQueue){
        if (arc4random()%2) {
            [somePatient setDelegate :doctor];
            [somePatient howAreYou];
            [somePatient setDoctorRating:arc4random()%2];
            if (healthIndicator== arc4random()%2) {
                [somePatient patientBecameWorse];
            }
        } else {
            [somePatient setDelegate :badDoctor];
            [somePatient howAreYou];
            [somePatient setDoctorRating:arc4random()%2];
            if (healthIndicator== arc4random()%2) {
                [somePatient patientBecameWorse];
            }
        }
        
        
    }
    
    [doctor reportFromDoctor];
    // who's treated before
    for (Patient * somePatient in patientQueue){
        
        NSLog(@" Patient %@ is treated by a %@", somePatient.name,somePatient.delegate.doctorName);
    }
    //changing doctor
    for (id somePatient in patientQueue){
        if (![somePatient doctorRating]&& [somePatient delegate]==doctor) { //somePatient.delegate ?
            [somePatient setDelegate :badDoctor];
            
        } else if (![somePatient doctorRating]&& [somePatient delegate]==badDoctor) {
            [somePatient setDelegate :doctor];
        }
        
    }
    
    NSLog(@"Start new day");
    // who's treated after
    for (Patient * somePatient in patientQueue){
    
        NSLog(@" Patient %@ is treated by a %@", somePatient.name,somePatient.delegate.doctorName );
    }
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
