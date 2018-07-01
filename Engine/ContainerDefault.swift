
import Foundation

class ContainerDelfault : Container {
    
    let produccerStorage: FactoriesStorage
    let instanceStorage: InstanceStorage
    
    init(produccerStorage: FactoriesStorage, instanceStorage: InstanceStorage) {
        self.produccerStorage = produccerStorage
        self.instanceStorage = instanceStorage
    }
    
    func register<T, J:Injectable>(type: T.Type, with injectable: J.Type, name: String, scope: Scope) {
        let produccer = Factory({ injector in
            try injectable.init(with: injector)
        }, scope: scope)
        
        produccerStorage.save(key: FactoryKey(type: type, name: name), value: produccer)
    }
    
    fileprivate func getInstance<T>(key: FactoryKey) throws -> T {
        let produccer = try produccerStorage.findProduccerBy(key: key)
        let injectable = try instanceStorage.retrieveInstanceOf(key: key, produccer: produccer, injector: self)
        
        guard let instance = injectable as? T else {
            throw NurseError(message: "The instance is not the type \(key.type)", code: 2)
        }
        
        return instance
    }
    
    func clear() {
        produccerStorage.clear()
        instanceStorage.clear()
    }
    
    func getInstance<T>(of type: T.Type) throws -> T {
        let key = FactoryKey(type: type)
        return try getInstance(key: key)
    }
    
    func getInstance<T>(of type: T.Type, name: String) throws -> T {
        let key = FactoryKey(type: type, name: name)
        return try getInstance(key: key)
    }
    
}
