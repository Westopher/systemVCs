//
//  ViewController.swift
//  usingSystemViewControllers
//
//  Created by West Kraemer on 5/20/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    //button names for styling
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var safariButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    
    
    //button actions
    @IBAction func shareButtonTapped(_ sender: Any) {
        guard let imageWithText = imageView.image else {return}
        let activityController = UIActivityViewController(activityItems: [imageWithText], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender as? UIView
        
        present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func safariButtonTapped(_ sender: Any) {
        guard let urlFromUser = textField.text else {return}
        
        if let url = URL(string: "http://\(urlFromUser)") {
            let safariViewController = SFSafariViewController(url: url)
            
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in  print("user selected camera action")})
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { action in print("user selected Photo Library") })
        
        
        alertController.addAction(cancelAction)
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.popoverPresentationController?.sourceView = sender as? UIView
        
        present(alertController, animated: true, completion: nil)
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

