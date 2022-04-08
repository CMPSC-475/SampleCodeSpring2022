//
//  PlayerManager+Teams.swift
//  Footballers
//
//  Created by jjh9 on 10/11/21.
//

import Foundation

extension PlayersManager {
    
    //TODO: -
    func teams(for footballers: [Player]) -> [Team] {
        var _teams = [Team]()
        
        for player in footballers {
            if let team = _teams.first(where: {(t) -> Bool in t.name == player.teamname}) {
                team.addPlayer(player)
            } else {
                let newTeam = Team(name: player.teamname)
                newTeam.addPlayer(player)
                _teams.append(newTeam)
            }
        }
        
        return _teams
        
    }
    
}
