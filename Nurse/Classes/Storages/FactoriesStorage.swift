
import Foundation

protocol FactoriesStorage {
    func findProduccerBy(key: FactoryKey) throws -> Factory
    func save(key: FactoryKey, value: Factory)
    func clear()
}
