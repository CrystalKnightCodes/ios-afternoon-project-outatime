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
        
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func travelBackButton(_ sender: UIButton) {
    }
    
    private func updateViews() {
        let todayString = string(from: today)
        
        presentTimeLabel.text = todayString
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "---   --   ----"
        
        
    }
    
    private func string(from date: Date) -> String {
        return dateFormatter.string(for: date)!

    }
 
    
    /*
    // MARK: Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
