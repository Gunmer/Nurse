
import Foundation

public class Container {
    typealias Produccer = (Injector) throws -> Injectable
    
    var produccers = [ProduccerKey:Produccer]()
    
    public init() { }
    
    public func add(module type: Module.Type) {
        let module = type.init()
        module.configure(container: self)
    }
    
    public func register<T, J:Injectable>(type: T.Type, with injectable: J.Type, name: String = "") {
        let produccer = { injector in
            try injectable.init(with: injector)
        }
        
        produccers.updateValue(produccer, forKey: ProduccerKey(type: type, name: name))
    }
    
    fileprivate func getInstance<T>(key: ProduccerKey) throws -> T {
        guard let produccer = produccers[key] else {
            throw NurseError(message: "There is no instance registered with \(key)", code: 1)
        }
        
        guard let instance = try produccer(self) as? T else {
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
