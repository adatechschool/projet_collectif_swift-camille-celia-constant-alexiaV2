//
//  ContentView.swift
//  SurfSpots
//
//  Created by Camille FOL on 04/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //Text("Hello World")
        SpotsList()
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
