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
        imageView.layer.borderColor = UIColor(cgColor: .init(genericCMYKCyan: 0.1, magenta: 0.2, yellow: 10, black:0.2, alpha: 0.2)).cgColor
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 5


//        imageView.image = (imageName)
        label.text = imageName
        
        imageView.image = UIImage(named: imageName ?? "") 
        
        
        
    }
    
    
    

  

}
