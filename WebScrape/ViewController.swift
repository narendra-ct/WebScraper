//
//  ViewController.swift
//  WebScrape
//
//  Created by IERO_DEV on 14/06/19.
//  Copyright © 2019 IERO_DEV. All rights reserved.
//

import UIKit
import Alamofire
import Kanna

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        scrapeNYCMetalScene()
    }
    
    @IBAction func button1Action1(_ sender: Any) {
        scrapeAmazonIn()
    }
    
    @IBAction func button2Action2(_ sender: Any) {
        scrapeAmazonCom()
    }
    
    @IBAction func dynamicAction(_ sender: Any) {
       
//        let link = "https://www.etsy.com/in-en/listing/632458365/personalised-foil-notebook-a5-notebook?ref=hp_prn&bes=1";
        
        
        // let link = "https://www.aliexpress.com/item/32982338666.html?spm=a2g01.ams_82789.layer-nban3a.1.2ee344c7MSRCRF"
        
        let link = "https://www.aliexpress.com/item/32504733682.html?spm=a2g01.12597576.p99adbb.11.479a6501n7UXkA&gps-id=6272395&scm=1007.16233.119941.0&scm_id=1007.16233.119941.0&scm-url=1007.16233.119941.0&pvid=0db5b018-dee0-4c69-8b5d-437e13e1ce55"
        
        AF.request(link).responseString { response in
            let value = try? response.result.get()
            if let _value = value {
                print(_value)
                self.parseHTML(html: _value)
            }
        }
    }
    
    // Grabs the HTML from nycmetalscene.com for parsing.
    func scrapeNYCMetalScene() -> Void {
        AF.request("https://www.amazon.in/Amazon-FireTV-Stick-4K-Alexa-Voice-Remote-Streaming-Player/dp/B079QQZZJK/ref=pd_sim_23_4/261-7187993-3239608?_encoding=UTF8&pd_rd_i=B079QQZZJK&pd_rd_r=de1ef60e-8e8b-11e9-8b78-3da000dfd895&pd_rd_w=KbaRz&pd_rd_wg=eGGZi&pf_rd_p=3ba80840-2950-4d64-ba61-c68a14bd0939&pf_rd_r=N0SDQPTQ2QTBYEHRB99T&psc=1&refRID=N0SDQPTQ2QTBYEHRB99T").responseString { response in
            let value = try! response.result.get()
            print(value)
            self.parseHTML(html: value)
        }
    }
    
    func parseHTML(html: String) -> Void {
        // Finish this next
        if let doc = try? Kanna.HTML(html: html, encoding: String.Encoding.utf8) {
            print(doc.title)
            
            
            /* // ALI EXPRS
            if let base = doc.at_css("head"){
                // print(base?.toHTML)
                for link in base.css("meta") {
                    //print(link["name"])
                    if let linkStr = link["property"], linkStr == "og:image" {
                        print(link["content"])
                    }
                    
                    if let titleStr = link["property"], titleStr == "og:title" {
                        print(link["content"])
                    }
                }
                for link in base.css("link") {
                    // print(link["rel"])
                    if let linkStr = link["rel"], linkStr == "canonical" {
                       print(link["href"])
                    }
                }
            }
            
            let s = doc.at_css("title")
            print(s?.text)
            let priceAm = doc.at_css("span#j-sku-discount-price")
            if let price = priceAm?.text {
                print(price)
            }
            if let base = doc.at_css("div#j-product-info-sku"){
                // print(base?.toHTML)
                for link in base.css("img") {
                    print(link["src"])
                    print(link["bigpic"])
                }
            }
            if let base = doc.at_css("div#j-detail-gallery-main"){
                // print(base?.toHTML)
                for link in base.css("img") {
                    print(link["src"])
                    print(link["bigpic"])
                }
            }
            */
            
            
            
            

            
            /* // W-MART
            let s = doc.at_css("script#item")
            if let price = s?.text {
                print(price)
                do{
                    if let json = price.data(using: String.Encoding.utf8){
                        if let jsonData = try JSONSerialization.jsonObject(with: json, options: .allowFragments) as? [String:AnyObject]{
                            print(jsonData)
                        }
                    }
                }catch {
                    print(error.localizedDescription)
                }
            } */
            
            
            /* //AMAZ
            let s = doc.at_css("span#priceblock_ourprice")
            if let price = s?.text {
                let priceStr = price.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                print(priceStr)
                
                let filteredPrice = price.filter { !" \n\t\r".contains($0) }.trimmingCharacters(in: .whitespacesAndNewlines)
                print(filteredPrice)
                let components = filteredPrice.components(separatedBy: ".")
                if components.count > 1 {
                    // expected
                }else if let firstObj = components.first{
                    let dollar = firstObj.prefix(1)
                    let priceStrFull = firstObj.suffix(firstObj.count - 1)
                    if priceStrFull.count >= 2 {
                        let priceStrDev = priceStrFull.suffix(priceStrFull.count - 2)
                        let priceStrDevPre = priceStrFull.prefix(priceStrFull.count - 2)
                        let updatedPrice = "\(priceStrDevPre).\(priceStrDev)"
                        print(updatedPrice)
                    }
                }
            }
            
            let stitle = doc.at_css("span#productTitle")
            if let tilte = stitle?.text {
                let showString = tilte.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                print(showString)
            }
            
            if let base = doc.at_css("div#imgTagWrapperId"){
                // print(base?.toHTML)
                for link in base.css("img") {
                    print(link["src"])
                    print(link["data-old-hires"])
                }
            } */
        }
    }
}

extension ViewController {
    func scrapeAmazonIn() {
        AF.request("https://www.amazon.in/Amazon-Echo-Smart-speaker-Powered/dp/B0725W7Q38/ref=sr_1_1?keywords=alexa&qid=1561352374&s=gateway&sr=8-1").responseString { response in
            let value = try! response.result.get()
            print(value)
            self.parseHTML(html: value)
        }
    }
    
    func scrapeAmazonCom() {
        AF.request("https://www.amazon.com/Echo-2nd-Generation-International-Version/dp/B075RSCZHD/ref=sr_1_3?keywords=Amazon+Echo&qid=1561352405&s=gateway&sr=8-3").responseString { response in
            let value = try! response.result.get()
            print(value)
            self.parseHTML(html: value)
        }
    }
}

