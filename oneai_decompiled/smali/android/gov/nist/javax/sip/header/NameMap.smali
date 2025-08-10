.class public Landroid/gov/nist/javax/sip/header/NameMap;
.super Ljava/lang/Object;
.source "NameMap.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/header/SIPHeaderNames;
.implements Landroid/gov/nist/core/PackageNames;


# static fields
.field static nameMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 61
    invoke-static {}, Landroid/gov/nist/javax/sip/header/NameMap;->initializeNameMap()V

    .line 62
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addExtensionHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "headerName"    # Ljava/lang/String;
    .param p1, "className"    # Ljava/lang/String;

    .line 93
    sget-object v0, Landroid/gov/nist/javax/sip/header/NameMap;->nameMap:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    return-void
.end method

.method public static getClassFromName(Ljava/lang/String;)Ljava/lang/Class;
    .locals 3
    .param p0, "headerName"    # Ljava/lang/String;

    .line 71
    sget-object v0, Landroid/gov/nist/javax/sip/header/NameMap;->nameMap:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 72
    .local v0, "className":Ljava/lang/String;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 73
    return-object v1

    .line 76
    :cond_0
    :try_start_0
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 77
    :catch_0
    move-exception v2

    .line 78
    .local v2, "ex":Ljava/lang/ClassNotFoundException;
    return-object v1
.end method

