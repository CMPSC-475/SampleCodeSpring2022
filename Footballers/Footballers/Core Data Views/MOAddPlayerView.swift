//
//  MOAddPlayerView.swift
//  Footballers
//
//  Created by jjh9 on 10/19/21.
//

import SwiftUI

struct MOAddPlayerView: View {
    @EnvironmentObject var manager : PlayersManager
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \TeamMO.name, ascending: true)],
                      animation: .default)
        private var teams: FetchedResults<TeamMO>
    
    @Environment(\.dismiss) var dismiss
    
    @State private var firstname : String = ""
    @State private var lastname : String = ""
    @State private var teamname : String = ""
    @State private var country : String = ""
    
    enum Field: Hashable {
        case firstname, lastname, teamname, country
    }
    @FocusState private var focusedField: Field?
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Enter Player Details")) {
                    TextField("First Name", text: $firstname)
                        .focused($focusedField, equals: .firstname)
                    
                    TextField("Last Name", text: $lastname)
                        .focused($focusedField, equals: .lastname)
                    
                    Picker("Team", selection: $teamname) {
                        ForEach(manager.teams.map{$0.name}, id:\.self) {name in
                            Text(name)
                        }
                    }
                    .focused($focusedField, equals: .teamname)
                    
                    TextField("Country", text: $country)
                        .focused($focusedField, equals: .country)
                    
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {dismiss()}
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        if firstname.isEmpty {
                            focusedField = .firstname
                        } else if lastname.isEmpty {
                            focusedField = .lastname
                        } else if teamname.isEmpty {
                            focusedField = .teamname  // doesn't do anything.  Need more here
                        } else if country.isEmpty {
                            focusedField = .country
                        } else {
                            
                            let player = Player(firstname: firstname, lastname: lastname, team: teamname, country: country)
                            //self.manager.addPlayer(player: player)
                            addPlayer(player: player)
                            dismiss()
                            
                        }
                    }
                }
            }
        }
    }
        func addPlayer(player:Player) {
            let newPlayer = PlayerMO(context: viewContext)
            newPlayer.firstname = player.firstname
            newPlayer.lastname = player.lastname
            newPlayer.country = player.country
            newPlayer.info = player.info
            if let team = teams.first(where: { (teamMO) -> Bool  in
                                        teamMO.name == player.teamname}) {
                newPlayer.team = team
            } else {  // new team
                let newTeam = TeamMO(context: viewContext)
                newTeam.name = player.teamname
                newTeam.addToRoster(newPlayer)
            }
        }
    private var isValid : Bool {[firstname,lastname,teamname,country].allSatisfy{!$0.isEmpty}}
    }
    



struct MOAddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MOAddPlayerView()
    }
}
