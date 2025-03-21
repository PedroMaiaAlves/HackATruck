//
//  Modo1UIView.swift
//  Aula3-Desafio2
//
//  Created by Turma01-23 on 21/03/25.
//

import SwiftUI

struct Modo1UIView: View {
    var body: some View {
        ZStack{
            Color.azul
                .ignoresSafeArea()
            Spacer()
            
            ZStack{
                VStack{
                    Text("Modo 1").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundStyle(.white)
                    Spacer()
                }
                Spacer()
                Rectangle()
                    .frame(width: 250, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                VStack{
                    Text("Nome: Pedro").foregroundStyle(.white)
                    Text("Sobrenome: Maia").foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    Modo1UIView()
}
