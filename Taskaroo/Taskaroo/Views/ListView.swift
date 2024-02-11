//
//  ListView.swift
//  Taskaroo
//
//  Created by Batuhan Akdemir on 11.01.2024.
//

import SwiftUI

struct ListView: View {
    
    @Environment(ListViewModel.self) private var viewModel
    
    var body: some View {
        
        ZStack {
            if(viewModel.items.isEmpty) {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(viewModel.items ) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    viewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: viewModel.deleteItem)
                    .onMove(perform: viewModel.moveItem)
                }
                .listStyle(.plain)
            }
        }
      
      
        .navigationTitle("Taskaroo 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
    }
}

/*#Preview {
    NavigationStack {
        ListView()
            .environment(ListViewModel())
    }
   
}
*/
