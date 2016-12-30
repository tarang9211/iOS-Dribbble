//
//  ViewController.swift
//  Dribble
//
//  Created by Tarang Hirani on 12/26/16.
//  Copyright © 2016 Tarang Hirani. All rights reserved.
//

import UIKit

class ShotsViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getShots()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getShots() {
        DribbleApiService.fetchShots { (models, error) in
            
        }
    }


}

