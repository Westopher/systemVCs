//
//  ViewController.swift
//  usingSystemViewControllers
//
//  Created by West Kraemer on 5/20/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    //button names for styling
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var safariButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    
    
    //button actions
    @IBAction func shareButtonTapped(_ sender: Any) {
    }
    
    @IBAction func safariButtonTapped(_ sender: Any) {
    }
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
    }
    
    @IBAction func emailButtonTapped(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //button styles
    self.shareButton.layer.cornerRadius = 3
    self.safariButton.layer.cornerRadius = 3
    self.cameraButton.layer.cornerRadius = 3
    self.emailButton.layer.cornerRadius = 3
        
    }


}

