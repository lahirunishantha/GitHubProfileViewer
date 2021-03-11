//
//  AlertUtils.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/11/21.
//

import UIKit

class AlertUtils {
    
    func showErrorAlert(vc:UIViewController, message:String){
        // create the alert
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        vc.present(alert, animated: true, completion: nil)
    }
}

