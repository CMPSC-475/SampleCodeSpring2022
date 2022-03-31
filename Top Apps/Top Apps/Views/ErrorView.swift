//
//  ErrorView.swift
//  Top Apps
//
//  Created by Nader Alfares on 3/30/22.
//

import SwiftUI

struct ErrorView: View {
     @Binding var error : HTTPError?
     var body: some View {
         VStack {
             Text("HTTP Error")
             Text("Status Code: \(error?.response.statusCode ?? 000)")

         }.padding(30)
             .background(.gray)
             .cornerRadius(25)
     }
 }

 struct ErrorView_Previews: PreviewProvider {
     static var previews: some View {
         ErrorView(error: .constant(HTTPError(response: HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 000, httpVersion: nil, headerFields: nil)!)))
     }
 }
