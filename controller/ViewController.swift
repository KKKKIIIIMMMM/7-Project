//
//  ViewController.swift
//  7 Project
//
//  Created by 김동준 on 8/22/24.

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



class firstview: UIView {
    
    let button = UIButton()
    let nametext = UITextField()
    let sentencetext = UITextField()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        view.addSubview(button)
        view.addSubview(nametext)
        view.addSubview(sentencetext)
        
        button.setTitle("완료", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        button.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(50)
            make.trailing.equalToSuperview().inset(50)
            
        }
        
        nametext.placeholder = "제목"
        nametext.textColor = UIColor.blue
        nametext.font = UIFont.systemFont(ofSize: 20)
        nametext.textAlignment = .left
        
        nametext.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(25)
        }
        
        nametext.placeholder = "메모"
        nametext.textColor = UIColor.blue
        nametext.font = UIFont.systemFont(ofSize: 20)
        nametext.textAlignment = .left
        
        nametext.snp.makeConstraints{ make in
            make.top.equalTo(nametext.snp.bottom).inset(50)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(25)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    


























































































//import UIKit
//
//class mainview: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
//    
//    private let topname: UILabel = {
//        let topname = UILabel()
//        topname.textColor = .mainGreen
//        topname.textAlignment = .center
//        topname.font = UIFont.systemFont(ofSize: 16, weight: .light)
//        return topname
//    }()
//    
//    private let folder: UIButton = {
//        let folder = UIButton(type: .system)
//        folder.setTitle("폴더", for: .normal)
//        folder.addTarget(self, action: #selector(folderButtonTapped), for: .touchDown)
//        folder.translatesAutoresizingMaskIntoConstraints = false
//        return folder
//    }()
//    
//    private let search: UISearchBar = {
//        let search = UISearchBar()
//        search.placeholder = "검색어 입력"
//        search.showsCancelButton = true
//        search.barStyle = .default
//        search.delete = self
//        return search
//    }()
//    
//    private let tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.separatorStyle = .none
//        tableView.register(mainviewTableViewCell.self, forCellReuseIdentifier: "mainviewTableViewCell")
//        return tableView
//    }()
//    
//    private let Write: UIButton = {
//        let write = UIButton(type: .system)
//        write.setTitle("작성하기", for: .normal)
//        write.addTarget(self, action: #selector(WriteButtonTapped), for: .touchDown)
//        write.translatesAutoresizingMaskIntoConstraints = false
//        return write
//    }()
//    
//    private let arrow: UIButton = {
//        let arrow = UIButton(type: .system)
//        arrow.setTitle("화살표", for: .normal)
//        arrow.addTarget(self, action: #selector(arrowButtonTapped), for: .touchDown)
//        arrow.translatesAutoresizingMaskIntoConstraints = false
//        return write
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.dataSource = self
//        configureUI()
//        
//        let pickerView = UIPickerView()
//        pickerView.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 200)
//        pickerView.dataSource = self
//        pickerView.delegate = self
//        self.view.addSubview(pickerView)
//        
//    }
//    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1 // 구성 요소(열) 수
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 10 // 행(옵션) 수
//    }
//    
//    // UIPickerViewDelegate 메서드 구현
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return "Option \(row + 1)"
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        print("Selected Option: \(row + 1)")
//    }
//    
//    private func configureUI() {
//        view.backgroundColor = .white
//        [
//            topname,
//            folder,
//            search,
//            tableView,
//            write,
//            
//        ].forEach { view.addSubview($0) }
//        
//        folder.snp.makeConstraints {
//            $0.top.equalTo(collectionView.snp.bottom)
//            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.height.equalTo(300)
//            $0.bottom.equalTo(view.safeAreaLayoutGuide)
//        }
//        search.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide)
//            $0.leading.equalTo(30)
//        }
//        tableView.snp.makeConstraints {
//            $0.top.equalTo(collectionView.snp.bottom)
//            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.height.equalTo(300)
//            $0.bottom.equalTo(view.safeAreaLayoutGuide)
//        }
//        Write.snp.makeConstraints {
//            $0.top.equalTo(collectionView.snp.bottom)
//            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.height.equalTo(300)
//            $0.bottom.equalTo(view.safeAreaLayoutGuide)
//        }
//        topname.snp.makeConstraints {
//            $0.top.equalTo(collectionView.snp.bottom)
//            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.height.equalTo(300)
//            $0.bottom.equalTo(view.safeAreaLayoutGuide)
//        }
//        arrow.snp.makeConstraints {
//            $0.top.equalTo(collectionView.snp.bottom)
//            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.height.equalTo(300)
//            $0.bottom.equalTo(view.safeAreaLayoutGuide)
//        }
//    }
//}
//
//extension mainview: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 20
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableViewCell", for: indexPath) as! WeatherTableViewCell
//        
//        return cell
//    }
//}
