//
//  WarplaneModel.swift
//  Warplane
//
//  Created by cmStudent on 2022/08/02.
//

import Foundation


class WarplaneModel: ObservableObject {
    
    @Published var x:Double = 0.0
    @Published var y:Double = 0.0
    @Published var z:Double = 0.0
    
    @Published var speed:Double = 0.0 //2237km/h
    @Published var hight:Double = 0.0
    
    
    
}
