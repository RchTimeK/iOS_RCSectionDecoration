//
//  SectionDecorationFlowLayout.swift
//  RCSectionDecoration
//
//  Created by RongCheng on 2023/6/16.
//

import UIKit

class SectionDecorationFlowLayout: UICollectionViewFlowLayout {
    // 代理
    weak var sectionDelegate: SectionDecorationFlowLayoutDelegate?
    // 保存所有自定义Section的布局属性
    private var sectionDecorationAttrs: [Int:UICollectionViewLayoutAttributes] = [:]
    
    static let SectionBGID = "SectionBGID"
    
    
    override init() {
        super.init()
        // 注册背景
        self.register(SectionDecorationReusableView.self, forDecorationViewOfKind: Self.SectionBGID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 重写布局
    override func prepare() {
        super.prepare()
        // 没有分区退出
        guard let numberOfSections = self.collectionView?.numberOfSections else {
            return
        }
        // 是否代理
        guard let delegate = sectionDelegate else {
            return
        }
        // 先移除所有属性
        if !sectionDecorationAttrs.isEmpty {
            sectionDecorationAttrs.removeAll()
        }
        for section in 0..<numberOfSections {
            // 获取该section下第一个，以及最后一个item的布局属性
            guard let numberOfItems = self.collectionView?.numberOfItems(inSection: section),
                  numberOfItems > 0,
                  let firstItem = self.layoutAttributesForItem(at:
                                                                IndexPath(item: 0, section: section)),
                  let lastItem = self.layoutAttributesForItem(at:
                                                                IndexPath(item: numberOfItems - 1, section: section))
            else {
                continue
            }
            let sectionInset:UIEdgeInsets = self.sectionInset
            let collectionInset = self.collectionView!.contentInset
            // 获取该section的外边距
            let margin = delegate.collectionView(collectionView: self.collectionView!, layout: self,                         marginForSectionAt: section)
            
            // 获取该section header的size
            let headerSize = delegate.collectionView(collectionView: self.collectionView!, layout: self, headerForSectionAt: section)
            
            // 获取该section footer的size
            let footerSize = delegate.collectionView(collectionView: self.collectionView!, layout: self, footerForSectionAt: section)
            
            var decorationFrame:CGRect = .zero
            
            
            if self.scrollDirection == .vertical {
                let x = margin.left
                let y = firstItem.frame.origin.y - sectionInset.top - collectionInset.top + margin.top - headerSize.height
                let w = self.collectionView!.frame.size.width - collectionInset.left - collectionInset.right - margin.left - margin.right
                let h = CGRectGetMaxY(lastItem.frame) - firstItem.frame.origin.y + sectionInset.top + sectionInset.bottom + headerSize.height + footerSize.height  - margin.top - margin.bottom
                
                decorationFrame = CGRect(x: x, y: y, width: w, height: h)
               
            } else {
                let x = margin.left
                let y = firstItem.frame.origin.y - sectionInset.top - collectionInset.top + margin.top - headerSize.height
                let w = self.collectionView!.frame.size.width - collectionInset.left - collectionInset.right - margin.left - margin.right
                let h = CGRectGetMaxY(lastItem.frame) - firstItem.frame.origin.y + sectionInset.top + sectionInset.bottom + headerSize.height + footerSize.height  - margin.top - margin.bottom
                
                decorationFrame = CGRect(x: x, y: y, width: w, height: h)
            }
            
            let attrs = SectionDecorationLayoutAttributes(forDecorationViewOfKind: Self.SectionBGID, with: IndexPath(item: 0, section: section))
            attrs.frame = decorationFrame
            attrs.zIndex = -1 // 最下层
            // 代理获取背景色
            let backgroundColor = delegate.collectionView(self.collectionView!, layout: self, backgroundColorForSectionAt: section)
            attrs.backgroundColor = backgroundColor
            
            // 背景图
            if let imageName = delegate.collectionView(self.collectionView!, layout: self, backgroundImageForSectionAt: section) {
                attrs.imageName = imageName
            }
            
            // 背景圆角
            if let cornerRadius = delegate.collectionView(self.collectionView!, layout: self, cornerRadiusForSectionAt: section) {
                attrs.cornerRadius = cornerRadius
            }
            
            // 保存
            sectionDecorationAttrs[section] = attrs
        }
    }
    
    // 重写DecorationView，
    /*
     If the layout supports any supplementary or decoration view types, it should also implement the respective atIndexPath: methods for those types.
     */
    override func layoutAttributesForDecorationView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let section = indexPath.section
        if elementKind  == Self.SectionBGID {
            return sectionDecorationAttrs[section]
        }
        return super.layoutAttributesForDecorationView(ofKind: elementKind,at: indexPath)
    }
    
    // 返回rect范围下父类的所有元素的布局属性以及子类自定义装饰视图的布局属性
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attrs = super.layoutAttributesForElements(in: rect)
        attrs?.append(contentsOf: sectionDecorationAttrs.values.filter {
            return rect.intersects($0.frame)
        })
        return attrs
    }
    
}
