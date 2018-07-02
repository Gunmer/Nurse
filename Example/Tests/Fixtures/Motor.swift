
import Foundation
import Nurse

protocol Motor {
    
}

class GasolineMotor: Motor, Injectable {
    
    required init(injector: Injector) {}
    
}

class DieselMotor: Motor, Injectable {
    
    required init(injector: Injector) {}
    
}

class ElectricMotor: Motor, Injectable {
    
    required init(injector: Injector) {}
    
}
