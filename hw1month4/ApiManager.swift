//
//  ApiManager.swift
//  hw1month4
//
//  Created by atay on 17/5/23.
//

import UIKit

class APIManager {
    
    static let shared = APIManager()
    
    let urlString = "https://dummyjson.com/products"
    
    func getData(completion: @escaping (Result<Welcome, Error>) -> Void) {
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request)
        { data, response, error in
            guard let data else {return}
            do {
                let newsData = try JSONDecoder().decode(Welcome.self, from: data)
                completion(.success(newsData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
