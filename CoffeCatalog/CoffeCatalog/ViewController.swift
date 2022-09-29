//
//  ViewController.swift
//  CoffeCatalog
//
//  Created by Emre Özbağdatlı on 28.09.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    let imageTitlesArray : [String] = ["americano","coldbrew","espresso","latte"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view33.
        

        tableView.delegate = self
        tableView.dataSource = self
        
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageTitlesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell()
        cell.imageView?.image = UIImage(named:imageTitlesArray[indexPath.row])
        cell.textLabel?.text = imageTitlesArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: imageTitlesArray[indexPath.row])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            if let detailsViewController = segue.destination as? DetailsViewController{
                if let sender = sender as? String {
                    detailsViewController.imageName = sender
                }

            }
            
        }
    }

    
}