.method private static initializeNameMap()V
    .locals 2

    .line 97
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x3f

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Landroid/gov/nist/javax/sip/header/NameMap;->nameMap:Ljava/util/Map;

    .line 98
    const-class v0, Landroid/gov/nist/javax/sip/header/MinExpires;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Min-Expires"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    const-class v0, Landroid/gov/nist/javax/sip/header/ErrorInfo;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Error-Info"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    const-class v0, Landroid/gov/nist/javax/sip/header/MimeVersion;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MIME-Version"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    const-class v0, Landroid/gov/nist/javax/sip/header/InReplyTo;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "In-Reply-To"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    const-class v0, Landroid/gov/nist/javax/sip/header/Allow;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Allow"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    const-class v0, Landroid/gov/nist/javax/sip/header/ContentLanguage;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Content-Language"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    const-class v0, Landroid/gov/nist/javax/sip/header/CallInfo;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Call-Info"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    const-class v0, Landroid/gov/nist/javax/sip/header/CSeq;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CSeq"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    const-class v0, Landroid/gov/nist/javax/sip/header/AlertInfo;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Alert-Info"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    const-class v0, Landroid/gov/nist/javax/sip/header/AcceptEncoding;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Accept-Encoding"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    const-class v0, Landroid/gov/nist/javax/sip/header/Accept;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Accept"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    const-class v0, Landroid/gov/nist/javax/sip/header/AcceptLanguage;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Accept-Language"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    const-class v0, Landroid/gov/nist/javax/sip/header/RecordRoute;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Record-Route"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    const-class v0, Landroid/gov/nist/javax/sip/header/TimeStamp;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Timestamp"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    const-class v0, Landroid/gov/nist/javax/sip/header/To;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "To"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    const-class v0, Landroid/gov/nist/javax/sip/header/Via;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Via"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    const-class v0, Landroid/gov/nist/javax/sip/header/From;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "From"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    const-class v0, Landroid/gov/nist/javax/sip/header/CallID;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Call-ID"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    const-class v0, Landroid/gov/nist/javax/sip/header/Authorization;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Authorization"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    const-class v0, Landroid/gov/nist/javax/sip/header/ProxyAuthenticate;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Proxy-Authenticate"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    const-class v0, Landroid/gov/nist/javax/sip/header/Server;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Server"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    const-class v0, Landroid/gov/nist/javax/sip/header/Unsupported;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Unsupported"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    const-class v0, Landroid/gov/nist/javax/sip/header/RetryAfter;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Retry-After"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    const-class v0, Landroid/gov/nist/javax/sip/header/ContentType;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Content-Type"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    const-class v0, Landroid/gov/nist/javax/sip/header/ContentEncoding;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Content-Encoding"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    const-class v0, Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Content-Length"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    const-class v0, Landroid/gov/nist/javax/sip/header/Route;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Route"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    const-class v0, Landroid/gov/nist/javax/sip/header/Contact;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Contact"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    const-class v0, Landroid/gov/nist/javax/sip/header/WWWAuthenticate;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "WWW-Authenticate"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    const-class v0, Landroid/gov/nist/javax/sip/header/MaxForwards;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Max-Forwards"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    const-class v0, Landroid/gov/nist/javax/sip/header/Organization;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Organization"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    const-class v0, Landroid/gov/nist/javax/sip/header/ProxyAuthorization;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Proxy-Authorization"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    const-class v0, Landroid/gov/nist/javax/sip/header/ProxyRequire;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Proxy-Require"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    const-class v0, Landroid/gov/nist/javax/sip/header/Require;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Require"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    const-class v0, Landroid/gov/nist/javax/sip/header/ContentDisposition;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Content-Disposition"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    const-class v0, Landroid/gov/nist/javax/sip/header/Subject;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Subject"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    const-class v0, Landroid/gov/nist/javax/sip/header/UserAgent;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "User-Agent"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    const-class v0, Landroid/gov/nist/javax/sip/header/Warning;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Warning"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    const-class v0, Landroid/gov/nist/javax/sip/header/Priority;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Priority"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    const-class v0, Landroid/gov/nist/javax/sip/header/SIPDateHeader;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Date"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    const-class v0, Landroid/gov/nist/javax/sip/header/Expires;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Expires"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    const-class v0, Landroid/gov/nist/javax/sip/header/Supported;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Supported"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    const-class v0, Landroid/gov/nist/javax/sip/header/ReplyTo;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Reply-To"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    const-class v0, Landroid/gov/nist/javax/sip/header/SubscriptionState;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Subscription-State"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    const-class v0, Landroid/gov/nist/javax/sip/header/Event;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Event"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    const-class v0, Landroid/gov/nist/javax/sip/header/AllowEvents;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Allow-Events"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    const-string/jumbo v0, "Referred-By"

    const-string/jumbo v1, "ReferredBy"

    invoke-static {v0, v1}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    const-string/jumbo v0, "Session-Expires"

    const-string/jumbo v1, "SessionExpires"

    invoke-static {v0, v1}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    const-string v0, "Min-SE"

    const-string v1, "MinSE"

    invoke-static {v0, v1}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    const-string/jumbo v0, "Replaces"

    invoke-static {v0, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    const-string v0, "Join"

    invoke-static {v0, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    const-class v0, Landroid/gov/nist/javax/sip/header/ims/PAccessNetworkInfo;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "P-Access-Network-Info"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    const-class v0, Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentity;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "P-Asserted-Identity"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    const-class v0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "P-Associated-URI"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    const-class v0, Landroid/gov/nist/javax/sip/header/ims/PCalledPartyID;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "P-Called-Party-ID"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    const-class v0, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "P-Charging-Function-Addresses"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    const-class v0, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "P-Charging-Vector"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    const-class v0, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "P-Media-Authorization"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    const-class v0, Landroid/gov/nist/javax/sip/header/ims/Path;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Path"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    const-class v0, Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentity;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "P-Preferred-Identity"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    const-class v0, Landroid/gov/nist/javax/sip/header/ims/Privacy;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Privacy"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    const-class v0, Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Service-Route"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    const-class v0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "P-Visited-Network-ID"

    invoke-static {v1, v0}, Landroid/gov/nist/javax/sip/header/NameMap;->putNameMap(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    return-void
.end method

.method protected static putNameMap(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "headerName"    # Ljava/lang/String;
    .param p1, "className"    # Ljava/lang/String;

    .line 65
    sget-object v0, Landroid/gov/nist/javax/sip/header/NameMap;->nameMap:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    return-void
.end method
