//
//  AlertService.swift
//  ImagesViewer
//
//  Created by Jayalakshmi NP on 12/08/20.
//  Copyright © 2020 natarajan k. All rights reserved.
//

import Foundation
import UIKit

class AlertServices{
    func alert(body:String) -> AlertViewController{
        let storyboard = UIStoryboard(name: "AlertStoryboard", bundle: .main)
        let alertVC = storyboard.instantiateViewController(withIdentifier: "AlertVC") as!AlertViewController
        alertVC.alertBody = body
        return alertVC 
    }
}
