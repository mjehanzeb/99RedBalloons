//
//  ViewController.swift
//  99RedBalloons
//
//  Created by KT on 2014-09-18.
//  Copyright (c) 2014 KT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showBallonNumberLabel: UILabel!
    @IBOutlet weak var balloonImage: UIImageView!
    var currentIndex = 0
    var totalBalloons = 99
    
    var balloonsArray:[Balloon] = []
    let imagesArray = ["BerlinTVTower.jpg", "RedBalloon1.jpg", "RedBalloon2.jpg", "RedBalloon3.jpg", "RedBalloon4.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 1...self.totalBalloons {
            var balloon = Balloon()
            balloon.balloonNumber = i
            balloon.balloonImage = UIImage(named: self.getRandomImage())
            balloonsArray.append(balloon)
        }
        
        //println("\(balloonsArray.count)")
        //println("\(balloonsArray[0].balloonImage)")
        showBallonNumberLabel.text = "1 Balloon"
        showBallonNumberLabel.hidden = false
        balloonImage.image = balloonsArray[self.currentIndex].balloonImage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBallonButtonPressed(sender: UIBarButtonItem) {
        
        if self.currentIndex <= self.totalBalloons {
            self.currentIndex++
            let nextBalloon = self.balloonsArray[self.currentIndex]
            showBallonNumberLabel.text = "\(nextBalloon.balloonNumber) Balloon"
            balloonImage.image = nextBalloon.balloonImage
            
        }
    }
    
    func getRandomImage() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(imagesArray.count)))
        return imagesArray[randomNumber]
    }


}

