//
//  ViewController.swift
//  CLC Tally
//
//  Created by Illya Starikov on 3/22/16.
//  Copyright © 2016 Illya Starikov. All rights reserved.
//

import UIKit
import Foundation

class TallyViewController: UIViewController {
    var counter = Counter()
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet var tapView: UIView?
    
    let defaults = UserDefaults.standard
    var startDate = NSDateComponents()
    
    let tapRecognizer = UITapGestureRecognizer()
    //    let swipeRecognizer = UISwipeGestureRecognizer()
    let longPressRecognizer = UILongPressGestureRecognizer()
    
    //    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    
    
    func tappedView() {
        counter.update()
        update()
    }
    
    func longPressedView() {
        counter.reset()
        update()
    }
    
    func update() {
        counterLabel.text? = String(counter.count)
    }
    
    override func viewDidLoad() {
        tapRecognizer.addTarget(self, action: #selector(TallyViewController.tappedView))
        //        swipeRecognizer.addTarget(self, action: "swipedView")
        longPressRecognizer.addTarget(self, action: #selector(TallyViewController.longPressedView))
        
        
        tapView!.addGestureRecognizer(tapRecognizer)
        //        tapView!.addGestureRecognizer(swipeView)
        tapView!.addGestureRecognizer(longPressRecognizer)
        
        tapView!.isUserInteractionEnabled = true
        
        update()
        
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

