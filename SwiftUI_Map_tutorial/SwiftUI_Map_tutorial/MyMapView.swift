//
//  MyMapView.swift
//  SwiftUI_Map_tutorial
//
//  Created by 최윤제 on 2023/10/17.
//

import Foundation
import MapKit
import SwiftUI
import CoreLocation

struct MyMapView: UIViewRepresentable {
    
    let locationManager = CLLocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        self.locationManager.delegate = context.coordinator
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest // 정확도 올리기
        
        // 위치 이용 허용 물어보기
        self.locationManager.requestWhenInUseAuthorization()
        
        // 현재 위치 업데이트 시작
        self.locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true // 현재 사용자 위치 보여주기
        mapView.setUserTrackingMode(.follow, animated: true) // 따라오는지
        
        let regionRadius: CLLocationDistance = 200 // 카메라 반경
        
        // 보여줄 지역 설정
        let coordinateRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
        
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator()
    }
}

class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lat = locations.first?.coordinate.latitude, let long = locations.first?.coordinate.longitude else {return}
        print("위도 : \(lat), 경도 : \(long)")
    }
}



