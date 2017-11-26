
import Foundation
import Nurse

protocol Car {
    var wheels: [Wheel] { get }
}

class Renault: Car, Injectable {
    
    let wheels: [Wheel]
    
    required init(with injector: Injector) throws {
        wheels = [
            try injector.getInstance(of: Wheel.self),
            try injector.getInstance(of: Wheel.self),
            try injector.getInstance(of: Wheel.self),
            try injector.getInstance(of: Wheel.self)
        ]
    }
    
}


