//
//  Colors.swift
//  ToDo-SwiftData
//
//  Created by Apetrei Mirel on 30.10.23.
//

import SwiftUI
/// RGBColor struct for handling colors in RGB format.
/// It includes red, green, blue and alpha components.
/// It also provides initializers for creating an RGBColor from a Color and vice versa.
struct RGBColor: Codable {
    var red: Double
    var green: Double
    var blue: Double
    var alpha: Double

    /// Initializer for creating an RGBColor with specified red, green, blue and alpha values.
    init(red: Double, green: Double, blue: Double, alpha: Double) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }

    /// Initializer for creating an RGBColor from a Color.
    init (_ color: Color) {
        let uiColor = UIColor(color)
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        self.red = Double(red)
        self.green = Double(green)
        self.blue = Double(blue)
        self.alpha = Double(alpha)
    }

    /// Function to convert RGBColor to a Color.
    func toSwiftUIColor() -> Color {
        return Color(red: red, green: green, blue: blue, opacity: alpha)
    }
}
