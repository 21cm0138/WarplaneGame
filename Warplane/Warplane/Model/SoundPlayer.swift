//
//  MusicPlayer.swift
//  Warplane
//
//  Created by cmStudent on 2022/07/30.
//

import UIKit
import AVFoundation
class SoundPlayer: NSObject {
    let sound_searching = NSDataAsset(name: "Sound_rader")!.data //调取数据文件
    let sound_shooting = NSDataAsset(name: "Sound_shooting")!.data //调取数据文件
    let sound_locked = NSDataAsset(name: "Sound_locked")!.data //调取数据文件
    let sound_mic = NSDataAsset(name: "Sound_mic")!.data //调取数据文件
    let sound_speak = NSDataAsset(name: "Sound_speak")!.data //调取数据文件
    let sound_go = NSDataAsset(name: "Sound_go")!.data //调取数据文件
    let sound_engine = NSDataAsset(name: "Sound_engine")!.data //调取数据文件
    
    
    
    
    var soundPlayer: AVAudioPlayer!
    var soundPlayer2: AVAudioPlayer!
    var soundPlayer3: AVAudioPlayer!
    
    func playSearching() {
        do{
            soundPlayer = try AVAudioPlayer(data: sound_locked)
            
            soundPlayer.play()
            
        }catch{
            print("シンバルで、エラーが発生しました！")
        }
    }

    func playengine() {
        do{
            soundPlayer2 = try AVAudioPlayer(data: sound_engine)
            soundPlayer2.play()
            
        }catch{
            print("シンバルで、エラーが発生しました！")
        }
    }
    func playShooting() {
        do{
            soundPlayer3 = try AVAudioPlayer(data: sound_shooting)
            soundPlayer3.play()
            
        }catch{
            print("シンバルで、エラーが発生しました！")
        }
    }
    
    
    
    func SoundStop(){
        soundPlayer.stop()
        
    }

    
}

