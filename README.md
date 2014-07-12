XMLGenerator
============

Create XML from code. Programmed in Swift

To create this XML...

<?xml version="1.0" encoding="UTF-8"?>
<Library address="0000 Candy Land Drive"/>
<catalog>
    <book id="0000">
        <author>Steven King</author>
    </book>
    <book id="0001">
        <author>Paulo Coehlo</author>
    </book>
</catalog>

... Create an XMLGenerator object by calling the constructor of either XMLGenerator() or XMLGenerator(ver:Double, encode:NSString).
To create a tag element, call the tag method and pass in the string for the tag name. 
To add attributes to the tag, call the tagAttributes after the tag method has been called. The parameter for tagAttributes is that of NSDictionary. At the moment the key and value must be string types. Primitive and other objects are not available to be the key or value.
To close a tag, there are two ways. By using the end() method which will cause the tag to end with a '/>'. The endTag() will result in ending the tag with '</SomeTagName>'. 
Do not call end() if you call the addElement(input:NSString) method. This will cause the XML to be badly formed (assert methods will be added in the next version). 
To add text between the open and close tags, use addElement(input:NSString). This will properly insert text while closing the tag accordingly by using the tag name.
When everything is in place, call output() to get the string representation of the XML.

Warning, keep tabs on the end tag methods when/where they are called and how many times.

To create the xml above, use this code below.

let xml = XMLGenerator(ver: 1.0, encode: "UTF-8");
xml.tag("Library");
xml.tagAttributes(["address":"0000 Candy Land Drive"]);xml.end()
xml.tag("catalog")
    xml.tag("book")
    xml.tagAttributes(["id":"0000"])
        xml.tag("author")
        xml.addElement("Steven King") 
    xml.endTag()
    xml.tag("book")
    xml.tagAttributes(["id":"0001"])
        xml.tag("author")
        xml.addElement("Paulo Coehlo")
    xml.endTag()
xml.endTag()