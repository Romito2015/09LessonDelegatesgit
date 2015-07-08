//
//  RSPatient.h
//  09LessonDelegatesHW
//
//  Created by Roman Chopovenko on 26.06.15.
//  Copyright (c) 2015 Roman Chopovenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    RSHead,
    RSChest,
    RSStomach,
    RSArm,
    RSLeg

} RSbodyParts;

@protocol RSPatientDelegate;

@interface RSPatient : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat temperature;
@property (assign, nonatomic) RSbodyParts additionalPain;

@property (assign, nonatomic) BOOL satisfiedWithTheDoctor;

@property (weak, nonatomic) id <RSPatientDelegate> delegate;

- (BOOL) howAreYou;
- (void) takePill;
- (void) makeShot;
- (void) imposeAGypsum;
- (void) makeABandage;

@end

@protocol RSPatientDelegate <NSObject>

@required

@property (strong, nonatomic) NSString *name;

- (void) patientFeelsBad:(RSPatient*) patient;

@end
