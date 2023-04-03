//
//  LoginView.swift
//  CJB
//
//  Created by 봉주헌 on 2023/03/24.
//

import SwiftUI

struct LoginView: View {
    @State var FirstView = false
    @State private var User_id: String = ""
    @State private var User_password: String = ""
    var body: some View {
        NavigationView{
            ZStack{
                Color(hex: 0xF193B8A).ignoresSafeArea()
                
                VStack{
                    Image("로고버튼")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .padding(.bottom)
                    TextField("로그인", text: $User_id)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(50)
                    SecureField("비밀번호", text: $User_password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(50)
                        .padding(.top, 5)
                    NavigationLink(
                        destination: TabbarView(),
                        label: {
                            Text("로그인")
                                .frame(width: 260, height: 10)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(hex: 0x87CEFA))
                                .cornerRadius(50)
                        })
                    .padding([.top, .bottom], 5)
                    VStack{
                        NavigationLink(
                            destination: SignUp(),
                            label:{
                                Text("회원가입")
                                    .padding([.leading, .trailing])
                                    .frame(width: 100, height: 30)
                                    .font(.system(size: 17))
                                    .foregroundColor(Color.white)
                                    .frame(width: 290, alignment: .trailing)
                            })
                    }
                    
                }
            }
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
