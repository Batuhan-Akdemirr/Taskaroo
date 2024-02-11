//
//  AddView.swift
//  Taskaroo
//
//  Created by Batuhan Akdemir on 11.01.2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(ListViewModel.self) private var viewModel
    @Environment(\.dismiss) var dismiss
   
    @State private var textFieldText = ""
    @State private var alertTitle = ""
    @State private var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                     TextField("Type something here...", text: $textFieldText)
                         .padding(.horizontal)
                         .frame(height: 55)
                         .background(Color(UIColor.secondarySystemBackground))
                         .cornerRadius(10)
                     
                     Button(action: saveButtonPress, label: {
                         Text("Save".uppercased())
                             .foregroundColor(.white)
                             .font(.headline)
                             .frame(height: 55)
                             .frame(maxWidth: .infinity)
                             .background(Color.accentColor)
                             .cornerRadius(10)
                     })
                 }
                 .padding(14)
             }
        .navigationTitle("Add an Item  🖊")
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK") {}
        }
      
    }
    
    private func saveButtonPress() {
        if textIsAppropriate() {
            viewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    
   private  func textIsAppropriate() -> Bool {
          if textFieldText.count < 3 {
              alertTitle = "Your new todo item must be at least 3 characters long!!! 😨😰😱"
              showAlert.toggle()
              return false
          }
          return true
      }
}

/*#Preview {
    NavigationStack {
        AddView()
            .environment(ListViewModel())
    }
 
}
*/
