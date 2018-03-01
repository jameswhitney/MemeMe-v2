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
}
