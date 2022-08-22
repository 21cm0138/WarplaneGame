//
//  ContentViewModel.swift
//  Warplane
//
//  Created by cmStudent on 2022/07/29.
//

import Foundation


final class ContentViewModel: ObservableObject {
    let deviceMotionManager = DeviceMotionManager.shared
    
    func updateAcceleration(handler: @escaping (MotionData) -> Void){
        deviceMotionManager.startQueuedUpdate{ motionData in
            
            handler(motionData)
            
        }
        
    }
}
