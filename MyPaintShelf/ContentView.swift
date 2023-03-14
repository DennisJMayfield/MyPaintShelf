//
//  ContentView.swift
//  MyPaintShelf
//
//  Created by Dennis Mayfield on 3/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(sortDescriptors: []) var paints: FetchedResults<Paint>
    
    var body: some View {
        NavigationView(){
            List{
                Text("Paint")
                
            }
            .navigationTitle("MyPaintShelf")
          
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
