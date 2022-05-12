//
//  ContentView.swift
//  SurfSpots
//
//  Created by Camille FOL on 04/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .spots
    
    enum Tab {
            case spots
            case newSpot
        }
    
    var body: some View {
        TabView(selection: $selection){
            SpotsList()
                .tabItem {
                    Label("Surf Spots", systemImage:"wind")
                }
                .tag(Tab.spots)
            
            NewSpot()
                .tabItem {
                   Label("Add Spot", systemImage:"plus")
                }
                .tag(Tab.newSpot)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
        ContentView()
            .environmentObject(ModelData())
        }
    }
}
