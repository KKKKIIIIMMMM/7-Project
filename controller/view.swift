//
//  view.swift
//  7 Project
//
//  Created by 김동준 on 9/5/24.
//

import UIKit
import SnapKit

class view: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    let folder = UIButton()
    let search = UISearchBar()
    let cell = UITableView()
    let create = UIButton()
    let change = UIButton()
    let cdm = CoreDataManager()
    var memorist = [Entity]()
    var filteredItems: [Entity] = []
    var isFiltering = false
    var issort = true
    var enilrehtaew = UIImageView()
    var information: Bool?
    
    func reloadData() {
        if information == true {
            memorist = cdm.loadMemo(restoration: true)
        } else {
            memorist = cdm.loadMemo(restoration: false)
        }
        if issort == true{
            memorist.sort { a, b in
                b.time < a.time
            }
           } else {
                memorist.sort { a, b in
                b.time > a.time
                }
            }
        cell.reloadData()
        print(memorist)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cell.delegate = self
        cell.dataSource = self
        search.delegate = self
        
        view.addSubview(folder)
        view.addSubview(search)
        view.addSubview(cell)
        view.addSubview(enilrehtaew)
        view.addSubview(create)
        view.addSubview(change)
        
        folder.setTitle("목록", for: .normal)
        folder.setTitleColor(UIColor.black, for: .normal)
        folder.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        folder.addTarget(self, action: #selector(noitamrofni), for: .touchUpInside)
        
        folder.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(25)
        }
        
        search.placeholder = "검색어 입력해주세요."
        search.searchBarStyle = .default
        search.tintColor = UIColor.gray
        search.searchTextField.textColor = .gray
        search.snp.makeConstraints{ make in
            make.top.equalTo(folder.snp.bottom).inset(-10)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(25)
        }
        
        cell.rowHeight = 50 //
        cell.estimatedRowHeight = 0
        cell.sectionFooterHeight = 0
        cell.separatorColor = UIColor.gray
        cell.allowsSelection = true
        cell.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        cell.backgroundColor = .white
        cell.dataSource = self
        cell.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        cell.snp.makeConstraints{ make in
            make.top.equalTo(search.snp.bottom).inset(-15)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().inset(125)
        }
        
        enilrehtaew.image = UIImage(named: "weatherline")
        
        enilrehtaew.snp.makeConstraints{ make in
            make.top.equalTo(cell.snp.bottom).inset(-1)
            make.leading.equalToSuperview().inset(-10)
            make.trailing.equalToSuperview().inset(-10)
        }
        
        create.setBackgroundImage(UIImage(named: "cloud"), for: .normal)
        create.addTarget(self, action: #selector(createTapped), for: .touchUpInside)
        
        create.snp.makeConstraints{ make in
            make.top.equalTo(enilrehtaew.snp.bottom).inset(-5)
            make.trailing.equalToSuperview().inset(5)
            make.height.equalTo(100)
            make.width.equalTo(100)
            
        }
        
        change.setBackgroundImage(UIImage(named: "lightning"), for: .normal)
        change.addTarget(self, action: #selector(egnahc), for: .touchUpInside)
        
        change.snp.makeConstraints{ make in
            make.top.equalTo(enilrehtaew.snp.bottom).inset(-5)
            make.leading.equalToSuperview().inset(15)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        
        
    }
    
    @objc func noitamrofni() {
        
        if information == false {
            folder.setTitle("삭제", for: .normal)
            information = true
            memorist = cdm.loadMemo(restoration: true)
            
        } else {
            folder.setTitle("목록", for: .normal)
            information = false
            memorist = cdm.loadMemo(restoration: false)
        }
        cell.reloadData()
    }
    
    @objc func egnahc() {
        if issort == false {
            issort = true
        } else {
            issort = false
        }
        reloadData()
        print(memorist)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            
            return filteredItems.count
        } else {
           
            return memorist.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
            cell.delegate = self

        if isFiltering {
            cell.entity = filteredItems[indexPath.row]
            cell.title.text = "\(filteredItems[indexPath.row].name!)"
            cell.title.textColor = UIColor.hexStringToUIColor(hex:filteredItems[indexPath.row].color )
            cell.update(Entity: filteredItems[indexPath.row])
            cell.title.textColor = UIColor.gray
        }else{
            cell.entity = memorist[indexPath.row]
            cell.title.text = "\(memorist[indexPath.row].name!)"
            cell.title.textColor = UIColor.hexStringToUIColor(hex: memorist[indexPath.row].color )
            cell.update(Entity: memorist[indexPath.row])
            cell.title.textColor = UIColor.gray
        }
        return cell
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            isFiltering = false
        } else {
            isFiltering = true
            filteredItems = []
            for memo in memorist  {
                
                if memo.name!.contains(searchText.lowercased()) {
                    filteredItems.append(memo)
                   
                }
            }
        }
        cell.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        isFiltering = false
        cell.reloadData()
        searchBar.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = indexPath.row
        print("Selected row at \(selectedRow)")
        print("Selected row at \(indexPath.row)")
    
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewcontroller = ViewController()
        
        viewcontroller.onDismiss = {
            self.reloadData()
        }
        
        viewcontroller.ischange = true
        if isFiltering == true {
            viewcontroller.entity = filteredItems[selectedRow]
        }else{
            viewcontroller.entity = memorist[selectedRow]
        }
        
        self.present(viewcontroller, animated: true)
    }
}

extension view {
    @objc func createTapped() {
        let viewcontroller = ViewController()
        viewcontroller.onDismiss = {
            self.reloadData()
        }
       
        self.present(viewcontroller, animated: true) }
    }

extension view: CustomTableViewCellDelegate {
    func checkButtonTapped(entity: Entity?) {
        cdm.checkMemo(entity: entity, check: "Check" )
        reloadData()
        
        guard let entity = entity else { return }
        
        if entity.check == "Check" {
            entity.check = "Delete"
            cdm.checkMemo(entity: entity, check: "Delete")
        }else{
            entity.check = "Check"
            cdm.checkMemo(entity: entity, check: "Check")
        }
        
        reloadData()
        print("Check 가 눌렸어요.")
        
    }
    
    func deleteButtonTapped(entity: Entity?) {
        
        guard let entity = entity else { return }
        
        if information == true {
            cdm.removeMemo(entity: entity)
        } else {
            cdm.deleteMemo(entity: entity)
        }
        
        if let index = filteredItems.firstIndex(where: { $0.id == entity.id }) {
            filteredItems.remove(at: index)
            
        }
        reloadData()
        print("Delete button was tapped and the cell has been removed.")
    }
}
    


