//
//  ViewController.swift
//  memoIleKahveSaati
//
//  Created by Emre Özbağdatlı on 28.09.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
   
    @IBOutlet weak var tableView: UITableView!
    
    
    let resimArr : [String] = ["amer","cappucino","caramel","latte"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "coffeeCell", for: indexPath)
        
        cell.textLabel?.text = "seekish"
        cell.imageView?.image = UIImage(named: "amer")
        return cell
        
    }
    

}

