//
//  WorkoutTableViewCell.swift
//  HIITintervalTimer
//
//  Created by Aleksandar Tesanovic on 3/1/19.
//  Copyright © 2019 Aleksandar Tesanovic. All rights reserved.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {
    
    //MARK:- Set up Properties
    
    var deleteDelegate: CustomDeleteDelegate?
    var editDelegate:CustomEditDelegate?
    
    
    @IBOutlet weak var trainingNameLabel: UILabel! {
        didSet {
            trainingNameLabel.textColor = UIColor.white
            trainingNameLabel.font = UIFont.textStyle7
        }
    }
    
    @IBOutlet weak var totalTimeLabel: UILabel! {
        didSet {
            totalTimeLabel.textColor = UIColor.brownishGrey
            totalTimeLabel.font = UIFont.textStyle6
        }
    }
    
    //MARK:- Set up Handlers
    
    @IBAction func editTrainingButton(_ sender: Any) {
        
        editDelegate?.editButtonPressed(cell: self)
    }
    
    @IBAction func deleteTrainingButton(_ sender: Any) {
        
        deleteDelegate?.deleteButtonPressed(cell: self)
    }
}
