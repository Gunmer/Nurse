
import Foundation

class ProduccerKey {
    let type: String
    let name: String
    
    var key: String {
        return "\(type)\(name)"
    }
    
    init<T>(type: T.Type, name: String = "") {
        self.type = "\(type)"
        self.name = name
    }
    
}

extension ProduccerKey: Hashable {
    
    var hashValue: Int {
        return key.hashValue
    }
    
    static func ==(lhs: ProduccerKey, rhs: ProduccerKey) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
}

extension ProduccerKey: CustomStringConvertible {
    
    var description: String {
        return "Type: \(type) and name: \(name)"
    }
    
}
