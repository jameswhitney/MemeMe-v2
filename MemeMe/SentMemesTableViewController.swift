//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by James Whitney on 3/1/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import UIKit

// MARK: - SentMemesTableView: UITableViewController

class SentMemesTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var memes: [Meme]!
    
    // This function saves generated memes to AppDelegate Meme array
    override func viewDidLoad() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
    }
    
    // MARK: Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return number of elements in Meme array
        print(self.memes.count)
        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SentMemesTableViewCell")!
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        
        cell.imageView?.image = meme.memedImage
        cell.textLabel?.text = ""
        
        // TODO: Set cell text detail labels
        if let detailTextLabel = cell.detailTextLabel {
            detailTextLabel.text = "detail"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
