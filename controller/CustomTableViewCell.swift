//
//  Untitled.swift
//  7 Project
//
//  Created by 김동준 on 9/23/24.
//
import UIKit
import SnapKit

protocol CustomTableViewCellDelegate: AnyObject {
    func checkButtonTapped(entity: Entity?)
    func deleteButtonTapped(entity: Entity?)
}

class CustomTableViewCell: UITableViewCell {
    
    let title = UILabel()
    let check = UIButton()
    let delete = UIButton()
    var tableView: UITableView!
    var delegate: CustomTableViewCellDelegate?
    var entity: Entity?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(title)
        contentView.addSubview(check)
        contentView.addSubview(delete)
        
        setupTitle()
        setupCheckButton()
        setupDeleteButton()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTitle() {
        
        title.text = ""
        title.textColor = UIColor.black
        title.font = UIFont.systemFont(ofSize: 20)
        title.textAlignment = .left
        
        title.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(125)
        }
    }
    
    func setupCheckButton() {
        
        check.setBackgroundImage(UIImage(named: "checkk"), for: .normal)
        check.addTarget(self, action: #selector(clicktab), for: .touchUpInside)
        check.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(10)
            make.bottom.equalTo(10)
        }
    }
    
    func setupDeleteButton() {
        
        delete.setBackgroundImage(UIImage(named: "deletee"), for: .normal)
        delete.addTarget(self, action: #selector(deletetab), for: .touchUpInside)
        delete.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(10)
            make.bottom.equalTo(10)
        }
    }
    
    func update(Entity: Entity) {
        
        if Entity.check == "Check" {
            check.setBackgroundImage(UIImage(named: "checkkk"), for: .normal)
            
        } else {
            check.setBackgroundImage(UIImage(named: "checkk"), for: .normal)
            
        }
    }
}
    
    extension CustomTableViewCell {
        
        @objc func clicktab() {
            delegate?.checkButtonTapped(entity: entity)
        }
        @objc func deletetab(_ sender: UIButton) {
            delegate?.deleteButtonTapped(entity: entity)
        }
    }



