//
//  JSQDocumentMediaItem.h
//  JSQMessages
//
//  Created by Nitish Makhija on 28/06/17.
//  Copyright © 2017 Hexed Bits. All rights reserved.
//

#import "JSQMediaItem.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JSQMediaExtension) {
    JSQMediaExtensionDOCx = 0,
    JSQMediaExtensionXLS,
    JSQMediaExtensionPPT,
};

/**
 *  The `JSQDocumentMediaItem` class is a concrete `JSQMediaItem` subclass that implements the `JSQMessageMediaData` protocol
 *  and represents a Document(.ppt,.docx,xlsx) media message. An initialized `JSQDocumentMediaItem` object can be passed
 *  to a `JSQMediaMessage` object during its initialization to construct a valid media message object.
 *  You may wish to subclass `JSQDocumentMediaItem` to provide additional functionality or behavior.
 */
@interface JSQDocumentMediaItem : JSQMediaItem <JSQMessageMediaData, NSCoding, NSCopying>

/**
 *  The URL that identifies a document resource
 */
@property (nonatomic, strong, nullable) NSURL *fileURL;

/**
 *  Initializes and returns a video media item having the given fileURL.
 *
 *  @param fileURL The URL that identifies the video resource.
 *
 *  @return An initialized `JSQDocumentMediaItem`.
 *
 *  @discussion If the document must be downloaded from the network,
 *  you may initialize a `JSQDocumentMediaItem` with a `nil` fileURL.
 *  Once the viddocumenteo has been saved to disk, you can
 *  set the fileURL property.
 */
- (instancetype)initWithFileURL:(NSURL *)fileURL type:(JSQMediaExtension)extensionType;


@end

NS_ASSUME_NONNULL_END
