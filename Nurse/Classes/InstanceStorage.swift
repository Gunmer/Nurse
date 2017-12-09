
import Foundation

protocol InstanceStorage {
    func retrieveInstanceOf(key: ProduccerKey, produccer: Produccer, injector: Injector) throws -> Injectable
}
