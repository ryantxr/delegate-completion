//
//  LipsumWrapper.swift
//  getsum
//
//  Created by ryan teixeira on 5/12/17.
//  Copyright © 2017 blazecore. All rights reserved.
//
/*
 This class is a wrapper for another class that uses a delegate pattern for completion.
 This wraps that other class and 'converts' it to using a completion block pattern.
 */
import Foundation

class LipsumWrapper : LipsumDelegate {
    
    typealias LipsumCompletion = ((_ success: Bool, _ text: String?, _ response: URLResponse?, _ error: Error?) -> Void)
    var callfunc : LipsumCompletion?
    
    func get(completion: LipsumCompletion?) {
        
        self.callfunc = completion
        
        let lipsumClient = Lipsum()
        lipsumClient.get(with: self)

        
        
    }
    
    func didLoadText(text: String?, response: URLResponse?, error: Error?) {
        
        var success = true
        if error != nil {
            success = false
        }
        self.callfunc?(success, text, response, error)
    }
    
}
