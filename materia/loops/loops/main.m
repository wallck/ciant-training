//
//  main.m
//  loops
//
//  Created by Wallace Goncalves de Oliveira on 19/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        for (int i = 0; i < 10; i++) {
            printf("%d ", i);
        }
        
        printf("\n");
        
        NSArray *array = [NSArray array];
        for (NSString *elemento in array) {
            printf("%s", [elemento cStringUsingEncoding:NSUTF8StringEncoding]);
        }
        
        printf("\n");
        
        int valor = 10;
        while (valor < 100) {
            printf("%d ", valor);
            valor *= 2;
        }
        
        printf("\n");
        
        do {
            printf("%d ", valor);
            valor /= 2;
        } while (valor > 0);
        
    }
    return 0;
}
