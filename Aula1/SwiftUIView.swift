//
//  SwiftUIView.swift
//  Aula1
//
//  Created by Turma01-23 on 19/03/25.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack{
            HStack{
                Image("EngSoft")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                Spacer()
                VStack{
                    Text("Olá")
                    Text("Tudo")
                    Text("Bem?")
                }.padding(50)
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
