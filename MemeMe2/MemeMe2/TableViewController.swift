//
//  TableViewController.swift
//  MemeMe2
//
//  Created by Fato0omAH on 8/16/19.
//  Copyright © 2019 Fatema. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    //MARK: life cycle functions
    override func viewDidLoad() {
        self.tableView.delegate=self
        self.tableView.dataSource=self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //MARK: TableView functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "memeCell")!
        let meme = memes[(indexPath as NSIndexPath).row]
        
        // Set the image and the label
        cell.imageView?.image = meme.memedImage
        cell.textLabel?.text = meme.topText + "..." + meme.bottomText
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //call the MemeDetailViewController
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
}
