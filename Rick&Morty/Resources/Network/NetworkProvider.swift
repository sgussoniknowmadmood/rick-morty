//
//  NetworkProvider.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 2/10/23.
//

import Foundation
import UIKit

class NetworkProvider {
    
    static func getCharacters(customUrl: String,  completion: @escaping (Data) -> ()) {
        
        let stringUrl = baseUrl + characterUrl + customUrl
        let url = URL(string: stringUrl)!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            completion(data)
        }

        task.resume()
    }
    
    static func getImage(imageUrl: String,  completion: @escaping (UIImage) -> ()) {
        let url = URL(string: imageUrl)!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            
            
            completion(UIImage(data:data ,scale:1.0) ?? UIImage() )
        }

        task.resume()
    }

}
