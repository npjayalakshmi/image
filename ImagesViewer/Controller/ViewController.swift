//
//  ViewController.swift
//  ImagesViewer
//
//  Created by Jayalakshmi NP on 11/08/20.
//  Copyright © 2020 natarajan k. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
var imagesDetail = [ImagesDetail]()
    let alertService = AlertServices()
    let networkingService = NetworkingService.shared
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(CustomTableViewCell.nib, forCellReuseIdentifier: CustomTableViewCell.reuseIdentifier)
        getImages()
  }
    
    func getImages(){
        networkingService.makeRequest(to: .picsumPhotos) { (result) in
            switch result{
            case .success(let data):
                guard  let unwrappedData = data as? Data else  {return}
                do{
                    let images = try JSONDecoder().decode([ImagesDetail].self, from: unwrappedData)
                    print(images)
                   self.imagesDetail = images
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }catch{
                    print(error)
                }

            case .failure(let error):
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return imagesDetail.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reuseIdentifier) as? CustomTableViewCell else {return UITableViewCell()}
//        cell.textLabel?.text = "cell \(indexPath.row)"
        let imagedetails = imagesDetail[indexPath.row]
        cell.populate(with: imagedetails)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row \(indexPath)")
        let imagedetail = imagesDetail[indexPath.row]
        let alertVC = alertService.alert(body: "id for the image is \(imagedetail.id) and author name \(imagedetail.author)")
        present(alertVC,animated: true)
    }
}

