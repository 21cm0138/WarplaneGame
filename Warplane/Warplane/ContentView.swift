//
//  ContentView.swift
//  Warplane
//
//  Created by cmStudent on 2022/07/29.
//

import SwiftUI
import CoreMotion
import Foundation

struct ContentView: View {
    private let screenWidth = UIScreen.main.bounds.width
    private  let screenHeight = UIScreen.main.bounds.height
    
    @StateObject private var viewModel: ContentViewModel = .init()
    @State var warplane = WarplaneModel()
    
    
    @State private var collimatorLocation = (x:-100.0,y:-100.0)
    
    @State private var enemyPosition = (x:0.0,y:0.0,z:0)
    @State private var warplanePosition = (x:0.0,y:0.0,z:0.0)
    
    @State private var enemyLocation = (x:100.0,y:100.0)
    @State private var warplaneLocation = (x:0.0,y:0.0)
    
    @State private var countLocation = (x:0.0,y:0.0)
    @State private var missileLocation = (x:0.0,y:0.0)
    
    //旋转角
    @State private var rotationAngle: Angle = Angle(degrees: 0) //← Here
    
    @State private var rotation = 0.0
    @State private var rotationFacePlate: Angle = Angle(degrees:0.0) //← Here
    
    @State private var isShowEnermy = false
    @State private var isShooting = false
    
    //Times
    @State private var timerHandler : Timer?
    @State private var isLocked = false
    @State private var count = 0
    
    @State private var isHighSpeed = false
    
    //Sound
    let soundPlayer = SoundPlayer()
    
    //data
    @State private var hight = 0.0
    @State private var speed = 0.0
    
