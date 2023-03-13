//
//  ViewController.swift
//  test
//
//  Created by hjshin on 2023/03/13.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
//    let MAX_ARRAY_NUM =
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = ["님좀쩌는듯.jpeg","머리를탁.jpeg","머리박박극기.jpeg","소리쳐부르지만저대답없는노을만붉게타는데.jpeg",
        "시끄러시씨씨시시ㅣ씨끄러.jpeg","아하.jpeg","안돼안바꿔줘돌아가.jpeg","윙크작렬.jpeg","자세히관찰하기.jpeg","주문받겠습니다 손님.jpeg","턱꼬집.jpeg","홀쭉이.jpeg","흐음.jpeg"]
    
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<imageFileName.count{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView:UIPickerView, rowHeightForComponent component: Int) -> CGFloat{
        return PICKER_VIEW_HEIGHT
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent: Int) -> Int{
        return imageFileName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String?{
        return imageFileName[row]
    }
    
    func pickerView(_ pickerView:UIPickerView, viewForRow row:Int, forComponent component: Int, reusing view: UIView?) -> UIView{
        
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x:0,y:0,width: 100,height: 80)
        return imageView
    }
    
    func pickerView(_ pickerView:UIPickerView, didSelectRow row: Int, inComponent component: Int){
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
    
    
}

