//
//  ViewController.swift
//  Destini
//

import UIKit

class ViewController: UIViewController {
    
    let storyList   =  StoryBank()
    var currentStory    : Int = 0
    var pressedButton   : Int = 0
    var finish          : Bool = false
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    // TODO Step 5: Initialise instance variables here
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyTextView.text = storyList.list[currentStory].storyString
        topButton.setTitle(storyList.list[currentStory].buttonTextA, for: .normal)
        bottomButton.setTitle(storyList.list[currentStory].buttonTextB, for: .normal)
        
        // TODO Step 3: Set the text for the storyTextView, topButton, bottomButton, and to T1_Story, T1_Ans1, and T1_Ans2
        
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
    
        pressedButton = sender.tag
        
        if(pressedButton == 1){
            if(finish == true) {
                alert()
            }
            else{
                currentStory = storyList.list[currentStory].storyPathA!
            }
        }
        else if(pressedButton == 2){
            currentStory = storyList.list[currentStory].storyPathB!
        }
    
        nextStory()
        
        // TODO Step 4: Write an IF-Statement to update the views
                
        // TODO Step 6: Modify the IF-Statement to complete the story
        
    
    }
    
    func nextStory(){
        
        if(storyList.list[currentStory].storyPathA != nil &&
            storyList.list[currentStory].storyPathB != nil){
            
            storyTextView.text = storyList.list[currentStory].storyString
            topButton.setTitle(storyList.list[currentStory].buttonTextA, for: .normal)
            bottomButton.setTitle(storyList.list[currentStory].buttonTextB, for: .normal)
            
        }
        else{
            storyTextView.text = storyList.list[currentStory].storyString
            topButton.setTitle("Finish", for: .normal)
            bottomButton.isHidden = true
            finish = true
        }
    }
    
    func alert(){
        let alert = UIAlertController(title: "Awesome", message: "You've finished, wanna start over?", preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "Restart" , style: .default, handler: { (UIAlertAction) in
            self.startOver()
        })
        
        alert.addAction(restartAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func startOver(){
        currentStory = 0
        pressedButton = 0
        finish = false
        bottomButton.isHidden = false
        
        storyTextView.text = storyList.list[currentStory].storyString
        topButton.setTitle(storyList.list[currentStory].buttonTextA, for: .normal)
        bottomButton.setTitle(storyList.list[currentStory].buttonTextB, for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

