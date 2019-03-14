//
//  AddActionViewController.swift
//  HIITintervalTimer
//
//  Created by Aleksandar Tesanovic on 2/27/19.
//  Copyright © 2019 Aleksandar Tesanovic. All rights reserved.
//

import UIKit

class AddActionViewController: UIViewController {

    //MARK: - Set up propeties
    
    var numberOfRounds = 0
    var numberOfActionSeconds = 0
    var numberOfRestSeconds = 0
    var totalTime = 0
    
    @IBOutlet weak var trainingNameTextField: UITextField! {
        didSet {
            trainingNameTextField.textColor = UIColor.black
            trainingNameTextField.font = UIFont.textStyle8
        }
    }
    
    @IBOutlet weak var restColorView: UIView! {
        didSet {
            restColorView.backgroundColor = UIColor.neonRed
        }
    }
    
    @IBOutlet weak var actionColorView: UIView! {
        didSet {
            actionColorView.backgroundColor = UIColor.neonYellow
        }
    }
    
    @IBOutlet weak var restLabel: UILabel! {
        didSet {
            restLabel.text = "0 SECONDS"
            restLabel.textAlignment = .center
            restLabel.font = UIFont.textStyle9
            restLabel.textColor = UIColor.black
        }
    }
    
    @IBOutlet weak var actionLabel: UILabel! {
        didSet {
            actionLabel.text = "0 SECONDS"
            actionLabel.textAlignment = .center
            actionLabel.font  = UIFont.textStyle9
            actionLabel.textColor = UIColor.black
        }
    }
    @IBOutlet weak var labelForRounds: UILabel! {
        didSet {
            labelForRounds.text = "0 ROUNDS"
            labelForRounds.font = UIFont.textStyle9
            labelForRounds.textColor = UIColor.black
            labelForRounds.textAlignment = .center
        }
    }
    
    @IBOutlet weak var actionNameLabel: UILabel! {
        didSet {
            actionNameLabel.text = "ACTION"
            actionNameLabel.font = UIFont.textStyle7
            actionNameLabel.textColor = UIColor.white
        }
    }
    
    @IBOutlet weak var workoutRoundsView: UIView! {
        didSet {
            workoutRoundsView.backgroundColor = UIColor(patternImage: UIImage(named: "rectangle31")!)
        }
    }
    @IBOutlet weak var workoutNameView: UIView! {
        didSet {
            workoutNameView.backgroundColor = UIColor(patternImage: UIImage(named: "rectangle7")!)
        }
    }
    
    @IBOutlet weak var labelName: UILabel! {
        didSet {
            labelName.text = "WORKOUT NAME"
            labelName.font = UIFont.textStyle7
            labelName.textColor = UIColor.white
        }
    }
    
    @IBOutlet weak var saveBarButton: UIBarButtonItem! {
        didSet {
            saveBarButton.title = "SAVE"
            saveBarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.textStyle5], for: .normal)
            saveBarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.textStyle5, NSAttributedString.Key.foregroundColor: UIColor.white], for: .highlighted)
        }
    }
        
    @IBOutlet weak var addActionButton: UIButton! {
        didSet {
            addActionButton.setTitle("ADD ACTION", for: .normal)
            addActionButton.tintColor = UIColor.black
            addActionButton.titleLabel?.font = UIFont.textStyle9
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        setUpNavigationBar()
        trainingNameTextField.delegate = self
    }
    
    //MARK:- Set up Methods
    
    func setUpNavigationBar() {
        
        title = "WORKOUTS"
    }
    
    @IBAction func saveBarButtonPressed(_ sender: UIBarButtonItem) {
        
        saveAction()
        resetAction()
    }
    
    @IBAction func addActionButtonPressed(_ sender: Any) {
    
        performSegue(withIdentifier: "goToListOfWorkoutsVC", sender: self)
    }
    
    func saveAction() {
        
        let workout = Workout()
        
        workout.nameOfTraining = trainingNameTextField.text ?? ""
        workout.numberOfRounds = numberOfRounds
        workout.actionSeconds = numberOfActionSeconds
        workout.restSeconds = numberOfRestSeconds
        workout.totalTime = Double(numberOfRounds*(numberOfRestSeconds + numberOfActionSeconds))
        workoutTrainings.append(workout)
    }
    
    func resetAction() {
        
        numberOfRounds = 0
        numberOfRestSeconds = 0
        numberOfActionSeconds = 0
        totalTime = 0
        
        trainingNameTextField.text = ""
        labelForRounds.text = "0 ROUNDS"
        actionLabel.text = "0 SECONDS"
        restLabel.text = "0 SECONDS"
    }
   
    
    @IBAction func addButtonRounds(_ sender: Any) {
        
        numberOfRounds += 1
        labelForRounds.text = "\(numberOfRounds) ROUNDS"
    }
    
    @IBAction func reduceButtonRounds(_ sender: Any) {
        
        if numberOfRounds > 0 {
            numberOfRounds -= 1
            labelForRounds.text = "\(numberOfRounds) ROUNDS"
        }
    }
    
    @IBAction func addActionSecondsBtn(_ sender: Any) {
        
        numberOfActionSeconds += 10
        actionLabel.text = "\(numberOfActionSeconds) SECONDS"
    }
    @IBAction func reduceActionSecondsBtn(_ sender: Any) {
        
        if numberOfActionSeconds > 0 {
            numberOfActionSeconds -= 10
            actionLabel.text = "\(numberOfActionSeconds) SECONDS"
        }
    }
    @IBAction func addRestSecondsBtn(_ sender: Any) {
        
        numberOfRestSeconds += 10
        restLabel.text = "\(numberOfRestSeconds) SECONDS"
        
    }
    
    @IBAction func reduceRestSecondsBtn(_ sender: Any) {
        
        if numberOfRestSeconds > 0 {
            numberOfRestSeconds -= 10
            restLabel.text = "\(numberOfRestSeconds) SECONDS"
        }
    }
    
    //MARK:- Set up Unwind Seque Method
    
    @IBAction func unwindToAddActionVC(segue: UIStoryboardSegue) {
        
        if let listOfWorkoutsVC = segue.source as? ListOfWorkoutsViewController {
            if let recivedSelectedRow = listOfWorkoutsVC.selectedRow {
                
                let workout: Workout = workoutTrainings[recivedSelectedRow]
                
                numberOfRounds = workout.numberOfRounds
                labelForRounds.text = "\(numberOfRounds) ROUNDS"
                
//                trainingNameTextField.text = workoutTrainings[recivedSelectedRow].nameOfTraining
//                labelForRounds.text = "\(workoutTrainings[recivedSelectedRow].numberOfRounds) ROUNDS"
//                actionLabel.text = "\(workoutTrainings[recivedSelectedRow].actionSeconds) SECONDS"
//                restLabel.text = "\(workoutTrainings[recivedSelectedRow].restSeconds) SECONDS"
//
//                workoutTrainings.remove(at: recivedSelectedRow)
            }
        }
    }
}

//MARK:- Set up TextFieldDelegate Method

extension AddActionViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        trainingNameTextField.resignFirstResponder()
        return true
    }
    
}