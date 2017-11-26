
import Nurse

class InjectorProvider {
    static let shared = InjectorProvider()
    
    static var injector: Injector {
        return shared.container
    }
    
    private let container: Container
    
    private init() {
        container = Container()
        container.add(module: AppModule.self)
    }
    
    class AppModule: Module {
        
        required init() {}
        
        func configure(container: Container) {
            container.register(type: Car.self, with: Renault.self)
            container.register(type: Wheel.self, with: Firestorm.self)
        }
    }
    
    
}
