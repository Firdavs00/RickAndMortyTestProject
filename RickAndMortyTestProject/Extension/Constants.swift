//
//  Constants.swift
//  RickAndMortyTestProject
//
//  Created by Firdavs Boltayev on 19/11/22.
//

import Foundation
import UIKit

struct Constants {

        static let BASE_URL = URL(string: "https://rickandmortyapi.com/api/")!
    
}

extension UIImageView {
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            
            if let data = try? Data(contentsOf: url) {
                
                if let image = UIImage(data: data) {
                    
                    DispatchQueue.main.async {
                        
                        self?.image = image
                    }
                }
            }
        }
    }
}
