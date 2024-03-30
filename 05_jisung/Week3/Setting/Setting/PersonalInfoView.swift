//
//  PersonalInfoView.swift
//  Setting
//
//  Created by 임지성 on 3/31/24.
//

import SwiftUI

struct PersonalInfoView: View {
    @Binding var firstName: String
    @Binding var lastName: String
    
    @State private var birthday = Date.now
    
    var userBirthday: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.M.dd."
        
        return dateFormatter.string(from: birthday)
    }
    
    @State private var isDatePickerPresented = false
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    NameModifyView(lastName: $lastName, firstName: $firstName)
                } label: {
                    HStack {
                        Text("이름")
                        Spacer()
                        Text(lastName + firstName)
                            .foregroundStyle(.gray)
                    }
                }
                
                Button {
                    withAnimation {
                        isDatePickerPresented = true
                    }
                } label: {
                    HStack {
                        Text("생년월일")
                            .foregroundStyle(.black)
                        Spacer()
                        Text(userBirthday)
                            .foregroundStyle(.gray)
                    }
                }
                
                if isDatePickerPresented {
                    DatePicker("Birthday", selection: $birthday, in: ...Date.now, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .environment(\.locale, Locale(identifier: "ko_KR"))
                }
                
                Section {
                    NavigationLink("커뮤니케이션 환경설정") {
                        
                    }
                }
                
                Button("사용자의 데이터가 어떻게 관리되는지 보기...") {
                    //list테두리 없애니까 클릭 애니메이션이 안보임
                }
                .listRowBackground(Color.clear)
                .frame(alignment: .center)
            }
            .navigationTitle("개인 정보")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(isDatePickerPresented)
            .toolbar {
                if isDatePickerPresented {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("취소") {
                            isDatePickerPresented = false
                            birthday = Date.now
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("완료") {
                            isDatePickerPresented = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PersonalInfoView(firstName: .constant("지성"), lastName: .constant("임"))
}
