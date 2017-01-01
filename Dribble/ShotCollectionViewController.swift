//
//  ViewController.swift
//  Dribble
//
//  Created by Tarang Hirani on 12/26/16.
//  Copyright © 2016 Tarang Hirani. All rights reserved.
//

import UIKit

let cellIdentifier = "ShotCell"

class ShotsCollectionViewController: UICollectionViewController {
    
    private var items = [DribbbleShotsModel]() {
        didSet {
            self.collectionView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(UINib(nibName: cellIdentifier, bundle: nil) , forCellWithReuseIdentifier: cellIdentifier)
        
        getShots()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ShotCell
        let shot = items[indexPath.row]
        return cell
    }
    
    private func getShots() {
        DribbleApiService.fetchShots { (models, error) in
            
            if error != nil {
                //handle error
            }
            
            guard let shots = models else {
                return
            }
            
            self.items = shots
        }
    }

}

