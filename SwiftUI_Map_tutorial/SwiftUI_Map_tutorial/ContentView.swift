//
//  ContentView.swift
//  SwiftUI_Map_tutorial
//
//  Created by 최윤제 on 2023/10/17.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var myPostion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(37.331705), longitude: CLLocationDegrees(-122.030237)), span: MKCoordinateSpan())
    
    var body: some View {
        
        //Map(coordinateRegion: $myPostion) // iOS 14 부터 사용이 가능한 코드
        MyMapView()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
