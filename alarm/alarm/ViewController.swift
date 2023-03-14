//
//  ViewController.swift
//  alarm
//
//  Created by hjshin on 2023/03/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DateTime: UILabel!
    @IBOutlet weak var PickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        DateTime.text = formatter.string(from: Date())
        
        if PickerTime.text == DateTime.text {
            let alert = UIAlertController(title: "알림", message: "설정된 시간입니다", preferredStyle: UIAlertController.Style.alert)
            let confirmAction  = UIAlertAction(title: "끄기", style: UIAlertAction.Style.default, handler: {
                ACTION in
                    self.view.backgroundColor = UIColor.white
                    self.PickerTime.text = ""
                
            })
            
            self.view.backgroundColor = UIColor.red
            alert.addAction(confirmAction)
            self.present(alert,animated: true,completion: nil)
        }
    }

    @IBAction func DatePicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        PickerTime.text = formatter.string(from: sender.date)
    }
    
}

