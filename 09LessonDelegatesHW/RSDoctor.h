//
//  RSDoctor.h
//  09LessonDelegatesHW
//
//  Created by Roman Chopovenko on 26.06.15.
//  Copyright (c) 2015 Roman Chopovenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSPatient.h"

@interface RSDoctor : NSObject <RSPatientDelegate>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableDictionary *journal;

- (NSString*) convertToString:(RSbodyParts) bodyPart;

- (void) report;



@end
