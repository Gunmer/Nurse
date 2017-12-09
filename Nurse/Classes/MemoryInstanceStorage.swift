
import Foundation

class MemoryInstanceStorage: InstanceStorage {
    static let shared = MemoryInstanceStorage()
    
    var singletons: [ProduccerKey:Injectable]
    
    init() {
        singletons = [:]
    }
    
    func retrieveInstanceOf(key: ProduccerKey, produccer: Produccer, injector: Injector) throws -> Injectable {
        switch produccer.scope {
        case .prototype:
            return try produccer.buildInstance(injector: injector)
        case .singleton:
            return try retrieveFromSingleton(key: key, produccer: produccer, injector: injector)
        }
    }
    
    private func retrieveFromSingleton(key: ProduccerKey, produccer: Produccer, injector: Injector) throws -> Injectable {
        if let injectable = singletons[key] {
            return injectable
        }
        
        let injectable = try produccer.buildInstance(injector: injector)
        singletons.updateValue(injectable, forKey: key)
        return injectable
    }
}
