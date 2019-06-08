//
//  ViewController.swift
//  Dicee
//
//  Created by Aseel Alshohatee on 6/1/19.
//  Copyright © 2019 Aseel Alshohatee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    
    var diceImages: [UIImage] = []
    
    
    let diceArray  = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    
    var score1:Int = 0
    var score2:Int = 0
    
    
    
    @IBOutlet weak var LabelSocre1: UILabel!
    @IBOutlet weak var LabelScore2: UILabel!
    
    var timeCount:Int = 0
    var timer:Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateTheDiceFace()
        
        diceImages = createImageArray(total: 6, imagePrefix: "dice");
}
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        
        var imageArray: [UIImage] = []
        
        for imageCount in 1..<total + 1 {
            let imageName = "\(imagePrefix)\(imageCount).png"
            let image = UIImage(named: imageName)!
            
            imageArray.append(image)
        }
        return imageArray
    }
    
    func animate(imageView: UIImageView, images: [UIImage]) {
        imageView.animationImages = images
        imageView.animationDuration = 1.0
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }

    func updateTheDiceFace (){
        
        animate(imageView: diceImageView1, images: diceImages)
        animate(imageView: diceImageView2, images: diceImages)
        
        LabelSocre1.text = "player 1: " + "\(score1)"
        LabelScore2.text = "player 2: " + "\(score2)"
        
        randomDiceIndex1  = Int.random(in: 0 ... 5)
        randomDiceIndex2  = Int.random(in: 0 ... 5)
        
        // UIImage take string as parameter
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        
    }
    func socreDecider(){
        if (randomDiceIndex1 > randomDiceIndex2){
            score1 = score1 + 1
            LabelSocre1.text = "player 1: " + "\(score1)"
            
        }
        else if ( randomDiceIndex1 < randomDiceIndex2){
            score2 = score2 + 1
            LabelScore2.text = "player 2: " + "\(score2)"
        }
        
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateTheDiceFace ()
        socreDecider()
    }
    
    @IBAction func RollButtonPressed(_ sender: UIButton) {
        updateTheDiceFace()
        socreDecider()
    }
    
}
