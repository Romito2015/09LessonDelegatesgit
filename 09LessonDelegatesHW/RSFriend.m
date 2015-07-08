//
//  RSFriend.m
//  09LessonDelegatesHW
//
//  Created by Roman Chopovenko on 02.07.15.
//  Copyright (c) 2015 Roman Chopovenko. All rights reserved.
//

#import "RSFriend.h"

@implementation RSFriend

- (void) patientFeelsBad:(RSPatient *)patient {
    
    NSLog(@"%@ youll be ok", patient.name);
    
    patient.satisfiedWithTheDoctor = YES;
    //
    
    
    
}



@end
