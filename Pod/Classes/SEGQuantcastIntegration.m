#import "SEGQuantcastIntegration.h"
#import <Quantcast-Measure/QuantcastMeasurement.h>
#import <Analytics/SEGAnalyticsUtils.h>

@implementation SEGQuantcastIntegration

#pragma mark - Initialization

- (id)initWithSettings:(NSDictionary *)settings
{
    if (self = [super init]) {
        self.settings = settings;
        
        NSString *apiKey = [settings objectForKey:@"apiKey"];
        [[QuantcastMeasurement sharedInstance] setupMeasurementSessionWithAPIKey:apiKey userIdentifier:nil labels:nil];
        //[QuantcastMeasurement sharedInstance].enableLogging = YES;
    }
    return self;
}


- (void)identify:(SEGIdentifyPayload *)payload
{
    // TODO add support for labels?
    if (payload.userId) {
        [[QuantcastMeasurement sharedInstance] recordUserIdentifier:payload.userId withLabels:nil];
    }
}


- (void)track:(SEGTrackPayload *)payload
{
    // TODO add support for labels?
    [[QuantcastMeasurement sharedInstance] logEvent:payload.event withLabels:nil];
}

- (void)screen:(SEGScreenPayload *)payload
{
    NSString *event = [[NSString alloc] initWithFormat:@"Viewed %@ Screen", payload.name];
    [[QuantcastMeasurement sharedInstance] logEvent:event withLabels:nil];
}

@end