
import Nurse

class TestModule: Module {
    
    required init() {}
    
    func configure(container: Container) {
        container.register(type: Motor.self, with: ElectricMotor.self)
    }
    
}
