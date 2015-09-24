//
//  main.m
//  classes
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contador.h"
#import "Cuboide.h"
#import "Temperatura.h"
#import "Veiculo.h"
#import "Bicicleta.h"
#import "Carro.h"

void testarContator() {
    Contador *c = [Contador new];
    printf("Contador inicializado com valor %d\n", c.valor);
    
    [c incrementar];
    printf("Contador está com valor: %d\n", c.valor);
    
    [c incrementarEm:3];
    printf("Contador está com valor: %d\n", c.valor);
    
    [c reset];
    printf("Contador está com valor: %d\n", c.valor);
}

// Parte 1
void testarCuboide() {
    // Classe Cuboide
    // Inicializador com largura, altura e profundidade
    // inicializador com new
    // propriedades largura, altura e profundidade
    // propriedade volume (dica: somente leitura, sobrescrita para calculo)
    
    Cuboide *c = [[Cuboide alloc] initComLargura:5 eAltura:4.5 eProfundidade:3.2];
    printf("\nCuboide (%.1f x %.1f x %.1f) = %.1f de volume\n",
           c.largura, c.altura, c.profundidade, [c calcularVolume]);
}

// Parte 2
void testarTemperatura() {
    // Classe Temperatura
    // Inicializadores
    //  initWithCelcius
    //  initWithFahrenheit
    //  initWithKelvin
    // (dica: ao inicializar, converter para um padrao)
    // metodos de conversão
    //  celciusValue
    //  fahrenheitValue
    //  kelvinValue
    
    Temperatura *t = [[Temperatura alloc] initWithCelcius: 27];
    printf("\nTemperaturas: %.1fC %.1fF %.1fK\n", t.celcius, t.fahrenheit, t.kelvin);
    
    Temperatura *t2 = [[Temperatura alloc] initWithFahrenheit:80.6];
    printf("Temperaturas: %.1fC %.1fF %.1fK\n", t2.celcius, t2.fahrenheit, t2.kelvin);
    
    Temperatura *t3 = [[Temperatura alloc] initWithKelvin:300];
    printf("Temperaturas: %.1fC %.1fF %.1fK\n", t3.celcius, t3.fahrenheit, t3.kelvin);
}

// Parte 3
void testarVeiculo() {
    
    Veiculo *v1 = [[Veiculo alloc] init];
    v1.velocidade = 50.5;
    printf("\nVeículo: %s", [[v1 descricao] cStringUsingEncoding:NSUTF8StringEncoding]);
    [v1 buzinar];
    
    Bicicleta *v2 = [[Bicicleta alloc] init];
    v2.velocidade = 16.7;
    printf("\nVeículo: %s", [[v2 descricao] cStringUsingEncoding:NSUTF8StringEncoding]);
    [v2 buzinar];
    
    Carro *v3 = [[Carro alloc] init];
    v3.velocidade = 128.9;
    v3.marcha = 5;
    printf("\nVeículo: %s", [[v3 descricao] cStringUsingEncoding:NSUTF8StringEncoding]);
    [v3 buzinar];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        testarContator();
        testarCuboide();
        testarTemperatura();
        testarVeiculo();
    }
    return 0;
}