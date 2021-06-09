//
//  Constants.swift


import Foundation
import UIKit

class Constants: NSObject
{
    //MARK: - Variable declaration
    static let shared = Constants()
    let appDel : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //MARK: - Toast Messages
    let kComingSoonText = "Coming Soon..."
    
    //MARK: - Storyboard names
    let kMainStoryBoard = "Main"
    
    //MARK: - View Controller name
    let kDetailVC = "CuntryDetailsViewController"
    let kHomeVC = "HomeViewController"
    
    //MARK: - Messages
    let kUserIDRequired = "User ID is required."
    let kPasswordRequired = "Passward is required."
    let kAppName = "Assignment App"
    
    func isValidUrl(url: String) -> Bool {
        let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
        let result = urlTest.evaluate(with: url)
        return result
    }
    
    /// validate email
    func validateEmail(enteredEmail:String) -> Bool
    {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
    
    //MARK:- Messages
    enum MESSAGES {
        static let NetworkIssueTitle = "Network Issue"
        static let NoInternetConnectionMessage = "No internet connection. Please connect with internet and try again"
        static let SometingWentWrongMessage = "The service is temporarily unavailable. Please try again later"//"Something went wrong, please try again."
        static let ACCEPT_TERMS_CONDITION = "Please Accept Terms & Conditions."
        static let BLANK = ""
        static let CONGRATULATIONS = "Congratulations!"
        static let UNDERDEVELOPMENT = "Sorry! Under Development."
        static let LOGIN_SUCCESS = "Congratulations! Login Successfully."
        static let TokenExpiredMessage = "Authorization has been denied for this request."
        static let Welcome = "Welcome UserID: "
    }
    
    enum ErrorCode {
        static let Success = 200
        static let Failure = 199
        static let TokenExpired = 401
        static let Retry = 404
        static let BadRequest = 400
    }
     
    enum CustomColor {
        //MARK: - Color
        static let navBackground = UIColor(red:255/255.0, green:176.0/255.0, blue:86.0/255.0, alpha: 1.0)
        static let lighterGrayColor = UIColor(red:225.0/255.0, green:225.0/255.0, blue:225.0/255.0, alpha: 1.0)
        static let buttonBack = UIColor(red:58/255.0, green:54/255.0, blue:51/255.0, alpha: 1.0)
        static let otpViewBorder = UIColor(red:166.0/255.0, green:170.0/255.0, blue:180.0/255.0, alpha: 1.0)
        static let loginBackViewBorder = UIColor(red:142.0/255.0, green:22.0/255.0, blue:36.0/255.0, alpha: 0.5)
        static let orange = UIColor(red:254.0/255.0, green:155.0/255.0, blue:42.0/255.0, alpha: 1.0)
        static let blue = UIColor(red:0.0/255.0, green:100.0/255.0, blue:255.0/255.0, alpha: 1.0)
        static let green = UIColor(red: 0.901, green: 1, blue: 0.867, alpha: 1)
        static let greenSelected = UIColor(red: 0.273, green: 0.742, blue: 0.108, alpha: 1)
        static let red = UIColor(red: 0.979, green: 0.692, blue: 0.673, alpha: 1)
        static let redSelected = UIColor(red: 0.913, green: 0.183, blue: 0.137, alpha: 1)
        static let amber = UIColor(red: 1, green: 0.831, blue: 0.637, alpha: 1)
        static let amberSelected = UIColor(red: 0.996, green: 0.609, blue: 0.166, alpha: 1)
        static let progressbarPath = UIColor(red: 237.0/255.0, green: 237.0/255.0, blue: 237.0/255.0, alpha: 1)
    }
    
    enum CustomFontColor {
        static let LightBlack = UIColor(red: 0.325, green: 0.325, blue: 0.325, alpha: 1)
    }
    
    enum Device {
        static let Height = UIScreen.main.bounds.height
        static let Width = UIScreen.main.bounds.width
    }
}
