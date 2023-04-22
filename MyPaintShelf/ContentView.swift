//
//  ContentView.swift
//  MyPaintShelf
//
//  Created by Dennis Mayfield on 3/1/23.
//

import SwiftUI



struct ContentView: View {
    init() {
           //Use this if NavigationBarTitle is with Large Font
           //UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 20)!]

           //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "AcademyEngravedLetPlain", size: 34)!]
       }
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var paints: FetchedResults<Paint>
    @State private var showingaddPaint = false
    @State private var name: String = ""
    
    var body: some View {
        NavigationView(){
            VStack{
                List{
                    Text("Paint")
                    
                }
                //.navigationBarTitle(Text("Dashboard").font(.subheadline), displayMode: .large)
                .navigationBarTitle (Text("My Paint Shelf").font(.largeTitle), displayMode: .inline)
                
                .listStyle(.insetGrouped)
                Button(action: {}, label: {
                    HStack {
                        Image(systemName: "plus.circle")
                        Text("Add new paint")
                    }
                })
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
