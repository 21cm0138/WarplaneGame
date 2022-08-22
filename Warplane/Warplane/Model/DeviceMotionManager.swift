//
//  DeviceMotionManager.swift
//  Warplane
//
//  Created by cmStudent on 2022/07/29.
//

import Foundation
import CoreMotion

final class DeviceMotionManager {
    static let shared:DeviceMotionManager = .init()
    private let motion = CMMotionManager()
    private let queue = OperationQueue()
    
    private var x:Double = 0.0
    private var y:Double = 0.0
    private var z:Double = 0.0
    
    private var roll:Double = 0.0
    private var pitch:Double = 0.0
    private var yaw:Double = 0.0
    

    private init(){}
    
    func startQueuedUpdate(handler: @escaping (MotionData) -> Void){
        
        guard motion.isDeviceMotionAvailable else { return }
        motion.deviceMotionUpdateInterval = 1.0 / 100.0  //0.1s间隔
        motion.showsDeviceMovementDisplay = true

        motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical,to: queue){ data, error  in
            
            if let validData = data {
                
                let gravity_x = validData.gravity.x
                let gravity_y = validData.gravity.y
                let gravity_z = validData.gravity.z
                
                let attitude_roll = validData.attitude.roll //角度
                let attitude_pitch = validData.attitude.pitch //左右倾角
                let attitude_yaw = validData.attitude.yaw //左右旋角
                
                //  平放0  -0.45 垂直 -1.6  pai  - +
                
                
//                print("角度 = \(attitude_roll / 314 * 180)")
//                print("左右倾角 = \(attitude_pitch / 314 * 180)")
//                print("左右旋角 = \(attitude_yaw / 314 * 180)")
                
                self.x = gravity_x
                self.y = gravity_y
                self.z = gravity_z
                self.roll = attitude_roll * 100
                self.pitch = attitude_pitch * 100
                self.yaw = attitude_yaw * 100
                

                let motionData = MotionData(x: self.x, y: self.y, z: self.z, roll: self.roll, pitch: self.pitch, yaw: self.yaw)
                handler(motionData)
            }
            
        }
    }
    
}

