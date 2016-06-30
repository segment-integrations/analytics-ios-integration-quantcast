#import "SEGQuantcastIntegrationFactory.h"
#import "SEGQuantcastIntegration.h"

@implementation SEGQuantcastIntegrationFactory

+ (instancetype)instance
{
    static dispatch_once_t once;
    static SEGQuantcastIntegrationFactory *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    return self;
}

- (id<SEGIntegration>)createWithSettings:(NSDictionary *)settings forAnalytics:(SEGAnalytics *)analytics
{
    return [[SEGQuantcastIntegration alloc] initWithSettings:settings];
}

- (NSString *)key
{
    return @"Quantcast";
}

@end
