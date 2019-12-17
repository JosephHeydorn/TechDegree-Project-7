//
//  ViewController.swift
//  Unit7 Project Folder
//
//  Created by Joseph Heydorn on 12/7/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var generateMovieButton: UIButton!
    @IBOutlet weak var watcherOneButton: UIButton!
    @IBOutlet weak var watcherTwoButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        UIDesign()
        // Do any additional setup after loading the view.
    }
    
    //MARK: UI Design
    func UIDesign() {
        generateMovieButton.layer.cornerRadius = 5
        watcherListCompleted()
    }
    
    func watcherListCompleted() {
        if watcherOneIDOne != 0 && watcherOneIDTwo != 0 && watcherOneIDThree != 0 && watcherOneIDFour != 0 && watcherOneIDFive != 0 {
            watcherOneButton.setImage(UIImage(named: "bubble-selected"), for: .normal)
        } else {
            watcherOneButton.setImage(UIImage(named: "bubble-empty"), for: .normal)
        }
        
        if watcherTwoIDOne != 0 && watcherTwoIDTwo != 0 && watcherTwoIDThree != 0 && watcherTwoIDFour != 0 && watcherTwoIDFive != 0 {
            watcherTwoButton.setImage(UIImage(named: "bubble-selected"), for: .normal)
        } else {
            watcherTwoButton.setImage(UIImage(named: "bubble-empty"), for: .normal)
        }
    }


}

