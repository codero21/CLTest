//
//  ViewController.swift
//  CLTest
//
//  Created by Rollin Francois on 9/1/17.
//  Copyright © 2017 Francois Technology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var latitudeValue: UILabel!
    @IBOutlet weak var LongitudeValue: UILabel!
    @IBOutlet weak var distanceValue: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
    
    
    // MARK: Action Methods
    
    @IBAction func onButtonPressed(_ sender: Any) {
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

