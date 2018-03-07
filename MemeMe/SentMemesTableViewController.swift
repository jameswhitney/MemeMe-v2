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
    @IBOutlet var memeView: UITableView!
    
    // This function saves generated memes to AppDelegate Meme array
    override func viewDidLoad() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        memeView.reloadData()
    }
    
    // MARK: Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return number of elements in Meme array
        print(self.memes.count)
        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SentMemesTableViewCell")!
        _ = self.memes[(indexPath as NSIndexPath).row]
        
        cell.imageView?.image = memes[indexPath.row].memedImage
        cell.textLabel?.text = "\(memes[indexPath.row].topTextField!)...\(memes[indexPath.row].bottomTextField!)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
}
