//
//  RSAppDelegate.m
//  09LessonDelegatesHW
//
//  Created by Roman Chopovenko on 26.06.15.
//  Copyright (c) 2015 Roman Chopovenko. All rights reserved.
//

#import "RSAppDelegate.h"
#import "RSPatient.h"
#import "RSDoctor.h"
#import "RSFriend.h"

@implementation RSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    //
    
    RSPatient * patient1 = [[RSPatient alloc] init];
    patient1.name = @"Amanda";
    patient1.temperature = 37.2f;
    
    RSPatient * patient2 = [[RSPatient alloc] init];
    patient2.name = @"Peter";
    patient2.temperature = 37.4;
    
    RSPatient * patient3 = [[RSPatient alloc] init];
    patient3.name = @"Tanya";
    patient3.temperature = 37.9f;
    
    RSPatient * patient4 = [[RSPatient alloc] init];
    patient4.name = @"Alex";
    patient4.temperature = 36.8f;
    
    RSPatient * patient5 = [[RSPatient alloc] init];
    patient5.name = @"Olga";
    patient5.temperature = 37.f;
    
    RSPatient * patient6 = [[RSPatient alloc] init];
    patient6.name = @"Rojer";
    patient6.temperature = 39.f;
    
    RSPatient * patient7 = [[RSPatient alloc] init];
    patient7.name = @"Sara";
    patient7.temperature = 38.8f;
    
    
    RSDoctor * doctor = [[RSDoctor alloc] init];
    [doctor setName:@"dr. House"];
    
    RSDoctor * doctor1 = [[RSDoctor alloc] init];
    doctor1.name = @"Vasya";
    
    RSDoctor * doctor2 = [[RSDoctor alloc] init];
    doctor2.name = @"Alla";
    
    
    NSArray * patientsList = @[patient1, patient2 ,patient3, patient4, patient5, patient6, patient7];
    
    NSArray * doctorsList  = @[doctor, doctor1, doctor2];
    
    
    int randomDoctorId = (arc4random() % 2) + 1;
    
    
    RSDoctor * newDoctor = [doctorsList objectAtIndex:randomDoctorId];
    
    for (RSPatient * sick in patientsList) {

        sick.delegate = doctor;
        [sick howAreYou];
    };
    [doctor report];
    
    for (RSPatient * sick in patientsList) {
        if (!sick.satisfiedWithTheDoctor) {
            
            sick.delegate = newDoctor;
            [sick howAreYou];
        };
       
    }
     [newDoctor report];
    
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
