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

    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    var memes: [Meme]!
    
    // MARK: Outlets
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    // MARK: Life cycle
    
    // This function saves generated memes to AppDelegate Meme array
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memes = appDelegate.memes
        collectionView?.reloadData()
    }
    
    // Call flowLayout function to display customized cells
    override func viewDidLoad() {
        super.viewDidLoad()
        flowLayout(size: view.frame.size)
        memes = appDelegate.memes
    }
    
    // Create custom cells for SentMemesCollectionViewController.
    // Create three memes in table view per row
    func flowLayout(size: CGSize) {
        
        let space: CGFloat = 3.0
        let dimension: CGFloat = size.width > size.height ? (size.width - (4 * space)) / 6.0 : (size.width - (2 * space)) / 3.0
        
        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    // MARK: Collection View Data Source
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemesCollectionViewCell", for: indexPath) as! SentMemeCollectionViewCell
        let memeObject = memes[indexPath.item]

        cell.sentMemeImage?.image = memeObject.memedImage

        return cell
    }
    
    // MARK: Segue
    
    // Add meme to MemeDetailViewController then present the controller when user selects a specific meme
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = memes[(indexPath as NSIndexPath).row]
        
        navigationController!.pushViewController(detailController, animated: true)
    }
}
