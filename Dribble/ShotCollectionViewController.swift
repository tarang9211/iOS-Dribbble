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
  private var loader: UIActivityIndicatorView? = nil

  private var items = [DribbbleShotsModel]() {
    didSet {
      self.collectionView?.reloadData()
      loader?.stopAnimating()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    layoutCells()
    collectionView?.backgroundColor = UIColor.collectionViewBackgroundColor
    collectionView?.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)

    setUpLoader()
    getShots()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    // swiftlint:disable force_cast
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ShotCell

    cell.shot = items[indexPath.row]

    return cell
  }

  private func setUpLoader() {
    loader = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    loader?.center = self.view.center
    loader?.startAnimating()

    if let loader = loader {
      self.view.addSubview(loader)
    }
  }

  //setting up custom layout for collection view
  private func layoutCells() {
    guard let colleccionViewWidth = collectionView?.bounds.width else { return }
    guard let collectionViewHeight = collectionView?.bounds.height else { return }

    let layout = UICollectionViewFlowLayout()

    layout.itemSize = CGSize(width: colleccionViewWidth - 16, height: collectionViewHeight * 0.40)
    layout.sectionInset = UIEdgeInsets(top: 20, left: 8, bottom: 20, right: 8)
    layout.minimumLineSpacing = 20

    self.collectionView?.setCollectionViewLayout(layout, animated: false)
  }

  //method call to fetch shots from the API
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
