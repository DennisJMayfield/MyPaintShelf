//
//  ContentView.swift
//  MyPaintShelf
//
//  Created by Dennis Mayfield on 3/1/23.
//

import SwiftUI



struct ContentView: View {
   
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var paints: FetchedResults<Paint>
    @State private var showingaddPaint = false
    @State private var name: String = ""
    
    func removePaints(at offsets: IndexSet) {
        for index in offsets {
            let paint = paints[index]
            
            moc.delete(paint)
            
            do {
                try moc.save()
            } catch {
                print("Well Whaddya know...")
            }
            
        }
    }
    
    var body: some View {
        
        NavigationView(){
            VStack{
                List{
                    ForEach(paints, id: \.self) { paint in
                        Text(paint.name ?? "No name?")
                        
                    }
                    .onDelete(perform: removePaints)
                  
//                    .navigationBarTitle(Text("My Paint Shelf").font(.largeTitle), displayMode: .inline)
                    .listStyle(.insetGrouped)
                    Spacer()
                }
        
                .navigationBarTitleDisplayMode(.inline)
                        .toolbar { // <2>
                            ToolbarItem(placement: .principal) { // <3>
                                VStack {
                                    Text("My Paint Shelf").font(.headline)
                                    Text("").font(.subheadline)
                                }
                            }
                        }
               
                    Button(action: {showingaddPaint.toggle()}, label: {
                        HStack {
                            Image(systemName: "plus.circle")
                            Text("Add new paint")
                        }
                    })
                    .popover(isPresented: $showingaddPaint) {
                        Form {
                            Section {
                                TextField("Enter paint name", text: $name)
                                    .disableAutocorrection(true)
                                Spacer(minLength: 40)
                                Button ("Save") {
                                    let paint = Paint(context: self.moc)
                                    paint.name = self.name
                                    
                                    do {
                                        try self.moc.save()
                                    } catch {
                                        print("Oh good lort...")
                                    }
                                }
                            }
                        }
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
