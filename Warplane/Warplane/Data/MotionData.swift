//
//  Point.swift
//  Warplane
//
//  Created by cmStudent on 2022/07/29.
//

import Foundation

class MotionData: ObservableObject {
    @Published var x:Double = 0.0
    @Published var y:Double = 0.0
    @Published var z:Double = 0.0
    
    @Published var roll:Double = 0.0
    @Published var pitch:Double = 0.0
    @Published var yaw:Double = 0.0
    
    init(x:Double,y:Double,z:Double,roll:Double,pitch:Double,yaw:Double) {
        self.x = x
        self.y = y
        self.z = z
        
        self.roll = roll
        self.pitch = pitch
        self.yaw = yaw
        
    }
}
