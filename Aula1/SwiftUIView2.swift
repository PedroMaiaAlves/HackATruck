//
//  SwiftUIView2.swift
//  Aula1
//
//  Created by Turma01-23 on 19/03/25.
//

import SwiftUI

struct SwiftUIView2: View {
    @State private var username: String = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack{
            Text("Bem-Vindo, \(username)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading){
                TextField("Usename", text: $username)
            }.padding()
        }
        Spacer()
        ZStack{
            Image("imgFundo").resizable().opacity(0.3)
            Image("imgFrente").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        }
        VStack{
            Button("Alerta"){
                showAlert = true
            }
            .alert(isPresented: $showAlert){
                Alert(
                    title: Text("Alerta"),
                    message: Text("Voce esta usando um alert do Swift UI"),
                    primaryButton: .cancel(Text("Fechar")), secondaryButton: .destructive(Text("Fechar Tambem"))
                )
            }
        }
    }
}

#Preview {
    SwiftUIView2()
}
