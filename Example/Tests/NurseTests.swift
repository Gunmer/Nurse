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
    
    func test_shouldBeGasolineMotor_whenRequestInstanceOfMotor() throws {
        let instance = try Nurse.getInstance(of: Motor.self)
        
        XCTAssertTrue(instance is GasolineMotor)
    }
    
    func test_shouldBeDieselMotor_whenRequestInstanceOfMotorWithName() throws {
        let instance = try Nurse.getInstance(of: Motor.self, withName: "DieselMotor")
        
        XCTAssertTrue(instance is DieselMotor)
    }
    
    func test_shouldHaveFirestormWheels_whenRequestInstanceCard() throws {
        let instance = try Nurse.getInstance(of: Car.self)
        
        XCTAssertFalse(instance.wheels.isEmpty)
        for wheel in instance.wheels {
            XCTAssertTrue(wheel is Firestorm)
        }
    }
    
    func test_shouldBeDistinctInstances_whenRequestIntanceWithDefaultScope() throws {
        let instance1 = try Nurse.getInstance(of: Wheel.self)
        let instance2 = try Nurse.getInstance(of: Wheel.self)
        
        XCTAssertNotEqual(ObjectIdentifier(instance1), ObjectIdentifier(instance2))
    }
    
    func test_shouldBeEqualsInstances_whenRequestIntanceOfSingleton() throws {
        let instance1 = try Nurse.getInstance(of: Wheel.self, withName: "Goodyear")
        let instance2 = try Nurse.getInstance(of: Wheel.self, withName: "Goodyear")
        
        XCTAssertEqual(ObjectIdentifier(instance1), ObjectIdentifier(instance2))
    }
    
    func test_shouldBeOverrideRegister_whenAddNewModule() throws {
        Nurse.add(module: TestModule.self)
        
        let instance = try Nurse.getInstance(of: Car.self)
        
        XCTAssertTrue(instance is Renault)
        XCTAssertTrue(instance.motor is ElectricMotor)
    }
    
    func test_shouldBeNil_whenClear() {
        Nurse.clear()
        
        let instance = try? Nurse.getInstance(of: Car.self)
        
        XCTAssertNil(instance)
    }
    
}
