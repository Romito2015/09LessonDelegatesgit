//
//  RSFriend.h
//  09LessonDelegatesHW
//
//  Created by Roman Chopovenko on 02.07.15.
//  Copyright (c) 2015 Roman Chopovenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSPatient.h"

@interface RSFriend : NSObject <RSPatientDelegate>

@property (strong, nonatomic) NSString *name;

@end
