//
//  Planet.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "BaseNSManagedObject.h"

@class People, Film, Specie;

NS_ASSUME_NONNULL_BEGIN

@interface Planet : BaseNSManagedObject

-(void)fillResidents;
-(void)fillFilms;

@end

NS_ASSUME_NONNULL_END

#import "Planet+CoreDataProperties.h"
