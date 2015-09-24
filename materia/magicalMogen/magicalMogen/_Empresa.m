// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Empresa.m instead.

#import "_Empresa.h"

const struct EmpresaAttributes EmpresaAttributes = {
	.nome = @"nome",
};

const struct EmpresaRelationships EmpresaRelationships = {
	.funcionarios = @"funcionarios",
};

@implementation EmpresaID
@end

@implementation _Empresa

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Empresa" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Empresa";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Empresa" inManagedObjectContext:moc_];
}

- (EmpresaID*)objectID {
	return (EmpresaID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic nome;

@dynamic funcionarios;

- (NSMutableSet*)funcionariosSet {
	[self willAccessValueForKey:@"funcionarios"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"funcionarios"];

	[self didAccessValueForKey:@"funcionarios"];
	return result;
}

@end

