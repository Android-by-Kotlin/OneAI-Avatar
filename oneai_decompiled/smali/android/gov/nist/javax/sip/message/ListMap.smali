.class public Landroid/gov/nist/javax/sip/message/ListMap;
.super Ljava/lang/Object;
.source "ListMap.java"


# static fields
.field private static headerListTable:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static initialized:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 126
    invoke-static {}, Landroid/gov/nist/javax/sip/message/ListMap;->initializeListMap()V

    .line 127
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addListHeader(Ljava/lang/Class;Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Landroid/gov/nist/javax/sip/header/SIPHeader;",
            ">;",
            "Ljava/lang/Class<",
            "+",
            "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
            "+",
            "Landroid/gov/nist/javax/sip/header/SIPHeader;",
            ">;>;)V"
        }
    .end annotation

    .line 243
    .local p0, "sipHeaderClass":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    .local p1, "sipHeaderListClass":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/gov/nist/javax/sip/header/SIPHeaderList<+Landroid/gov/nist/javax/sip/header/SIPHeader;>;>;"
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    return-void
.end method

.method public static getList(Landroid/gov/nist/javax/sip/header/SIPHeader;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;
    .locals 4
    .param p0, "sipHeader"    # Landroid/gov/nist/javax/sip/header/SIPHeader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/gov/nist/javax/sip/header/SIPHeader;",
            ")",
            "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
            "Landroid/gov/nist/javax/sip/header/SIPHeader;",
            ">;"
        }
    .end annotation

    .line 260
    sget-boolean v0, Landroid/gov/nist/javax/sip/message/ListMap;->initialized:Z

    if-nez v0, :cond_0

    .line 261
    invoke-static {}, Landroid/gov/nist/javax/sip/message/ListMap;->initializeListMap()V

    .line 263
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 264
    .local v0, "headerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v1, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 265
    .local v1, "listClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 266
    .local v2, "shl":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/SIPHeader;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->setHeaderName(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 267
    return-object v2

    .line 270
    .end local v0    # "headerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "listClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "shl":Landroid/gov/nist/javax/sip/header/SIPHeaderList;, "Landroid/gov/nist/javax/sip/header/SIPHeaderList<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :catch_0
    move-exception v0

    .line 271
    .local v0, "ex":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    .line 268
    .end local v0    # "ex":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v0

    .line 269
    .local v0, "ex":Ljava/lang/InstantiationException;
    invoke-virtual {v0}, Ljava/lang/InstantiationException;->printStackTrace()V

    .line 272
    .end local v0    # "ex":Ljava/lang/InstantiationException;
    nop

    .line 273
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getListClass(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 250
    .local p0, "sipHdrClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-boolean v0, Landroid/gov/nist/javax/sip/message/ListMap;->initialized:Z

    if-nez v0, :cond_0

    .line 251
    invoke-static {}, Landroid/gov/nist/javax/sip/message/ListMap;->initializeListMap()V

    .line 252
    :cond_0
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    return-object v0
.end method

.method public static hasList(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z
    .locals 3
    .param p0, "sipHeader"    # Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 220
    instance-of v0, p0, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 221
    return v1

    .line 223
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 224
    .local v0, "headerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v2, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public static hasList(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    .line 232
    .local p0, "sipHdrClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-boolean v0, Landroid/gov/nist/javax/sip/message/ListMap;->initialized:Z

    if-nez v0, :cond_0

    .line 233
    invoke-static {}, Landroid/gov/nist/javax/sip/message/ListMap;->initializeListMap()V

    .line 234
    :cond_0
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static initializeListMap()V
    .locals 3

    .line 135
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x22

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    .line 136
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;

    const-class v2, Landroid/gov/nist/javax/sip/header/ExtensionHeaderList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/Contact;

    const-class v2, Landroid/gov/nist/javax/sip/header/ContactList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ContentEncoding;

    const-class v2, Landroid/gov/nist/javax/sip/header/ContentEncodingList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/Via;

    const-class v2, Landroid/gov/nist/javax/sip/header/ViaList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/WWWAuthenticate;

    const-class v2, Landroid/gov/nist/javax/sip/header/WWWAuthenticateList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/Accept;

    const-class v2, Landroid/gov/nist/javax/sip/header/AcceptList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/AcceptEncoding;

    const-class v2, Landroid/gov/nist/javax/sip/header/AcceptEncodingList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/AcceptLanguage;

    const-class v2, Landroid/gov/nist/javax/sip/header/AcceptLanguageList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ProxyRequire;

    const-class v2, Landroid/gov/nist/javax/sip/header/ProxyRequireList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/Route;

    const-class v2, Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/Require;

    const-class v2, Landroid/gov/nist/javax/sip/header/RequireList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/Warning;

    const-class v2, Landroid/gov/nist/javax/sip/header/WarningList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/Unsupported;

    const-class v2, Landroid/gov/nist/javax/sip/header/UnsupportedList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/AlertInfo;

    const-class v2, Landroid/gov/nist/javax/sip/header/AlertInfoList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/CallInfo;

    const-class v2, Landroid/gov/nist/javax/sip/header/CallInfoList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ProxyAuthenticate;

    const-class v2, Landroid/gov/nist/javax/sip/header/ProxyAuthenticateList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ProxyAuthorization;

    const-class v2, Landroid/gov/nist/javax/sip/header/ProxyAuthorizationList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/Authorization;

    const-class v2, Landroid/gov/nist/javax/sip/header/AuthorizationList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/Allow;

    const-class v2, Landroid/gov/nist/javax/sip/header/AllowList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/AllowEvents;

    const-class v2, Landroid/gov/nist/javax/sip/header/AllowEventsList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/RecordRoute;

    const-class v2, Landroid/gov/nist/javax/sip/header/RecordRouteList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ContentLanguage;

    const-class v2, Landroid/gov/nist/javax/sip/header/ContentLanguageList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ErrorInfo;

    const-class v2, Landroid/gov/nist/javax/sip/header/ErrorInfoList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/Supported;

    const-class v2, Landroid/gov/nist/javax/sip/header/SupportedList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/InReplyTo;

    const-class v2, Landroid/gov/nist/javax/sip/header/InReplyToList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;

    const-class v2, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURIList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;

    const-class v2, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorizationList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ims/Path;

    const-class v2, Landroid/gov/nist/javax/sip/header/ims/PathList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ims/Privacy;

    const-class v2, Landroid/gov/nist/javax/sip/header/ims/PrivacyList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;

    const-class v2, Landroid/gov/nist/javax/sip/header/ims/ServiceRouteList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;

    const-class v2, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkIDList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ims/SecurityClient;

    const-class v2, Landroid/gov/nist/javax/sip/header/ims/SecurityClientList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ims/SecurityServer;

    const-class v2, Landroid/gov/nist/javax/sip/header/ims/SecurityServerList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ims/SecurityVerify;

    const-class v2, Landroid/gov/nist/javax/sip/header/ims/SecurityVerifyList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentity;

    const-class v2, Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentityList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    sget-object v0, Landroid/gov/nist/javax/sip/message/ListMap;->headerListTable:Ljava/util/Map;

    const-class v1, Landroid/gov/nist/javax/sip/header/Reason;

    const-class v2, Landroid/gov/nist/javax/sip/header/ReasonList;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    const/4 v0, 0x1

    sput-boolean v0, Landroid/gov/nist/javax/sip/message/ListMap;->initialized:Z

    .line 214
    return-void
.end method
