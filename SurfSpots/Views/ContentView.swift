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
            case categories
        }
    
    var body: some View {
        TabView(selection: $selection){
            SpotsCategory()
                .tabItem{
                    Label("Categories", systemImage:"square.grid.2x2.fill")
                }
                .tag(Tab.categories)
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
