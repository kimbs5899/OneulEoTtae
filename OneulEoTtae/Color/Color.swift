//
//  Color.swift
//  OneulEoTtae
//
//  Created by 박찬호 on 1/28/24.
//

import SwiftUI
import UIKit

// MARK: - Convenience Initializers
extension Color {
    public init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(
            red: Double(red) / 255.0,
            green: Double(green) / 255.0,
            blue: Double(blue) / 255.0
        )
    }
    
    public init(hex: Int) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF
        )
    }
    
    init(hexCode: String) {
        var formattedHex = hexCode.trimmingCharacters(in: .whitespacesAndNewlines)
        formattedHex = formattedHex.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: formattedHex).scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

// MARK: - Helpers

public extension Color {
    var uiColor: UIColor {
        UIColor(self)
    }
    
    static var Blue1_OET: Color {
        return .init(hexCode: "#274984")
    }
    
    static var Blue2_OET: Color {
        return .init(hexCode: "#2B83BC")
    }
    
    static var Blue3_OET: Color {
        return .init(hexCode: "#91CDE3")
    }
    
    static var Blue4_OET: Color {
        return .init(hexCode: "#3D5A9A")
    }
    
    static var Blue5_OET: Color {
        return .init(hexCode: "#646B96")
    }
    
    static var Blak_OET: Color {
        return .init(hexCode: "#000000")
    }
    
    static var Gray1_OET: Color {
        return .init(hexCode: "##8B8F9F")
    }
    
    static var Gray2_OET: Color {
        return .init(hexCode: "#AEB1BC")
    }
    
    static var White_OET: Color {
        return .init(hexCode: "#FFFFFF")
    }
    
    static var YellowGreenGradient_OET: LinearGradient {
            LinearGradient(
                gradient: Gradient(colors: [Color(hexCode: "#FFD91E"), Color(hexCode: "#A5ED49")]),
                startPoint: .leading,
                endPoint: .trailing
            )
        }
}
