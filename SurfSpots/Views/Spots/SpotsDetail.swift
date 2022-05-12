//
//  SpotsDetail.swift
//  SurfSpots
//
//  Created by Camille FOL on 04/05/2022.
//

import SwiftUI

struct SpotsDetail: View {
    @EnvironmentObject var modelData: ModelData
    var spot: Record
    
    var spotIndex: Int {
        $modelData.spots.firstIndex(where: { $0.id == spot.id })!
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    MapView(geocode: spot.fields.geocode)
                        .frame(height: 400)
                    
                    CircleImageLarge(spot: spot)
                        .offset(y: -130)
                        .padding(.bottom, -130)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(spot.fields.destination)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Spacer()
                            Text("Difficulty :")
                            Text(String(spot.fields.difficultyLevel) + "/5 🔥")
                        }
                        Spacer()
                        HStack {
                            Text(spot.fields.destinationStateCountry)
                                .font(.subheadline)
                            Spacer()
                            Text(spot.fields.surfBreak[0].rawValue)
                        }
                    }
                    .padding()
                    Divider()
                }
                
                VStack {
                    Text("Peak Season")
                        .font(.headline)
                    HStack {
                        Text(spot.fields.seasonStart)
                        Text("➟")
                            .font(.title)
                        Text(spot.fields.seasonEnd)
                    }
                    Spacer()
                    HStack {
                        Text("More information about this")
                        Link("Spot", destination: URL(string: spot.fields.link)!)
                    }
                }
                
            }
            .ignoresSafeArea(edges: .top)
            Spacer()
        }
    }
}

struct SpotsDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        ZStack {
            SpotsDetail(spot: modelData.spots[0])
                .environmentObject(modelData)
        }
    }
}
