
import Foundation

protocol InstanceStorage {
    func retrieveInstanceOf(key: FactoryKey, produccer: Factory, injector: Injector) throws -> Injectable
    func clear()
}
