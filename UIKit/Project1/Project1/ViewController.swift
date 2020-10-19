//
//  ViewController.swift
//  Project1
//
//  Created by Paul Yi on 10/18/20.
//

import UIKit

class ViewController: UITableViewController {
   var pictures = [String]()

   override func viewDidLoad() {
      super.viewDidLoad()
      
      title = "Storm Viewer"
      
      navigationController?.navigationBar.prefersLargeTitles = true
      
      let fm = FileManager.default
      let path = Bundle.main.resourcePath!
      let items = try! fm.contentsOfDirectory(atPath: path)
      
      for item in items {
         if item.hasPrefix("nssl") {
            pictures.append(item)
            // Challenge: In your main table view, show the image names in sorted order, so "nssl033.jpg" comes before "nssl10034.jpg".
            pictures.sort()
         }
      }
      print(pictures)
   }
   
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return pictures.count
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
      cell.textLabel?.text = pictures[indexPath.row]
      return cell
   }
   
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      // 1. try loading the "Detail" view controller and typecasting it to be DetailViewController
      if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
         // 2. success! Set its selectedImage property
         vc.selectedImage = pictures[indexPath.row]
         // Challenge: Rather than show image names in the detail title bar, show "Picture X of Y", where Y is the total number of images and X is the selected picture's position in the array. Make sure you count from 1 rather than 0.
         vc.selectedPictureNumber = indexPath.row + 1
         vc.totalPictures = pictures.count
         
         //3. now push it onto the navigation controller
         navigationController?.pushViewController(vc, animated: true)
      }
   }


}

