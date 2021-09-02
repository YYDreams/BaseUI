//
//  NMRequestEmptyDataView.swift
//  NMDiscoverUI
//
//  Created by flowerflower on 2021/8/15.
//

import UIKit
import SnapKit


/// 缺省页事件回调类型
public enum NMDefaultViewClickType: Int {
    /// 点击文字事件类型
    case clickTitleType
    /// 点击刷新按钮类型
    case clickRefrashType
}


public class NMRequestEmptyDataView: UIView {
    
    /// 点击回调block
    public var clickBlock: ((NMDefaultViewClickType)->Void)?
    
    /// 缺省图
    public lazy var imgView: UIImageView = {
        let imgView = UIImageView()
//        let imgView = UIImageView.init(image: UIImage.init(named: "emptypage_404",
//                                                           in: NMBundleUtil.getCurrentBundle(), compatibleWith: nil))
        imgView.contentMode = .center
        imgView.isUserInteractionEnabled = true
        return imgView
    }()
    /// 内容标题
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init("#ADADB4")
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(clickRefrash))
        // 点击刷新事件
        label.addGestureRecognizer(tapGesture);
        label.numberOfLines = 0
        return label
    }()
    
    // 图片上的文字
    public lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init("#ADADB4")
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(clickRefrash))
        // 点击刷新事件
        label.addGestureRecognizer(tapGesture);
        label.numberOfLines = 0
        return label
    }()
    
    
    /// 刷新按钮
    public lazy var refrashButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(clickRefrashMenthod), for: .touchUpInside)
        button.isHidden = true
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.init("#105CFB").cgColor
        button.setTitle("刷新", for: .normal)
        button.setTitleColor(UIColor.init("#105CFB"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func showNetworkErrorView(){
        
    }
    
    public func showNoDataView(){
        
    }
    
    public func showNoData(title: String, imageUrl:String){
        
        
        
    }
    
    
    
    
    
    
    /// 配置文案和图片
    public func configData(_ title: String, imageUrl: String, isShowSubTitle: Bool) {
        if isShowSubTitle {
            subTitleLabel.text = title
        } else {
            titleLabel.text = title
        }
        imgView.image = UIImage.init(named: imageUrl)
    }
    
    func setupSubView(){
        backgroundColor = UIColor.white
        addSubview(imgView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(refrashButton)
    }
    
    func setupConstraints() {
        
        imgView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(imgView.snp.bottom).offset(24)
            maker.left.equalToSuperview().offset(15)
            maker.right.equalToSuperview().offset(-15)
            maker.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(imgView.snp.bottom).offset(-20)
            maker.left.equalToSuperview().offset(15)
            maker.right.equalToSuperview().offset(-15)
            maker.centerX.equalToSuperview()
        }
        
        refrashButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(titleLabel.snp.bottom).offset(32)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(32)
            maker.width.greaterThanOrEqualTo(100)
        }
        
        
    }
    
    
    // MARK: 点击刷新数据
    @objc func clickRefrash() {
        clickBlock?(.clickTitleType)
    }
    
    // MARK: 按钮点击刷新数据
    @objc func clickRefrashMenthod() {
        clickBlock?(.clickRefrashType)
    }
    
}
