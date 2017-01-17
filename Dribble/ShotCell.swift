//
//  ShotCell.swift
//  Dribble
//
//  Created by Tarang Hirani on 1/1/17.
//  Copyright © 2017 Tarang Hirani. All rights reserved.
//

import UIKit

class ShotCell: UICollectionViewCell {
    
    @IBOutlet weak var shotImageView: UIImageView!
    var shot: DribbbleShotsModel? {
        didSet {
            setupCell()
        }
    }
    
    override func awakeFromNib() {
        

        super.awakeFromNib()
        // Initialization code
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.red
        self.layer.cornerRadius = CGFloat(5)
        self.layer.masksToBounds = false
        
    }
    
    func setupCell() {
        
    }

}
