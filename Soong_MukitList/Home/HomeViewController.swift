//
//  HomeViewController.swift
//  Soong_MukitList
//
//  Created by 이숭인 on 2021/01/17.
//

import UIKit
import NMapsMap

class HomeViewController: MapViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
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

//MARK: - collectionView DataSource
extension HomeViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionItems.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dummyItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MatzipCell", for: indexPath) as? MatzipCell else {
            return UICollectionViewCell()
        }
        cell.testLabel.text = dummyItems[indexPath.row]
        
        return cell
    }
}

//MARK: - collectionView Delegate
extension HomeViewController : UICollectionViewDelegate {

}

//MARK: - collectionView FlowLayout
extension HomeViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            //TODO : header custom class 만들어서 사용해보자
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
            headerView.backgroundColor = .red
            return headerView
        default :
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //TODO: view.frame의 값으로 기기별 사이즈에 맞춰 아이탬들의 사이즈 조절
        return CGSize(width: 300, height: 40)
    }
}
