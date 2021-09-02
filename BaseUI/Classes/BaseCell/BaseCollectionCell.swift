//
//  BaseCollectionCell.swift
//  BaseUI
//
//  Created by flowerflower on 2021/8/30.
//

import Foundation

open class BaseCollectionCell: UICollectionViewCell{
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// 设置子视图
    open  func setupSubViews(){
        
        
    }
    
    /// 设置布局
    open  func setupConstraints(){
        
        
    }
    
}

