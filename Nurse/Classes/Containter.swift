
import Foundation

public class Container: Injector {
    typealias Produccer = (Injector) throws -> Injectable
    
    var produccers = [String:Produccer]()
    
    public init() {
        
    }
    
    public func add(module type: Module.Type) {
        let module = type.init()
        module.configure(container: self)
    }
    
    public func register<T, J:Injectable>(type: T.Type, with injectable: J.Type) {
        let produccer = { injector in
            try injectable.init(with: injector)
        }
        
        produccers.updateValue(produccer, forKey: "\(type)")
    }
    
    public func getInstance<T>(of type: T.Type) throws -> T {
        let key = "\(type)"
        
        guard let produccer = produccers[key] else {
            fatalError()
        }
        
        guard let instance = try produccer(self) as? T else {
            fatalError()
        }
        
        return instance
    }
    
}
