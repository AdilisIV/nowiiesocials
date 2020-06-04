//
//  CustomDigitsPageControl.swift
//  nowiiesocials
//
//  Created by user on 03.06.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import UIKit

class CustomDigitsPageControl: UIPageControl {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard !subviews.isEmpty else { return }
        
        let spacing: CGFloat = 8
        
        let width: CGFloat = 44
        
        let height: CGFloat = 44
        
        var total: CGFloat = 0
        
        for (index, view) in subviews.enumerated() {
            let labelView = UILabel()
            labelView.font = .systemFont(ofSize: 14)
            
            if index == self.currentPage {
                labelView.textColor = .white
            } else {
                labelView.textColor = .black
            }
            
            labelView.text = "0\(index+1)"
            labelView.frame = CGRect(x: 14, y: 12, width: width, height: 20)
            view.addSubview(labelView)
            
            view.layer.cornerRadius = 22
            view.frame = CGRect(x: total, y: frame.size.height / 2 - height / 2, width: width, height: height)
            
            total += width + spacing
        }
        
        total -= spacing
        
        frame.origin.x = frame.origin.x + frame.size.width / 2 - total / 2
        frame.size.width = total
    }
}
