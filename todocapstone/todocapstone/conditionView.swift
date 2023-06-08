//
//  conditionView.swift
//  capstone_immune
//
//  Created by hufsaim on 2023/06/06.
//

import SwiftUI
import Combine

struct conditionView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var fatigue : FetchedResults<Fatigue>
    @State private var showingAddScreen = false
    var body: some View {
        NavigationView{
            List{
                ForEach(fatigue){ fatigue in
                    NavigationLink{
                        Text("\(fatigue.fatigue)")
                    } label : {
                        VStack(alignment: .leading) {
                            Text("")
                                .font(.headline)
                        }
                    }
                }
                .onDelete(perform: deleteData)
            }.navigationTitle("Condition")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            showingAddScreen.toggle()
                        } label : {
                            Label("Add Condition",systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    Addview()
                }
        }
            
        }
    func deleteData(at offsets : IndexSet){
        for offset in offsets{
            let data = fatigue[offset]
            moc.delete(data)
        }
        try? moc.save()
    }
    }


struct conditionView_Previews: PreviewProvider {
    static var previews: some View {
        conditionView()
    }
}
