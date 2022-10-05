//
//  ViewController.swift
//  CoffeCatalog
//
//  Created by Emre Özbağdatlı on 28.09.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
   // @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    
    let imageTitlesArray : [String] = ["americano","coldbrew","espresso","latte"]
    
    var arrProductPhotos = [UIImage(named: "americano")!,UIImage(named: "coldbrew")!,UIImage(named: "espresso")!,UIImage(named: "latte")!,UIImage(named: "kahve1")!,UIImage(named: "kahve2")!]
   
    var timer: Timer?
    var currentCellIndex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
      //  pageControll.numberOfPages = arrProductPhotos.count
        
        
        
        startTimer()
        
    }

    func startTimer(){
        Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
        
    }
    @objc func moveToNextIndex(){
        
        if currentCellIndex < arrProductPhotos.count-1{
            
            currentCellIndex += 1
        }else{
                currentCellIndex = 0
        }
        
        
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
     //   pageControll.currentPage = currentCellIndex
        
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrProductPhotos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let ColCell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
        
        ColCell.imageView.image = arrProductPhotos[indexPath.row]
        
        return  ColCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

