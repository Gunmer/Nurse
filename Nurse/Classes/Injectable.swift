
import Foundation

public protocol Injectable {
    init(with injector: Injector) throws
}
