//
//  HTTPError.swift
//  Top Apps
//
//  Created by Nader Alfares on 3/30/22.
//

import Foundation

struct HTTPError : Error, Identifiable {
     var response: HTTPURLResponse
     var id = UUID()
 }
