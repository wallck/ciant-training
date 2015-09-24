//
//  Specie.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "BaseNSManagedObject.h"

@class Film, People, Planet;

NS_ASSUME_NONNULL_BEGIN

@interface Specie : BaseNSManagedObject

-(void)fillHomeWorld;
-(void)fillPeople;
-(void)fillFilms;

@end

NS_ASSUME_NONNULL_END

#import "Specie+CoreDataProperties.h"
