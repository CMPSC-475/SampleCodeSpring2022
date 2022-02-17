//
//  ConfirmationDialog.swift
//  SwiftUI Examples
//
//  Created by Nader Alfares on 2/16/22.
//

import SwiftUI

struct ConfirmationDialogView: View {
    @State var textColor : Color = .blue
    @State var showDialog : Bool = false
    var body: some View {
        NavigationView{
            VStack {
                Text("The Best Application Built Ever...")
                    .bold()
                    .font(.system(size: 50))
                    .foregroundColor(textColor)
            }
            .toolbar(content: {
                Button("Change Color") {
                    showDialog = true
                }
                .confirmationDialog("Pick a color", isPresented: $showDialog, actions: {
                    Button("Red"){textColor = .red}
                    Button("Green"){textColor = .green}
                    Button("Blue"){textColor = .blue}
                })
            })

        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ConfirmationDialogView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationDialogView()
    }
}
