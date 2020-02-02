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
    var lettersGuessed = ""
    var wordToGuess = "SWIFT"
    let maxWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuesssLabel()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        updateUIAfterGuess()
        
    }
    
    func updateUIAfterGuess(){
        guessLetterField.resignFirstResponder()
        guessLetterField.text = ""
    }
    
    func guessALetter(){
        formatUserGuesssLabel()
        guessCount += 1
        //decremeents wrongGuessesRemaining and shows image with one less petal
        let currentLetterGuessed = guessLetterField.text!
        
        if !wordToGuess.contains(currentLetterGuessed){
            wrongGuessesRemaining -= 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        //Stop game if wrongGuessesRemaining reaches 0
        let revealedWord = userGuessLabel.text!

        if wrongGuessesRemaining == 0{
            playAgainButton.isHidden = false
            guessLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "Sorry! You're out of guesses!"
        }else if !revealedWord.contains("_"){
            //You've won a game!
            playAgainButton.isHidden = false
            guessLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "Congrats! It took you \(guessCount) tries."
        }else{
            //update our guess count
            let guess = (guessCount == 1 ? "guess" : "guesses")
            guessCountLabel.text = "You've Made \(guessCount) " + guess
        }
        
    }
    
    func formatUserGuesssLabel(){
        var revealedWord = ""
        lettersGuessed += guessLetterField.text!
        for letter in wordToGuess{
            if lettersGuessed.contains(letter){
                revealedWord += " " + String(letter)
            }
            else{
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
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
        guessALetter()
        updateUIAfterGuess()
        
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        
        guessLetterField.isEnabled = true
        guessLetterButton.isEnabled = true
        playAgainButton.isHidden = true
        flowerImageView.image = UIImage(named: "flower8")
        lettersGuessed = ""
        formatUserGuesssLabel()
        guessCountLabel.text = "You've Made 0 Guesses"
        guessCount = 0 
    }
    


}

