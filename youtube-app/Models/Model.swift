//
//  Model.swift
//  youtube-app
//
//  Created by George on 8/29/21.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos: [Video])
}

class Model {
    
    var delegate:ModelDelegate?
    
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
            
            do {
                //parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    //user interface stuff should be done in main thread
                    DispatchQueue.main.async {
                        // call the videosReturned method of delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                    
                    
                }
                
                dump(response)
            }
            catch {
                
            }
            
            
        }
        // kick off task
        
        dataTask.resume()
    
    }
}
