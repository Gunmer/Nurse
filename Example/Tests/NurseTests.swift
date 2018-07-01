import UIKit
import XCTest
import Nurse

class NurseTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Nurse.add(module: AppModule.self)
    }
    
    override func tearDown() {
        Nurse.clear()
        super.tearDown()
    }
    
    func test_shouldNoNil_whenAddModule() {
        let instance = try? Nurse.getInstance(of: Car.self)
        
        XCTAssertNotNil(instance)
    }
    
    func test_shouldBeNil_whenClear() {
        Nurse.clear()
        
        let instance = try? Nurse.getInstance(of: Car.self)
        
        XCTAssertNil(instance)
    }
    
}
