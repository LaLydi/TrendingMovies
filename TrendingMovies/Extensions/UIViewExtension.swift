//
//  UIViewExtension.swift
//  TrendingMovies
//
//  Created by Lydia Marion on 05/12/22.
//

import UIKit

extension UIView {
    func round(radius: CGFloat = 10) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addBorder(width: CGFloat, color: CGColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
}
