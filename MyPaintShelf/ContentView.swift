//
//  ContentView.swift
//  MyPaintShelf
//
//  Created by Dennis Mayfield on 3/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(sortDescriptors: []) var paints: FetchedResults<Paint>
    @State private var showingaddPaint = false
    @State private var name: String = ""
    
    var body: some View {
        NavigationView(){
            VStack{
                List{
                    Text("Paint")
                    
                }
                .navigationTitle("MyPaintShelf")
                Button("Add Paint") {
                    showingaddPaint = true
                }
                .buttonStyle(.borderedProminent)
                .popover(isPresented: $showingaddPaint) {
                    TextField("Enter your paint name.", text:$name)
                        .font(.headline)
                        .padding()
                        
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
