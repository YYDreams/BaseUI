//
//  BaseCollectionView.swift
//  BaseUI
//
//  Created by flowerflower on 2021/9/2.
//

import Foundation
import XMUtil
import SDWebImage
// MARK: ------------------------- Const/Enum/Struct
public extension BaseCollectionView {
    
    /// 常量
    struct Const {}
    
    /// 内部属性
    struct Propertys {
        let titles = [String]()
    }
    
    /// 外部参数
     struct Params {
//        var model: XMHomeModel?
        public  var titleArr:[String]?
        public  var imageArr:[String]?

//     public  var titleArr =  [String]()
//      public var imageArr = [String]()
    }
}




open class BaseCollectionView: UIView {
    
    // MARK: ------------------------- Propertys
    
    //点击item回调
   public var selectItemBlock: ((Int)->Void)?
    
    /// 内部属性
    var propertys: Propertys = Propertys()
    /// 外部参数
   public var params: Params = Params()
    
    
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.white
        return collection
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubView()
    }
    lazy var layout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        let itemWH = (kScreenWidth - 1) / 5.0
        flowLayout.minimumInteritemSpacing = 0.01
        flowLayout.minimumLineSpacing = 0.01
        flowLayout.itemSize = CGSize(width: itemWH, height: itemWH)
        return flowLayout
    }()
    
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupSubView(){
      
        self.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        collectionView.register(BaseCollectionCell.self, forCellWithReuseIdentifier: "BaseCollectionCellID")
        
    }
    
    open func refreshUI(titleArr:[String]? ,imageArr:[String]?){
        self.params.titleArr = titleArr
        self.params.imageArr = imageArr
        self.collectionView.reloadData()
    }
        
}

extension  BaseCollectionView: UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        self.params.titleArr?.count ?? 0
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:BaseCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BaseCollectionCellID", for: indexPath)  as! BaseCollectionCell
        cell.titleLabel.text = self.params.titleArr?[safe:indexPath.row]
        cell.imgView.sd_setImage(with: URL(string: self.params.imageArr?[safe:indexPath.row] ?? ""))
        return cell
        
    }
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        self.selectItemBlock?(indexPath.row)
       
        
        
    }
    
    
    
}
