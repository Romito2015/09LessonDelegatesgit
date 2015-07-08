//
//  RSDoctor.m
//  09LessonDelegatesHW
//
//  Created by Roman Chopovenko on 26.06.15.
//  Copyright (c) 2015 Roman Chopovenko. All rights reserved.
//

#import "RSDoctor.h"

@implementation RSDoctor

- (instancetype) init {
    
    self = [super init];
    if (self) {
        NSArray *armArray = [NSArray array];
        NSArray *legArray = [NSArray array];
        NSArray *headArray = [NSArray array];
        NSArray *chestArray = [NSArray array];
        NSArray *stomachArray = [NSArray array];
        self.journal = [NSMutableDictionary dictionaryWithObjects:@[armArray, legArray, headArray, chestArray, stomachArray]
                                                          forKeys:@[@"arm", @"leg", @"head", @"chest", @"stomach"]];
       
    }
    return self;
}

#pragma mark - RSPatientDelegate

- (void) patientFeelsBad:(RSPatient *)patient {
    
    NSLog(@"Patient %@ feels bad", patient.name);
    
    patient.additionalPain = (RSbodyParts) arc4random() % 5;
   
    
    switch (patient.additionalPain) {
        case RSArm:
            [patient makeABandage];
            
            self.journal[[self convertToString:patient.additionalPain]] = [self addNameToArray:patient];
            
            break;
        case RSLeg:
            [patient imposeAGypsum];
            
           self.journal[[self convertToString:patient.additionalPain]] = [self addNameToArray:patient];
            break;
        case RSHead:
            [patient takePill];
            [patient makeShot];
            
            self.journal[[self convertToString:patient.additionalPain]] = [self addNameToArray:patient];
            break;
        case RSChest:
            [patient makeShot];
            
            self.journal[[self convertToString:patient.additionalPain]] = [self addNameToArray:patient];
            break;
        case RSStomach:
            [patient takePill];
            
            self.journal[[self convertToString:patient.additionalPain]] = [self addNameToArray:patient];
            break;
            
        default:
            break;
    }
    
}

- (NSArray *) addNameToArray:(RSPatient*) patient {
    
    NSArray * result =
    [[self.journal objectForKey:[self convertToString:patient.additionalPain]] arrayByAddingObject:patient.name];

    return result;
}

- (NSString*) convertToString:(RSbodyParts) bodyPart {
    
    NSString * result = nil;
    
    switch (bodyPart) {
        case RSArm:
            result = @"arm";
            break;
        case RSLeg:
            result = @"leg";
            break;
        case RSHead:
            result = @"head";
            break;
        case RSChest:
            result = @"chest";
            break;
        case RSStomach:
            result = @"stomach";
            break;
            
        default:
            result = @"none";
            break;
    }
    return result;
}

- (void) report {
    
    NSLog(@"\n~~~~~~~~~~~~~~~~~~~~~REPORT~~~~~~~~~~~~~~~~~~~~~");
    
    NSLog(@"%@", self.journal);
}


@end
