
import Foundation

class MemoryFatoriesStorage: FactoriesStorage {
    static let shared = MemoryFatoriesStorage()
    
    var factories: [FactoryKey:Factory]
    
    init() {
        factories = [:]
    }
    
    func findProduccerBy(key: FactoryKey) throws -> Factory {
        guard let factory = factories[key] else {
            throw NurseError(message: "There is no instance registered with \(key)", code: 1)
        }
        
        return factory
    }
    
    func save(key: FactoryKey, value: Factory) {
        factories.updateValue(value, forKey: key)
    }
    
    func clear() {
        factories.removeAll()
    }
    
}
