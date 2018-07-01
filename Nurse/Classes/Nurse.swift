
import Foundation

public class Nurse {
    private static let instance = Nurse()
    
    public static var injector: Injector {
        return instance.container
    }
    
    private let container: Container
    
    private init() {
        container = ContainerDelfault(produccerStorage: MemoryFatoriesStorage.shared, instanceStorage: MemoryInstanceStorage.shared)
    }
    
    public static func add<T : Module>(module moduleType: T.Type) {
        let module = moduleType.init()
        module.configure(container: instance.container)
    }
    
    public static func getInstance<T>(of: T.Type) throws -> T {
        return try instance.container.getInstance(of: T.self)
    }
    
    public static func getInstance<T>(of: T.Type, withName: String) throws -> T {
        return try instance.container.getInstance(of: T.self, name: withName)
    }
    
    public static func clear() {
        instance.container.clear()
    }
    
}
