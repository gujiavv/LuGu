//
//  WTService.swift
//  LuGu
//
//  Created by 111 on 2018/6/13.
//  Copyright © 2018年 mars. All rights reserved.
//

import Foundation
import Alamofire
import Kanna

let fuliBaseUrl = "http://www.dbmeinv.com/dbgroup/rank.htm?pager_offset="
let itemBaseUrl = "http://www.dbmeinv.com/dbgroup/show.htm?cid="
let meipaiBaseUrl = "http://www.dbmeinv.com/dbgroup/videos.htm?pager_offset="

func cidByItemNumber(number:Int) -> String {
    switch number {
    case 0:
        return "0"
    case 1:
        return "1"
    case 2:
        return "2"
    case 3:
        return "3"
    case 4:
        return "4"
    case 5:
        return "5"
    case 6:
        return "6"
    case 7:
        return "7"
    default:
        return "0"
    }
}

func requestItemImages(type:String,page:Int, completion: @escaping ([String]?) -> Void) -> Void {
    let url = itemBaseUrl + type + "&pager_offset=" + "\(page)"
    Alamofire.request(url, method: .get, parameters: nil, encoding:JSONEncoding.default, headers: nil).responseString { (response) in
        let isSuccess = response.result.isSuccess
        let html = response.result.value
        if isSuccess {
            var urls = [String]()
            if let doc = try? Kanna.HTML(html: html!, encoding: String.Encoding.utf8){
                CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingASCII)
                for node in doc.css("img"){
                    urls.append(node["src"]!)
                }
                completion(urls)
            }
        }
        
    }
}
