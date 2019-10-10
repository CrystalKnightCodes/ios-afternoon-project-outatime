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
    var destinationDate: Date = Date()
    var timer: Timer?
 
        
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    @IBAction func travelBackButton(_ sender: UIButton) {
        startTimer()
    }
    
    private func updateViews() {
        let todayString = string(from: today)
        let destinationString = string(from: destinationDate)
        
        presentTimeLabel.text = todayString
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "---   --   ----"
        
        
        
    }
    
    private func string(from date: Date) -> String {
        return dateFormatter.string(for: date)!

    }
 
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            self.updateSpeed()
        }
    }
    
    func updateSpeed() {
        speedLabel.text = "\(currentSpeed) MPH"
        if currentSpeed < 88 {
            currentSpeed += 1
        } else {
            timer?.invalidate()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            
            let alert = UIAlertController(title: "Time Travel Successful!", message: "It is now \(presentTimeLabel.text)" ?? "You didn't quite make it...", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            currentSpeed = 0
        }
    }
    
    // MARK: Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "modalDestinationDatePickerSegue" {
        guard let vc = segue.destination as? DatePickerViewController else { return }
        vc.delegate = self
        }
    }
}

// MARK: - Extensions
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
    
}



