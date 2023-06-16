//
//  ViewController.swift
//  RCSectionDecoration
//
//  Created by RongCheng on 2023/6/16.
//

import UIKit

class ViewController: UIViewController {

    private var collectionView: UICollectionView!
    private static let CellID = "CellID"
    private static let HeaderID = "HeaderID"
    private static let FooterID = "FooterID"
    private let sections = [6,3,8,5,7]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        setupCollectionView()
    }
}
// 设置的sectionInset，设置的是每个区内的区头和区尾到本区的Cell之间的距离，并不是到上一个区尾的距离
private extension ViewController {

    func setupCollectionView(){
        let kWidth = UIScreen.main.bounds.width
        let kHeight = UIScreen.main.bounds.height
        
        let itemW: CGFloat = (kWidth-70)*0.25
        let itemH: CGFloat = itemW
        let layout = SectionDecorationFlowLayout()
        layout.sectionDelegate = self
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.headerReferenceSize = CGSize(width: kWidth, height: 40)
        layout.footerReferenceSize = CGSize(width: kWidth, height: 40)
        layout.itemSize = CGSize(width: itemW, height: itemH)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: kWidth, height: kHeight), collectionViewLayout: layout)
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .orange
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.dragInteractionEnabled = true
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: Self.CellID)
        collectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Self.HeaderID)
        collectionView.register(FooterReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: Self.FooterID)
        view.addSubview(collectionView)
    }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        5
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section]
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.CellID, for: indexPath) as! CollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Self.HeaderID, for: indexPath) as! HeaderReusableView
            return header
        }else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: Self.FooterID, for: indexPath) as! FooterReusableView
            return footer
        }
    }
    
}

extension ViewController: SectionDecorationFlowLayoutDelegate {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: SectionDecorationFlowLayout, marginForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: SectionDecorationFlowLayout, cornerRadiusForSectionAt section: Int) -> CGFloat? {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: SectionDecorationFlowLayout, backgroundColorForSectionAt section: Int) -> UIColor {
        .randomColor()
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: SectionDecorationFlowLayout, headerForSectionAt section: Int) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: 40)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: SectionDecorationFlowLayout, footerForSectionAt section: Int) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: SectionDecorationFlowLayout, backgroundImageForSectionAt section: Int) -> String? {
        if section == 0 {
            return "https://img2.baidu.com/it/u=1738681348,1945875603&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500"
        }else if section == 2 {
            return "https://img0.baidu.com/it/u=2543642668,3752110512&fm=253&fmt=auto&app=138&f=JPEG?w=499&h=312"
        }else{
            return nil
        }
    }
}

