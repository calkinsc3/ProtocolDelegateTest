//
//  ImagePlayController.swift
//  ProtocolDelegateTester
//
//  Created by William Calkins on 12/31/16.
//  Copyright © 2016 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class ImagePlayController: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RoundImage(_ sender: Any) {
        if let imageSize = self.profileImage.image {
            print("current image size; width = \(imageSize.size.width); hieght = \(imageSize.size.height)")
        }
        
    }
    
    
    @IBAction func SquareImage(_ sender: Any) {
        
        let targetSize = CGSize(width: 200, height: 200)
        
        if let imageSize = self.profileImage.image {
            print("current image size; width = \(imageSize.size.width); hieght = \(imageSize.size.height)")
            let newImageRect = CGRect(x: 0.0, y: 0.0, width: targetSize.width, height: targetSize.height)
            
            //Start Image resize
            UIGraphicsBeginImageContextWithOptions(targetSize, false, 1.0)
            imageSize.draw(in: newImageRect)
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.profileImage.image = newImage
        }
        
    }
    
    
    @IBOutlet weak var CancelMe: UIButton!
    
    // MARK: - Navigation
    @IBAction func CancelMe(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
