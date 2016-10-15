//
//  UIWindow+TouchID.swift
//  ZHSplashWindow
//
//  Created by Hao Zheng on 10/14/16.
//  Copyright © 2016 Planhola. All rights reserved.
//

import UIKit
import LocalAuthentication

extension UIWindow {
    
    func useTouchID(description: String, completion: (_ success:Bool, _ msg: String, _ errorResult: NSInteger) -> ()) {
        var error : NSError?
        let context = LAContext()
        
        //Can we use local auth?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                       localizedReason: description,
                                       reply: { (success: Bool, error: Error?) -> Void in
                                        
                                        
//                                        if success {
//                                            completion(true, "User authentication OK", 0)
//                                        } else {
//                                            switch error {
//                                            case LAError.Code.systemCancel.rawValue:
//                                                message = "The system has cancelled the login process";
//                                            case LAError.Code.userCancel.rawValue:
//                                                message = "The user has cancelled the login process";
//                                            case LAError.Code.userFallback.rawValue:
//                                                message = "The user has chosen alternative method for login";
//                                                
//                                            default:
//                                                message = "Login with TouchID has failed and show alternative method";
//                                            }
//                                            completion(false, message, error!.code)
//                                        }
//                                        
                                        
//                                        if success {
//                                            self.statusText = "Touch ID success!"
//                                            self.alert.title = "Success"
//                                            self.alert.message = "I knew it was you!"
//                                        } else {
//                                            self.statusText = "Touch ID failed!"
//                                            self.alert.title = "Failure"
//                                            
//                                            switch error!.code {
//                                            case LAError.AuthenticationFailed.toRaw():
//                                                self.alert.message = "Authentication Failed"
//                                            case LAError.UserCancel.toRaw():
//                                                self.alert.message = "User canceled!"
//                                            case LAError.SystemCancel.toRaw():
//                                                self.alert.message = "The system canceled!"
//                                            case LAError.UserFallback.toRaw():
//                                                self.alert.message = "User request to enter passcode"
//                                            default:
//                                                self.alert.message = "Something else went wrong"
//                                            }
//                                        }
//                                        self.presentViewController(self.alert, animated: true, completion:{self.statusLabel.text = self.statusText})
            } )
        } else {
//            self.statusText = "No local authentication"
//            alert.title = "Uh oh!"
//            
//            switch authError!.code {
//            case LAError.TouchIDNotAvailable.toRaw():
//                alert.message = "No Touch ID on device"
//            case LAError.TouchIDNotEnrolled.toRaw():
//                alert.message = "No fingers enrolled"
//            case LAError.PasscodeNotSet.toRaw():
//                alert.message = "No passcode set"
//            default:
//                alert.message = "Something went wrong getting local auth"
//            }
//            self.presentViewController(self.alert, animated: true, completion: {self.statusLabel.text = self.statusText})
        }
        resetTouchID()
    }
    
    func resetTouchID() {
//        authContext = LAContext()
//        alert = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.Alert)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
//        let passcodeDetector = SwiftPasscodeDetector()
//        if passcodeDetector.checkForPasscode() {
//            headerString.text = "Passcode Set on Device"
//        } else {
//            headerString.text = "No Passcode Set"
//        }
        
    }
    
//    func useTouchID(description: String, completion:@escaping (_ success:Bool, _ messageState: String, _ errorResult: NSInteger) -> ()) {
//        let context = LAContext()
//        var error: NSError?
//        var message : String!
//        
//        
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: description) { (success: Bool, error: NSError!) in
//                
//                if success {
//                    completion(true, "User authentication OK", 0)
//                } else {
//                    switch error.code {
//                    case LAError.Code.systemCancel.rawValue:
//                        message = "The system has cancelled the login process";
//                    case LAError.Code.userCancel.rawValue:
//                        message = "The user has cancelled the login process";
//                    case LAError.Code.userFallback.rawValue:
//                        message = "The user has chosen alternative method for login";
//                        
//                    default:
//                        message = "Login with TouchID has failed and show alternative method";
//                    }
//                    completion(false, message, error!.code)
//                }
//            }
//        } else {
//            switch error!.code {
//            case LAError.Code.touchIDNotEnrolled.rawValue:
//                message = "User has not configurated the TouchID";
//                break;
//            case LAError.Code.passcodeNotSet.rawValue:
//                message = "User has not configurated the password";
//                break;
//            default:
//                message = "Touch ID not available";
//                break;
//            }
//            
//            completion(false, message, error!.code)
//        }
//    }
}
