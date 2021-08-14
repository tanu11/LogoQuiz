//
//  ImageModule.swift
//  Logo
//
//  Created by tanvi tuteja on 14/08/21.
//

import UIKit


// can add caching here
public class ImageManager {
    
    public var shared = ImageManager()
    
    private init() {}
    
    func downloaded(from url: URL, completionHandler:@escaping (_ image: UIImage) ->()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
               completionHandler(image)
            
        }.resume()
    }
}
