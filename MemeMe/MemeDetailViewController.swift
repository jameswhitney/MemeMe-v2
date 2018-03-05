//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by James Whitney on 3/5/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {
    
    
    @IBOutlet weak var memeImage: UIImageView!
    var meme: Meme?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let meme = meme {
            memeImage?.image = meme.memedImage
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
}
