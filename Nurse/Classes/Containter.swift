
import Foundation

public protocol Container: Injector {
    func register<T, J:Injectable>(type: T.Type, with injectable: J.Type, name: String, scope: Scope)
    func clear()
}

extension Container {
    
    public func register<T, J:Injectable>(type: T.Type, with injectable: J.Type) {
        register(type: type, with: injectable, name: "", scope: Scope.prototype)
    }
    
    public func register<T, J:Injectable>(type: T.Type, with injectable: J.Type, name: String) {
        register(type: type, with: injectable, name: name, scope: Scope.prototype)
    }
    
    public func register<T, J:Injectable>(type: T.Type, with injectable: J.Type, scope: Scope) {
        register(type: type, with: injectable, name: "", scope: scope)
    }
    
}
