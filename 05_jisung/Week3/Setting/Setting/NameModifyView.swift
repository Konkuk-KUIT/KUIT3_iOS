//
//  NameModifyView.swift
//  Setting
//
//  Created by 임지성 on 3/31/24.
//

import SwiftUI

struct NameModifyView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var userLastName = ""
    @State private var userFirstName = ""
    
    @Binding var lastName: String
    @Binding var firstName: String
    
    var body: some View {
        NavigationStack {
            Form {
                HStack(spacing: 60) {
                    Text("성")
                        .frame(width: 30, alignment: .leading)
                    TextField("필수사항", text: $userLastName)
                }
                HStack(spacing: 60) {
                    Text("이름")
                        .frame(width: 30, alignment: .leading)
                    TextField("필수사항", text: $userFirstName)
                }
            }
            .navigationTitle("이름")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("뒤로")
                        }
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("완료", action: saveName)
                        .disabled(userLastName == "" || userFirstName == "")
                }
            }
        }
    }
    
    func saveName() {
        lastName = userLastName
        firstName = userFirstName
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    NameModifyView(lastName: .constant("임"), firstName: .constant("지성"))
}
