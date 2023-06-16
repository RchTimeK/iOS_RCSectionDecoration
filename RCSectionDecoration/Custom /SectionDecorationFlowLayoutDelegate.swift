//
//  SectionDecorationFlowLayoutDelegate.swift
//  RCSectionDecoration
//
//  Created by RongCheng on 2023/6/16.
//

import UIKit

protocol SectionDecorationFlowLayoutDelegate: NSObjectProtocol {
    
    /// 设置Section背景色，默认：white
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: SectionDecorationFlowLayout,
                        backgroundColorForSectionAt section: Int) -> UIColor
    
    /// 设置Section的背景图片，默认：nil（简单判断下：根据是否含http判断是网络图片还是本地图片）
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: SectionDecorationFlowLayout,
                        backgroundImageForSectionAt section: Int) -> String?
    
    /// 设置Section背景圆角，默认：nil
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: SectionDecorationFlowLayout,
                        cornerRadiusForSectionAt section: Int) -> CGFloat?
    
    /// 设置Section背景的外间距，默认：UIEdgeInsets.zero
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: SectionDecorationFlowLayout,
                        marginForSectionAt section: Int) -> UIEdgeInsets
    
    /// 设置Section Header 宽高，默认：CGSizeZero
    func collectionView(collectionView: UICollectionView,
                         layout collectionViewLayout:SectionDecorationFlowLayout,
                         headerForSectionAt section: Int) -> CGSize
    
    /// 设置Section Footer 宽高，默认：CGSizeZero
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout:SectionDecorationFlowLayout,
                        footerForSectionAt section: Int) -> CGSize
}

extension SectionDecorationFlowLayoutDelegate {
    // 设置Section背景色，默认为白色
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: SectionDecorationFlowLayout,
                        backgroundColorForSectionAt section: Int) -> UIColor {
        .white
    }
    
    // 设置Section的背景图片（简单判断下：根据是否含http判断是网络图片还是本地图片）
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: SectionDecorationFlowLayout,
                        backgroundImageForSectionAt section: Int) -> String? {
        nil
    }
    
    // 设置Section背景圆角，默认值为nil
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: SectionDecorationFlowLayout,
                        cornerRadiusForSectionAt section: Int) -> CGFloat? {
        nil
    }
    
    // 设置Section背景的间距，默认
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: SectionDecorationFlowLayout,
                                                marginForSectionAt section: Int) -> UIEdgeInsets {
        .zero
    }
    
    // 设置Section Header 宽高
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout:SectionDecorationFlowLayout,
                        headerForSectionAt section: Int) -> CGSize {
        .zero
    }
    
    // 设置Section Footer 宽高
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout:SectionDecorationFlowLayout,
                        footerForSectionAt section: Int) -> CGSize {
        .zero
    }
}
