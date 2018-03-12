//
//  SentMemesCollectionViewController.swift
//  MemeMe
//
//  Created by James Whitney on 3/1/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import UIKit

// MARK: - SentMemesCollectionViewController

class SentMemesCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme]!
    
    // Hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    // This function saves generated memes to AppDelegate Meme array
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        collectionView?.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        flowLayout(size: view.frame.size)
        
//        let space: CGFloat = 3.0
//
//        if self.view.frame.size.width < self.view.frame.size.height {
//
//            let width = (self.view.frame.size.width -  (2 * space)) / 2.0
//            let height = (self.view.frame.size.height - (2 * space)) / 6.0
//            flowLayout.itemSize = CGSize(width: width, height: height)
//
//        } else {
//
//            let width = (self.view.frame.size.width -  (2 * space)) / 6.0
//            let height = (self.view.frame.size.height - (2 * space)) / 2.0
//            flowLayout.itemSize = CGSize(width: width, height: height)
//        }
//
//        flowLayout.minimumInteritemSpacing = 0.5
//        flowLayout.minimumLineSpacing = 0.5
        

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
    }
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        self.collectionViewLayout.invalidateLayout()
//        adjustFlowLayout(size: size)
//    }
    
    func flowLayout(size: CGSize) {
        
        let space: CGFloat = 3.0
        let dimension: CGFloat = size.width > size.height ? (size.width - (4 * space)) / 5.0 : (size.width - (2 * space)) / 3.0
        
        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = 1.0
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemesCollectionViewCell", for: indexPath) as! SentMemeCollectionViewCell
        let memeObject = memes[indexPath.item]

        cell.sentMemeImage?.image = memeObject.memedImage

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // TODO: Add code to get detail VC, populate VC with data, and present controller
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        
        detailController.meme = memes[(indexPath as NSIndexPath).row]
        
        navigationController!.pushViewController(detailController, animated: true)
    }
}
