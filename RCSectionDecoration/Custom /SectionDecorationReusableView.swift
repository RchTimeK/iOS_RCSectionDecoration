//
//  SectionDecorationReusableView.swift
//  RCSectionDecoration
//
//  Created by RongCheng on 2023/6/16.
//

import UIKit
import Kingfisher
class SectionDecorationReusableView: UICollectionReusableView {
    // 新建UIImageView
    private lazy var bgImageView: UIImageView = {
        let imageView = UIImageView()
        self.addSubview(imageView)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        guard let att = layoutAttributes as? SectionDecorationLayoutAttributes else {
            return
        }
        self.backgroundColor = .clear
        bgImageView.frame = att.bounds
        
        if let cornerRadius = att.cornerRadius {
            bgImageView.clipsToBounds = true
            bgImageView.layer.cornerRadius = cornerRadius
        }
        
        bgImageView.backgroundColor = att.backgroundColor
        
        if let imageName = att.imageName {
            if imageName.hasPrefix("http") {
                bgImageView.kf.setImage(with: URL(string: imageName))
            }else{
                bgImageView.image = UIImage(named: imageName)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


/*
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 https://askzybf.com/20221020/pReuMMRu/index.m3u8
 https://askzybf.com/20221010/FZqueoo9/index.m3u8
 https://askzybf.com/20221003/erPnKA9B/index.m3u8
 https://askzybf.com/20221003/ytACTvIW/index.m3u
 https://askzybf.com/20221003/GFCeffRo/index.m3u8
 https://askzybf.com/20221108/RyeY6mNp/index.m3u8
 https://askzybf.com/20221109/fcCvVu6C/index.m3u8
 https://askzybf.com/20221109/No5cxtDG/index.m3u8
 https://askzybf.com/20221110/5RJf8GW4/index.m3u8
 https://askzybf.com/20221111/rWgfyuQJ/index.m3u8
 https://askzybf.com/20221113/Qgi9vznx/index.m3u8
 https://askzybf.com/20230604/EcBrEvZj/index.m3u8
 https://askzybf.com/20230603/boXrIXCp/index.m3u8
 https://askzybf.com/20230530/zdLUhCHm/index.m3u8
 https://siwazywcdn3.com:5278/cvguochanzipai/mkTIuOZR/index.m3u8
 https://askzybf.com/20230515/bDzdMr4S/index.m3u8
 https://askzybf.com/20230514/zV0iK2vq/index.m3u8
 https://siwazywcdn2.com:5278/jiaguochanzipai/kpLTdajB/index.m3u8
 https://siwazywcdn2.com:5278/jiaguochanzipai/aRcjetun/index.m3u8
 https://play1.laoyacdn.com/20220304/DyWxqtgI/index.m3u8
 https://play1.laoyacdn.com/20220306/85D7eMnr/index.m3u8
 https://askzybf.com/20221015/H2ga7nsn/index.m3u8
 https://askzybf.com/20221122/IX3CdgI3/index.m3u8
 
 */
