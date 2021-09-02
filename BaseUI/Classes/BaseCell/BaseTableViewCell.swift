//
//  BaseTableViewCell.swift
//  BaseUI
//
//  Created by flowerflower on 2021/8/30.
//

import Foundation

open class BaseTableViewCell: UITableViewCell{
    
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
