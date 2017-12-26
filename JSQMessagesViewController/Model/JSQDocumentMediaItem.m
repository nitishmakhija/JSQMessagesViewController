//
//  JSQDocumentMediaItem.m
//  JSQMessages
//
//  Created by Nitish Makhija on 28/06/17.
//  Copyright © 2017 Hexed Bits. All rights reserved.
//

#import "JSQDocumentMediaItem.h"
#import "JSQMessagesLabel.h"
#import "JSQMessagesMediaPlaceholderView.h"
#import "JSQMessagesMediaViewBubbleImageMasker.h"

@interface JSQDocumentMediaItem ()

@property (nonatomic, assign) JSQMediaExtension extensionType;

@property (nonatomic, strong) UIView *documentView;
@property (nonatomic, strong) UIImageView *cachedImageView;
@property (nonatomic, strong) JSQMessagesLabel *cachedMediaNameLabel;

@end

@implementation JSQDocumentMediaItem

- (instancetype)initWithFileURL:(NSURL *)fileURL type:(JSQMediaExtension)extensionType {
    self = [super init];
    if (self) {
        _fileURL = fileURL;
        _extensionType = extensionType;
        _cachedImageView = nil;
        _cachedMediaNameLabel = nil;
    }
    return self;
}

- (void)clearCachedMediaViews {
    [super clearCachedMediaViews];
    _cachedImageView = nil;
    _cachedMediaNameLabel = nil;
}

- (void)setFileURL:(NSURL *)fileURL {
    _fileURL = [fileURL copy];
    _cachedImageView = nil;
    _cachedMediaNameLabel = nil;
}

- (void)setExtensionType:(JSQMediaExtension)extensionType {
    _extensionType = extensionType;
    _cachedImageView = nil;
    _cachedMediaNameLabel = nil;
}

- (void)setAppliesMediaViewMaskAsOutgoing:(BOOL)appliesMediaViewMaskAsOutgoing {
    [super setAppliesMediaViewMaskAsOutgoing:appliesMediaViewMaskAsOutgoing];
    _cachedImageView = nil;
    _cachedMediaNameLabel = nil;
}

- (UIView *)mediaView
{
    if (!self.fileURL) {
        return nil;
    }
    
    if (!self.cachedImageView) {
        //we have the size with us for the mdedi vuew here we just need to plot yhe uistackview togerther
        CGSize size = [self mediaViewDisplaySize];
        UIView *documentView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, size.width, size.height)];

        switch (self.extensionType) {
                case JSQMediaExtensionDOCx:
                    
                break;
                case JSQMediaExtensionXLS:
                
                break;
                case JSQMediaExtensionPPT:
                
                break;
        }
        
//        UIImageView *cachedImageView = [[UIImageView alloc] initWithImage:<#(nullable UIImage *)#>]
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:self.fileURL];
//        imageView.frame = CGRectMake(0.0f, 0.0f, size.width/2.5, size.height/2.5);
//        imageView.contentMode = UIViewContentModeScaleAspectFill;
//        imageView.clipsToBounds = YES;
        [JSQMessagesMediaViewBubbleImageMasker applyBubbleImageMaskToMediaView:documentView isOutgoing:self.appliesMediaViewMaskAsOutgoing];
        self.cachedImageView = imageView;
    }
    
    return self.cachedImageView;
}


@end
