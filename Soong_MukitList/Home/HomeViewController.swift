//
//  HomeViewController.swift
//  Soong_MukitList
//
//  Created by 이숭인 on 2021/01/17.
//

import UIKit
import NMapsMap

class HomeViewController: MapViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let sectionItems : [String] = ["서울","부산","경기"]
    private let dummyItems : [String] = ["스파게티","치킨","족발"]

    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 위치 권한이 없는 경우
        if !requestGPSPermission(){
            locationManager.requestAlwaysAuthorization()
        }
        mapView.moveCamera(NMFCameraUpdate(position: NMFCameraPosition(NMGLatLng(lat: mapView.locationOverlay.location.lat, lng: mapView.locationOverlay.location.lng), zoom: 15, tilt: 0, heading: 0)))
        mapView.positionMode = .compass
        naverMapView.showLocationButton = true //내 위치 찾기 버튼 활성화 false는 비활성화
      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Category" {
            
        } 
    }
    
    func requestGPSPermission() -> Bool {
          switch CLLocationManager.authorizationStatus() {
          case .authorizedAlways, .authorizedWhenInUse:
            print("GPS: 권한 있음")
            return true
          case .restricted, .notDetermined:
            print("GPS: 아직 선택하지 않음")
            return false
          case .denied:
              print("GPS: 권한 없음")
            return false
          default:
              print("GPS: Default")
            return false
        }
    }
}

//MARK: - tableView DataSource
extension HomeViewController : UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionItems[section]
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MatzipCell", for: indexPath) as? MatzipCell else{
            return UITableViewCell()
        }
        switch (indexPath.section){
        case 0:
            cell.testLabel.text = dummyItems[indexPath.row]
        case 1:
            cell.testLabel.text = dummyItems[indexPath.row]
        case 2:
            cell.testLabel.text = dummyItems[indexPath.row]
        default:
            print("section 에러")
        }
        
        return cell
    }
}

//MARK: - tableView Delegate
extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let sectionText = UILabel()
        sectionText.frame = CGRect.init(x: 10, y: 5, width: sectionHeader.frame.width-10, height: sectionHeader.frame.height-10)
        sectionText.text = sectionItems[section]
        sectionText.font = .systemFont(ofSize: 18, weight: .bold) // my custom font
        sectionText.textColor = .systemPink // my custom color
        sectionHeader.addSubview(sectionText)
        return sectionHeader
    }
}
