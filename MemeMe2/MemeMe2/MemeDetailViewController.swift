//
//  MemeDetailViewController.swift
//  MemeMe2
//
//  Created by Fato0omAH on 8/23/19.
//  Copyright © 2019 Fatema. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController:  UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Properties
    var meme: Meme!
    
    // MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        
        self.imageView!.image = meme.memedImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}
