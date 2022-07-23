//
//  ImageService.swift
//  ProductsMeLi
//
//  Created by _ on 21/07/22.
//

import UIKit

final class ImageService {
    
    private var images = NSCache<NSString, NSData>()

    // MARK: - Public API
    
    func image(for url: URL, completion: @escaping (UIImage?) -> Void) {
        if let imageData = images.object(forKey: url.absoluteString as NSString) {
            print("Using cached images")
            
            guard let image = UIImage(data: imageData as Data) else { return }
            completion(image)
            
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            
            var image: UIImage?

            defer {
                
                DispatchQueue.main.async {
                    completion(image)
                }
            }

            if let data = data {
                self.images.setObject(data as NSData, forKey: url.absoluteString as NSString)
                image = UIImage(data: data)
            }
        }
        dataTask.resume()
    }

}
