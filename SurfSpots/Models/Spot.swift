//
//  Spots.swift
//  SurfSpots
//
//  Created by Camille FOL on 04/05/2022.
//

import SwiftUI
import Foundation
import CoreLocation
import UIKit


// MARK: - SpotsData
struct SpotsData: Codable {
    var records: [Record]
}

// MARK: - Record
struct Record: Codable, Identifiable {
    let id: String
    let fields: Fields
}

// MARK: - Fields
struct Fields: Codable,Identifiable {
    var id: UUID = UUID()
    
    let surfBreak: [String]
    let difficultyLevel: Int
    let destination: String
    let photos: [Photo]
    let destinationStateCountry : String
    let address: String
    let seasonStart: String
    let seasonEnd: String
    let link : String
    
    var geocode: String
    /*var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }*/
    func fromBase64(word:String) -> String{
        let base64Decoded = Data(base64Encoded : word)!
        let decodedString = String(data: base64Decoded, encoding: .utf8)!
        
        return decodedString
    }
    
    var stringDecode: String {fromBase64(word:geocode)}
    

    enum CodingKeys: String, CodingKey {
        case surfBreak = "Surf Break"
        case difficultyLevel = "Difficulty Level"
        case destination = "Destination"
        case photos = "Photos"
        case destinationStateCountry = "Destination State/Country"
        case address = "Address"
        case geocode = "Geocode"
        case seasonStart = "Peak Surf Season Begins"
        case seasonEnd = "Peak Surf Season Ends"
        case link = "Magic Seaweed Link"
    }
}

// MARK: - Photo
struct Photo: Codable {
    //let id: String
    let url: String
    //let filename: String
    //let size: Int
    //let type: String
    let thumbnails: Thumbnails
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let small, large, full: Resolution
}

// MARK: - Full
struct Resolution: Codable {
    let url: String
    let width, height: Int
}
/*
struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}*/
