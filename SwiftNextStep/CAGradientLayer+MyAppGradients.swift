//
//  CAGradientLayer+MyAppGradients.swift
//  SwiftNextStep
//
//  Created by Icaro Barreira Lavrador on 10/09/15.
//  Copyright (c) 2015 Icaro Barreira Lavrador. All rights reserved.
//

extension CAGradientLayer{
    
    func LoginAppGradiend() -> CAGradientLayer{
        
        let startColor = UIColor.color1()
        let endColor = UIColor.color2()
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [startColor.CGColor, endColor.CGColor]
        gradientLayer.startPoint = CGPointMake(0.5, 0.0)
        gradientLayer.endPoint = CGPointMake(0.5, 1.0)
        gradientLayer.opacity = 1
        
        return gradientLayer
    }
}
