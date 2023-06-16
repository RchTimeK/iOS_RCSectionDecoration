//
//  SectionDecorationFlowLayoutDelegate.swift
//  RCSectionDecoration
//
//  Created by RongCheng on 2023/6/16.
//

import UIKit

// Section 背景的属性，所定义属性的类型需要遵从 NSCopying 协议
class SectionDecorationLayoutAttributes: UICollectionViewLayoutAttributes {
    
    // 背景图片
    var imageName: String?
    // 背景色
    var backgroundColor = UIColor.white
    // 圆角
    var cornerRadius: CGFloat?
    
    /// 重写copy方法
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! SectionDecorationLayoutAttributes
        copy.imageName = self.imageName
        copy.backgroundColor = self.backgroundColor
        copy.cornerRadius = self.cornerRadius
        return copy
    }
    
    /// 所定义属性的类型还要实现相等判断方法（isEqual）
    override func isEqual(_ object: Any?) -> Bool {
        guard let obj = object as? SectionDecorationLayoutAttributes else {
            return false
        }
        if self.imageName != obj.imageName {
            return false
        }
        if self.cornerRadius != obj.cornerRadius {
            return false
        }
        if !self.backgroundColor.isEqual(obj.backgroundColor) {
            return false
        }
        return super.isEqual(object)
    }
}
