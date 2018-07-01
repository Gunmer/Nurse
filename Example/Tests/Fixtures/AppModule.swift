
import Nurse

class AppModule: Module {
    
    required init() {}
    
    func configure(container: Container) {
        container.register(type: Motor.self, with: GasolineMotor.self)
        container.register(type: Motor.self, with: DieselMotor.self, name: "DieselMotor")
        container.register(type: Car.self, with: Renault.self)
        container.register(type: Wheel.self, with: Goodyear.self, name: "Goodyear", scope: .singleton)
        container.register(type: Wheel.self, with: Firestorm.self)
    }
    
}
