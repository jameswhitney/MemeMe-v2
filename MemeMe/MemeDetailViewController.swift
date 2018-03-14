//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by James Whitney on 3/5/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import UIKit

// MARK: - MemeDetailViewController

class MemeDetailViewController: UIViewController {
    
    // MARK: Properties
    
    var meme: Meme?
    
    // MARK: Outlets
    
    @IBOutlet weak var memeImage: UIImageView!

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let meme = meme {
            memeImage?.image = meme.memedImage
        }
    }
}
