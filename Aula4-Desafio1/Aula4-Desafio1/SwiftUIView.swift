//
//  SwiftUIView.swift
//  Aula4-Desafio1
//
//  Created by Turma01-23 on 24/03/25.
//

import SwiftUI

struct SwiftUIView: View {
    var musica: Song
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                Spacer()
                VStack{
                    AsyncImage(url: URL(string: musica.capa)) {
                        phase in switch phase {
                        case .empty:
                            ProgressView()
                        case . success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        case .failure(_):
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                        }
                    }.frame(width:20 ,height: 200)
                    Text(musica.name)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text(musica.artist)
                        .font(.subheadline)
                        .foregroundStyle(.white)
                }
               Spacer()
                HStack(spacing:30){
                    Image(systemName: "shuffle")
                    Image(systemName: "backward.end.fill")
                    Image(systemName: "play.fill")
                    Image(systemName: "forward.end.fill")
                    Image(systemName: "repeat")
                }
                .foregroundStyle(.white)
                Spacer()
            }
        }
    }
}

#Preview {
    SwiftUIView(musica: arrayMusicas[0])
}
