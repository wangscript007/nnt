
# ifndef __NNT_BSE_STATISTICS_6BE6672C70D64E99919A5B9223EA8035_H_INCLUDED
# define __NNT_BSE_STATISTICS_6BE6672C70D64E99919A5B9223EA8035_H_INCLUDED

NNT_BEGIN_HEADER_OBJC

NNTDECL_PRIVATE_HEAD(AppStatistics);

@interface AppStatistics : NNTObject {
    NSString *_appid;
    
    NNTDECL_PRIVATE(AppStatistics);
}

@property (nonatomic, copy) NSString *appid;

@end

NNT_END_HEADER_OBJC

# ifdef NNT_CXX

NNT_BEGIN_CXX
NNT_BEGIN_NS(bse)


NNT_END_NS
NNT_END_CXX

# endif

# endif