    var body: some View {
        ZStack{
            Group{
                BackgroundView() //背景
                
                if(isShowEnermy){
                    EnermyView()//敌人
                        .position(x: enemyLocation.x, y: enemyLocation.y)
                }
                
                //导弹
                if(isShooting){
                    MissileView()
                        .position(x: missileLocation.x, y: missileLocation.y)
                }
               
                
                if(isLocked == true){
                    CollimatorView2() //准星
                        .position(x:enemyLocation.x,y:enemyLocation.y + 3)
                }else{
                    CollimatorView() //准星
                        .position(x:collimatorLocation.x,y:collimatorLocation.y)
                }
                
                SpeedView(speed: $speed)
                    .position(x: screenWidth / 2 + 152 , y: collimatorLocation.y) //10系数
                HightView()
                    .position(x: screenWidth / 2 - 152 , y: collimatorLocation.y)
                    
                    
                FacePlateView()//面板
                    .rotationEffect(Angle(degrees: rotation))
            }
           
            
            Group{
                //左
                if(enemyLocation.x < -5 && (enemyLocation.y < screenHeight + 5 || enemyLocation.y < -5)){
                    VStack{
                        Image("mark2")
                            .resizable()
                            .frame(width: 25, height: 8, alignment: .center)
                            .position(x: 11, y: enemyLocation.y)
                    }
                }
                //右
                if(enemyLocation.x > screenWidth + 5 && (enemyLocation.y < screenHeight + 5 || enemyLocation.y < -5)){
                    VStack{
                        Image("mark4")
                            .resizable()
                            .frame(width: 25, height: 8, alignment: .center)
                            .position(x: screenWidth - 11, y: enemyLocation.y)
                    }
                    
                }
                
                //下
                if(enemyLocation.y > screenHeight + 5 && (enemyLocation.x < screenWidth + 5 || enemyLocation.x > -5)){
                    VStack{
                        Image("mark3")
                            .resizable()
                            .frame(width: 8, height: 25, alignment: .center)
                            .position(x: enemyLocation.x, y: screenHeight - 12.5)
                    }
                }
                //上
                if(enemyLocation.y < -5 && (enemyLocation.x < screenWidth + 5 || enemyLocation.x > -5)){
                    VStack{
                        Image("mark1")
                            .resizable()
                            .frame(width: 8, height: 25, alignment: .center)
                            .position(x: enemyLocation.x, y: 12.5)
                    }
                }
                
               
                
            }
            
            Group{
                if(enemyLocation.x < -5 && enemyLocation.y < -5){
                    Image("mark5")
                        .resizable()
                        .frame(width: 26, height: 10, alignment: .center)
                        .position(x:9, y: 5)
                    
                }
                if(enemyLocation.x > screenWidth + 5 && enemyLocation.y < -5){
                    Image("mark6")
                        .resizable()
                        .frame(width: 26, height: 10, alignment: .center)
                        .position(x:screenWidth - 9, y: 5)
                }
                if(enemyLocation.x < -5 && enemyLocation.y > screenHeight + 5){
                    Image("mark8")
                        .resizable()
                        .frame(width: 26, height: 10, alignment: .center)
                        .position(x:9, y: screenHeight - 5)
                }
                if(enemyLocation.x > screenWidth + 5 && enemyLocation.y > screenHeight + 5){
                    Image("mark7")
                        .resizable()
                        .frame(width: 26, height: 10, alignment: .center)
                        .position(x:screenWidth - 9, y: screenHeight - 5)
                }
 
            }
           

            
            VStack{
                Spacer()
                
                HStack{
                    Button{
                        startTimer()//开始计时
                        
                    
                        soundPlayer.playengine()
                        
                        viewModel.updateAcceleration{ motionData in
                            
                            //                        var x = round(motionData.x * 10000) / 10000
                            //                        var y = round(motionData.y * 10000) / 10000
                            //                        var z = round(motionData.z * 10000) / 10000
                            
                            //let roll = round(motionData.roll * 10) / 10 + 30 //前倾角补偿30度
                            let roll = round(motionData.roll * 10) / 10  //未补偿30度
                            let pitch = round(motionData.pitch * 10) / 10
                            //let yaw = round(motionData.yaw * 10) / 10
                            
                            
                            //rotation = pitch * 2 - roll
                            
                            if(pitch >= 30){
                                
                                if(roll >= 30){
                                    rotation = 30 * 2 +  -30 * 30 / 25
                                }else if(roll <= -30){
                                    rotation = 30 * 2 + 30 * 30 / 25
                                }else{
                                    rotation = 30 * 2 +  -roll * 30 / 25
                                }
                                
                            }else if(pitch <= -30){
                                if(roll >= 30){
                                    rotation = -30 * 2 +  -30 * -30 / 25
                                }else if(roll <= -30){
                                    rotation = -30 * 2 +  30 * -30 / 25
                                }else{
                                    rotation = -30 * 2 +  -roll * -30 / 25
                                }
                                
                            }else{
                                if(roll >= 30){
                                    rotation = pitch * 2 +  -30 * pitch / 25
                                }else if(roll <= -30){
                                    rotation = pitch * 2 +  30 * pitch / 25
                                }else{
                                    rotation = pitch * 2 +  -roll * pitch / 25
                                }
                            }
                            
                            
                            
                            if(pitch < -30){
                                collimatorLocation.x = screenWidth / 2 - 36
                                countLocation.x = countLocation.x + 36 / 100
                            }else if(pitch > 30){
                                collimatorLocation.x = screenWidth / 2 + 36
                                countLocation.x = countLocation.x - 36 / 100
                            }else{
                                collimatorLocation.x = screenWidth / 2 + pitch * 1.2
                                countLocation.x = countLocation.x - pitch * 1.2 / 100
                            }
                            
                            if(roll < -30){
                                collimatorLocation.y = screenHeight / 2 + 36
                                countLocation.y = countLocation.y - 36 / 100
                            }else if(roll > 30){
                                collimatorLocation.y = screenHeight / 2 - 36
                                countLocation.y = countLocation.y + 36 / 100
                            }else{
                                collimatorLocation.y = screenHeight / 2 - roll * 1.2
                                countLocation.y = countLocation.y + roll * 1.2 / 100
                            }
                            
                            enemyLocation.x = countLocation.x
                            enemyLocation.y = countLocation.y
                            
                            
                            
                        }
                    }label: {
                        Text("Start")
                            .frame(width: 80, height: 40, alignment: .center)
                            .background(Color.red)
                    }
                    Spacer()
                    Button{
                        //soundPlayer.playLocked()
                        //soundPlayer.playShooting()
                        soundPlayer.playShooting()
                        
                        missileLocation.x = screenWidth / 2
                        missileLocation.y = screenHeight / 2
                        isShooting = true
                        countMissileLocation()

                    }label: {
                        Text("Shoot")
                            .frame(width: 80, height: 40, alignment: .center)
                            .background(Color.red)
                    }
                    
                }
               
            }
        }
    }
    
