
import Foundation
import Nurse

protocol Wheel: NSObjectProtocol {
    
}

class Firestorm: NSObject, Wheel, Injectable {
    
    required init(injector: Injector) throws {
        
    }
    
}

class Goodyear: NSObject, Wheel, Injectable {
    
    required init(injector: Injector) throws {
        
    }
    
}
