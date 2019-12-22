//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Marc Batete on 11/27/19.
//  Copyright © 2019 Marc Batete. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    let photoInfoController = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        descriptionLabel.text = ""
            copyrightLabel.text = ""
        
            photoInfoController.fetchPhotoInfo { (photoInfo) in
                        if let photoInfo = photoInfo {
                            self.updateUI(with: photoInfo)
                        }

            }
        }
    
    func updateUI(with photoInfo: PhotoInfo) {
        let task = URLSession.shared.dataTask(with: photoInfo.url,
        completionHandler: { (data, response, error) in
    
            guard let data = data,
                let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.title = photoInfo.title
                self.imageView.image = image
                self.descriptionLabel.text =
                    photoInfo.description
    
                if let copyright = photoInfo.copyright {
                    self.copyrightLabel.text =
                    "Copyright \(copyright)"
                } else {
                    self.copyrightLabel.isHidden = true
                }
            }
        })
    
        task.resume()
    }
    


}

