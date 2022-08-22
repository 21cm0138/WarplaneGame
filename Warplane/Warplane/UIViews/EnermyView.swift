//
//  EnermyView.swift
//  Warplane
//
//  Created by cmStudent on 2022/07/30.
//

import SwiftUI

struct EnermyView: View {
    var body: some View {
        VStack{
            Image("enermy")
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
                
        }
    }
}

struct EnermyView_Previews: PreviewProvider {
    static var previews: some View {
        EnermyView()
    }
}
