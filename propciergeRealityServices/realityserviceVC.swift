//
//  realityserviceVC.swift
//  propciergeRealityServices
//
//  Created by shaahid shamil on 15/05/21.
//

import UIKit

protocol RealtyServicesDelegate {
    func changeSegment(_ sender:UIButton)
}
protocol typeservicedelegate {
    func typechangeSegment(_ sender:UIButton)
}
protocol buyresadvancecontrol {
    func advanceaction(_ sender:UIButton)
}
protocol catdelegate {
    func categorychangeSegment(_ sender:UIButton)
}
protocol buycomadvancecontrol {
    func comadvanceaction(_ sender:UIButton)
}
protocol resaleadvancecontrol {
    func resaleadvanceaction(_ sender:UIButton)
}


class realityserviceVC: UIViewController,RealtyServicesDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDelegate,UITableViewDataSource,typeservicedelegate,buyresadvancecontrol,buycomadvancecontrol,catdelegate,resaleadvancecontrol {
   
    
    
    var realityservice = [Property]()
    
    var propnearyou = [Propertynearyou]()
  
  
    @IBOutlet weak var propbarbutton: UIBarButtonItem!
    
    
    var selected_index = 0
    @IBOutlet weak var tabView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabView.tableFooterView = UIView()
        tabView.delegate = self
        tabView.dataSource = self
        tabView.rowHeight = UITableView.automaticDimension
        makeGetCall()
        GetCallforpropertynearyou()
      
      //  downloadItems()
 //-->Buy residential nib
 
        tabView.register(UINib(nibName: "TypeRadioCell", bundle: nil), forCellReuseIdentifier: "TypeRadioCell")
        tabView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: "CategoryCell")
        tabView.register(UINib(nibName: "PropertyTypeCell", bundle: nil), forCellReuseIdentifier: "PropertyTypeCell")
        tabView.register(UINib(nibName: "bhkCell", bundle: nil), forCellReuseIdentifier: "bhkCell")
        tabView.register(UINib(nibName: "PriceRangeCell", bundle: nil), forCellReuseIdentifier: "PriceRangeCell")
        tabView.register(UINib(nibName: "PropertyStatusCell", bundle: nil), forCellReuseIdentifier: "PropertyStatusCell")
        tabView.register(UINib(nibName: "AdvancedFilterCell", bundle: nil), forCellReuseIdentifier: "AdvancedFilterCell")
        tabView.register(UINib(nibName: "BuyResAdvancebtncell", bundle: nil), forCellReuseIdentifier: "BuyResAdvancebtncell")
        tabView.register(UINib(nibName: "ShareButtonCell", bundle: nil), forCellReuseIdentifier: "ShareButtonCell")
          
   //-->Buy commercialnib
        tabView.register(UINib(nibName: "TypeRadioCell", bundle: nil), forCellReuseIdentifier: "TypeRadioCell")
        tabView.register(UINib(nibName: "commercialpropertytypeCell", bundle: nil), forCellReuseIdentifier: "commercialpropertytypeCell")
        tabView.register(UINib(nibName: "CommercialCoveredAreaCell", bundle: nil), forCellReuseIdentifier: "CommercialCoveredAreaCell")
        tabView.register(UINib(nibName: "BuiltupareaCell", bundle: nil), forCellReuseIdentifier: "BuiltupareaCell")
        tabView.register(UINib(nibName: "commercialNoOfseatsCell", bundle: nil), forCellReuseIdentifier: "commercialNoOfseatsCell")
        tabView.register(UINib(nibName: "CommercialPriceRangeCell", bundle: nil), forCellReuseIdentifier: "CommercialPriceRangeCell")
        tabView.register(UINib(nibName: "commercialAdvancedFilters", bundle: nil), forCellReuseIdentifier: "commercialAdvancedFilters")
        tabView.register(UINib(nibName: "BuyComadvanceBtnCell", bundle: nil), forCellReuseIdentifier: "BuyComadvanceBtnCell")
        
        tabView.register(UINib(nibName: "resalepropertystatus", bundle: nil), forCellReuseIdentifier: "resalepropertystatus")
        tabView.register(UINib(nibName: "resaleadvancefiltercell", bundle: nil), forCellReuseIdentifier: "resaleadvancefiltercell")
        tabView.register(UINib(nibName: "resaleadvbtn", bundle: nil), forCellReuseIdentifier: "resaleadvbtn")
        
    
        //----> land nib
        tabView.register(UINib(nibName: "landCell", bundle: nil), forCellReuseIdentifier: "landCell")
        
        
        tabView.register(UINib(nibName: "logocell", bundle: nil), forCellReuseIdentifier: "logocell")
        tabView.register(UINib(nibName: "TitleCell", bundle: nil), forCellReuseIdentifier: "TitleCell")
        tabView.register(UINib(nibName: "propertiesnearmecell", bundle: nil), forCellReuseIdentifier: "propertiesnearmecell")
        
        
        tabView.register(UINib(nibName: "propertiesnearyoutitle", bundle: nil), forCellReuseIdentifier: "propertiesnearyoutitle")
        
        
    }
    
   func numberOfSections(in tableView: UITableView) -> Int {
    if selected_index == 0{
        return 5
    }else if selected_index == 1 || selected_index == 6 || selected_index == 7{  //-->Buy section
        return 11
    }else if selected_index == 2 || selected_index == 15{ //---> Rent Section
        return 11
    }
    else if selected_index == 3{ //--->Buy residential
        return 11
    }else if selected_index == 4{ //--->Buy commercial
        return 11
    }else if selected_index == 5{ //--->land type
        return 5
    }
    else if selected_index == 8{ //--->resadvance
        return 11
    }else if selected_index == 9{ //--->comadvance
        return 11
    }
    else{
        return 1
    }
    }

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if selected_index == 0{  //--->normal display
    switch section {
            case 0: return 1
            case 1: return 1
            case 2: return 1
            case 3: return 1
            case 4: return propnearyou.count
            default: return 0
    }
    } else  if selected_index == 1 || selected_index == 6 || selected_index == 7{ //---> Buy
        switch section {
                case 0: return 1
                case 1: return 1
                case 2: return 1
                case 3: return 1
                case 4: return 1
                case 5: return 1
                case 6: return 1
                case 7: return 1
                case 8: return 1
                case 9: return 1
                case 10: return 1
                default: return 1
        }
    }
    else if selected_index == 2 || selected_index == 15{   ///------>Rent
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 1
        case 3: return 1
        case 4: return 1
        case 5: return 1
        case 6: return 1
        case 7: return 1
        case 8: return 1
        case 9: return 1
        case 10: return 1
        default: return 1
            
        }
    }
    else if selected_index == 3{   ///------>Buy residential
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 1
        case 3: return 1
        case 4: return 1
        case 5: return 1
        case 6: return 1
        case 7: return 1
        case 8: return 1
        case 9: return 1
        case 10: return 1
        default: return 1
            
        }
    } else if selected_index == 4 {   ///------>Buy commercial
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 1
        case 3: return 1
        case 4: return 1
        case 5: return 1
        case 6: return 1
        case 7: return 1
        case 8: return 1
        case 9: return 1
        case 10: return 1
        default: return 1
            
        }
    }
        else if selected_index == 5 {   ///------>land
            switch section {
            case 0: return 1
            case 1: return 1
            case 2: return 1
            case 3: return 1
            case 4: return 1
            default: return 1
                
            }
    }else if selected_index == 8 {   ///------>res advance
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 1
        case 3: return 1
        case 4: return 1
        case 5: return 1
        case 6: return 1
        case 7: return 1
        case 8: return 1
        case 9: return 1
        case 10: return 1
        default: return 1
            
        }
        
    }else if selected_index == 9 {   ///------>com advance
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 1
        case 3: return 1
        case 4: return 1
        case 5: return 1
        case 6: return 1
        case 7: return 1
        case 8: return 1
        case 9: return 1
        case 10: return 1
        default: return 1
            
        }
    }
    
    else{
        return 1
        }
   }
   

// func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//         return (section == 0) ? 0 : 50
//       }
//
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if selected_index == 0{    ///---> Buy height
//            return UITableView.automaticDimension
//        }
//        if selected_index == 1 || selected_index == 6{    ///---> Buy height
//            return UITableView.automaticDimension
//        }
//
//        else if selected_index == 2 { //--> Rent Height
//            return UITableView.automaticDimension
//        }
//           else if selected_index == 3{   //--> Buy residential Height
//            return UITableView.automaticDimension
//        }
//
//        else if selected_index == 4{   //--> Buy commercial Height
//                return UITableView.automaticDimension
//        }
//
//        else if selected_index == 5{   //--> land height
//                    return UITableView.automaticDimension
//
//        }else if selected_index == 7{   //--> Buy residential advance Height
//                return UITableView.automaticDimension
//
//            }
//        else if selected_index == 15{   //--> Buy residential advance Height
//            return UITableView.automaticDimension
//
//        } else if selected_index == 8{   //--> Buy residential advance Height
//            return UITableView.automaticDimension
//
//
//
//        }else if selected_index == 9{   //--> Buy commercial advance Height
//            return UITableView.automaticDimension
//                }
//    else{
        return UITableView.automaticDimension
//            }
    }
    
    
        
