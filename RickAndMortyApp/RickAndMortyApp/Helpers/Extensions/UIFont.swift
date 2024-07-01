//
//  UIFont.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 1/7/24.
//

import SwiftUI

extension UIFont {
    static func robotoBold(size: CGFloat) -> UIFont? {
        UIFont(name: "Roboto-Bold", size: size)
    }

    static func robotoLight(size: CGFloat) -> UIFont? {
        UIFont(name:"Roboto-Light", size: size)
    }

    static func robotoMedium(size: CGFloat) -> UIFont? {
        UIFont(name:"Roboto-Medium", size: size)
    }
    
    static func robotoRegular(size: CGFloat) -> UIFont? {
        UIFont(name:"Roboto-Regular", size: size)
    }

    static func bangers(size: CGFloat) -> UIFont? {
        UIFont(name:"Bangers", size: size)
    }
}
