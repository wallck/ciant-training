//
//  Film.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "BaseNSManagedObject.h"

@class People, Planet, Vehicle, Specie, Starship;

NS_ASSUME_NONNULL_BEGIN

@interface Film : BaseNSManagedObject

-(void)fillCharacters;
-(void)fillPlanets;
-(void)fillVehicles;
-(void)fillStarship;
-(void)fillSpecies;

@end

NS_ASSUME_NONNULL_END

#import "Film+CoreDataProperties.h"
