//
//  NewSpot.swift
//  SurfSpots
//
//  Created by Camille FOL on 12/05/2022.
//

import SwiftUI

struct NewSpot: View {
    
    @State var name : String = ""
    @State var address : String = ""
    @State var surfBreak : String = ""
    @State var img : String = ""
    @State var diff = "1"
    let difficulties = ["1 😌", "2 😎", "3 😳", "4 🫣", "5 🤕"]
    @State private var dateStart = Date()
    @State private var dateEnd = Date()
    @State var link : String = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Mandatory fields")){
                    TextField("Spot's Name", text: $name)
                    TextField("Spot's Address", text: $address)
                    TextField("Spot's Surf Break", text: $surfBreak)
                    TextField("Image (url only)", text : $img)
                }
                Section(header: Text("Other Information")){
                    Text("Spot's Difficulty")
                    Picker("Diff", selection: $diff) {
                        ForEach(difficulties, id: \.self) {
                            Text($0)
                                .padding()
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Spot's Magic Seaweed Link (url)", text: $link)
                    
                    Text("Start of peak season")
                    DatePicker("Start Date", selection: $dateStart, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                    
                    Text("End of peak season")
                    DatePicker("End Date", selection: $dateEnd, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                    
                }
                Section {
                    Button(action: {
                        print("Added")
                    }) {
                        Text("Add a new spot")
                    }
                }
            }
        }
    }
}

struct NewSpot_Previews: PreviewProvider {
    static var previews: some View {
        NewSpot()
    }
}
