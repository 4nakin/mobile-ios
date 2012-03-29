//
//  UploadPhotos.h
//  OpenPhoto
//
//  Created by Patrick Santana on 28/03/12.
//  Copyright (c) 2012 OpenPhoto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UploadPhotos : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * facebook;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSNumber * permissionPrivate;
@property (nonatomic, retain) NSString * source;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * tags;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * twitter;
@property (nonatomic, retain) NSNumber * filtered;
@property (nonatomic, retain) NSData * filteredImage;

@end