//
//  AzulUIView.swift
//  Aula3-Desafio1
//
//  Created by Turma01-23 on 21/03/25.
//

import SwiftUI

struct AzulUIView: View {
    var body: some View {
        VStack{
            ZStack{
                Color.blue
                    .ignoresSafeArea(edges: .top)
                            Circle().scaledToFit()
                            Image(systemName:"paintbrush.pointed")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.blue)
                                .frame(width: 300, height: 300)
                                
            }
        }
    }
}

#Preview {
    AzulUIView()
}
