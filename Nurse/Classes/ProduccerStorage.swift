
import Foundation

protocol ProduccerStorage {
    func findProduccerBy(key: ProduccerKey) throws -> Produccer
    func save(key: ProduccerKey, value: Produccer)
}
