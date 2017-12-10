
import Foundation

public class Container {
    
    var produccerStorage: ProduccerStorage
    var instanceStorage: InstanceStorage
    
    public init() {
        produccerStorage = MemoryProduccerStorage.shared
        instanceStorage = MemoryInstanceStorage.shared
    }
    
    public func add(module type: Module.Type) {
        let module = type.init()
        module.configure(container: self)
    }
    
    public func register<T, J:Injectable>(type: T.Type, with injectable: J.Type, name: String = "", scope: Scope = Scope.prototype) {
        let produccer = Produccer({ injector in
            try injectable.init(with: injector)
        }, scope: scope)
        
        produccerStorage.save(key: ProduccerKey(type: type, name: name), value: produccer)
    }
    
    fileprivate func getInstance<T>(key: ProduccerKey) throws -> T {
        let produccer = try produccerStorage.findProduccerBy(key: key)
        let injectable = try instanceStorage.retrieveInstanceOf(key: key, produccer: produccer, injector: self)
        
        guard let instance = injectable as? T else {
            throw NurseError(message: "The instance is not the type \(key.type)", code: 2)
        }
        
        return instance
    }
 
}

extension Container: Injector {
    
    public func getInstance<T>(of type: T.Type) throws -> T {
        let key = ProduccerKey(type: type)
        return try getInstance(key: key)
    }
    
    public func getInstance<T>(of type: T.Type, name: String) throws -> T {
        let key = ProduccerKey(type: type, name: name)
        return try getInstance(key: key)
    }
    
}
