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
    @IBOutlet weak var toolbarLabel: UILabel!
    
    let tapRecognizer = UITapGestureRecognizer()
    let upSwipeRecognizer = UISwipeGestureRecognizer()
    let downSwipeRecognizer = UISwipeGestureRecognizer()
    let longPressRecognizer = UILongPressGestureRecognizer()
    
    
    
    func tappedView() {
        counter.increment()
        update()
    }
    
    func longPressedView() {
        counter.reset()
        update()
    }
    
    func upSwipedView() {
        counter.increment()
        update()
    }
    
    func downSwipedView() {
        counter.decrement()
        update()
    }
    
    func update() {
        counterLabel.text? = String(counter.count)
        
        let usersThisHour = counter.usersThisHour()
        toolbarLabel.text? = "This Hour: \(usersThisHour) Users"
    }
    
    override func viewDidLoad() {
        tapRecognizer.addTarget(self, action: #selector(tappedView))
        upSwipeRecognizer.addTarget(self, action: #selector(upSwipedView))
        downSwipeRecognizer.addTarget(self, action: #selector(downSwipedView))
        longPressRecognizer.addTarget(self, action: #selector(longPressedView))
        
        upSwipeRecognizer.direction = .up
        downSwipeRecognizer.direction = .down
        
        tapView?.addGestureRecognizer(tapRecognizer)
        tapView?.addGestureRecognizer(upSwipeRecognizer)
        tapView?.addGestureRecognizer(downSwipeRecognizer)
        tapView?.addGestureRecognizer(longPressRecognizer)
        
        tapView?.isUserInteractionEnabled = true
        update()
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

