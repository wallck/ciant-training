//
//  People.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "BaseNSManagedObject.h"

@class Planet, Vehicle, Specie, Film, Starship;

NS_ASSUME_NONNULL_BEGIN

@interface People : BaseNSManagedObject

-(void)fillHomeWorld;
-(void)fillFilms;
-(void)fillVehicles;
-(void)fillStarship;
-(void)fillSpecies;

@end

NS_ASSUME_NONNULL_END

#import "People+CoreDataProperties.h"
