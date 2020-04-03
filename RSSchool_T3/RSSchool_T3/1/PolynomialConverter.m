#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    if([numbers count] == 0) {
          return nil;
      }
    
    BOOL flag = NO;
    
    NSMutableArray <NSNumber*>* _numbers = [[NSMutableArray alloc] initWithArray:numbers copyItems:YES];
    NSMutableString *result = [NSMutableString new];
    
    while ([_numbers count] != 0) {
        NSInteger value = [[_numbers firstObject] intValue];
        NSInteger exponent = [_numbers count] - 1;
        
        if(flag == YES){
            if(value < 0 ){
                [result appendString:@" - "];
                value *= -1;
            } else if(value > 0) {
                [result appendString:@" + "];
            } else {
                [_numbers removeObjectAtIndex:0];
                continue;
            }
        } else {
            if(value < 0 ){
                [result appendString:@"- "];
                value *= -1;
            } else if(value == 0) {
                [_numbers removeObjectAtIndex:0];
                continue;
            }
        }
        
        flag = YES;
        
        if(exponent != 0) {
            if(value != 1) {
                [result appendFormat:@"%ld", (long)value];
            }
            [result appendFormat:@"x"];
            if( exponent != 1) {
                [result appendFormat:@"^%ld", (long)exponent];
            }
            [_numbers removeObjectAtIndex:0];
            continue;
        }
        
        [result appendFormat:@"%ld", (long)value];
        [_numbers removeObjectAtIndex:0];
        
    }
    
    return result;
}
@end
