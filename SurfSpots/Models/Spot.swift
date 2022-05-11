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
    let geocode: String
    let address: String
    let seasonStart: String
    let seasonEnd: String
    let link : String
    
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

struct Geocode: Codable {
    
    var i: String
    var o: Obj
    var e: Int
}

struct Obj: Codable {
    var status, formattedAddress: String, lat, lng: Double
}

extension String {
    
    func base64Encoded() -> String? {
        return data(using: .utf8)?.base64EncodedString()
    }
    
    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded : self, options: .ignoreUnknownCharacters) else
        { return nil}
        return String(data: data, encoding: .utf8)
    }
}
//A FINIR
struct Coordinates : Codable {
    var latitude : Double
    var longitude : Double
}
