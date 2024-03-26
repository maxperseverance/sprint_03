//
//  ViewController.swift
//  Counter
//
//  Created by Maxim Sarkisyan on 26.03.2024.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var dropButton: UIButton!
    
    @IBOutlet weak var logView: UITextView!
    
    private func changeButtonColor(_ button: UIButton) {
        button.backgroundColor = .orange
    }
    
    private func getDateTimeString() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = formatter.string(from: date)
        return dateString
    }
    
    private func scrollTextViewDown() {
        let range = NSMakeRange(logView.text.count - 1, 0)
        logView.scrollRangeToVisible(range)
    }
    
    private func changeNumber(increase action: Bool) {
        if let oldNumber = counterLabel.text {
            if let intOldNumber = Int(oldNumber) {
                if action {
                    counterLabel.text = "\(intOldNumber + 1)"
                    logView.text += "\n[\(getDateTimeString())]: значение изменено на +1"
                } else {
                    if intOldNumber > 0 {
                        counterLabel.text = "\(intOldNumber - 1)"
                        logView.text += "\n[\(getDateTimeString())]: значение изменено на -1"
                    } else {
                        logView.text += "\n[\(getDateTimeString())]: попытка уменьшить значение счётчика ниже 0"
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plusButton.layer.cornerRadius = 20
        minusButton.layer.cornerRadius = 20
        dropButton.layer.cornerRadius = 10
        logView.isEditable = false
    }
    
    @IBAction func plusButtonTouchDown(_ sender: Any) {
        changeButtonColor(plusButton)
    }
    
    @IBAction func plusButtonTouch(_ sender: Any) {
        plusButton.backgroundColor = .systemPink
        changeNumber(increase: true)
        scrollTextViewDown()
    }
    
    @IBAction func minusButtonTouchDown(_ sender: Any) {
        changeButtonColor(minusButton)
    }
    
    @IBAction func minusButtonTouch(_ sender: Any) {
        minusButton.backgroundColor = .systemBlue
        changeNumber(increase: false)
        scrollTextViewDown()
    }
    
    @IBAction func dropButtonTouchDown(_ sender: Any) {
        changeButtonColor(dropButton)
    }
    
    @IBAction func dropButtonTouch(_ sender: Any) {
        dropButton.backgroundColor = .lightGray
        counterLabel.text = "0"
        logView.text += "\n[\(getDateTimeString())]: значение сброшено"
        scrollTextViewDown()
    }
}
