//
//  BaseCollectionCell.swift
//  BaseUI
//
//  Created by flowerflower on 2021/8/30.
//

import Foundation
import SnapKit
import XMUtil
open class BaseCollectionCell: UICollectionViewCell{
    
    public lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = kThemeColor
        return label
    }()
    
    public lazy var imgView : UIImageView = {
        let img = UIImageView()
        return img
    }()
    

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
        setupConstraints()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 设置子视图
    open  func setupSubViews(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(imgView)
    }
    
    /// 设置布局
    open  func setupConstraints(){
        
        imgView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.width.height.equalTo(60)
            $0.centerX.equalToSuperview()
        }
        titleLabel.snp.makeConstraints{
            $0.left.right.equalToSuperview()
            $0.top.equalTo(imgView.snp_bottom).offset(4)
        }
        
    }
    
}

