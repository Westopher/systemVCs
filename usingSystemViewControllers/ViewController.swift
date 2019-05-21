//
//  ViewController.swift
//  usingSystemViewControllers
//
//  Created by West Kraemer on 5/20/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    //button names for styling
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var safariButton: UIButton!  // this button is titled: "Go!"
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
        
        //add image picker and set delegate
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        //add alert controller
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        //add cancel to the alert controller
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        //add the camera with functionality to alert controller
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        //add photolibrary with functionality to alert controller
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { action in imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        
        alertController.popoverPresentationController?.sourceView = sender as? UIView
        present(alertController, animated: true, completion: nil)
    }
    
    //apply picked image to view
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("expected photo library, but got \(info) instead")
        }
        
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func emailButtonTapped(_ sender: Any) {
        if !MFMailComposeViewController.canSendMail() {
            print("this device can not send mail")
            return
        }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setToRecipients(["kraemerwest@gmail.com"])
        mailComposer.setSubject("testing subject")
        mailComposer.setMessageBody("testing body", isHTML: false)
        
        present(mailComposer, animated: true, completion: nil)
        
    }
    
    func mailComposeController(_ controller:
        MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //button styles
    self.shareButton.layer.cornerRadius = 3
    self.safariButton.layer.cornerRadius = 3
    self.cameraButton.layer.cornerRadius = 3
    self.emailButton.layer.cornerRadius = 3
        
    self.shareButton.layer.borderWidth = 0.2
    self.shareButton.layer.borderColor = UIColor.blue.cgColor
        
    self.safariButton.layer.borderWidth = 0.2
    self.safariButton.layer.borderColor = UIColor.blue.cgColor
        
    self.cameraButton.layer.borderWidth = 0.2
    self.cameraButton.layer.borderColor = UIColor.blue.cgColor
        
    self.emailButton.layer.borderWidth = 0.2
    self.emailButton.layer.borderColor = UIColor.blue.cgColor
    }


}

