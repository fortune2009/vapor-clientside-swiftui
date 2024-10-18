//
//  SongList.swift
//  YT-Vapor-iOS-App
//
//  Created by Fortune David Chigozirim on 29/05/2024.
//

import SwiftUI

struct SongList: View {
    
    @StateObject var viewModel = SongListVIewModel()
    
    @State var modal: ModalType? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.songs) {
                    song in
                    Button {
                        modal = .update(song)
                        print("update song")
                    } label: {
                        Text(song.title)
                            .font(.title)
                            .foregroundColor(Color(.label))
                    }
                }.onDelete(perform: viewModel.delete)
            }
            .font(.system(size: 3))
            .navigationTitle(Text("🎵 Songs"))
            .toolbar {
                Button {
                    print("add song")
                    modal = .add
                } label: {
                    Label("Add Song", systemImage: "plus.circle")
                }
            }
        }
        .sheet(item: $modal, onDismiss: {
            // on dismiss code
            Task{
                do {
                    try await viewModel.fetchSongs()
                } catch {
                    print("X Error: \(error)")
                }
            }
        }) { modal in
            switch modal {
            case .add:
                AddUpdateSong(viewModel: AddUpdateSongViewModel())
            case .update(let song):
                AddUpdateSong(viewModel: AddUpdateSongViewModel(currentSong: song))
            }
            
        }
        .onAppear{
            Task {
                do{
                    try await viewModel.fetchSongs()
                } catch {
                    print("X Error: \(error)")
                }
                
            }
        }
    }
}

#Preview {
    SongList()
}
