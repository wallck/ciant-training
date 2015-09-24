// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Pessoa.m instead.

#import "_Pessoa.h"

const struct PessoaAttributes PessoaAttributes = {
	.nome = @"nome",
};

const struct PessoaRelationships PessoaRelationships = {
	.empresa = @"empresa",
};

@implementation PessoaID
@end

@implementation _Pessoa

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Pessoa" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Pessoa";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Pessoa" inManagedObjectContext:moc_];
}

- (PessoaID*)objectID {
	return (PessoaID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic nome;

@dynamic empresa;

@end

