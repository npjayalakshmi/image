//
//  AlertViewController.swift
//  ImagesViewer
//
//  Created by Jayalakshmi NP on 12/08/20.
//  Copyright © 2020 natarajan k. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    var alertBody = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    func setupView(){
        bodyLabel.text = alertBody
    }

    @IBAction func didTapToCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    

}
