//
//  DefaultDynamicTalbleViewController.swift
//  DynamicTalbeviewbuoi21
//
//  Created by Huy chãng on 12/24/19.
//  Copyright © 2019 macshop. All rights reserved.
//

import UIKit

class DefaultDynamicTalbleViewController: UIViewController {

    var animal : [Animal]?
    var mainView: UITableView = {
            let mainView = UITableView()
            mainView.translatesAutoresizingMaskIntoConstraints = false
    //        mainView.backgroundColor = .white
            return mainView
        }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        // gọi tên lên màn hình
        title = "tableView"
        view.addSubview(mainView)
        setupView()
        setData()
        configTable()
    }
      func setupView(){
            
    //        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    //        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -300).isActive = true
    //        mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
    //        mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
            mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/4).isActive = true
            mainView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
            mainView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
             mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height/4).isActive = true
            
        }
    func setData(){
        animal = [
        Animal(animal: "cho1", feet: "4 feet", imageName: "ten1"),
        Animal(animal: "cho2", feet: "4 feet", imageName: "ten2"),
        Animal(animal: "cho3", feet: "4 feet", imageName: "ten3"),
        Animal(animal: "cho4", feet: "4 feet", imageName: "ten4"),
        Animal(animal: "cho5", feet: "4 feet", imageName: "ten5")]
    }
    func configTable(){
        mainView.delegate = self
        mainView.dataSource = self
    }
    }
 

extension DefaultDynamicTalbleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return view.frame.height/10
        return 60
}
}
extension DefaultDynamicTalbleViewController : UITableViewDataSource{
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animal!.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          var cell: UITableViewCell?
          cell = tableView.dequeueReusableCell(withIdentifier: "id")
                if cell == nil {
                    cell = UITableViewCell(style: .subtitle, reuseIdentifier: "id")
                }
                cell?.imageView?.image = UIImage(named: animal![indexPath.row].imageName)
           
//        //        cell?.textLabel?.text = String(indexPath.row)
                cell?.textLabel?.text = animal![indexPath.row].animal
                // hien thi text view
                cell?.detailTextLabel?.text = animal![indexPath.row].feet
                // c
               
                return cell!
      }
    
}


