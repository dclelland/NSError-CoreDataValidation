//
//  NSError+CoreDataValidation.m
//  CALX
//
//  Created by Daniel Clelland on 13/01/14.
//  Copyright (c) 2014 Daniel Clelland. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "NSError+CoreDataValidation.h"

@implementation NSError (CoreDataValidation)

// https://developer.apple.com/library/ios/documentation/cocoa/Reference/CoreDataFramework/Miscellaneous/CoreData_Constants/Reference/reference.html

- (NSString *)coreDataValidationErrorDescription
{
    NSString *entity = [self.userInfo[NSValidationObjectErrorKey] entity].name;
    NSString *key = self.userInfo[NSValidationKeyErrorKey];
    NSObject *value = self.userInfo[NSValidationValueErrorKey];

    switch (self.code) {
        case NSValidationMultipleErrorsError: {
            NSString *string = [NSString stringWithFormat:@"Multiple errors:"];
            for (NSError *error in self.userInfo[NSDetailedErrorsKey]) {
                string = [string stringByAppendingFormat:@"\n%@", [error coreDataValidationError]];
            }
            return string;
        }

        case NSManagedObjectValidationError:
            return [NSString stringWithFormat:@"Core Data invalidation: %@ entity error on key \"%@\" with value \"%@\"", entity, key, value];
            
        case NSValidationMissingMandatoryPropertyError:
            return [NSString stringWithFormat:@"Core Data invalidation: %@ entity missing mandatory property \"%@\"", entity, key];
            
        case NSValidationRelationshipLacksMinimumCountError:
            return [NSString stringWithFormat:@"Core Data invalidation: %@ entity relationship \"%@\" lacks minimum count", entity, key];
            
        case NSValidationRelationshipExceedsMaximumCountError:
            return [NSString stringWithFormat:@"Core Data invalidation: %@ entity relationship \"%@\" exceeds maximum count", entity, key];
            
        case NSValidationRelationshipDeniedDeleteError:
            return [NSString stringWithFormat:@"Core Data invalidation: %@ entity relationship \"%@\" denied delete", entity, key];
            
        case NSValidationNumberTooLargeError:
            return [NSString stringWithFormat:@"Core Data invalidation: %@ entity number too large error on key \"%@\" with value \"%@\"", entity, key, value];
            
        case NSValidationNumberTooSmallError:
            return [NSString stringWithFormat:@"Core Data invalidation: %@ entity number too small error on key \"%@\" with value \"%@\"", entity, key, value];
            
        case NSValidationDateTooLateError:
            return [NSString stringWithFormat:@"Core Data invalidation: %@ entity date too late error on key \"%@\" with value \"%@\"", entity, key, value];
            
        case NSValidationDateTooSoonError:
            return [NSString stringWithFormat:@"Core Data invalidation: %@ entity date too soon error on key \"%@\" with value \"%@\"", entity, key, value];
            
        case NSValidationInvalidDateError:
            return [NSString stringWithFormat:@"Core Data invalidation: %@ entity invalid date error on key \"%@\" with value \"%@\"", entity, key, value];
            
        case NSValidationStringTooLongError:
            return [NSString stringWithFormat:@"Core Data invalidation: %@ entity string too long error on key \"%@\" with value \"%@\"", entity, key, value];
            
        case NSValidationStringTooShortError:
            return [NSString stringWithFormat:@"Core Data invalidation: %@ entity string too short error on key \"%@\" with value \"%@\"", entity, key, value];
            
        case NSValidationStringPatternMatchingError:
            return [NSString stringWithFormat:@"Core Data invalidation: %@ entity string pattern matching error on key \"%@\" with value \"%@\"", entity, key, value];
            
        case NSManagedObjectMergeError:
            return [NSString stringWithFormat:@"Core data merge conflict: %@", self.userInfo.description];
            
        default:
            return [NSString stringWithFormat:@"%@", [self localizedDescription]];
    }
}

@end
