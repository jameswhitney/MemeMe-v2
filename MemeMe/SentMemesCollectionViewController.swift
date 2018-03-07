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
    
    var memes: [Meme]!
    
    // This function saves generated memes to AppDelegate Meme array
    override func viewDidLoad() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemesCollectionViewCell", for: indexPath) as! SentMemeCollectionViewCell
<<<<<<< HEAD
        let memeObject = memes[indexPath.item]
||||||| merged common ancestors
        let meme = self.memes[(indexPath as NSIndexPath).row]
=======
        let memeObject = self.memes[(indexPath as NSIndexPath).item]
>>>>>>> table-view-dev
        
<<<<<<< HEAD
        cell.sentMemeLabel.text = memeObject.topTextField
        cell.sentMemeImage?.image = memeObject.memedImage
||||||| merged common ancestors
        cell.sentMemeLabel.text = meme.topTextField
        cell.sentMemeImage!.image = meme.memedImage
=======
        cell.sentMemeLabel.text = memeObject.topTextField
        cell.sentMemeImage!.image = memeObject.memedImage
>>>>>>> table-view-dev
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // TODO: Add code to get detail VC, populate VC with data, and present controller

        
    }
}
