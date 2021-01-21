//
//  PickerViewController.swift
//  Soong_MukitList
//
//  Created by 이숭인 on 2021/01/22.
//

import UIKit

class PickerViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    var test = ""
    private let areaItem : [String] = ["서울","경기","강원","부산"]
    private let categoryItem : [String] = ["한식","중식","일식","양식"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("test-->\(test)")
       
    }
    @IBAction func selectButton(_ sender: Any) {
        //TODO : 화면지우면서 선택한 데이터 넘기기
        print("넘김")
        dismiss(animated: true, completion: nil)
        
    }
}

extension PickerViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryItem.count
    }


}
extension PickerViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryItem[row]

    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row: \(row)")
        print("value: \(categoryItem[row])") }



}
