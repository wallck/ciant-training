// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Pessoa.h instead.

@import CoreData;

extern const struct PessoaAttributes {
	__unsafe_unretained NSString *nome;
} PessoaAttributes;

extern const struct PessoaRelationships {
	__unsafe_unretained NSString *empresa;
} PessoaRelationships;

@class Empresa;

@interface PessoaID : NSManagedObjectID {}
@end

@interface _Pessoa : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) PessoaID* objectID;

@property (nonatomic, strong) NSString* nome;

//- (BOOL)validateNome:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Empresa *empresa;

//- (BOOL)validateEmpresa:(id*)value_ error:(NSError**)error_;

@end

@interface _Pessoa (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveNome;
- (void)setPrimitiveNome:(NSString*)value;

- (Empresa*)primitiveEmpresa;
- (void)setPrimitiveEmpresa:(Empresa*)value;

@end
