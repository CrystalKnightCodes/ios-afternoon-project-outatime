//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Christy Hicks on 10/8/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - Properties
    var delegate: DatePickerDelegate?
    
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
}
