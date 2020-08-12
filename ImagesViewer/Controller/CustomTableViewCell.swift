//
//  CustomTableViewCell.swift
//  ImagesViewer
//
//  Created by Jayalakshmi NP on 11/08/20.
//  Copyright © 2020 natarajan k. All rights reserved.
//

import UIKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var secnariesImageView: UIImageView!
    
    @IBOutlet weak var idLabel: UILabel!
    
   
    @IBOutlet weak var descriptionLabel: UILabel!
    static var reuseIdentifier: String{
        return "customCell"
    }
    static var nib:UINib{
        return UINib.init(nibName: "CustomTableViewCell", bundle: Bundle.init(for: CustomTableViewCell.self))
    }
    func populate(with imagesDetail:ImagesDetail){
        idLabel.text = imagesDetail.id
        descriptionLabel.text = imagesDetail.author
        
        if let downloadImage = imagesDetail.download_url{
            let url = URL(string: downloadImage)
            secnariesImageView.kf.setImage(with: url)
        }
    }
    
    
}
