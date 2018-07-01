
import UIKit
import Nurse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        do {
//            Nurse.add(module: AppModule.self)
//
//            let renault = try Nurse.injector.getInstance(of: Car.self)
//            let ford = try Nurse.injector.getInstance(of: Car.self, name: "Ford")
//
//            assert(renault is Renault)
//            assert(ford is Ford)
//            assert(!renault.wheels.isEmpty)
//        } catch {
//            print(error)
//            assertionFailure(error.localizedDescription)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

