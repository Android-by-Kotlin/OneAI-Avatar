.class public Landroid/gov/nist/javax/sip/stack/DefaultRouter;
.super Ljava/lang/Object;
.source "DefaultRouter.java"

# interfaces
.implements Landroid/javax/sip/address/Router;


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private defaultRoute:Landroid/javax/sip/address/Hop;

.field private sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 101
    const-class v0, Landroid/gov/nist/javax/sip/stack/DefaultRouter;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    return-void
.end method

.method public constructor <init>(Landroid/javax/sip/SipStack;Ljava/lang/String;)V
    .locals 3
    .param p1, "sipStack"    # Landroid/javax/sip/SipStack;
    .param p2, "defaultRoute"    # Ljava/lang/String;

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 116
    if-eqz p2, :cond_0

    .line 118
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getAddressResolver()Landroid/gov/nist/core/net/AddressResolver;

    move-result-object v0

    new-instance v1, Landroid/gov/nist/javax/sip/stack/HopImpl;

    invoke-direct {v1, p2}, Landroid/gov/nist/javax/sip/stack/HopImpl;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Landroid/gov/nist/core/net/AddressResolver;->resolveAddress(Landroid/javax/sip/address/Hop;)Landroid/javax/sip/address/Hop;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->defaultRoute:Landroid/javax/sip/address/Hop;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    goto :goto_0

    .line 120
    :catch_0
    move-exception v0

    .line 122
    .local v0, "ex":Ljava/lang/IllegalArgumentException;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "Invalid default route specification - need host:port/transport"

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 125
    throw v0

    .line 128
    .end local v0    # "ex":Ljava/lang/IllegalArgumentException;
    :cond_0
    :goto_0
    return-void
.end method


# virtual methods
.method protected final createHop(Landroid/javax/sip/address/SipURI;Landroid/javax/sip/message/Request;)Landroid/javax/sip/address/Hop;
    .locals 5
    .param p1, "sipUri"    # Landroid/javax/sip/address/SipURI;
    .param p2, "request"    # Landroid/javax/sip/message/Request;

    .line 296
    invoke-interface {p1}, Landroid/javax/sip/address/SipURI;->isSecure()Z

    move-result v0

    const-string/jumbo v1, "tls"

    if-eqz v0, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Landroid/javax/sip/address/SipURI;->getTransportParam()Ljava/lang/String;

    move-result-object v0

    .line 298
    .local v0, "transport":Ljava/lang/String;
    :goto_0
    if-nez v0, :cond_2

    .line 300
    const-string/jumbo v2, "Via"

    invoke-interface {p2, v2}, Landroid/javax/sip/message/Request;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/header/ViaHeader;

    .line 301
    .local v2, "via":Landroid/javax/sip/header/ViaHeader;
    if-eqz v2, :cond_1

    .line 302
    invoke-interface {v2}, Landroid/javax/sip/header/ViaHeader;->getTransport()Ljava/lang/String;

    move-result-object v0

    .line 304
    :cond_1
    if-nez v0, :cond_2

    .line 305
    const-string/jumbo v0, "UDP"

    .line 312
    .end local v2    # "via":Landroid/javax/sip/header/ViaHeader;
    :cond_2
    invoke-interface {p1}, Landroid/javax/sip/address/SipURI;->getPort()I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_3

    .line 313
    invoke-interface {p1}, Landroid/javax/sip/address/SipURI;->getPort()I

    move-result v1

    .local v1, "port":I
    goto :goto_1

    .line 315
    .end local v1    # "port":I
    :cond_3
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 316
    const/16 v1, 0x13c5

    .restart local v1    # "port":I
    goto :goto_1

    .line 318
    .end local v1    # "port":I
    :cond_4
    const/16 v1, 0x13c4

    .line 320
    .restart local v1    # "port":I
    :goto_1
    invoke-interface {p1}, Landroid/javax/sip/address/SipURI;->getMAddrParam()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_5

    invoke-interface {p1}, Landroid/javax/sip/address/SipURI;->getMAddrParam()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :cond_5
    invoke-interface {p1}, Landroid/javax/sip/address/SipURI;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 322
    .local v2, "host":Ljava/lang/String;
    :goto_2
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getAddressResolver()Landroid/gov/nist/core/net/AddressResolver;

    move-result-object v3

    .line 323
    .local v3, "addressResolver":Landroid/gov/nist/core/net/AddressResolver;
    new-instance v4, Landroid/gov/nist/javax/sip/stack/HopImpl;

    invoke-direct {v4, v2, v1, v0}, Landroid/gov/nist/javax/sip/stack/HopImpl;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-interface {v3, v4}, Landroid/gov/nist/core/net/AddressResolver;->resolveAddress(Landroid/javax/sip/address/Hop;)Landroid/javax/sip/address/Hop;

    move-result-object v4

    return-object v4
