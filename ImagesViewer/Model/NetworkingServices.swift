//
//  NetworkingServices.swift
//  ImagesViewer
//
//  Created by Jayalakshmi NP on 11/08/20.
//  Copyright © 2020 natarajan k. All rights reserved.
//

import Foundation
enum Result<T>{
    case success(T)
    case failure(Error)
}

class NetworkingService{
    //Singleton pattern
    private init() {}
    static let shared = NetworkingService()
    
    func makeRequest(to endpoint:Endpoint,completion:@escaping(Result<Any>) -> Void){
        let session = URLSession.shared
        guard let url = URL(string: endpoint.rawValue) else {return}
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let unwrappedError = error{
                print(unwrappedError)
                completion(.failure(unwrappedError))
            }
            if let unwrappedData = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: unwrappedData, options: [])
                    print(json)
                    completion(.success(unwrappedData))
                }catch let jsonError{
                    print(jsonError)
                    completion(.failure(jsonError))
                }
            }
        }
        dataTask.resume()
    }
    
    enum Endpoint:String{
        case picsumPhotos = "https://picsum.photos/v2/list?page=2&limit=20"
    }
    
    
    
}
