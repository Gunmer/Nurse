
import Foundation

class MemoryProduccerStorage: ProduccerStorage {
    static let shared = MemoryProduccerStorage()
    
    var produccers: [ProduccerKey:Produccer]
    
    init() {
        produccers = [:]
    }
    
    func findProduccerBy(key: ProduccerKey) throws -> Produccer {
        guard let produccer = produccers[key] else {
            throw NurseError(message: "There is no instance registered with \(key)", code: 1)
        }
        
        return produccer
    }
    
    func save(key: ProduccerKey, value: Produccer) {
        produccers.updateValue(value, forKey: key)
    }
    
}
