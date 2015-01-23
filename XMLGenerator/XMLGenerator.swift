//
//  XMLGenerator.swift
//  XMLGenerator
//
//  Created by iury bessa on 7/11/14.
//  Copyright (c) 2014 yellokrow. All rights reserved.
//

import Foundation

class XMLGenerator {
    
    var xmlString : NSMutableString = "";
    var tags:Array<String> = [];
    let ELEMENT = ""
    
    init()
    {
        xmlString.appendString("<?xml version=\"1.0\" encoding=\"UTF-8\"?>")
    }
    
    init(ver:Double,encode:NSString)
    {
        xmlString.appendString("<?xml version=\"\(ver)\" encoding=\"\(encode)\"?>")
    }
    
    func tag(tagName:NSString)
    {
        assert(tagName != ELEMENT, "CANNOT HAVE TAGNAME TO BE EMPTY")
        
        xmlString.appendString("<\(tagName)>")
        tags.append(tagName)
    }
    
    func tag(tagName: NSString, attributes: NSDictionary) {
        tag(tagName)
        tagAttributes(attributes)
    }
    
    func tag(tagName: NSString, contentBlock: ()->()) {
        tag(tagName)
        contentBlock()
        endTag()
    }
    
    func tag(tagName: NSString, attributes: NSDictionary, contentBlock: ()->()) {
        tag(tagName)
        tagAttributes(attributes)
        contentBlock()
        endTag()
    }
    
    func tagAttributes(attributes:NSDictionary)
    {
        var tempXMLAttributes: NSMutableString = ""
        let keys = attributes.allKeys
        let lastIndex = keys.count - 1
        var counter = 0
        for k in keys {
            let value:NSString = attributes.objectForKey(k) as NSString
            if(counter != lastIndex)
            {
                tempXMLAttributes.appendString("\(k)=\"\(value)\" ")
            }
            else
            {
                tempXMLAttributes.appendString("\(k)=\"\(value)\"")
            }
            counter++;
        }
        
        let range = NSRange(location: xmlString.length - 1, length: 1)
        xmlString = NSMutableString(string: xmlString.stringByReplacingCharactersInRange(range, withString: " "))
        xmlString.appendString("\(tempXMLAttributes)>")
    }
    func addElement(input: NSString)
    {
        xmlString.appendString("\(input)</\(tags[tags.count-1])>")
        tags.removeLast()
    }
    
    func end()
    {
        assert(tags.count > 0, "Can't remove tag when there aren't any")
        
        let range = NSRange(location: xmlString.length - 1, length: 1)
        xmlString = NSMutableString(string: xmlString.stringByReplacingCharactersInRange(range, withString: "/>"))
        tags.removeLast()
    }
    
    func endTag()
    {
        assert(tags.count > 0, "Can't remove tag when there aren't any")
        
        xmlString.appendString("</\(tags[tags.count-1])>")
        tags.removeLast()
    }
    
    func output() -> String
    {
        return xmlString
    }
}