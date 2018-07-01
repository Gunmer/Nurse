
import Foundation

class FactoryKey {
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

extension FactoryKey: Hashable {
    
    var hashValue: Int {
        return key.hashValue
    }
    
    static func ==(lhs: FactoryKey, rhs: FactoryKey) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
}

extension FactoryKey: CustomStringConvertible {
    
    var description: String {
        return "Type: \(type) and name: \(name)"
    }
    
}
