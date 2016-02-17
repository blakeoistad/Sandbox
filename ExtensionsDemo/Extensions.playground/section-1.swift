// Playground - noun: a place where people can play

import UIKit

extension UIImage {
    
    // Returns a half-size image from the current image
    var halfSizeImage: UIImage?
        {
        let halfWidth = self.size.width / 2
            let halfHeight = self.size.height / 2
            UIGraphicsBeginImageContext(CGSize(width: halfWidth, height: halfHeight))
            self.drawInRect(CGRectMake(0, 0, halfWidth, halfHeight))
            var image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
    }
}

extension UILabel {
    
    // Initializer that accepts the label text
    convenience init(text: String)
    {
        self.init()
        self.text = text
    }
}

extension String {
    
    // Returns the Character at the specified index
    subscript(index: Int) -> Character? {
        
        var charAtIndex: Character?
            
            if (index >= 0 && index < countElements(self))
            {
                var firstChar = self.startIndex
                charAtIndex = self[advance(startIndex, index)]
            }
            else
            {
                return nil
            }
            return charAtIndex
    }
}