.end method

.method public fixStrictRouting(Landroid/gov/nist/javax/sip/message/SIPRequest;)V
    .locals 8
    .param p1, "req"    # Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 269
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRouteHeaders()Landroid/gov/nist/javax/sip/header/RouteList;

    move-result-object v0

    .line 270
    .local v0, "routes":Landroid/gov/nist/javax/sip/header/RouteList;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/RouteList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/Route;

    .line 271
    .local v1, "first":Landroid/gov/nist/javax/sip/header/Route;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Route;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v2

    invoke-interface {v2}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/address/SipUri;

    .line 272
    .local v2, "firstUri":Landroid/gov/nist/javax/sip/address/SipUri;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/RouteList;->removeFirst()V

    .line 275
    new-instance v3, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-direct {v3}, Landroid/gov/nist/javax/sip/address/AddressImpl;-><init>()V

    .line 276
    .local v3, "addr":Landroid/gov/nist/javax/sip/address/AddressImpl;
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setAddess(Landroid/javax/sip/address/URI;)V

    .line 277
    new-instance v4, Landroid/gov/nist/javax/sip/header/Route;

    invoke-direct {v4, v3}, Landroid/gov/nist/javax/sip/header/Route;-><init>(Landroid/gov/nist/javax/sip/address/AddressImpl;)V

    .line 279
    .local v4, "route":Landroid/gov/nist/javax/sip/header/Route;
    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/header/RouteList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 280
    invoke-virtual {p1, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setRequestURI(Landroid/javax/sip/address/URI;)V

    .line 281
    sget-object v5, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v6, 0x20

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 282
    sget-object v5, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "post: fixStrictRouting"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 284
    :cond_0
    return-void
.end method

.method public getNextHop(Landroid/javax/sip/message/Request;)Landroid/javax/sip/address/Hop;
    .locals 11
    .param p1, "request"    # Landroid/javax/sip/message/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 164
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 166
    .local v0, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestLine()Landroid/gov/nist/javax/sip/header/RequestLine;

    move-result-object v1

    .line 167
    .local v1, "requestLine":Landroid/gov/nist/javax/sip/header/RequestLine;
    if-nez v1, :cond_0

    .line 168
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->defaultRoute:Landroid/javax/sip/address/Hop;

    return-object v2

    .line 170
    :cond_0
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/RequestLine;->getUri()Landroid/gov/nist/javax/sip/address/GenericURI;

    move-result-object v2

    .line 171
    .local v2, "requestURI":Landroid/javax/sip/address/URI;
    if-eqz v2, :cond_c

    .line 174
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRouteHeaders()Landroid/gov/nist/javax/sip/header/RouteList;

    move-result-object v3

    .line 197
    .local v3, "routes":Landroid/gov/nist/javax/sip/header/RouteList;
    const/16 v4, 0x20

    if-eqz v3, :cond_4

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/RouteList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 201
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/RouteList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/header/Route;

    .line 202
    .local v5, "route":Landroid/gov/nist/javax/sip/header/Route;
    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/header/Route;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v6

    invoke-interface {v6}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v6

    .line 203
    .local v6, "uri":Landroid/javax/sip/address/URI;
    invoke-interface {v6}, Landroid/javax/sip/address/URI;->isSipURI()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 204
    move-object v7, v6

    check-cast v7, Landroid/javax/sip/address/SipURI;

    .line 205
    .local v7, "sipUri":Landroid/javax/sip/address/SipURI;
    invoke-interface {v7}, Landroid/javax/sip/address/SipURI;->hasLrParam()Z

    move-result v8

    if-nez v8, :cond_1

    .line 207
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->fixStrictRouting(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 208
    sget-object v8, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v8, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 209
    sget-object v8, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v9, "Route post processing fixed strict routing"

    invoke-interface {v8, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 213
    :cond_1
    invoke-virtual {p0, v7, p1}, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->createHop(Landroid/javax/sip/address/SipURI;Landroid/javax/sip/message/Request;)Landroid/javax/sip/address/Hop;

    move-result-object v8

    .line 214
    .local v8, "hop":Landroid/javax/sip/address/Hop;
    sget-object v9, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v9, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 215
    sget-object v4, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "NextHop based on Route:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v4, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 217
    :cond_2
    return-object v8

    .line 219
    .end local v7    # "sipUri":Landroid/javax/sip/address/SipURI;
    .end local v8    # "hop":Landroid/javax/sip/address/Hop;
    :cond_3
    new-instance v4, Landroid/javax/sip/SipException;

    const-string v7, "First Route not a SIP URI"

    invoke-direct {v4, v7}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 222
    .end local v5    # "route":Landroid/gov/nist/javax/sip/header/Route;
    .end local v6    # "uri":Landroid/javax/sip/address/URI;
    :cond_4
    invoke-interface {v2}, Landroid/javax/sip/address/URI;->isSipURI()Z

    move-result v5

    if-eqz v5, :cond_6

    move-object v5, v2

    check-cast v5, Landroid/javax/sip/address/SipURI;

    invoke-interface {v5}, Landroid/javax/sip/address/SipURI;->getMAddrParam()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_6

    .line 224
    move-object v5, v2

    check-cast v5, Landroid/javax/sip/address/SipURI;

    invoke-virtual {p0, v5, p1}, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->createHop(Landroid/javax/sip/address/SipURI;Landroid/javax/sip/message/Request;)Landroid/javax/sip/address/Hop;

    move-result-object v5

    .line 225
    .local v5, "hop":Landroid/javax/sip/address/Hop;
    sget-object v6, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 226
    sget-object v4, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Using request URI maddr to route the request = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v5}, Landroid/javax/sip/address/Hop;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 233
    :cond_5
    return-object v5

    .line 235
    .end local v5    # "hop":Landroid/javax/sip/address/Hop;
    :cond_6
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->defaultRoute:Landroid/javax/sip/address/Hop;

    if-eqz v5, :cond_8

    .line 236
    sget-object v5, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 237
    sget-object v4, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Using outbound proxy to route the request = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->defaultRoute:Landroid/javax/sip/address/Hop;

    invoke-interface {v6}, Landroid/javax/sip/address/Hop;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 240
    :cond_7
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->defaultRoute:Landroid/javax/sip/address/Hop;

    return-object v4

    .line 241
    :cond_8
    invoke-interface {v2}, Landroid/javax/sip/address/URI;->isSipURI()Z

    move-result v5

    if-eqz v5, :cond_b

    .line 242
    move-object v5, v2

    check-cast v5, Landroid/javax/sip/address/SipURI;

    invoke-virtual {p0, v5, p1}, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->createHop(Landroid/javax/sip/address/SipURI;Landroid/javax/sip/message/Request;)Landroid/javax/sip/address/Hop;

    move-result-object v5

    .line 243
    .restart local v5    # "hop":Landroid/javax/sip/address/Hop;
    if-eqz v5, :cond_9

    sget-object v6, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 244
    sget-object v4, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Used request-URI for nextHop = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v5}, Landroid/javax/sip/address/Hop;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_0

    .line 246
    :cond_9
    sget-object v6, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 247
    sget-object v4, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v6, "returning null hop -- loop detected"

    invoke-interface {v4, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 250
    :cond_a
    :goto_0
    return-object v5

    .line 254
    .end local v5    # "hop":Landroid/javax/sip/address/Hop;
    :cond_b
    const-string/jumbo v4, "Unexpected non-sip URI"

    sget-object v5, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-static {v4, v5}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/String;Landroid/gov/nist/core/StackLogger;)V

    .line 256
    const/4 v4, 0x0

    return-object v4

    .line 172
    .end local v3    # "routes":Landroid/gov/nist/javax/sip/header/RouteList;
    :cond_c
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Bad message: Null requestURI"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public getNextHops(Landroid/javax/sip/message/Request;)Ljava/util/ListIterator;
    .locals 2
    .param p1, "request"    # Landroid/javax/sip/message/Request;

    .line 347
    :try_start_0
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 348
    .local v0, "llist":Ljava/util/LinkedList;
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->getNextHop(Landroid/javax/sip/message/Request;)Landroid/javax/sip/address/Hop;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 349
    invoke-virtual {v0}, Ljava/util/LinkedList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1
    :try_end_0
    .catch Landroid/javax/sip/SipException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 350
    .end local v0    # "llist":Ljava/util/LinkedList;
    :catch_0
    move-exception v0

    .line 351
    .local v0, "ex":Landroid/javax/sip/SipException;
    const/4 v1, 0x0

    return-object v1
.end method

.method public getOutboundProxy()Landroid/javax/sip/address/Hop;
    .locals 1

    .line 337
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->defaultRoute:Landroid/javax/sip/address/Hop;

    return-object v0
.end method
