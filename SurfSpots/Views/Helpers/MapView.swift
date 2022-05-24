//
//  MapView.swift
//  SurfSpots
//
//  Created by Camille FOL on 04/05/2022.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    
    var spotAddress: String
    
    @State private var region = MKCoordinateRegion()
    
    func setRegion (_ geocode: String) {
        
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(geocode) { (placemarks, error) in
            guard
                let placemark = placemarks?.first,
                let lat = placemark.location?.coordinate.latitude,
                let lng = placemark.location?.coordinate.longitude
                    
            else {
                // err
                return
            }
            
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: lat, longitude: lng),
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        }
    }
    /* private func setRegion(_ geocode: String) {
     guard let res = geocode.base64Decoded() else {return}
     let jsonData = res.data(using: .utf8)!
     let decoder = JSONDecoder()
     let geocodeJson : Geocode = try! decoder.decode(Geocode.self, from: jsonData)
     let lat = geocodeJson.o.lat
     let lng = geocodeJson.o.lng
     }*/
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(spotAddress)
            }
    }
}
/*
 struct MapView_Previews: PreviewProvider {
 static var previews: some View {
 MapView(geocode: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
 }
 }*/

