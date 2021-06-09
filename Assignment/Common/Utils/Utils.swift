//
//  Utils.swift
//  EcotechAssignment_SagarSukoode
//
//  Created by Tushar Khopade on 16/03/1943 .
//

import Foundation
import UIKit

class Utils: NSObject {
    
    class func showAlertView(title : String, message : String){
        let alertController = UIAlertController( title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        //you can add custom actions as well
        alertController.addAction(defaultAction)
        if let topViewController = UIApplication.getTopMostViewController() {
            topViewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    class func getLoginStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: "loginStatus")
    }
    
    class func setLoginStatus(bool:Bool) {
        UserDefaults.standard.set(bool, forKey: "loginStatus")
        UserDefaults.standard.synchronize()
    }
    
}
