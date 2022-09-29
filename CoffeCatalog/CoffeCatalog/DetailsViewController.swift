//
//  DetailsViewController.swift
//  CoffeCatalog
//
//  Created by Emre Özbağdatlı on 28.09.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

//        imageView.image = (imageName)
        label.text = imageName
        
        imageView.image = UIImage(named: imageName ?? "") 
        
    }
    

  

}
