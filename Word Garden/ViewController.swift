//
//  ViewController.swift
//  Word Garden
//
//  Created by Hannah Jiang on 2/1/20.
//  Copyright © 2020 Hannah Jiang. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessLetterField: UITextField!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var flowerImageView: UIImageView!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessLetterField.resignFirstResponder()
        updateUIAfterGuess()
        
    }
    
    func updateUIAfterGuess(){
        guessLetterField.resignFirstResponder()
        guessLetterField.text = ""
    }
    
    @IBAction func guessLetterFieldChanged(_ sender: UITextField) {
        
        if let letterGuess = guessLetterField.text?.last {
            guessLetterField.text = "\(letterGuess)"
            guessLetterButton.isEnabled = true
        }else{
            guessLetterButton.isEnabled = false
        }
    }
    
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        updateUIAfterGuess()
        
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
    }
    


}

