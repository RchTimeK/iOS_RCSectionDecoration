//
//  HeaderReusableView.swift
//  RCSectionDecoration
//
//  Created by RongCheng on 2023/6/16.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 200, height: 40))
        label.text = "这是区头"
        label.textColor = .white
        self.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
