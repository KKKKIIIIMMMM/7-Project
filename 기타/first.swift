//
//  first.swift
//  7 Project
//
//  Created by 김동준 on 8/26/24

import UIKit

class first: ViewController, UIViewController, UITextFieldDelegate {
    
    private let Donebutton: UIButton = {
        let Donebutton = UIButton()
        Donebutton.setTitle("뒤로가기", for: .normal)
        Donebutton.setTitleColor(.black, for: .normal)
        Donebutton.translatesAutoresizingMaskIntoConstraints = false
        //        Donebutton.addTarget(self, action: #selector(backbutton), for: .touchDown)
        return Donebutton
    }()
    
    private let complete: UIButton = {
        let complete = UIButton()
        complete.setTitle("완료", for: .normal)
        complete.setTitleColor(.black, for: .normal)
        complete.translatesAutoresizingMaskIntoConstraints = false
        //        Donebutton.addTarget(self, action: #selector(complete), for: .touchDown)
        return complete
    }()
    private let textfirst: UITextField = {
        textfirst.placeholder = "title"
        textfirst.textColor = .black
        textfirst.borderStyle = .roundedRect
        textfirst.keyboardType = .default
        textfirst.returnKeyType = .done
        textfirst.clearButtonMode = .whileEditing
        textfirst.delegate = self
        return textfirst
        }()
        
    private let textsecond: UITextField = {
        textField.placeholder = "sentence"
        textsecond.textColor = .black
        textsecond.borderStyle = .roundedRect
        textsecond.keyboardType = .default
        textsecond.returnKeyType = .done
        textsecond.clearButtonMode = .whileEditing
        textsecond.delegate = self
        return textsecond
        }()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            configureUI()
        }
        
      private func configureUI() {
            view.backgroundColor = .white
            [
                            Donebutton,
                            complete,
                            textfirst,
                            textsecond
                
            ].forEach { view.addSubview($0) }
          
          Donebutton.snp.makeConstraints {
              $0.top.equalTo(collectionView.snp.bottom)
              $0.leading.trailing.equalToSuperview().inset(16)
              $0.height.equalTo(300)
              $0.bottom.equalTo(view.safeAreaLayoutGuide)
          }
          complete.snp.makeConstraints {
              $0.top.equalTo(view.safeAreaLayoutGuide)
              $0.leading.equalTo(30)
          }
          textfirst.snp.makeConstraints {
              $0.top.equalTo(collectionView.snp.bottom)
              $0.leading.trailing.equalToSuperview().inset(16)
              $0.height.equalTo(300)
              $0.bottom.equalTo(view.safeAreaLayoutGuide)
          }
          textsecond.snp.makeConstraints {
              $0.top.equalTo(collectionView.snp.bottom)
              $0.leading.trailing.equalToSuperview().inset(16)
              $0.height.equalTo(300)
              $0.bottom.equalTo(view.safeAreaLayoutGuide)
          }
      }
  }
