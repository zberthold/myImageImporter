//
//  ViewController.swift
//  myImageImporter
//
//  Created by Zoe Berthold on 8/5/18.
//  Copyright © 2018 Zoe Berthold. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    var imageArray = [UIImage]()
    var bottomImageArray = [UIImage]()
    var whichImage = 0
    var whichBottomImage = 0
    var imageControllerArray = [UIImageView]()
    var bottomImageControllerArray = [UIImageView]()
    var whichImageController = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        imageControllerArray.append(myImageView)
        imageControllerArray.append(secondImageView)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func importImage(_ sender: Any) {
        whichImageController = 0
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true){
            //after its complete
        }
        
    }
    
    @IBAction func importBottomImage(_ sender: Any) {
        whichImageController = 1
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true){
            //after its complete
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(imageControllerArray[whichImageController])
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageControllerArray[whichImageController].frame.size.height = CGFloat(image.topCapHeight)
            if(whichImageController == 0){
                imageArray.insert(image, at: 0)
                imageControllerArray[whichImageController].image = image
            }
            else{
                bottomImageArray.insert(image, at: 0)
                imageControllerArray[whichImageController].image = image
            }
        }
        else{
            //error message
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if(imageArray.count > 1){
            if(whichImage < imageArray.count - 1){
                whichImage += 1
                myImageView.image = imageArray[whichImage]
            }
            else{
                whichImage = 0
                myImageView.image = imageArray[whichImage]
            }
        }
    }
    @IBAction func previousButton(_ sender: Any) {
        if(imageArray.count > 1){
            if(whichImage > 0){
                whichImage -= 1
                myImageView.image = imageArray[whichImage]
            }
            else{
                whichImage = imageArray.count - 1
                myImageView.image = imageArray[whichImage]
            }
        }
        
    }
    
    @IBAction func bottomPrevious(_ sender: Any) {
        if(bottomImageArray.count > 1){
            if(whichBottomImage > 0){
                whichImage -= 1
                secondImageView.image = bottomImageArray[whichBottomImage]
            }
            else{
                whichImage = imageArray.count - 1
                secondImageView.image = bottomImageArray[whichBottomImage]
            }
        }
    }
    @IBAction func bottomNext(_ sender: Any) {
        print(bottomImageArray.count)
        print(whichBottomImage)
        if(bottomImageArray.count > 1){
            if(whichBottomImage < (bottomImageArray.count - 1)){
                print("made it")
                whichBottomImage += 1
                secondImageView.image = bottomImageArray[whichBottomImage]
            }
            else{
                print("over here")
                whichBottomImage = 0
                secondImageView.image = bottomImageArray[whichBottomImage]
            }
        }
    }
}