//
//   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//         let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell")
//          if let headerLabel = headerCell?.contentView.viewWithTag(1) as? UILabel{
//           headerLabel.text = (section == 1) ? "Popular Picks" : "Properties Near You"
//       }
//          return headerCell
//      }
//
//
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        if selected_index == 0{
            if indexPath.section == 2{
                
                performSegue(withIdentifier: "searchpass", sender: self)
                
            }
        }
    }
    
    
    
   
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selected_index == 0{   //-->Buy
            if indexPath.section == 0 {
                let TitleCell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell
                return TitleCell
            }else if indexPath.section == 1 {
                let actionCell = tableView.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath) as! ActionTableCell
                actionCell.realtyServiceController = self
               
                return actionCell
            }
        if indexPath.section == 2 {
            let popularPicksCell = tableView.dequeueReusableCell(withIdentifier: "PopularPicksTableCell", for: indexPath) as! PopularPicksTableCell
            popularPicksCell.popularPicksCollectionView.dataSource = self
            popularPicksCell.popularPicksCollectionView.delegate = self
            popularPicksCell.popularPicksCollectionView.reloadData()
            return popularPicksCell
        }
    if indexPath.section == 3 {
        let titlecell = tableView.dequeueReusableCell(withIdentifier: "propertiesnearyoutitle", for: indexPath) as! propertiesnearyoutitle
     
        return titlecell
        }else if indexPath.section == 4{
            let propertyCell = tableView.dequeueReusableCell(withIdentifier: "PropertyTableCell", for: indexPath) as! PropertyTableCell
   
            propertyCell.nameLabel.text = propnearyou[indexPath.row].name
            propertyCell.priceLabel.text = propnearyou[indexPath.row].price
            propertyCell.cityname.text = "\(propnearyou[indexPath.row].city)|"
            propertyCell.bhkcount.text = "\(propnearyou[indexPath.row].bhkcount)BHK|"
            propertyCell.sqftsize.text = "\(propnearyou[indexPath.row].sqftsize) sq.ft"
         //   popularPicksCell.typeSpecificationLabel.text = "asdasd"      ///realityservice[indexPath.row].type
         //   popularPicksCell.banner.image = UIImage(named: "\(realityservice[indexPath.row].images)")
            
            let bannerImaGE = propnearyou[indexPath.row].images

            if let imageURL = URL(string: bannerImaGE) {
                       print(imageURL)
                       if let data = try? Data(contentsOf: imageURL) {
                           print(data)
                        propertyCell.banner.image = UIImage(data: data)
                       }
                   }
      
            return propertyCell
        }
        }else if selected_index == 1 || selected_index == 3 || selected_index == 6{ //-->Buy and Buy residential
            if indexPath.section == 0 {
                let logocell = tableView.dequeueReusableCell(withIdentifier: "logocell", for: indexPath) as! logocell
                return logocell
            }
            if indexPath.section == 1 {
                let actionCell = tableView.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath) as! ActionTableCell
                actionCell.realtyServiceController = self
                return actionCell
            }
            if indexPath.section == 2 {
                let propertiesnearmecell = tableView.dequeueReusableCell(withIdentifier: "propertiesnearmecell", for: indexPath) as! propertiesnearmecell
                propertiesnearmecell.propnearmebtn.tag = indexPath.row
                propertiesnearmecell.propnearmebtn.addTarget(self, action: #selector(propnearmentapped(sender:)), for: .touchUpInside)
                
                return propertiesnearmecell
            }
            
            else if indexPath.section == 3{
                let typecell = tableView.dequeueReusableCell(withIdentifier: "TypeRadioCell", for: indexPath) as! TypeRadioCell
                typecell.typecontrol = self
                return typecell
            }
                else if indexPath.section == 4{
                    let Categorycell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
                    Categorycell.categorycontrol = self
                    return Categorycell
            } else if indexPath.section == 5 {
                let proptype = tableView.dequeueReusableCell(withIdentifier: "PropertyTypeCell", for: indexPath) as! PropertyTypeCell
                proptype.appartmentBtn.tag = indexPath.row
                proptype.appartmentBtn.addTarget(self, action: #selector(appartmentcellbtntapped(sender:)), for: .touchUpInside)
                proptype.independenthouseBtn.tag = indexPath.row
                proptype.independenthouseBtn.addTarget(self, action: #selector(independentcellbtntapped(sender:)), for: .touchUpInside)
                proptype.gatedcommunityvillaBtn.tag = indexPath.row
                proptype.gatedcommunityvillaBtn.addTarget(self, action: #selector(gatedcommunitycellbtntapped(sender:)), for: .touchUpInside)
                
                proptype.beachhouseBtn.tag = indexPath.row
                proptype.beachhouseBtn.addTarget(self, action: #selector(beachhousecellbtntapped(sender:)), for: .touchUpInside)
                proptype.duplexBtn.tag = indexPath.row
                proptype.duplexBtn.addTarget(self, action: #selector(duplexcellbtntapped(sender:)), for: .touchUpInside)
         
               
                return proptype
            }else if indexPath.section == 6{
                let bhk = tableView.dequeueReusableCell(withIdentifier: "bhkCell", for: indexPath) as! bhkCell
                bhk.onerkBtn.tag = indexPath.row
                bhk.onerkBtn.addTarget(self, action: #selector(onerkcellbtntapped(sender:)), for: .touchUpInside)
                bhk.twobhkBtn.tag = indexPath.row
                bhk.twobhkBtn.addTarget(self, action: #selector(twobhkcellbtntapped(sender:)), for: .touchUpInside)
                bhk.twofivebhkBtn.tag = indexPath.row
                bhk.twofivebhkBtn.addTarget(self, action: #selector(twofivecellbtntapped(sender:)), for: .touchUpInside)
                
                bhk.threebhkbtn.tag = indexPath.row
                bhk.threebhkbtn.addTarget(self, action: #selector(threebhkcellbtntapped(sender:)), for: .touchUpInside)
                bhk.fourbhkBtn.tag = indexPath.row
                bhk.fourbhkBtn.addTarget(self, action: #selector(fourbhkbtntapped(sender:)), for: .touchUpInside)
                bhk.fivebhkBtn.tag = indexPath.row
                bhk.fivebhkBtn.addTarget(self, action: #selector(fivebhkbtntapped(sender:)), for: .touchUpInside)
                return bhk
            }else  if indexPath.section == 7 {
                let pricerange = tableView.dequeueReusableCell(withIdentifier: "PriceRangeCell", for: indexPath) as! PriceRangeCell
               
                return pricerange
            }else if indexPath.section == 8{
                let propstatus = tableView.dequeueReusableCell(withIdentifier: "PropertyStatusCell", for: indexPath) as! PropertyStatusCell
                
                return propstatus
            }else if indexPath.section == 9{
                let advancedbtncell = tableView.dequeueReusableCell(withIdentifier: "BuyResAdvancebtncell", for: indexPath) as! BuyResAdvancebtncell
                advancedbtncell.advanceclick = self
                
                return advancedbtncell
            }else if indexPath.section == 10{
                let searchcell = tableView.dequeueReusableCell(withIdentifier: "ShareButtonCell", for: indexPath) as! ShareButtonCell
                searchcell.searchbtn.tag = indexPath.row
                searchcell.searchbtn.addTarget(self, action: #selector(searchbtn(sender:)), for: .touchUpInside)
                
                return searchcell
            }
        }else if selected_index == 2 || selected_index == 3{ // Rent and rent residential
               
            if indexPath.section == 0 {
                let logocell = tableView.dequeueReusableCell(withIdentifier: "logocell", for: indexPath) as! logocell
                return logocell
            }
            if indexPath.section == 1 {
                let actionCell = tableView.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath) as! ActionTableCell
                actionCell.realtyServiceController = self
                return actionCell
            }
            if indexPath.section == 2 {
                let propertiesnearmecell = tableView.dequeueReusableCell(withIdentifier: "propertiesnearmecell", for: indexPath) as! propertiesnearmecell
                propertiesnearmecell.propnearmebtn.tag = indexPath.row
                propertiesnearmecell.propnearmebtn.addTarget(self, action: #selector(propnearmentapped(sender:)), for: .touchUpInside)
                
                return propertiesnearmecell
            }
                      else if indexPath.section == 3{
                            let typecell = tableView.dequeueReusableCell(withIdentifier: "TypeRadioCell", for: indexPath) as! TypeRadioCell
                            typecell.typecontrol = self
                            return typecell
                }
                 else if indexPath.section == 4{
                    let Categorycell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
                    Categorycell.categorycontrol = self
                    return Categorycell
            } else if indexPath.section == 5 {
                let proptype = tableView.dequeueReusableCell(withIdentifier: "PropertyTypeCell", for: indexPath) as! PropertyTypeCell
                proptype.appartmentBtn.tag = indexPath.row
                proptype.appartmentBtn.addTarget(self, action: #selector(appartmentcellbtntapped(sender:)), for: .touchUpInside)
                proptype.independenthouseBtn.tag = indexPath.row
                proptype.independenthouseBtn.addTarget(self, action: #selector(independentcellbtntapped(sender:)), for: .touchUpInside)
                proptype.gatedcommunityvillaBtn.tag = indexPath.row
                proptype.gatedcommunityvillaBtn.addTarget(self, action: #selector(gatedcommunitycellbtntapped(sender:)), for: .touchUpInside)
                
                proptype.beachhouseBtn.tag = indexPath.row
                proptype.beachhouseBtn.addTarget(self, action: #selector(beachhousecellbtntapped(sender:)), for: .touchUpInside)
                proptype.duplexBtn.tag = indexPath.row
                proptype.duplexBtn.addTarget(self, action: #selector(duplexcellbtntapped(sender:)), for: .touchUpInside)
                return proptype
            }else if indexPath.section == 6{
                let bhk = tableView.dequeueReusableCell(withIdentifier: "bhkCell", for: indexPath) as! bhkCell
                bhk.onerkBtn.tag = indexPath.row
                bhk.onerkBtn.addTarget(self, action: #selector(onerkcellbtntapped(sender:)), for: .touchUpInside)
                bhk.twobhkBtn.tag = indexPath.row
                bhk.twobhkBtn.addTarget(self, action: #selector(twobhkcellbtntapped(sender:)), for: .touchUpInside)
                bhk.twofivebhkBtn.tag = indexPath.row
                bhk.twofivebhkBtn.addTarget(self, action: #selector(twofivecellbtntapped(sender:)), for: .touchUpInside)
                
                bhk.threebhkbtn.tag = indexPath.row
                bhk.threebhkbtn.addTarget(self, action: #selector(threebhkcellbtntapped(sender:)), for: .touchUpInside)
                bhk.fourbhkBtn.tag = indexPath.row
                bhk.fourbhkBtn.addTarget(self, action: #selector(fourbhkbtntapped(sender:)), for: .touchUpInside)
                bhk.fivebhkBtn.tag = indexPath.row
                bhk.fivebhkBtn.addTarget(self, action: #selector(fivebhkbtntapped(sender:)), for: .touchUpInside)
                return bhk
            }else  if indexPath.section == 7 {
                let pricerange = tableView.dequeueReusableCell(withIdentifier: "PriceRangeCell", for: indexPath) as! PriceRangeCell
               
                return pricerange
            }else if indexPath.section == 8{
                let propstatus = tableView.dequeueReusableCell(withIdentifier: "PropertyStatusCell", for: indexPath) as! PropertyStatusCell
                
                return propstatus
            }else if indexPath.section == 9{
                let advancedfiltercell = tableView.dequeueReusableCell(withIdentifier: "BuyResAdvancebtncell", for: indexPath) as! BuyResAdvancebtncell
                advancedfiltercell.advanceclick = self
                return advancedfiltercell
                
            }else if indexPath.section == 10{
                let searchcell = tableView.dequeueReusableCell(withIdentifier: "ShareButtonCell", for: indexPath) as! ShareButtonCell
                searchcell.searchbtn.tag = indexPath.row
                searchcell.searchbtn.addTarget(self, action: #selector(searchbtn(sender:)), for: .touchUpInside)
                
                return searchcell
            }
            
            
        }else if selected_index == 4{ //-->Buy commercial
            if indexPath.section == 0 {
                let logocell = tableView.dequeueReusableCell(withIdentifier: "logocell", for: indexPath) as! logocell
                return logocell
            }
            if indexPath.section == 1 {
                let actionCell = tableView.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath) as! ActionTableCell
                actionCell.realtyServiceController = self
                return actionCell
            }
            if indexPath.section == 2 {
                let propertiesnearmecell = tableView.dequeueReusableCell(withIdentifier: "propertiesnearmecell", for: indexPath) as! propertiesnearmecell
                
                propertiesnearmecell.propnearmebtn.tag = indexPath.row
                propertiesnearmecell.propnearmebtn.addTarget(self, action: #selector(propnearmentapped(sender:)), for: .touchUpInside)
                
                return propertiesnearmecell
            }else if indexPath.section == 3{
                    let typecell = tableView.dequeueReusableCell(withIdentifier: "TypeRadioCell", for: indexPath) as! TypeRadioCell
                    typecell.typecontrol = self
                    return typecell
                }else if indexPath.section == 4 {
                    let comproptype = tableView.dequeueReusableCell(withIdentifier: "commercialpropertytypeCell", for: indexPath) as! commercialpropertytypeCell
                    comproptype.officespace.tag = indexPath.row
                    comproptype.officespace.addTarget(self, action: #selector(officespace(sender:)), for: .touchUpInside)
                    comproptype.commercialbuilding.tag = indexPath.row
                    comproptype.commercialbuilding.addTarget(self, action: #selector(commercialbuilding(sender:)), for: .touchUpInside)
                    comproptype.standaloneland.tag = indexPath.row
                    comproptype.standaloneland.addTarget(self, action: #selector(standaloneland(sender:)), for: .touchUpInside)
                    
                    comproptype.warehouse.tag = indexPath.row
                    comproptype.warehouse.addTarget(self, action: #selector(warehouse(sender:)), for: .touchUpInside)
                    comproptype.industrialbuilding.tag = indexPath.row
                    comproptype.industrialbuilding.addTarget(self, action: #selector(industrialbuilding(sender:)), for: .touchUpInside)
                    
                    comproptype.coworkingspace.tag = indexPath.row
                    comproptype.coworkingspace.addTarget(self, action: #selector(coworkingspace(sender:)), for: .touchUpInside)
                    return comproptype
                }else if indexPath.section == 5{
                    let comcovered = tableView.dequeueReusableCell(withIdentifier: "CommercialCoveredAreaCell", for: indexPath) as! CommercialCoveredAreaCell
                    
                    return comcovered
                }else  if indexPath.section == 6 {
                    let builduparea = tableView.dequeueReusableCell(withIdentifier: "BuiltupareaCell", for: indexPath) as! BuiltupareaCell
                   
                    return builduparea
                }else if indexPath.section == 7{
                    let noofseats = tableView.dequeueReusableCell(withIdentifier: "commercialNoOfseatsCell", for: indexPath) as! commercialNoOfseatsCell
                    
                    return noofseats
                }else if indexPath.section == 8{
                    let compricerange = tableView.dequeueReusableCell(withIdentifier: "CommercialPriceRangeCell", for: indexPath) as! CommercialPriceRangeCell
                    
                    return compricerange
                }else if indexPath.section == 9{
                    let comadvancedfiltercell = tableView.dequeueReusableCell(withIdentifier: "BuyComadvanceBtnCell", for: indexPath) as! BuyComadvanceBtnCell
                    comadvancedfiltercell.comadvanceclick = self
                    return comadvancedfiltercell
                    
                }else if indexPath.section == 10{
                    let searchcell = tableView.dequeueReusableCell(withIdentifier: "ShareButtonCell", for: indexPath) as! ShareButtonCell
                    searchcell.searchbtn.tag = indexPath.row
                    searchcell.searchbtn.addTarget(self, action: #selector(searchbtn(sender:)), for: .touchUpInside)
                    
                    return searchcell
                }
            
        }else if selected_index == 8{ //rent advance detail cell
            if indexPath.section == 0 {
                let logocell = tableView.dequeueReusableCell(withIdentifier: "logocell", for: indexPath) as! logocell
                return logocell
            }
            if indexPath.section == 1 {
                let actionCell = tableView.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath) as! ActionTableCell
                actionCell.realtyServiceController = self
                return actionCell
            }
            if indexPath.section == 2 {
                let propertiesnearmecell = tableView.dequeueReusableCell(withIdentifier: "propertiesnearmecell", for: indexPath) as! propertiesnearmecell
                
                propertiesnearmecell.propnearmebtn.tag = indexPath.row
                propertiesnearmecell.propnearmebtn.addTarget(self, action: #selector(propnearmentapped(sender:)), for: .touchUpInside)
                
                return propertiesnearmecell
            }else if indexPath.section == 3{
                            let typecell = tableView.dequeueReusableCell(withIdentifier: "TypeRadioCell", for: indexPath) as! TypeRadioCell
                            typecell.typecontrol = self
                            return typecell
                }
                 else if indexPath.section == 4{
                    let Categorycell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
                    
                    return Categorycell
            } else if indexPath.section == 5 {
                let proptype = tableView.dequeueReusableCell(withIdentifier: "PropertyTypeCell", for: indexPath) as! PropertyTypeCell
               
                return proptype
            }else if indexPath.section == 6{
                let bhk = tableView.dequeueReusableCell(withIdentifier: "bhkCell", for: indexPath) as! bhkCell
                
                return bhk
            }else  if indexPath.section == 7 {
                let pricerange = tableView.dequeueReusableCell(withIdentifier: "PriceRangeCell", for: indexPath) as! PriceRangeCell
               
                return pricerange
            }else if indexPath.section == 8{
                let propstatus = tableView.dequeueReusableCell(withIdentifier: "PropertyStatusCell", for: indexPath) as! PropertyStatusCell
                
                return propstatus
            }else if indexPath.section == 9{
                let advancedfiltercell = tableView.dequeueReusableCell(withIdentifier: "AdvancedFilterCell", for: indexPath) as! AdvancedFilterCell
                advancedfiltercell.parking.tag = indexPath.row
                advancedfiltercell.parking.addTarget(self, action: #selector(parking(sender:)), for: .touchUpInside)
                advancedfiltercell.gymbtn.tag = indexPath.row
                advancedfiltercell.gymbtn.addTarget(self, action: #selector(gymbtn(sender:)), for: .touchUpInside)
                advancedfiltercell.swimmingpoolbtn.tag = indexPath.row
                advancedfiltercell.swimmingpoolbtn.addTarget(self, action: #selector(swimmingpoolbtn(sender:)), for: .touchUpInside)
                
                advancedfiltercell.clubhousebtn.tag = indexPath.row
                advancedfiltercell.clubhousebtn.addTarget(self, action: #selector(clubhousebtn(sender:)), for: .touchUpInside)
                advancedfiltercell.powerbackbtn.tag = indexPath.row
                advancedfiltercell.powerbackbtn.addTarget(self, action: #selector(powerbackbtn(sender:)), for: .touchUpInside)
                advancedfiltercell.liftbtn.tag = indexPath.row
                advancedfiltercell.liftbtn.addTarget(self, action: #selector(liftbtn(sender:)), for: .touchUpInside)
                advancedfiltercell.gardenbtn.tag = indexPath.row
                advancedfiltercell.gardenbtn.addTarget(self, action: #selector(gardenbtn(sender:)), for: .touchUpInside)
                advancedfiltercell.securitybtn.tag = indexPath.row
                advancedfiltercell.securitybtn.addTarget(self, action: #selector(securitybtn(sender:)), for: .touchUpInside)
                advancedfiltercell.vastucomplaintbtn.tag = indexPath.row
                advancedfiltercell.vastucomplaintbtn.addTarget(self, action: #selector(vastucomplaintbtn(sender:)), for: .touchUpInside)
                
                advancedfiltercell.reraregbtn.tag = indexPath.row
                advancedfiltercell.reraregbtn.addTarget(self, action: #selector(reraregbtn(sender:)), for: .touchUpInside)
                advancedfiltercell.pipedgasbtn.tag = indexPath.row
                advancedfiltercell.pipedgasbtn.addTarget(self, action: #selector(pipedgasbtn(sender:)), for: .touchUpInside)
                advancedfiltercell.furnishingfullbtn.tag = indexPath.row
                advancedfiltercell.furnishingfullbtn.addTarget(self, action: #selector(furnishingfullbtn(sender:)), for: .touchUpInside)
                advancedfiltercell.furnishingsemibtn.tag = indexPath.row
                advancedfiltercell.furnishingsemibtn.addTarget(self, action: #selector(furnishingsemibtn(sender:)), for: .touchUpInside)
                advancedfiltercell.twentyonebtn.tag = indexPath.row
                advancedfiltercell.twentyonebtn.addTarget(self, action: #selector(twentyonebtn(sender:)), for: .touchUpInside)
                advancedfiltercell.twentytwobtn.tag = indexPath.row
                advancedfiltercell.twentytwobtn.addTarget(self, action: #selector(twentytwobtn(sender:)), for: .touchUpInside)
                
                advancedfiltercell.twentythreebtn.tag = indexPath.row
                advancedfiltercell.twentythreebtn.addTarget(self, action: #selector(twentythreebtn(sender:)), for: .touchUpInside)
                advancedfiltercell.twentyfourbtn.tag = indexPath.row
                advancedfiltercell.twentyfourbtn.addTarget(self, action: #selector(twentyfourbtn(sender:)), for: .touchUpInside)
                return advancedfiltercell
                    
            }else if indexPath.section == 10{
                let searchcell = tableView.dequeueReusableCell(withIdentifier: "ShareButtonCell", for: indexPath) as! ShareButtonCell
              
                searchcell.searchbtn.tag = indexPath.row
                searchcell.searchbtn.addTarget(self, action: #selector(searchbtn(sender:)), for: .touchUpInside)
                return searchcell
            }
            
        }else if selected_index == 9{ //comm advance detail cell
            if indexPath.section == 0 {
                let logocell = tableView.dequeueReusableCell(withIdentifier: "logocell", for: indexPath) as! logocell
                return logocell
            }
            if indexPath.section == 1 {
                let actionCell = tableView.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath) as! ActionTableCell
                actionCell.realtyServiceController = self
                return actionCell
            }
            if indexPath.section == 2 {
                let propertiesnearmecell = tableView.dequeueReusableCell(withIdentifier: "propertiesnearmecell", for: indexPath) as! propertiesnearmecell
                propertiesnearmecell.propnearmebtn.tag = indexPath.row
                propertiesnearmecell.propnearmebtn.addTarget(self, action: #selector(propnearmentapped(sender:)), for: .touchUpInside)
                
                return propertiesnearmecell
            }else if indexPath.section == 3{
            let typecell = tableView.dequeueReusableCell(withIdentifier: "TypeRadioCell", for: indexPath) as! TypeRadioCell
            typecell.typecontrol = self
            return typecell
        }else if indexPath.section == 4 {
            let comproptype = tableView.dequeueReusableCell(withIdentifier: "commercialpropertytypeCell", for: indexPath) as! commercialpropertytypeCell
           
            return comproptype
        }else if indexPath.section == 5{
            let comcovered = tableView.dequeueReusableCell(withIdentifier: "CommercialCoveredAreaCell", for: indexPath) as! CommercialCoveredAreaCell
            
            return comcovered
        }else  if indexPath.section == 6 {
            let builduparea = tableView.dequeueReusableCell(withIdentifier: "BuiltupareaCell", for: indexPath) as! BuiltupareaCell
           
            return builduparea
        }else if indexPath.section == 7{
            let noofseats = tableView.dequeueReusableCell(withIdentifier: "commercialNoOfseatsCell", for: indexPath) as! commercialNoOfseatsCell
            
            return noofseats
        }else if indexPath.section == 8{
            let compricerange = tableView.dequeueReusableCell(withIdentifier: "CommercialPriceRangeCell", for: indexPath) as! CommercialPriceRangeCell
            
            return compricerange
    }else if indexPath.section == 9{
        let advancedfiltercell = tableView.dequeueReusableCell(withIdentifier: "commercialAdvancedFilters", for: indexPath) as! commercialAdvancedFilters
        advancedfiltercell.cparking.tag = indexPath.row
        advancedfiltercell.cparking.addTarget(self, action: #selector(cparking(sender:)), for: .touchUpInside)
        advancedfiltercell.cafeteria.tag = indexPath.row
        advancedfiltercell.cafeteria.addTarget(self, action: #selector(cafeteria(sender:)), for: .touchUpInside)
        advancedfiltercell.clift.tag = indexPath.row
        advancedfiltercell.clift.addTarget(self, action: #selector(clift(sender:)), for: .touchUpInside)
        
        advancedfiltercell.garden.tag = indexPath.row
        advancedfiltercell.garden.addTarget(self, action: #selector(garden(sender:)), for: .touchUpInside)
        advancedfiltercell.security.tag = indexPath.row
        advancedfiltercell.security.addTarget(self, action: #selector(security(sender:)), for: .touchUpInside)
        advancedfiltercell.powerbackup.tag = indexPath.row
        advancedfiltercell.powerbackup.addTarget(self, action: #selector(powerbackup(sender:)), for: .touchUpInside)
        advancedfiltercell.rera.tag = indexPath.row
        advancedfiltercell.rera.addTarget(self, action: #selector(rera(sender:)), for: .touchUpInside)
        advancedfiltercell.cfullfurnished.tag = indexPath.row
        advancedfiltercell.cfullfurnished.addTarget(self, action: #selector(cfullfurnished(sender:)), for: .touchUpInside)
        advancedfiltercell.csemifurniched.tag = indexPath.row
        advancedfiltercell.csemifurniched.addTarget(self, action: #selector(csemifurniched(sender:)), for: .touchUpInside)
        
        advancedfiltercell.cpartiallyfurnished.tag = indexPath.row
        advancedfiltercell.cpartiallyfurnished.addTarget(self, action: #selector(cpartiallyfurnished(sender:)), for: .touchUpInside)
        advancedfiltercell.immediate.tag = indexPath.row
        advancedfiltercell.immediate.addTarget(self, action: #selector(immediate(sender:)), for: .touchUpInside)
        advancedfiltercell.withinfifteendays.tag = indexPath.row
        advancedfiltercell.withinfifteendays.addTarget(self, action: #selector(withinfifteendays(sender:)), for: .touchUpInside)
        advancedfiltercell.withinthirtydays.tag = indexPath.row
        advancedfiltercell.withinthirtydays.addTarget(self, action: #selector(withinthirtydays(sender:)), for: .touchUpInside)
        advancedfiltercell.afterthirtydays.tag = indexPath.row
        advancedfiltercell.afterthirtydays.addTarget(self, action: #selector(afterthirtydays(sender:)), for: .touchUpInside)
     
        return advancedfiltercell
            
    }else if indexPath.section == 10{
        let searchcell = tableView.dequeueReusableCell(withIdentifier: "ShareButtonCell", for: indexPath) as! ShareButtonCell
        searchcell.searchbtn.tag = indexPath.row
        searchcell.searchbtn.addTarget(self, action: #selector(searchbtn(sender:)), for: .touchUpInside)
        
        return searchcell
    }
        }else if selected_index == 5{ //land
            if indexPath.section == 0 {
                let logocell = tableView.dequeueReusableCell(withIdentifier: "logocell", for: indexPath) as! logocell
                return logocell
            }
            if indexPath.section == 1 {
                let actionCell = tableView.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath) as! ActionTableCell
                actionCell.realtyServiceController = self
                return actionCell
            }
            if indexPath.section == 2 {
                let propertiesnearmecell = tableView.dequeueReusableCell(withIdentifier: "propertiesnearmecell", for: indexPath) as! propertiesnearmecell
                propertiesnearmecell.propnearmebtn.tag = indexPath.row
                propertiesnearmecell.propnearmebtn.addTarget(self, action: #selector(propnearmentapped(sender:)), for: .touchUpInside)
                
                return propertiesnearmecell
            }
        else if indexPath.section == 3{
            let typecell = tableView.dequeueReusableCell(withIdentifier: "TypeRadioCell", for: indexPath) as! TypeRadioCell
            typecell.typecontrol = self
            return typecell
        }else if indexPath.section == 4 {
            let comproptype = tableView.dequeueReusableCell(withIdentifier: "landCell", for: indexPath) as! landCell
           
            return comproptype
        }
        }else if selected_index == 7{ // //buy residential resale
            if indexPath.section == 0 {
                let logocell = tableView.dequeueReusableCell(withIdentifier: "logocell", for: indexPath) as! logocell
                return logocell
            }
            if indexPath.section == 1 {
                let actionCell = tableView.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath) as! ActionTableCell
                actionCell.realtyServiceController = self
                return actionCell
            }
            if indexPath.section == 2 {
                let propertiesnearmecell = tableView.dequeueReusableCell(withIdentifier: "propertiesnearmecell", for: indexPath) as! propertiesnearmecell
                propertiesnearmecell.propnearmebtn.tag = indexPath.row
                propertiesnearmecell.propnearmebtn.addTarget(self, action: #selector(propnearmentapped(sender:)), for: .touchUpInside)
                
                return propertiesnearmecell
            }else if indexPath.section == 3{
            let typecell = tableView.dequeueReusableCell(withIdentifier: "TypeRadioCell", for: indexPath) as! TypeRadioCell
            typecell.typecontrol = self
            return typecell
        } else if indexPath.section == 4{
            let Categorycell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            Categorycell.categorycontrol = self
            return Categorycell
        
        }else if indexPath.section == 5 {
            let proptype = tableView.dequeueReusableCell(withIdentifier: "PropertyTypeCell", for: indexPath) as! PropertyTypeCell
            proptype.appartmentBtn.tag = indexPath.row
            proptype.appartmentBtn.addTarget(self, action: #selector(appartmentcellbtntapped(sender:)), for: .touchUpInside)
            proptype.independenthouseBtn.tag = indexPath.row
            proptype.independenthouseBtn.addTarget(self, action: #selector(independentcellbtntapped(sender:)), for: .touchUpInside)
            proptype.gatedcommunityvillaBtn.tag = indexPath.row
            proptype.gatedcommunityvillaBtn.addTarget(self, action: #selector(gatedcommunitycellbtntapped(sender:)), for: .touchUpInside)
            
            proptype.beachhouseBtn.tag = indexPath.row
            proptype.beachhouseBtn.addTarget(self, action: #selector(beachhousecellbtntapped(sender:)), for: .touchUpInside)
            proptype.duplexBtn.tag = indexPath.row
            proptype.duplexBtn.addTarget(self, action: #selector(duplexcellbtntapped(sender:)), for: .touchUpInside)
     
           
            return proptype
        }else if indexPath.section == 6{
            let bhk = tableView.dequeueReusableCell(withIdentifier: "bhkCell", for: indexPath) as! bhkCell
            bhk.onerkBtn.tag = indexPath.row
            bhk.onerkBtn.addTarget(self, action: #selector(onerkcellbtntapped(sender:)), for: .touchUpInside)
            bhk.twobhkBtn.tag = indexPath.row
            bhk.twobhkBtn.addTarget(self, action: #selector(twobhkcellbtntapped(sender:)), for: .touchUpInside)
            bhk.twofivebhkBtn.tag = indexPath.row
            bhk.twofivebhkBtn.addTarget(self, action: #selector(twofivecellbtntapped(sender:)), for: .touchUpInside)
            
            bhk.threebhkbtn.tag = indexPath.row
            bhk.threebhkbtn.addTarget(self, action: #selector(threebhkcellbtntapped(sender:)), for: .touchUpInside)
            bhk.fourbhkBtn.tag = indexPath.row
            bhk.fourbhkBtn.addTarget(self, action: #selector(fourbhkbtntapped(sender:)), for: .touchUpInside)
            bhk.fivebhkBtn.tag = indexPath.row
            bhk.fivebhkBtn.addTarget(self, action: #selector(fivebhkbtntapped(sender:)), for: .touchUpInside)
            return bhk
        }else  if indexPath.section == 7 {
            let pricerange = tableView.dequeueReusableCell(withIdentifier: "PriceRangeCell", for: indexPath) as! PriceRangeCell
           
            return pricerange
        }else if indexPath.section == 8{
            let propstatus = tableView.dequeueReusableCell(withIdentifier: "resalepropertystatus", for: indexPath) as! resalepropertystatus
            
            return propstatus
        }else if indexPath.section == 9{
                let advancedfiltercell = tableView.dequeueReusableCell(withIdentifier: "resaleadvbtn", for: indexPath) as! resaleadvbtn
            advancedfiltercell.resaladvanceclick = self
                return advancedfiltercell
        }else if indexPath.section == 10{
            let searchcell = tableView.dequeueReusableCell(withIdentifier: "ShareButtonCell", for: indexPath) as! ShareButtonCell
            searchcell.searchbtn.tag = indexPath.row
            searchcell.searchbtn.addTarget(self, action: #selector(searchbtn(sender:)), for: .touchUpInside)
            
            return searchcell
        }
            
        }else if selected_index == 15{ // //buy residential resale advanced filter
            if indexPath.section == 0 {
                let logocell = tableView.dequeueReusableCell(withIdentifier: "logocell", for: indexPath) as! logocell
                return logocell
            }
            if indexPath.section == 1 {
                let actionCell = tableView.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath) as! ActionTableCell
                actionCell.realtyServiceController = self
                return actionCell
            }
            if indexPath.section == 2 {
                let propertiesnearmecell = tableView.dequeueReusableCell(withIdentifier: "propertiesnearmecell", for: indexPath) as! propertiesnearmecell
                propertiesnearmecell.propnearmebtn.tag = indexPath.row
                propertiesnearmecell.propnearmebtn.addTarget(self, action: #selector(propnearmentapped(sender:)), for: .touchUpInside)
                return propertiesnearmecell
                
            }else if indexPath.section == 3{
                let typecell = tableView.dequeueReusableCell(withIdentifier: "TypeRadioCell", for: indexPath) as! TypeRadioCell
                typecell.typecontrol = self
                return typecell
            }
                else if indexPath.section == 4{
                    let Categorycell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
                    Categorycell.categorycontrol = self
                    return Categorycell
            } else if indexPath.section == 5 {
                let proptype = tableView.dequeueReusableCell(withIdentifier: "PropertyTypeCell", for: indexPath) as! PropertyTypeCell
                proptype.appartmentBtn.tag = indexPath.row
                proptype.appartmentBtn.addTarget(self, action: #selector(appartmentcellbtntapped(sender:)), for: .touchUpInside)
                proptype.independenthouseBtn.tag = indexPath.row
                proptype.independenthouseBtn.addTarget(self, action: #selector(independentcellbtntapped(sender:)), for: .touchUpInside)
                proptype.gatedcommunityvillaBtn.tag = indexPath.row
                proptype.gatedcommunityvillaBtn.addTarget(self, action: #selector(gatedcommunitycellbtntapped(sender:)), for: .touchUpInside)
                
                proptype.beachhouseBtn.tag = indexPath.row
                proptype.beachhouseBtn.addTarget(self, action: #selector(beachhousecellbtntapped(sender:)), for: .touchUpInside)
                proptype.duplexBtn.tag = indexPath.row
                proptype.duplexBtn.addTarget(self, action: #selector(duplexcellbtntapped(sender:)), for: .touchUpInside)
                return proptype
            }else if indexPath.section == 6{
                let bhk = tableView.dequeueReusableCell(withIdentifier: "bhkCell", for: indexPath) as! bhkCell
                bhk.onerkBtn.tag = indexPath.row
                bhk.onerkBtn.addTarget(self, action: #selector(onerkcellbtntapped(sender:)), for: .touchUpInside)
                bhk.twobhkBtn.tag = indexPath.row
                bhk.twobhkBtn.addTarget(self, action: #selector(twobhkcellbtntapped(sender:)), for: .touchUpInside)
                bhk.twofivebhkBtn.tag = indexPath.row
                bhk.twofivebhkBtn.addTarget(self, action: #selector(twofivecellbtntapped(sender:)), for: .touchUpInside)
                
                bhk.threebhkbtn.tag = indexPath.row
                bhk.threebhkbtn.addTarget(self, action: #selector(threebhkcellbtntapped(sender:)), for: .touchUpInside)
                bhk.fourbhkBtn.tag = indexPath.row
                bhk.fourbhkBtn.addTarget(self, action: #selector(fourbhkbtntapped(sender:)), for: .touchUpInside)
                bhk.fivebhkBtn.tag = indexPath.row
                bhk.fivebhkBtn.addTarget(self, action: #selector(fivebhkbtntapped(sender:)), for: .touchUpInside)
                return bhk
            }else  if indexPath.section == 7 {
                let pricerange = tableView.dequeueReusableCell(withIdentifier: "PriceRangeCell", for: indexPath) as! PriceRangeCell
               
                return pricerange
            }else if indexPath.section == 8{
                let propstatus = tableView.dequeueReusableCell(withIdentifier: "resalepropertystatus", for: indexPath) as! resalepropertystatus
                
                return propstatus
        }else if indexPath.section == 9{
                let advancedfiltercell = tableView.dequeueReusableCell(withIdentifier: "resaleadvancefiltercell", for: indexPath) as! resaleadvancefiltercell
                advancedfiltercell.rparking.tag = indexPath.row
                advancedfiltercell.rparking.addTarget(self, action: #selector(rparking(sender:)), for: .touchUpInside)
                advancedfiltercell.rgymbtn.tag = indexPath.row
                advancedfiltercell.rgymbtn.addTarget(self, action: #selector(rgymbtn(sender:)), for: .touchUpInside)
                advancedfiltercell.rswimmingpoolbtn.tag = indexPath.row
                advancedfiltercell.rswimmingpoolbtn.addTarget(self, action: #selector(rswimmingpoolbtn(sender:)), for: .touchUpInside)
                
                advancedfiltercell.rclubhousebtn.tag = indexPath.row
                advancedfiltercell.rclubhousebtn.addTarget(self, action: #selector(rclubhousebtn(sender:)), for: .touchUpInside)
                advancedfiltercell.rpowerbackbtn.tag = indexPath.row
                advancedfiltercell.rpowerbackbtn.addTarget(self, action: #selector(rpowerbackbtn(sender:)), for: .touchUpInside)
                advancedfiltercell.rliftbtn.tag = indexPath.row
                advancedfiltercell.rliftbtn.addTarget(self, action: #selector(rliftbtn(sender:)), for: .touchUpInside)
                advancedfiltercell.rgardenbtn.tag = indexPath.row
                advancedfiltercell.rgardenbtn.addTarget(self, action: #selector(rgardenbtn(sender:)), for: .touchUpInside)
                advancedfiltercell.rsecuritybtn.tag = indexPath.row
                advancedfiltercell.rsecuritybtn.addTarget(self, action: #selector(rsecuritybtn(sender:)), for: .touchUpInside)
                advancedfiltercell.rvastucomplaintbtn.tag = indexPath.row
                advancedfiltercell.rvastucomplaintbtn.addTarget(self, action: #selector(rvastucomplaintbtn(sender:)), for: .touchUpInside)
                
                advancedfiltercell.rreraregbtn.tag = indexPath.row
                advancedfiltercell.rreraregbtn.addTarget(self, action: #selector(rreraregbtn(sender:)), for: .touchUpInside)
                advancedfiltercell.rpipedgasbtn.tag = indexPath.row
                advancedfiltercell.rpipedgasbtn.addTarget(self, action: #selector(rpipedgasbtn(sender:)), for: .touchUpInside)
                advancedfiltercell.rfurnishingfullbtn.tag = indexPath.row
                advancedfiltercell.rfurnishingfullbtn.addTarget(self, action: #selector(rfurnishingfullbtn(sender:)), for: .touchUpInside)
                advancedfiltercell.rfurnishingsemibtn.tag = indexPath.row
                advancedfiltercell.rfurnishingsemibtn.addTarget(self, action: #selector(rfurnishingsemibtn(sender:)), for: .touchUpInside)
                advancedfiltercell.rminrange.tag = indexPath.row
                advancedfiltercell.rminrange.addTarget(self, action: #selector(rminrange(sender:)), for: .touchUpInside)
            advancedfiltercell.rmaxrange.tag = indexPath.row
            advancedfiltercell.rmaxrange.addTarget(self, action: #selector(rmaxrange(sender:)), for: .touchUpInside)
            advancedfiltercell.lessthantwo.tag = indexPath.row
            advancedfiltercell.lessthantwo.addTarget(self, action: #selector(lessthantwo(sender:)), for: .touchUpInside)
            advancedfiltercell.lessthanthree.tag = indexPath.row
            advancedfiltercell.lessthanthree.addTarget(self, action: #selector(lessthanthree(sender:)), for: .touchUpInside)
            advancedfiltercell.lessthanfive.tag = indexPath.row
            advancedfiltercell.lessthanfive.addTarget(self, action: #selector(lessthanfive(sender:)), for: .touchUpInside)
                return advancedfiltercell
        }else if indexPath.section == 10{
            let searchcell = tableView.dequeueReusableCell(withIdentifier: "ShareButtonCell", for: indexPath) as! ShareButtonCell
            searchcell.searchbtn.tag = indexPath.row
            searchcell.searchbtn.addTarget(self, action: #selector(searchbtn(sender:)), for: .touchUpInside)
        return searchcell
        }
            
        }
        return UITableViewCell()
    }


    func changeSegment(_ sender:UIButton){
        propbarbutton.isEnabled = false
        propbarbutton.tintColor = .clear
        selected_index = sender.tag
        if sender.tag == 1{
            propbarbutton.isEnabled = false
            propbarbutton.tintColor = .clear
            propbarbutton.customView?.isHidden = true
          sender.setTitle("BUY", for: .normal)
          print("Clicked on Buy")
            tabView.reloadData()
          
        }else if sender.tag == 2{
            propbarbutton.isEnabled = false
            propbarbutton.tintColor = .clear
            propbarbutton.customView?.isHidden = true
            sender.setTitle("RENT", for: .normal)
            tabView.reloadData()
           
            print("Clicked on Rent")
        }
//        tableView.reloadSections(IndexSet(integer: 1), with: .none)
//        tableView.reloadSections(IndexSet(integer: 2), with: .none)
    }
    
    func typechangeSegment(_ sender:UIButton){
        selected_index = sender.tag
        if sender.tag == 3{
            print("residential click")
            tabView.reloadData()
        }else if sender.tag == 4{
            tabView.reloadData()
            print("commercial click")
        }
        else if sender.tag == 5{
            tabView.reloadData()
            print("land click")
        }

    }
    
    func advanceaction(_ sender:UIButton){
        selected_index = sender.tag
        if sender.tag == 8{
            print("advance click")
            tabView.reloadData()
        }

    }
    
    func comadvanceaction(_ sender:UIButton){
        selected_index = sender.tag
        if sender.tag == 9{
            print("advance click")
            tabView.reloadData()
        }

    }
    
    func categorychangeSegment(_ sender: UIButton) {
        selected_index = sender.tag
        if sender.tag == 6{
            print("Clicked on newproj")
            tabView.reloadData()
        }else if sender.tag == 7{
            tabView.reloadData()
            print("Clicked on resale")
        }

    }
    
    func resaleadvanceaction(_ sender: UIButton) {
        selected_index = sender.tag
        if sender.tag == 15{
            print("resale advance click")
            tabView.reloadData()
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return realityservice.count
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                performSegue(withIdentifier: "collpass", sender: self)
                print("collection tapped")

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let popularPicksCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyCollectionCell", for: indexPath) as! PropertyCollectionCell
        popularPicksCell.nameLabel.text =  realityservice[indexPath.row].name
        popularPicksCell.priceLabel.text = realityservice[indexPath.row].price
        popularPicksCell.smallDescriptionLabel.text = "\(realityservice[indexPath.row].city)|"
        popularPicksCell.bhkcount.text = "\(realityservice[indexPath.row].bhkcount)BHK|"
        popularPicksCell.sqftcount.text = "\(realityservice[indexPath.row].sqftsize) sq.ft"
     //   popularPicksCell.typeSpecificationLabel.text = "asdasd"      ///realityservice[indexPath.row].type
     //   popularPicksCell.banner.image = UIImage(named: "\(realityservice[indexPath.row].images)")
        
        let bannerImaGE = realityservice[indexPath.row].images

        if let imageURL = URL(string: bannerImaGE) {
                   print(imageURL)
                   if let data = try? Data(contentsOf: imageURL) {
                       print(data)
                    popularPicksCell.banner.image = UIImage(data: data)
                   }
               }
        
        print("The image is  UIImage(named:\(realityservice[indexPath.row].images)")
        

            
        return popularPicksCell
    }
    
  //BUY RESIDENTIAL Radio
  //---->Property Type
    
    
    @objc func appartmentcellbtntapped(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
          
        } else {
            sender.isSelected = true
          
        }
      
    }
    
    @objc func independentcellbtntapped(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            
            
        } else {
            sender.isSelected = true
           
            
        }
        
    }
    
    
    @objc func gatedcommunitycellbtntapped(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
           
            
        } else {
            sender.isSelected = true
           
        }
    }
    
    @objc func beachhousecellbtntapped(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            
        } else {
            sender.isSelected = true
      
        }
        
    }
    
    @objc func duplexcellbtntapped(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
           
        } else {
            sender.isSelected = true
          
        }
  
    }
    
    
    //----> BHK
      
      
    @objc func onerkcellbtntapped(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
            
          } else {
              sender.isSelected = true
            
          }
        
      }
      
    @objc func twobhkcellbtntapped(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
              
              
          } else {
              sender.isSelected = true
             
              
          }
          
      }
      
      
    @objc func twofivecellbtntapped(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
             
              
          } else {
              sender.isSelected = true
             
          }
      }
      
    @objc func threebhkcellbtntapped(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
              
          } else {
              sender.isSelected = true
        
          }
          
      }
      
    @objc func fourbhkbtntapped(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
             
          } else {
              sender.isSelected = true
            
          }
    
      }
    
    @objc func fivebhkbtntapped(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
           
        } else {
            sender.isSelected = true
          
        }
  
    }
    //---->minamt - maxamt
    @objc func minamtbtntapped(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
           
        } else {
            sender.isSelected = true
          
        }
  
    }
  
    @objc func maxamtbtntapped(sender:UIButton) {
      if sender.isSelected {
          sender.isSelected = false
         
      } else {
          sender.isSelected = true
        
      }
    }
        
        
        //---->AdvancedFiltercell
        
        
        
        @objc func parking(sender:UIButton) {
            if sender.isSelected {
                sender.isSelected = false
              
            } else {
                sender.isSelected = true
              
            }
          
        }
        
        @objc func gymbtn(sender:UIButton) {
            if sender.isSelected {
                sender.isSelected = false
                
                
            } else {
                sender.isSelected = true
               
                
            }
            
        }
        
        
        @objc func swimmingpoolbtn(sender:UIButton) {
            if sender.isSelected {
                sender.isSelected = false
               
                
            } else {
                sender.isSelected = true
               
            }
        }
        
        @objc func clubhousebtn(sender:UIButton) {
            if sender.isSelected {
                sender.isSelected = false
                
            } else {
                sender.isSelected = true
          
            }
            
        }
        
        @objc func powerbackbtn(sender:UIButton) {
            if sender.isSelected {
                sender.isSelected = false
               
            } else {
                sender.isSelected = true
              
            }
      
        }
        
  
        @objc func liftbtn(sender:UIButton) {
              if sender.isSelected {
                  sender.isSelected = false
                
              } else {
                  sender.isSelected = true
                
              }
            
          }
          
        @objc func gardenbtn(sender:UIButton) {
              if sender.isSelected {
                  sender.isSelected = false
                  
                  
              } else {
                  sender.isSelected = true
                 
                  
              }
              
          }
          
          
        @objc func securitybtn(sender:UIButton) {
              if sender.isSelected {
                  sender.isSelected = false
                 
                  
              } else {
                  sender.isSelected = true
                 
              }
          }
          
        @objc func vastucomplaintbtn(sender:UIButton) {
              if sender.isSelected {
                  sender.isSelected = false
                  
              } else {
                  sender.isSelected = true
            
              }
              
          }
          
        @objc func reraregbtn(sender:UIButton) {
              if sender.isSelected {
                  sender.isSelected = false
                 
              } else {
                  sender.isSelected = true
                
              }
        
          }
        
        @objc func pipedgasbtn(sender:UIButton) {
            if sender.isSelected {
                sender.isSelected = false
               
            } else {
                sender.isSelected = true
              
            }
        }
        @objc func furnishingfullbtn(sender:UIButton) {
              if sender.isSelected {
                  sender.isSelected = false
                
              } else {
                  sender.isSelected = true
                
              }
          }
          
        @objc func furnishingsemibtn(sender:UIButton) {
              if sender.isSelected {
                  sender.isSelected = false
           
              } else {
                  sender.isSelected = true

              }}
          
          
        @objc func twentyonebtn(sender:UIButton) {
              if sender.isSelected {
                  sender.isSelected = false
                 
                  
              } else {
                  sender.isSelected = true
                 
              }
          }
          
        @objc func twentytwobtn(sender:UIButton) {
              if sender.isSelected {
                  sender.isSelected = false
                  
              } else {
                  sender.isSelected = true
            
              }
              
          }
          
        @objc func twentythreebtn(sender:UIButton) {
              if sender.isSelected {
                  sender.isSelected = false
                 
              } else {
                  sender.isSelected = true
                
              }
        
          }
        
        @objc func twentyfourbtn(sender:UIButton) {
            if sender.isSelected {
                sender.isSelected = false
               
            } else {
                sender.isSelected = true
              
            }
        

  }
    //--->Commercial Advance Filter cell
    
    @objc func cparking(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
          
        } else {
            sender.isSelected = true
          
        }
    }
    
    @objc func cafeteria(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
      
        } else {
            sender.isSelected = true
        }
    }
    
    
    @objc func clift(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
         
        } else {
            sender.isSelected = true
           
        }
    }
    
    @objc func garden(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            
        } else {
            sender.isSelected = true
      
        }
        
    }
    
    @objc func security(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
           
        } else {
            sender.isSelected = true
          
        }
  
    }
    
 
    @objc func powerbackup(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
            
          } else {
              sender.isSelected = true
            
          }
        
      }
      
    @objc func rera(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
              
              
          } else {
              sender.isSelected = true
             
              
          }
          
      }
      
      
    @objc func cfullfurnished(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
             
              
          } else {
              sender.isSelected = true
             
          }
      }
      
    @objc func csemifurniched(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
              
          } else {
              sender.isSelected = true
        
          }
          
      }
      
    @objc func cpartiallyfurnished(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
             
          } else {
              sender.isSelected = true
            
          }
    
      }
    
    @objc func immediate(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
           
        } else {
            sender.isSelected = true
          
        }
    }
    @objc func withinfifteendays(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
            
          } else {
              sender.isSelected = true
            
          }
        
      }
      
    @objc func withinthirtydays(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
              
              
          } else {
              sender.isSelected = true
             
              
          }
          
      }
      
      
    @objc func afterthirtydays(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
             
              
          } else {
              sender.isSelected = true
             
          }
      }
    
    //BUY COMMERCIAL RADIO
    
    @objc func officespace(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
           
        } else {
            sender.isSelected = true
          
        }
  
    }
    
 
    @objc func commercialbuilding(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
            
          } else {
              sender.isSelected = true
            
          }
        
      }
      
    @objc func standaloneland(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
              
              
          } else {
              sender.isSelected = true
             
              
          }
          
      }
      
      
    @objc func warehouse(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
             
              
          } else {
              sender.isSelected = true
             
          }
      }
      
    @objc func industrialbuilding(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
              
          } else {
              sender.isSelected = true
        
          }
          
      }
      
    @objc func coworkingspace(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
             
          } else {
              sender.isSelected = true
            
          }
    
      }
    //---> Resale residential
    
    @objc func rparking(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
          
        } else {
            sender.isSelected = true
          
        }
    }
    
    @objc func rgymbtn(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
      
        } else {
            sender.isSelected = true
        }
    }
    
    
    @objc func rswimmingpoolbtn(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
         
        } else {
            sender.isSelected = true
           
        }
    }
    
    @objc func rclubhousebtn(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            
        } else {
            sender.isSelected = true
      
        }
        
    }
    
    @objc func rpowerbackbtn(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
           
        } else {
            sender.isSelected = true
          
        }
  
    }
    
 
    @objc func rliftbtn(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
            
          } else {
              sender.isSelected = true
            
          }
        
      }
      
    @objc func rgardenbtn(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
              
              
          } else {
              sender.isSelected = true
             
              
          }
          
      }
      
      
    @objc func rsecuritybtn(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
             
              
          } else {
              sender.isSelected = true
             
          }
      }
      
    @objc func rvastucomplaintbtn(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
              
          } else {
              sender.isSelected = true
        
          }
          
      }
      
    @objc func rreraregbtn(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
             
          } else {
              sender.isSelected = true
            
          }
    
      }
    
    @objc func rpipedgasbtn(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
           
        } else {
            sender.isSelected = true
          
        }
    }
    @objc func rfurnishingfullbtn(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
            
          } else {
              sender.isSelected = true
            
          }
        
      }
      
    @objc func rfurnishingsemibtn(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
              
              
          } else {
              sender.isSelected = true
             
              
          }
          
      }
      
      
    @objc func rminrange(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
             
              
          } else {
              sender.isSelected = true
             
          }
      }
    
    @objc func rmaxrange(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
             
              
          } else {
              sender.isSelected = true
             
          }
      }
   
    @objc func lessthantwo(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
             
              
          } else {
              sender.isSelected = true
             
          }
      }
    
    @objc func lessthanthree(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
             
              
          } else {
              sender.isSelected = true
             
          }
      }
    
    @objc func lessthanfive(sender:UIButton) {
          if sender.isSelected {
              sender.isSelected = false
             
              
          } else {
              sender.isSelected = true
             
          }
      }
    
    
    
    
    ///---->Search button tapped

    
    @objc func searchbtn(sender:UIButton) {
          performSegue(withIdentifier: "searchtapped", sender: self)
      }
    
    
    
    
    
    @objc func propnearmentapped(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
           
        } else {
            sender.isSelected = true
          
        }
  
    }
    
//    func downloadItems() {
//
////        guard let employee_id = UserDefaults.standard.value(forKey: "employee_id") as? String else {return}
////
//
//        let request = NSMutableURLRequest(url: NSURL(string:"https://propcierge.in/stage/api/version_reality/reality_details.php")! as URL)
//            request.httpMethod = "POST"
//            let postString = "property_id=3553232141"
//            print("postString \(postString)")
//            request.httpBody = postString.data(using: String.Encoding.utf8)
//        let task = URLSession.shared.dataTask(with: request as URLRequest) {
//              data, response, error in
//              if error != nil {
//                print("error=\(String(describing: error))")
//                return
//              }
//              self.parseJSON(data!)
//              print("response = \(String(describing: response))")
//              let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//              print("responseString = \(String(describing: responseString))")
//            }
//            task.resume()
//
//            }
//
//    func parseJSON(_ data:Data) {
//        var jsonResult = NSArray()
//            do{
//                jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
//            } catch let error as NSError {
//                print(error)
//            }
//            var jsonElement = NSDictionary()
//     let stocks = NSMutableArray()
//        for i in 0 ..< jsonResult.count
//             {
//            print("The count is \(jsonResult.count)")
//            jsonElement = jsonResult[i] as! NSDictionary
//                //the following insures none of the JsonElement values are nil through optional binding
//            let title = jsonElement["title"] as? String
//            let amount = jsonElement["amount"] as? String
//            let images = jsonElement["photos"] as? String
//            let reality_type = jsonElement["reality_type"] as? String
//            let flatType = jsonElement["type"] as? String
//            let sqft = jsonElement["sq_ft"] as? String
//            let furnishtype = jsonElement["furnising_type"] as? String
//            let city = jsonElement["city"] as? String
//
//            realityservice.append(Property(name: title, price: amount, images: images, type: reality_type, flatType: flatType, city: city, sqftsize: sqft, isWishlisted: true, finishType: furnishtype))
//
//
//
//            }
//        DispatchQueue.main.async(execute: { [self] () -> Void in
//            tabView.reloadData()
//
//        })
//}
    func makeGetCall() {
      // Set up the URL request
      let urlstring: String = "https://propcierge.in/stage/api/version_reality/reality_details.php"
      guard let url = URL(string: urlstring) else {
        print("Error: cannot create URL")
        return
      }
      let urlRequest = URLRequest(url: url)

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
                            print("the new real : \(i["owner_name"] as! String)")
                            let title = i["title"] as! String
                            let amount = i["amount"] as! String
                            let reality_type = i["reality_type"] as! String
                            let flatType = i["type"] as! String
                            let sqft = i["sq_ft"] as! String
                            let furnishtype = i["furnising_type"] as! String
                            let bhk_count = i["bhk_count"] as! String
                          let city = i["city"] as! String
       // var imageresult: String!
                            
                            let photo = i["photos"] as! [[String:Any]]
                            for j in photo{
                                let img = j["url"] as! String
                                           
                   
                                self.realityservice.append(Property(name: title , price: amount, images: img, type: reality_type, flatType: flatType, city: city, bhkcount: bhk_count,sqftsize: sqft, finishType: furnishtype))
                                
                                print("The reality service is\(self.realityservice)")
                                     
                                     print("The real name is \(self.realityservice)")
                                
                            }
                            

                        }
        
        DispatchQueue.main.async(execute: { [self] () -> Void in
                tabView.reloadData()
                
            })

        
      }catch  {
          print("error trying to convert data to JSON")
          return
        }
      }
      
    task.resume()
    }

    
    func GetCallforpropertynearyou() {
      // Set up the URL request
      let urlstring: String = "https://propcierge.in/stage/api/version_reality/reality_details.php"
      guard let url = URL(string: urlstring) else {
        print("Error: cannot create URL")
        return
      }
      let urlRequest = URLRequest(url: url)

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
                            print("the new real : \(i["owner_name"] as! String)")
                            let title = i["title"] as! String
                            let amount = i["amount"] as! String
                            let reality_type = i["reality_type"] as! String
                            let flatType = i["type"] as! String
                            let sqft = i["sq_ft"] as! String
                            let furnishtype = i["furnising_type"] as! String
                            let bhk_count = i["bhk_count"] as! String
                          let city = i["city"] as! String
       // var imageresult: String!
                            
                            let photo = i["photos"] as! [[String:Any]]
                            for j in photo{
                                let img = j["url"] as! String
                                           
                   
                self.propnearyou.append(Propertynearyou(name: title , price: amount, images: img, type: reality_type, flatType: flatType, city: city, bhkcount: bhk_count,sqftsize: sqft, finishType: furnishtype))
                                
                    print("The reality service is\(self.propnearyou)")
                                     
                
                                
                            }
                            

                        }
        
        DispatchQueue.main.async(execute: { [self] () -> Void in
                tabView.reloadData()
                
            })

        
      }catch  {
          print("error trying to convert data to JSON")
          return
        }
      }
      
    task.resume()
    }

   
 
    
    }

struct Property {
  let name:String
  let price:String
  let images: String
  let type:String// 1. For Rent || 2. For Sale
  let flatType:String //1. 1BHK || 2. 2BHK || 3. 3BHK
  let city:String
    let bhkcount: String
  let sqftsize:String //Size in sq.ft
//  var isWishlisted:Bool = false
  let finishType:String
  
    //1. Semi Furnished || 2. Fully Furnished
  //For Description Page
}

struct Propertynearyou {
  let name:String
  let price:String
  let images: String
  let type:String// 1. For Rent || 2. For Sale
  let flatType:String //1. 1BHK || 2. 2BHK || 3. 3BHK
  let city:String
    let bhkcount: String
  let sqftsize:String //Size in sq.ft
//  var isWishlisted:Bool = false
  let finishType:String
  
    //1. Semi Furnished || 2. Fully Furnished
  //For Description Page
}

extension Array
{
    func filterDuplicate(_ keyValue:((AnyHashable...)->AnyHashable,Element)->AnyHashable) -> [Element]
    {
        func makeHash(_ params:AnyHashable ...) -> AnyHashable
        {
           var hash = Hasher()
           params.forEach{ hash.combine($0) }
           return hash.finalize()
        }
        var uniqueKeys = Set<AnyHashable>()
        return filter{uniqueKeys.insert(keyValue(makeHash,$0)).inserted}
    }
}
