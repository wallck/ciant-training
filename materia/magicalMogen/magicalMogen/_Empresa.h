// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Empresa.h instead.

@import CoreData;

extern const struct EmpresaAttributes {
	__unsafe_unretained NSString *nome;
} EmpresaAttributes;

extern const struct EmpresaRelationships {
	__unsafe_unretained NSString *funcionarios;
} EmpresaRelationships;

@class Pessoa;

@interface EmpresaID : NSManagedObjectID {}
@end

@interface _Empresa : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) EmpresaID* objectID;

@property (nonatomic, strong) NSString* nome;

//- (BOOL)validateNome:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *funcionarios;

- (NSMutableSet*)funcionariosSet;

@end

@interface _Empresa (FuncionariosCoreDataGeneratedAccessors)
- (void)addFuncionarios:(NSSet*)value_;
- (void)removeFuncionarios:(NSSet*)value_;
- (void)addFuncionariosObject:(Pessoa*)value_;
- (void)removeFuncionariosObject:(Pessoa*)value_;

@end

@interface _Empresa (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveNome;
- (void)setPrimitiveNome:(NSString*)value;

- (NSMutableSet*)primitiveFuncionarios;
- (void)setPrimitiveFuncionarios:(NSMutableSet*)value;

@end
