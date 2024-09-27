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
//    var isChecked: Bool = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 이것을 호출함으로써, 셀은 UITableViewCell 제공하는 기본 기능으로 초기화되어, 셀이 테이블 뷰에서 효율적으로 재사용될 수 있도록 한다. 나머지 셀의 사용자 지정 구성은 이 이후에 제공됩니다.
        
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
    
    private func setupTitle() {
        
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
    
    private func setupCheckButton() {
        
        check.setBackgroundImage(UIImage(named: "checkk"), for: .normal)
        check.addTarget(self, action: #selector(clicktab), for: .touchUpInside)
        check.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(10)
            make.bottom.equalTo(10)
        }
    }
    
    private func setupDeleteButton() {
        
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
        // 09.25 오전 숙제
        if Entity.check == "Check" {
            check.setBackgroundImage(UIImage(named: "checkkk"), for: .normal)
//            isChecked = true // 상태를 선택된 상태로 업데이트
            // Entity.check가 "Check"와 같다면 check 버튼의 이미지를 교체해주세요.
            // 선택되었음을 알려주면 좋을거 같아요.
        } else {
            check.setBackgroundImage(UIImage(named: "checkk"), for: .normal)
//            isChecked = false // 상태를 선택되지 않은 상태로 업데이트
            // Check가 아니라면 check 버튼의 이미지를 기존 이미지 "checkk"로 교체해주세요.
        }
    }
}
    
    extension CustomTableViewCell {
        
        @objc func clicktab() {
            delegate?.checkButtonTapped(entity: entity)
//            let newImage = isChecked ? "checkkk" : "checkk"
//                   check.setBackgroundImage(UIImage(named: newImage), for: .normal)
        }
        
        @objc func deletetab(_ sender: UIButton) {
            delegate?.deleteButtonTapped(entity: entity)
            
            
        }
    }



