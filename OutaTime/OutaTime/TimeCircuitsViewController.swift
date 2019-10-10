//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Christy Hicks on 10/8/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
   
    // MARK: - Properties
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter
    }()
    
    var currentSpeed = 0
    let today = Date()
    var timer: Timer?
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
        private func updateViews() {
        let todayString = string(from: today)
        
        presentTimeLabel.text = todayString
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "---   --   ----"
    }
    
    // MARK: - IBActions
    @IBAction func travelBackButton(_ sender: UIButton) {
        startTimer()
    }
    
    // MARK: - Methods
    // Formats date into string for buttons.
    private func string(from date: Date) -> String {
        return dateFormatter.string(for: date)!
    }
 
    // Starts timer for updating Speed Label
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            self.updateSpeed()
        }
    }
    
    // Updates Speed Label
    func updateSpeed() {
        speedLabel.text = "\(currentSpeed) MPH"
        if currentSpeed < 88 {
            currentSpeed += 1
        } else {
            timer?.invalidate()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            
            let alert = UIAlertController(title: "Time Travel Successful!", message: "It is now \(presentTimeLabel.text ?? "time to figure out what went wrong.")", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            currentSpeed = 0
        }
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "modalDestinationDatePickerSegue" {
        guard let vc = segue.destination as? DatePickerViewController else { return }
        vc.delegate = self
        }
    }
}

// MARK: - Extensions
// Updates Destination Time Label to date chosen in Date Picker VC
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}



