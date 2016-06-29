//
//  Video.swift
//  WWDCVideoApp
//
//  Created by Wouter Steidl on 29/06/16.
//  Copyright © 2016 CocoaHeads. All rights reserved.
//

import Foundation


//json data source
// "id": 403, "title": "Intermediate Swift", "track": "Tools", "focus": ["OS X", "iOS"], "description": "desc", "download_hd": "url", "download_sd": "url", "slides": "url", "url": "url", "year": 2014, "date": "2014-06-04"

struct Session {
    var focus: [String] = [String]()
    var track: String = ""
	var title: String = ""
	var description: String = ""
	var keywords: [String] = [String]()
    var url: URL?
    var urlHD: URL?
    var urlSD: URL?
    var year: Int = 0
    
    init(sessionDictionary:NSDictionary)
    {
        
        if let _focus = sessionDictionary.object(forKey: "focus") as? [String]  { focus = _focus }
        if let _track = sessionDictionary.object(forKey: "track") as? String    { track = _track }
        if let _title = sessionDictionary.object(forKey: "title") as? String  { title = _title }
        if let _description = sessionDictionary.object(forKey: "description") as? String { description = _description }

        generateKeywords()
        
        if let _url = sessionDictionary.object(forKey: "url") as? String { url = URL(string: _url) }
        if let _urlHD = sessionDictionary.object(forKey: "download_hd") as? String { urlHD = URL(string: _urlHD) }
        if let _urlSD = sessionDictionary.object(forKey: "download_sd") as? String { urlSD = URL(string: _urlSD) }
        if let _year = sessionDictionary.object(forKey: "year") as? Int { year = _year }
    
    }
    
    func generateKeywords()
    {
         
    }


}

struct Sessions
{
    var sessionList:[Session] = [Session]()
    
    init ()
    {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: videoData(), options:[])
            parseVideoData(jsonObject: jsonObject as! NSDictionary)
        } catch {
            print (error)
        }
    }
    
    func videoData()->Data{
        let _url = Bundle.main().urlForResource("videos", withExtension: "json")
        
        guard let url = _url
            else {return Data()}
        
        do {
            return try Data(contentsOf: url)
        } catch {
            return Data()
        }
    }

    mutating func parseVideoData(jsonObject:NSDictionary)
    {
        if let sessionsArray : NSArray = jsonObject.object(forKey: "sessions") as? NSArray
        {
            for _sessionDictionary in sessionsArray {
                
                guard let sessionDictionary: NSDictionary = _sessionDictionary as? NSDictionary
                    else {
                        print ("sessionDictionary not valid")
                        continue
                }
                
                sessionList.append(Session(sessionDictionary: sessionDictionary))
            }
        } else {
            print ("no videos found")
        }
    }
}
