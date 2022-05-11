//
//  SpotsList.swift
//  SurfSpots
//
//  Created by Camille FOL on 04/05/2022.
//

import SwiftUI

struct SpotsList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredSpots: [Record] {
        modelData.spots//.filter { spot in
            //(!showFavoritesOnly)
        }

    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                .tint(Color(red: 0.984313725490196, green: 0.5529411764705883, blue: 0.6274509803921569))
                
                ForEach(filteredSpots) { spot in
                    NavigationLink {
                        SpotsDetail(spot: spot)
                    } label: {
                        SpotsRow(spot: spot)
                    }
                }
            }
            .navigationTitle("Surf Spots")
            .onAppear {
                modelData.getSpots()
            }
            
            
        }
    }
}

struct SpotsList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
        SpotsList()
            .environmentObject(ModelData())
        }
    }
}
