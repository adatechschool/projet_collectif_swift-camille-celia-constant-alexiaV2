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
        modelData.spots.firstIndex(where: { $0.id == spot.id })!
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    /*MapView(geocode: spot.geocode)
                     .frame(height: 400)*/
                    
                    CircleImageLarge(spot: spot)
                        .offset(y: -130)
                        .padding(.bottom, -130)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(spot.name)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            FavoriteButton(isSet: $modelData.spots[spotIndex].favorite)
                            
                            Spacer()
                            
                            Text("Difficulty :")
                            Text(String(spot.difficultyLevel) + "/5 🔥")
                        }
                        Spacer()
                        HStack {
                            Text(spot.stateCountry)
                                .font(.subheadline)
                            Spacer()
                            Text(spot.surfBreak/*[0].rawValue*/)
                        }
                    }
                    .padding()
                    Divider()
                }
                
                VStack {
                    Text("Peak Season")
                        .font(.headline)
                    HStack {
                        Text(spot.seasonStart)
                        Text("➟")
                            .font(.title)
                        Text(spot.seasonEnd)
                    }
                    Spacer()
                    HStack {
                        Text("More information about this")
                        Link("Spot", destination: URL(string: spot.link)!)
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
