#import "Combinator.h"

@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    NSUInteger c = [[array firstObject] intValue];
    NSUInteger n = [[array lastObject] intValue];
    NSUInteger result = 2;
    
    if (n == 1) {
        return [array firstObject];
    }
    
    if (c == n) {
        return [[NSNumber alloc] initWithInt:1];
    }
   
    NSUInteger factN = [Combinator factorial:n];
    
    while (result < n) {
        NSUInteger tmp = factN / ( [Combinator factorial:(n - result)] * [Combinator factorial:result]);
        if(tmp == c) {
            return [[NSNumber alloc] initWithInt: (int)result];
        }
        result += 1;
    }
    
    return nil;
}

+ (NSUInteger)factorial:(NSUInteger) n {
    if (n == 0) {
        return 1;
    } else {
        return n * [Combinator factorial:(n - 1)];
    }
}

@end
