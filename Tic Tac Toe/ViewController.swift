//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Mat Sletten on 11/5/14.
//  Copyright (c) 2014 Mat Sletten. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var turnNumber = 1
    var winner = 0
    //For gameState array, 0 = empty, 1 = O, and 2 = X
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningStates = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var winningLabel: UILabel!
    
    
    //.Normal is the syntax forState of the IBOutlet object, a setable property. We then use sender to indicate which button object should be changed.
    @IBAction func button0Pressed(sender: AnyObject)
    {
        if (gameState[sender.tag]==0 && winner == 0)
        {
        var pieceImage = UIImage()
        if (turnNumber%2==0)
            {
                pieceImage = UIImage(named: "xmark.png")
                gameState[sender.tag] = 2
            }
        else
            {
                pieceImage = UIImage(named: "omark.png")
                gameState[sender.tag] = 1
            }
            for gameCombination in winningStates
            {
                if (gameState[gameCombination[0]]==gameState[gameCombination[1]] && gameState[gameCombination[1]]==gameState[gameCombination[2]] && gameState[gameCombination[0]] != 0)
                {
                winner = gameState[gameCombination[0]]
                }
            }
            
            if (winner != 0)
            {
                if (winner == 1) {
                    winningLabel.text = "Os have won!"
                }
                else {
                    winningLabel.text = "Xs have won!"
                }
                //println("We have a winner")
                winningLabel.hidden = false
                UIView.animateWithDuration(0.4, animations: {
                    self.winningLabel.center = CGPointMake(self.winningLabel.center.x + 400, self.winningLabel.center.y)
                    self.playAgainButton.alpha = 1
                })
            }
            
        turnNumber++
        sender.setImage(pieceImage, forState: .Normal)
        }
    }
    
    @IBAction func playAgainButtonPressed(sender: AnyObject)
    {
        turnNumber = 1
        winner = 0
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        winningLabel.hidden = true
        playAgainButton.alpha = 0
        var gameButtons : UIButton
        for var i = 0; i < 9; i++
        {
        gameButtons = view.viewWithTag(i) as UIButton
        gameButtons.setImage(nil, forState: .Normal)
        }
    }
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winningLabel.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        winningLabel.center = CGPointMake(winningLabel.center.x - 400, winningLabel.center.y)
        playAgainButton.alpha = 0
    }


}

