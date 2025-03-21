//
//  CinzaUIView.swift
//  Aula3-Desafio1
//
//  Created by Turma01-23 on 21/03/25.
//

import SwiftUI

struct CinzaUIView: View {
    var body: some View {
        VStack{
            ZStack{
                Color.gray
                    .ignoresSafeArea(edges: .top)
                            Circle().scaledToFit()
                            Image(systemName:"paintpalette")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.gray)
                                .frame(width: 300, height: 300)
                                
            }
        }
    }
}

#Preview {
    CinzaUIView()
}
