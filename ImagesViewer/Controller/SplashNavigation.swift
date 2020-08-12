//
//  SplashNavigation.swift
//  ImagesViewer
//
//  Created by Jayalakshmi NP on 11/08/20.
//  Copyright © 2020 natarajan k. All rights reserved.
//

import UIKit

class SplashNavigation: UINavigationController {
    
    let splashImage = UIImageView(image: UIImage(named: "splashImage")!)
    let splashView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        splashView.backgroundColor = UIColor.white
        view.addSubview(splashView)
        splashView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        splashImage.contentMode = .scaleAspectFit
        splashView.addSubview(splashImage)
        splashImage.frame = CGRect(x: splashView.frame.midX - 50, y: splashView.frame.midY - 50, width: 100, height: 100)
        }

    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            self.scaleDownAnimation()
        }
    }
    
    // Animation part
    func scaleDownAnimation(){
        UIView.animate(withDuration: 0.5,animations: {
            self.splashImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }) { (success) in
            self.scaleUpAnimation()
        }
    }
    func scaleUpAnimation(){
        UIView.animate(withDuration: 0.35, delay: 0.1, options: .curveEaseIn, animations: {
            self.splashImage.transform = CGAffineTransform(scaleX: 5, y: 5)
        }) { (success) in
            self.removeSplashScreen()
        }
        
    }
    func removeSplashScreen(){
        splashView.removeFromSuperview()
    }

   
 

}
