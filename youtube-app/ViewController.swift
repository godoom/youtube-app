//
//  ViewController.swift
//  youtube-app
//
//  Created by George on 8/29/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        
        // Do any additional setup after loading the view.
        model.getVideos()
    }
    
    //MARK: - Model Delegate (get videos) methods
    
    func videosFetched(_ videos: [Video]) {
        // set the returned videos to video property
        self.videos = videos
        //refresh tableview
        tableView.reloadData()
    }
    
    //MARK: - TableView Datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //get reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        //configure cell
        // get the title for video in question
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        
        //return cell
        return cell
    }

    //MARK: - TableView Delegate (user interation) methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
    
}

