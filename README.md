NSError-CoreDataValidation
==========================

NSError category that pretty-prints Core Data validation errors.

    NSError *error;
    [self.managedObjectContext save:&error];
    
    if (error) {
        NSLog(@"%@", [error coreDataValidationErrorDescription]);
    }

    >>> Foo entity "bar" count (257) should not be greater than the maximum allowed