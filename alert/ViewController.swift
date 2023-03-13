//
//  ViewController.swift
//  alert
//
//  Created by hjshin on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {
    let img1 = UIImage(named: "출근.jpeg")
    let img2 = UIImage(named: "야근.jpeg")
    let img3 = UIImage(named: "퇴근.jpeg")
    
    // 출근상태. 출근인 경우 true
    var isNotNightShift = true
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = img1
        
    }

    @IBAction func btnGoToWork(_ sender: UIButton) {
        if isNotNightShift {
            let workOnAlert = UIAlertController(title:"경고", message: "현재 출근한 상태입니다.",preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네???", style: UIAlertAction.Style.default, handler: nil)
            
            workOnAlert.addAction(onAction)
            present(workOnAlert,animated: true,completion: nil)
        }else{
            imageView.image = img1
            isNotNightShift = true
        }
    }
    
    @IBAction func btnNightShift(_ sender: UIButton) {
        if isNotNightShift {
            let NightShiftAlert = UIAlertController(title: "야근하기", message: "진짜 야근하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default,
                                          handler: {ACTION in self.imageView.image = self.img2
                self.isNotNightShift = false})
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            NightShiftAlert.addAction(offAction)
            NightShiftAlert.addAction(cancelAction)
            
            present(NightShiftAlert,animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLeaveWork(_ sender: UIButton) {
        let leaveWorkAlert = UIAlertController(title: "퇴근하기", message: "퇴근하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "아니요, 일하겠습니다", style: UIAlertAction.Style.default, handler: {
            ACTION in self.imageView.image = self.img1
            self.isNotNightShift = true
        })
        let onAction = UIAlertAction(title: "아니요, 야근하겠습니다", style: UIAlertAction.Style.default, handler: {
            ACTION in self.imageView.image = self.img2
            self.isNotNightShift = false
        })
        let leaveAction = UIAlertAction(title: "네, 퇴근하겠습니다", style: UIAlertAction.Style.destructive, handler: {
            ACTION in self.imageView.image = self.img3
            self.isNotNightShift = false
        })
        
        leaveWorkAlert.addAction(offAction)
        leaveWorkAlert.addAction(onAction)
        leaveWorkAlert.addAction(leaveAction)
        present(leaveWorkAlert,animated: true, completion: nil)
    }
    
}

