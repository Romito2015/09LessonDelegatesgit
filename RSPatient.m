//
//  RSPatient.m
//  09LessonDelegatesHW
//
//  Created by Roman Chopovenko on 26.06.15.
//  Copyright (c) 2015 Roman Chopovenko. All rights reserved.
//

#import "RSPatient.h"

@implementation RSPatient
- (instancetype) init {
    self = [super init];
    if (self) {
        self.satisfiedWithTheDoctor = YES;
    }
    return self;
}

- (BOOL) howAreYou {
    BOOL iFeelGood = NO;//arc4random() % 2;
    
    if (!iFeelGood) {
        
        [self.delegate patientFeelsBad:self];
    } else if (iFeelGood) {
        
        NSLog(@"%@: Im ok", self.name);
    }
    return iFeelGood;
}

- (void) takePill {
    NSLog(@"Patient %@ takes a pill", self.name);
    
    [self likeDoctorOrNot];
}

- (void) makeShot {
    NSLog(@"Patient %@ makes shot", self.name);
    
    [self likeDoctorOrNot];
}

- (void) imposeAGypsum {
    NSLog(@"Patient %@ gets a gypsum on his leg", self.name);
    
    [self likeDoctorOrNot];
}

- (void) makeABandage {
    NSLog(@"Patient %@ gets a bandage on arm", self.name);
    
    [self likeDoctorOrNot];
}

- (void) likeDoctorOrNot {
    
    if ([[self.delegate name] isEqualToString:@"dr. House"]) {
        self.satisfiedWithTheDoctor = arc4random() % 2;
    } else {
        self.satisfiedWithTheDoctor = YES;
        NSLog(@"%@ satisfied with dr. %@", self.name, [self.delegate name]);
    }
}
@end