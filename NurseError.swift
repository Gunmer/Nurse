
import Foundation

class NurseError: NSError {
    
    init(message: String, code: Int = 0) {
        super.init(domain: "Nurse", code: code, userInfo: [NSLocalizedFailureReasonErrorKey:message])
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    convenience init(error: NSError) {
        self.init(message: error.localizedDescription, code: error.code)
    }
    
}

