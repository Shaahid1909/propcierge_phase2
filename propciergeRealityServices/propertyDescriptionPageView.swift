//
//  propertyDescriptionPageView.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 11/05/21.
//

import UIKit

class propertyDescriptionPageView: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource {
   
    let array = ["1","2","3","2","1","3","1"]
    
    @IBAction func backBt(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    var propdesc = [descriptiondetails]()
    
    
    
    @IBOutlet weak var tabview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptorpage()
        
        tabview.delegate = self
        tabview.dataSource = self
      
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        var height:CGFloat = CGFloat()
//        if indexPath.row == 0 {
//            height = 197
//        }
//        else if indexPath.row == 1{
//            height = 327
//        }else if indexPath.row == 2{
//            height = 213
//        }else if indexPath.row == 3{
//            height = 233
//        }else if indexPath.row == 4{
//            height = 247
//        }else if indexPath.row == 5{
//            height = 214
//        }else if indexPath.row == 6{
//            height = 288
//        }
        return UITableView.automaticDimension
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return propdesc.count
        case 2: return propdesc.count
        case 3: return 1
        case 4: return 1
        case 5: return 1
        case 6: return 1
                default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "propdescriptionpage", for: indexPath) as! PropertyDesPageTableCell
            return cell
        }else if indexPath.section == 1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "propdetaildesc", for: indexPath) as! PersonDetailsDescription
            
            
            cell1.ownername.text = propdesc[indexPath.row].ownername
            cell1.ownerdescription.text = propdesc[indexPath.row].desc
            
            return cell1
        }else if indexPath.section == 2{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "detailscountCell", for: indexPath) as! detailscountCell
            
            cell2.bhkcount.text = propdesc[indexPath.row].bhkcount
            cell2.bathroomcount.text = propdesc[indexPath.row].bathroom_count
            cell2.buildingtype.text = propdesc[indexPath.row].property_type
            cell2.availability.text = propdesc[indexPath.row].flatType
            cell2.propertyid.text = propdesc[indexPath.row].property_id
            
            return cell2
        }else if indexPath.section == 3 {
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "AmentiesCell", for: indexPath) as! AmentiesCell
            return cell3
        }else if indexPath.section == 4{
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "ReasonstobuyCell", for: indexPath) as! ReasonstobuyCell
            return cell4
        }else if indexPath.section == 5 {
            let cell5 = tableView.dequeueReusableCell(withIdentifier: "photosCell", for: indexPath) as! photosCell
            cell5.propdesc.delegate = self
            cell5.propdesc.dataSource = self
            return cell5
        }else if indexPath.section == 6{
            let cell6 = tableView.dequeueReusableCell(withIdentifier: "shareCell", for: indexPath) as! shareCell
            return cell6
        }
        return UITableViewCell()
    }
    

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "prophotocell", for: indexPath) as! prophotosCollCell
        
        cell.imageV.image = UIImage(named: "\(array[indexPath.row])")
        
        return cell
    }
    
    
    func descriptorpage(){

            let parameters = ["property_id":"3553232141"]
            let urlRequest = getUrlRequest(url:URL(string: "https://propcierge.in/stage/api/version_reality/reality_details_single.php")!,type:"POST",parameter:parameters)
          // set up the session
          let config = URLSessionConfiguration.default
          let session = URLSession(configuration: config)

          // make the request
          let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
              print("error calling GET")
              print(error!)
              return
            }
            // make sure we got data
            guard let responseData = data else {
              print("Error: did not receive data")
              return
            }
            // parse the result as JSON, since that's what the API provides
            do {
              guard let jsonElement = try JSONSerialization.jsonObject(with: responseData, options:JSONSerialization.ReadingOptions.allowFragments) as? [String: Any]
              else {
                  print("error trying to convert data to JSON")

                  return
          
              }
                let real = jsonElement["reality_details"] as! [[String:Any]]
                

                            for i in real{
                                print("The real is \(real)")
                                print("the new real : \(i["owner_name"] as! String)")
                                let title = i["title"] as! String
                                let amount = i["amount"] as! String
                                let reality_type = i["reality_type"] as! String
                                let flatType = i["type"] as! String
                                let sqft = i["sq_ft"] as! String
                                let furnishtype = i["furnising_type"] as! String
                                let bhk_count = i["bhk_count"] as! String
                                let city = i["city"] as! String
                                let bathroom_count = i["bathroom_count"] as! String
                                let owner_name = i["owner_name"] as! String
                                let property_id = i["property_id"] as! String
                                let property_type = i["property_type"] as! String
                                let desc = i["description"] as! String
                                
//
//                                let photo = i["photos"] as! [[String:Any]]
//                                for j in photo{
//                                    let img = j["url"] as! String
//
                self.propdesc.append(descriptiondetails(name: title , price: amount, type: reality_type, flatType: flatType, city: city, bhkcount: bhk_count,sqftsize: sqft, finishType: furnishtype,bathroom_count: bathroom_count,property_id: property_id,property_type: property_type, ownername: owner_name,desc: desc))
                                                        
                                    
                                    print("descriptor\(self.propdesc)")
                
                           
                       //         }
       
                            }
            
            DispatchQueue.main.async(execute: { [self] () -> Void in
                self.propdesc.filterDuplicate{ $0($1.flatType,$1.bhkcount,$1.bathroom_count, $1.property_id,$1.property_type, $1.ownername, $1.desc ) }
                                    
                    tabview.reloadData()
                    
                })

            
          }catch  {
              print("error trying to convert data to JSON")
              return
            }
          }
          
        task.resume()
        }
        
        

    
    
    func getUrlRequest(url:URL,type:String,parameter:[String:Any]?)->URLRequest {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = type
            if let parameter = parameter{
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: parameter)
                    urlRequest.httpBody = jsonData
                } catch let jsonError {
                    print(jsonError.localizedDescription)
                }
            }
            return urlRequest
        }
    

    
    
}
struct descriptiondetails {
  let name:String
  let price:String
 // let images: String
  let type:String// 1. For Rent || 2. For Sale
  let flatType:String //1. 1BHK || 2. 2BHK || 3. 3BHK
  let city:String
    let bhkcount: String
  let sqftsize:String //Size in sq.ft

  let finishType:String
    let bathroom_count:String
    let property_id:String
    let property_type:String
    let ownername:String
    let desc:String

    //1. Semi Furnished || 2. Fully Furnished
  //For Description Page
}

