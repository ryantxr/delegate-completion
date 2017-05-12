//
//  Lipsum.swift
//  getsum
//
//  Created by ryan teixeira on 5/12/17.
//  Copyright © 2017 blazecore. All rights reserved.
//

/*
 This class is specifically designed to use a delegate pattern as a callback.
 */
import Foundation


protocol LipsumDelegate {
    func didLoadText(text: String?, response: URLResponse?, error: Error?)
}

// This class gets some lipsum text
class Lipsum {
    var delegate: LipsumDelegate?
    
    let endpoint = "http://lipsum.com/feed/json?what=words&amount=23"
    
    func get(with delegate: LipsumDelegate) {
        self.delegate = delegate
        let url = URL(string: endpoint)
        let queue = OperationQueue()
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)

        queue.addOperation {
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let sendTask = session.dataTask(with: request ) {
                (data: Data?, response: URLResponse?, error: Error?) in
                
                if let e = error {
                    print("\(#function) bad")
                    print(e.localizedDescription)
                    // do the call back
                    self.delegate?.didLoadText(text: nil, response: response, error: error)
                }
                else {
                    if data != nil {
                        
                        if let jsonstring = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as? String {
                            print("jsonstring: \(jsonstring)")
                            self.delegate?.didLoadText(text: jsonstring, response: response, error: error)
                            return
                        }
                    }
                    else {
                        print("Data is nil")
                    }
                    
                    self.delegate?.didLoadText(text: nil, response: response, error: error)
                }
            }
            sendTask.resume()
        }
        
    }
    
    
    
}
