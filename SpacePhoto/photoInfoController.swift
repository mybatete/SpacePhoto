//
//  photoInfoController.swift
//  SpacePhoto
//
//  Created by Marc Batete on 12/1/19.
//  Copyright © 2019 Marc Batete. All rights reserved.
//

import Foundation
struct PhotoInfoController {
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void)
    {
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!

        let query: [String: String] = ["api_key": "DEMO_KEY",]

        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data,
        response, error) in
        let jsonDecoder = JSONDecoder()
            if let data = data,
                let photoInfo = try?
                   jsonDecoder.decode(PhotoInfo.self, from: data) {
                completion(photoInfo)
            } else {
                print("Either no data was returned, or data was not               serialized.")
                completion(nil)
            }
        }
        task.resume()
    }

}
