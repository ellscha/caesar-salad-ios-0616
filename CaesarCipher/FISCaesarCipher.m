//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher
//Ascii numbers for lowercase letters range from 97-122
//uppercase letters range from 65-90
- (NSString *)encodeMessage:(NSString *)message withOffset:(NSInteger)key{
    unichar newAsciiCode;
    NSString *encodedMessage;
    NSMutableString *fullEncodedMessage = [NSMutableString new];
    NSInteger whatToAdd = key %26;
    for (NSUInteger i = 0; i<[message length]; i++) {
        unichar asciiCode = [message characterAtIndex:i];
        if (key%26 ==0) {
            newAsciiCode=asciiCode;
        }
        else if (asciiCode >= 97 && asciiCode <= 122) {
            newAsciiCode = asciiCode + whatToAdd;
            if (newAsciiCode > 122) {
                NSInteger numberToAddToPerserveCase = newAsciiCode - 122;
                newAsciiCode = 96 + numberToAddToPerserveCase;
                
            }
        }
        else if (asciiCode >=65 && asciiCode <= 90 ) {
            newAsciiCode = asciiCode + whatToAdd;
            if (newAsciiCode >= 91) {
                NSInteger numberToAddToPerserveCase = newAsciiCode - 90;
                newAsciiCode = 64 + numberToAddToPerserveCase;
            }
            
        }
        else {
            newAsciiCode = asciiCode;
        }
            
        encodedMessage = [NSString stringWithFormat:@"%C", newAsciiCode];
        [fullEncodedMessage appendString:encodedMessage];
        
        
    }
    return fullEncodedMessage;
}
-(NSString *)decodeMessage:(NSString *)encodedMessage withOffset:(NSInteger)key{
    unichar newAsciiCode;
    NSString *decodedMessage;
    NSMutableString *fullDecodedMessage = [NSMutableString new];
    NSInteger whatToSubtract = key %26;

    for (NSUInteger i = 0; i<[encodedMessage length]; i++) {
        unichar asciiCode = [encodedMessage characterAtIndex:i];
        //character will end up at same place every 26 places ideally
    
        if (key%26 ==0) {
            newAsciiCode=asciiCode;
        }
        
        else if (asciiCode >= 97 && asciiCode <= 122) {
            newAsciiCode = asciiCode - whatToSubtract;
        
            if (newAsciiCode < 97) {
                NSInteger numberToSubtractToPerserveCase = 97 - newAsciiCode;
                newAsciiCode = 123 - numberToSubtractToPerserveCase;
                
            }
        }
        //uppercase strings below
        else if (asciiCode >=65 && asciiCode <= 90 ) {
            newAsciiCode = asciiCode - whatToSubtract;
        
            if (newAsciiCode < 65) {
                NSInteger numberToSubtractToPerserveCase = 65 - newAsciiCode;
                newAsciiCode = 91 - numberToSubtractToPerserveCase;
            }
            
        }
        
        else {
        
            newAsciiCode = asciiCode;
        }
        
        decodedMessage = [NSString stringWithFormat:@"%C", newAsciiCode];
        [fullDecodedMessage appendString:decodedMessage];
        
        
    }

    return fullDecodedMessage;
}

@end
