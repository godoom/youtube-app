//
//  Model.swift
//  youtube-app
//
//  Created by George on 8/29/21.
//

import Foundation

class Model {
    
    func getVideos() {
        // url object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        // get url session object
        
        let session = URLSession.shared
        
        // get a data task from url session object
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if error != nil || data == nil {
                return
            }
            
            //parsing the data into video objects
            
        }
        // kick off task
        
        dataTask.resume()
    
    }
}