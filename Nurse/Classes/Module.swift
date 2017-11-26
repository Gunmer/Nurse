
import Foundation

public protocol Module {
    init()
    func configure(container: Container)
}
