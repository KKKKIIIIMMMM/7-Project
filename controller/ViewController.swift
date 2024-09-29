//
//  ViewController.swift
//  7 Project
//
//  Created by 김동준 on 8/22/24.

//
//  ViewController.swift
//  7 Project
//
//  Created by 김동준 on 8/22/24.

import UIKit
import SnapKit
import CoreData

class ViewController: UIViewController {
    
    let colorpicktab = UIColorPickerViewController()
    var color = UIButton()
    let preparation = UIButton()
    let button = UIButton()
    let titlelabel = UILabel()
    let memotext = UITextView()
    let textfield = UITextField()
    let coreDataManager = CoreDataManager()
    var onDismiss: (() -> Void)?
    var ischange : Bool = false
    var entity: Entity?
    var COLOR = UIColor.gray
    let textView = UITextView()
    let nredom = UIImageView()
    var weivtxet = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        view.addSubview(titlelabel)
        view.addSubview(textfield)
        view.addSubview(memotext)
        view.addSubview(textView)
        view.addSubview(nredom)
        view.backgroundColor = .white
        view.addSubview(color)
        view.addSubview(preparation)
        
        button.setTitle("수정", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        if ischange == true {
            button.setTitle("수정", for: .normal)
        } else {
            button.setTitle("완료", for: .normal)
        }
        
        button.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(50)
            make.trailing.equalToSuperview().inset(25)
            make.width.equalTo(50)
            make.height.equalTo(50)
            
        }
        
        titlelabel.text = "메모"
        titlelabel.textColor = UIColor.gray
        titlelabel.font = UIFont.systemFont(ofSize: 20)
        
        titlelabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(25)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        textfield.textColor = UIColor.gray
        textfield.font = UIFont.systemFont(ofSize: 20)
        textfield.backgroundColor = .white
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.layer.borderWidth = 0.5
        textfield.textColor = .gray
        textfield.placeholder = "입력해주세요."
        
        textfield.snp.makeConstraints{ make in
            make.top.equalTo(titlelabel.snp.bottom).inset(-50)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        
        memotext.font = UIFont.systemFont(ofSize: 20)
        memotext.textColor = UIColor.gray
        memotext.textAlignment = .left
        memotext.backgroundColor = UIColor.white
        memotext.layer.borderColor = UIColor.gray.cgColor
        memotext.layer.borderWidth = 0.5
        memotext.textColor = .gray
        
        memotext.snp.makeConstraints{ make in
            make.top.equalTo(textfield.snp.bottom).inset(-15)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(350)
        }
        
        textView.isHidden = true
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.textColor = UIColor.gray
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 0.5

                
        textView.snp.makeConstraints { make in
            make.top.equalTo(memotext.snp.bottom ).inset(-15)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(100)
        }
        
        nredom.image = UIImage(named: "modern")
        
        nredom.snp.makeConstraints{ make in
            make.top.equalTo(textView.snp.bottom).inset(-25)
            make.leading.equalToSuperview().inset(-25)
            make.trailing.equalToSuperview().inset(-25)
        }
        
        color.setTitleColor(UIColor.gray, for: .normal)
        color.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        color.addTarget(self, action: #selector(colorClick), for: .touchUpInside)
        color.setBackgroundImage(UIImage(named: "sparewindow"), for: .normal)
        
        color.snp.makeConstraints{ make in
            make.top.equalTo(nredom.snp.bottom).inset(-15)
            make.leading.equalToSuperview().inset(25)
            make.width.height.equalTo(50)
        }
        
        preparation.setTitleColor(UIColor.gray, for: .normal)
        preparation.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        preparation.addTarget(self, action: #selector(Colortypeinput), for: .touchUpInside)
        preparation.setBackgroundImage(UIImage(named: "Colortype"), for: .normal)
        
        preparation.snp.makeConstraints{ make in
            make.top.equalTo(nredom.snp.bottom).inset(-15)
            make.trailing.equalToSuperview().inset(25)
            make.width.height.equalTo(50)
        }
        
        colorpicktab.selectedColor = UIColor.white
        colorpicktab.supportsAlpha = false
        colorpicktab.delegate = self
        
        if let entity = entity {
            textfield.text = entity.name
            memotext.text = entity.memo
            textView.text = entity.sidescreen
            
               if entity.color == "#000000" {
                   textfield.textColor = UIColor.gray
                   memotext.textColor = UIColor.gray
                   textView.textColor = UIColor.gray
                   COLOR = UIColor.gray
               } else {
                   
                   textfield.textColor = UIColor.hexStringToUIColor(hex: entity.color)
                   memotext.textColor = UIColor.hexStringToUIColor(hex: entity.color)
                   textView.textColor = UIColor.hexStringToUIColor(hex: entity.color)
                   COLOR = UIColor.hexStringToUIColor(hex: entity.color)
               }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.onDismiss?()
    }
    
    @objc func buttonTapped() {
        self.dismiss(animated: true, completion: nil)
        
        if ischange == false {
            coreDataManager.saveMemo(title: textfield.text!, contents: memotext.text!, color: COLOR, sidescreen: textView.text! )
        } else {
            coreDataManager.uploadMemo(entity: entity, title: textfield.text!, sentence: memotext.text!, color: COLOR, sidescreen: textView.text!)
        }
    }
}

extension ViewController: UIColorPickerViewControllerDelegate {
    @objc func colorClick() {
        self.present(colorpicktab, animated: true, completion: nil)
    }
   
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool)  {
        
        textfield.textColor = color
        memotext.textColor = color
        textView.textColor = color
        COLOR = color
        print("색상이 선택됨: \(color)")
    }
    
    @objc func Colortypeinput() {
        weivtxet.toggle()
        
        if weivtxet == true {
            textView.isHidden = false
            
        } else {
            textView.isHidden = true
        }
    }
}
