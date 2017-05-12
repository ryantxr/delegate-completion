//
//  ViewController.swift
//  getsum
//
//  Created by ryan teixeira on 5/12/17.
//  Copyright © 2017 blazecore. All rights reserved.
//

import UIKit

class ViewController: UIViewController /*, LipsumDelegate*/ {

    @IBOutlet weak var lipsum: UILabel!
    
    
    
    @IBAction func buttonAction(_ sender: Any) {
        //let lipsumClient = Lipsum()
        //lipsumClient.get(with: self)
        
        let wrapper = LipsumWrapper()
        
        wrapper.get { (success, text, response, error) in
            if success {
                DispatchQueue.main.async {
                    self.lipsum.text = text
                }
            }
            else {
                DispatchQueue.main.async {
                    self.lipsum.text = "Fail"
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // Lipsum Delegate
    func didLoadText(text: String?, response: URLResponse?, error: Error?) {
        DispatchQueue.main.async {
            self.lipsum.text = text
        }
    }
     */

}

