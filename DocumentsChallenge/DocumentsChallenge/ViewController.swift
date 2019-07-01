//
//  ViewController.swift
//  DocumentsChallenge
//
//  Created by 刘洋 on 6/15/19.
//  Copyright © 2019 Yang Liu. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating{
    @IBOutlet weak var searchBar: UITableView!
    
    
    @IBOutlet weak var documentsTableView: UITableView!
    
    let fileManager = FileManager.default
    var documents: [Document] = []
    var filteredDocuments = [Document]()
    let searchController = UISearchController(searchResultsController: nil)
    
    
    let date = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date.dateStyle = .medium
        date.timeStyle = .medium
        documentsTableView.dataSource = self
        documentsTableView.delegate = self
        
        let directory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0].path
        if !fileManager.changeCurrentDirectoryPath(directory) {
            fatalError("Failed")
        }
    }
    func checksearchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    func ContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredDocuments = documents.filter({( document : Document) -> Bool in
            return (document.name.lowercased().contains(searchText.lowercased()))
        })
        
        documentsTableView.reloadData()
    }
    func isFiltering() -> Bool {
        return searchController.isActive && !checksearchBarIsEmpty()
    }
    func updateSearchResults(for searchController: UISearchController) {
        ContentForSearchText(searchController.searchBar.text!)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        documents.removeAll()
        do {
            for file in try fileManager.contentsOfDirectory(atPath: ".") {
                let attributes = try fileManager.attributesOfItem(atPath: file)
                documents.append(Document(name: file, size: attributes[FileAttributeKey.size] as! Int, Modified: attributes[FileAttributeKey.modificationDate] as! Date))
            }
        } catch {
            print(error.localizedDescription)
        }
        documentsTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selected = documentsTableView.indexPathForSelectedRow, let destination = segue.destination as? DocumentViewController {
            let doc = documents[selected.row]
            destination.document = doc
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath) as! DocumentTableViewCell
        let document = documents[indexPath.row]
        
        cell.nameLabel.text = "Name: \(document.name)"
        cell.sizeLabel.text = "Size: \(document.size) bytes"
        cell.timeLabel.text = "modified: \(date.string(from: document.Modified))"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
   
  
}




