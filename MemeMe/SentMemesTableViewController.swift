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
    
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    var memes: [Meme]!
    
    // MARK: Outlets
    
    @IBOutlet var memeView: UITableView!
    
    // MARK: Life Cycle
    
    // This function saves generated memes to AppDelegate Meme array
    override func viewDidLoad() {
        memes = appDelegate.memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        memeView.reloadData()
    }
    
    // MARK: Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SentMemesTableViewCell")!
        let memeObject = memes[indexPath.row]
        
        cell.imageView?.image = memeObject.memedImage
        cell.textLabel?.text = "\(memeObject.topTextField!)...\(memeObject.bottomTextField!)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
    // MARK: Utilities
    
    // Implement swipe gesture to delete selected meme(s) from tableView, collectionView and Meme array in AppDelegate
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            appDelegate.memes.remove(at: indexPath.row)
            
            // Update the Meme array in AppDelegate and tableView to reflect deletion of selected row index
            memes = appDelegate.memes
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
    }
}
