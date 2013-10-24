//
//  OWSpaceObject.m
//  Out of this World
//
//  Created by Jimzy Lui on 10/21/2013.
//  Copyright (c) 2013 Jimzy Lui. All rights reserved.
//

#import "OWSpaceObject.h"
#import "AstronomicalData.h"

@implementation OWSpaceObject

-(id)init
{
    self = [self initWithData: nil andImage:nil];
    return self;
}

-(id) initWithData:(NSDictionary *)data andImage:(UIImage *)image{
    self = [super init];  //the required line of code for our designated initializer, whatever that means
    
    //set the values for custom properties that you created in the .h
    self.name = data[PLANET_NAME];
    self.gravitationalForce = [data[PLANET_GRAVITY] floatValue];
    self.diameter = [data[PLANET_DIAMETER]floatValue];
    self.yearLength = [data[PLANET_YEAR_LENGTH]floatValue];
    self.dayLength = [data[PLANET_DAY_LENGTH]floatValue];
    self.temperature = [data[PLANET_TEMPERATURE]floatValue];
    self.numberOfMoons = [data[PLANET_NUMBER_OF_MOONS]intValue];
    self.nickname = data[PLANET_NICKNAME];
    self.interestingFact = data[PLANET_INTERESTING_FACT];
    
    self.spaceImage = image;
    return self;
}
@end
