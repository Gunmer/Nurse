
import Foundation

public protocol Injector {
    func getInstance<T>(of type: T.Type) throws -> T
}
