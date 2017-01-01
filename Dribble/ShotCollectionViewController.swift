//
//  ViewController.swift
//  Dribble
//
//  Created by Tarang Hirani on 12/26/16.
//  Copyright © 2016 Tarang Hirani. All rights reserved.
//

import UIKit

class ShotsCollectionViewController: UICollectionViewController {
    
    private var items = [DribbbleShotsModel]() {
        didSet {
            self.collectionView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getShots()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

