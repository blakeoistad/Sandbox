//
//  Person.h
//  classInSession
//
//  Created by Blake Oistad on 4/19/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
 
@public NSString *personName;
@private int age;
    
}
#pragma mark - Method Declarations
    
-(NSString *) welcome;
    

@end
