
import Foundation
import Nurse

protocol Motor {
    
}

class GasolineMotor: Motor, Injectable {
    
    required init(with injector: Injector) {}
    
}

class DieselMotor: Motor, Injectable {
    
    required init(with injector: Injector) {}
    
}
