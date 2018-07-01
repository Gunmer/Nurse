
import Foundation

class Factory {
    typealias BuildFuntion = (Injector) throws -> Injectable
    
    let buildFunction: BuildFuntion
    let scope: Scope
    
    init(_ buildFunction: @escaping BuildFuntion, scope: Scope) {
        self.buildFunction = buildFunction
        self.scope = scope
    }
    
    func buildInstance(injector: Injector) throws -> Injectable {
        return try buildFunction(injector)
    }
}
