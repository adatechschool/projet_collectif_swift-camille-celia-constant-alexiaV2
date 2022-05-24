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

// MARK: - Record
struct Record: Codable, Identifiable, Hashable {
    //var id : UUID = UUID()
    var id : Int
    var name: String
    var surfBreak: String //[Category]
    var difficultyLevel: Int
    var favorite : Bool
    var stateCountry : String
    var address: String
    var link : String
    var photos: String //[Photo]
    var seasonStart: String
    var seasonEnd: String
    var createdTime : String
    
    /*enum Category: String, CaseIterable, Codable {
        case beachBreak = "Beach Break"
        case reefBreak = "Reef Break"
        case pointBreak = "Point Break"
        case rivermouthBreak = "Rivermouth Break"
        case outerBanks = "Outer Banks"
    }*/
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case surfBreak = "Surf Break"
        case difficultyLevel = "Difficulty Level"
        case favorite = "Favorite"
        case stateCountry = "State/Country"
        case address = "Address"
        case link = "Link"
        case photos = "Photos"
        case seasonStart = "Season Start"
        case seasonEnd = "Season End"
        case createdTime = "createdTime"
    }
}

// MARK: - Photo
struct Photo: Codable {
    let url: String
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

struct Coordinates : Codable {
    var latitude : Double
    var longitude : Double
}
