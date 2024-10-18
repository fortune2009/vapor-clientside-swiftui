//
//  AddUpdateSong.swift
//  YT-Vapor-iOS-App
//
//  Created by Fortune David Chigozirim on 12/06/2024.
//

import SwiftUI

struct AddUpdateSong: View {
    @ObservedObject var viewModel: AddUpdateSongViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextField("song title", text: $viewModel.songTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button {
                viewModel.addUpdateAction {
                    presentationMode.wrappedValue.dismiss()
                }
                
            } label: {
                Text(viewModel.buttonTitle)
            }
        }
    }
}

#Preview {
    AddUpdateSong(viewModel: AddUpdateSongViewModel())
}
