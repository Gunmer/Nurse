
import Foundation
import Nurse

protocol Car {
    var wheels: [Wheel] { get }
    var motor: Motor { get }
}

class Renault: Car, Injectable {
    
    let wheels: [Wheel]
    let motor: Motor
    
    required init(injector: Injector) throws {
        wheels = [
            try injector.getInstance(of: Wheel.self),
            try injector.getInstance(of: Wheel.self),
            try injector.getInstance(of: Wheel.self),
            try injector.getInstance(of: Wheel.self)
        ]
        
        motor = try injector.getInstance(of: Motor.self)
    }
    
}