    func stopTimer(){
        timerHandler?.invalidate()//stop count
    }
    
    func countDownTimer() {
        count += 1
    }
    
    func startTimer() {

        timerHandler = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            countDownTimer()
            if(warplane.speed < 1267){
                warplane.speed = round((warplane.speed + Double(count) * 0.6)*100)/100
            }else if(!isHighSpeed && warplane.speed < 2237){
                warplane.speed = round((warplane.speed + Double(count) * 0.11)*100)/100
            }else{
                isHighSpeed = true
                
                if(collimatorLocation.x - screenWidth / 2 >= 0){
                    warplane.speed = round((2237.2 - (collimatorLocation.x - screenWidth / 2)*3.1)*100)/100
                }else{
                    warplane.speed = round((2237.2 + (collimatorLocation.x - screenWidth / 2)*3.1)*100)/100
                }
                
            }
            speed = warplane.speed
//            print("速度变化量：")
//            print((collimatorLocation.x - screenWidth / 2)*3.1)
//            print(warplane.speed)
            
            
            
//            print("\(countLocation.x) : \(countLocation.y)")
//            print("\(collimatorLocation.x) : \(collimatorLocation.y)")

            
            if(isShooting ){
                missileLocation.x = missileLocation.x + 0
                missileLocation.y = missileLocation.y + -0
                print("x:\(missileLocation.x) y:\(missileLocation.y)")
            }
            
            //Locked
            if(countLocation.x - collimatorLocation.x < 10 && countLocation.x - collimatorLocation.x > -10 && countLocation.y - collimatorLocation.y < 10 && countLocation.y - collimatorLocation.y > -10){
                isLocked = true
            }else if(isLocked && countLocation.x - collimatorLocation.x < 90 && countLocation.x - collimatorLocation.x > -90 && countLocation.y - collimatorLocation.y < 90 && countLocation.y - collimatorLocation.y > -90){
                isLocked = true
            }else{
                isLocked = false
            }
            
            
            if(countLocation.x >= screenWidth/2 - 36 && countLocation.x <= screenWidth/2 + 36 && countLocation.y >= screenHeight/2 - 36 && countLocation.y <= screenHeight/2 + 36 ){
                
                isShowEnermy = true
                
            }else{
                if(count % 4 == 0){
                    isShowEnermy.toggle()
                }
            }
            
            if(isLocked){
                if(count % 2 == 0){
                    soundPlayer.playSearching()
                }
                
            }else if(countLocation.x >= screenWidth/2 - 110 && countLocation.x <= screenWidth/2 + 110 && countLocation.y >= screenHeight/2 - 110 && countLocation.y <= screenHeight/2 + 110 ){
                
                if(count % 5 == 0){
                    soundPlayer.playSearching()

                }
                
            }else{
                if(count % 13 == 0){
                    soundPlayer.playSearching()
                    
                }
            }
            
        }
    }
    
    func countMissileLocation() {


        
        timerHandler = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            print("count Missile")
            //print("go")
            let distance_x = enemyLocation.x - missileLocation.x
            let distance_y = enemyLocation.y - missileLocation.y
            
           let distance =  sqrt(distance_x * distance_x + distance_y + distance_y)
                  print("distance = \(distance)")
            
            let speed_x = distance_x / distance * 2
            let speed_y = distance_y / distance * 2
            print("speed x = \(speed_x) y = \(speed_y)")
            
            if( distance_x > 0){
                missileLocation.x -= speed_x
            }else if(distance_x == 0){
                missileLocation.x += 0
            }else if(distance_x < 0){
                missileLocation.x += speed_x
            }
            
            if( distance_y > 0){
                missileLocation.y -= speed_y
            }else if(distance_y == 0){
                missileLocation.y += 0
            }else if(distance_y < 0){
                missileLocation.y += speed_y
            }
            
            if( (distance_x <= 10 && distance_x >= -10) && (distance_y <= 10 && distance_y >= -10) ){
                print("get------------>")
                timerHandler?.invalidate()//停止计时器
                //isShowEnermy = false
                
                isShooting = false
                

            }
            
            
        }
        

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}


