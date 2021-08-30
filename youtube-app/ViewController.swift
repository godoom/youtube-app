//
//  ViewController.swift
//  youtube-app
//
//  Created by George on 8/29/21.
//

import UIKit

class ViewController: UIViewController {
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideos()
    }


}

