.class public Landroid/gov/nist/javax/sip/parser/ParserFactory;
.super Ljava/lang/Object;
.source "ParserFactory.java"


# static fields
.field private static constructorArgs:[Ljava/lang/Class;

.field private static parserConstructorCache:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/Class;",
            "Ljava/lang/reflect/Constructor;",
            ">;"
        }
    .end annotation
.end field

.field private static parserTable:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "+",
            "Landroid/gov/nist/javax/sip/parser/HeaderParser;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 159
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    const/16 v1, 0x5a

    invoke-direct {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    sput-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    .line 160
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserConstructorCache:Ljava/util/concurrent/ConcurrentHashMap;

    .line 161
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Class;

    sput-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->constructorArgs:[Ljava/lang/Class;

    .line 162
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->constructorArgs:[Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Ljava/lang/String;

    aput-object v2, v0, v1

    .line 163
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Reply-To"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ReplyToParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "In-Reply-To"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/InReplyToParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Accept-Encoding"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Accept-Language"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "t"

    const-class v2, Landroid/gov/nist/javax/sip/parser/ToParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "To"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ToParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "From"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/FromParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "f"

    const-class v2, Landroid/gov/nist/javax/sip/parser/FromParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "CSeq"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/CSeqParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Via"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ViaParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "v"

    const-class v2, Landroid/gov/nist/javax/sip/parser/ViaParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Contact"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ContactParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "m"

    const-class v2, Landroid/gov/nist/javax/sip/parser/ContactParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Content-Type"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "c"

    const-class v2, Landroid/gov/nist/javax/sip/parser/ContentTypeParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Content-Length"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ContentLengthParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "l"

    const-class v2, Landroid/gov/nist/javax/sip/parser/ContentLengthParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Authorization"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/AuthorizationParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "WWW-Authenticate"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/WWWAuthenticateParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Call-ID"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/CallIDParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "i"

    const-class v2, Landroid/gov/nist/javax/sip/parser/CallIDParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Route"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/RouteParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Record-Route"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Date"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/DateParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Proxy-Authorization"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ProxyAuthorizationParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Proxy-Authenticate"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ProxyAuthenticateParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Retry-After"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Require"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/RequireParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Proxy-Require"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Timestamp"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/TimeStampParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Unsupported"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "User-Agent"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/UserAgentParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Supported"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/SupportedParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "k"

    const-class v2, Landroid/gov/nist/javax/sip/parser/SupportedParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Server"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ServerParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Subject"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/SubjectParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "s"

    const-class v2, Landroid/gov/nist/javax/sip/parser/SubjectParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Subscription-State"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/SubscriptionStateParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Max-Forwards"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/MaxForwardsParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "MIME-Version"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/MimeVersionParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Min-Expires"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/MinExpiresParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Organization"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/OrganizationParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Priority"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/PriorityParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "RAck"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/RAckParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "RSeq"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/RSeqParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Reason"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ReasonParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Warning"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/WarningParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Expires"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ExpiresParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Event"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/EventParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "o"

    const-class v2, Landroid/gov/nist/javax/sip/parser/EventParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Error-Info"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Content-Language"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Content-Encoding"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "e"

    const-class v2, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Content-Disposition"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ContentDispositionParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Call-Info"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/CallInfoParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Authentication-Info"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/AuthenticationInfoParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Allow"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/AllowParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Allow-Events"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "u"

    const-class v2, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Alert-Info"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Accept"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/AcceptParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Refer-To"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ReferToParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "r"

    const-class v2, Landroid/gov/nist/javax/sip/parser/ReferToParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "SIP-ETag"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/SIPETagParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "SIP-If-Match"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/SIPIfMatchParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "P-Access-Network-Info"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/PAccessNetworkInfoParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "P-Asserted-Identity"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "P-Preferred-Identity"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/PPreferredIdentityParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "P-Charging-Vector"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "P-Charging-Function-Addresses"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "P-Media-Authorization"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 351
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Path"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/PathParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Privacy"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Service-Route"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "P-Visited-Network-ID"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "P-Served-User"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/PServedUserParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "P-Preferred-Service"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/PPreferredServiceParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "P-Asserted-Service"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/PAssertedServiceParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "P-Profile-Key"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/PProfileKeyParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "P-User-Database"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/PUserDatabaseParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 364
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "P-Associated-URI"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/PAssociatedURIParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 365
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "P-Called-Party-ID"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/PCalledPartyIDParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Security-Server"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/SecurityServerParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Security-Client"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/SecurityClientParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Security-Verify"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/ims/SecurityVerifyParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Referred-By"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/extensions/ReferredByParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "b"

    const-class v2, Landroid/gov/nist/javax/sip/parser/ReferToParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Session-Expires"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "x"

    const-class v2, Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Min-SE"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/extensions/MinSEParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 383
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "Replaces"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string v1, "Join"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/extensions/JoinParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    const-string/jumbo v1, "References"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-class v2, Landroid/gov/nist/javax/sip/parser/extensions/ReferencesParser;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addToParserTable(Ljava/lang/String;Ljava/lang/Class;)V
    .locals 2
    .param p0, "headerName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "+",
            "Landroid/gov/nist/javax/sip/parser/HeaderParser;",
            ">;)V"
        }
    .end annotation

    .line 397
    .local p1, "parserClass":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/gov/nist/javax/sip/parser/HeaderParser;>;"
    sget-object v0, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    return-void
.end method

.method public static createParser(Ljava/lang/String;)Landroid/gov/nist/javax/sip/parser/HeaderParser;
    .locals 6
    .param p0, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 405
    invoke-static {p0}, Landroid/gov/nist/javax/sip/parser/Lexer;->getHeaderName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 406
    .local v0, "headerName":Ljava/lang/String;
    invoke-static {p0}, Landroid/gov/nist/javax/sip/parser/Lexer;->getHeaderValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 407
    .local v1, "headerValue":Ljava/lang/String;
    const/4 v2, 0x0

    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    .line 410
    sget-object v3, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserTable:Ljava/util/Map;

    invoke-static {v0}, Landroid/gov/nist/javax/sip/header/SIPHeaderNamesCache;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Class;

    .line 411
    .local v3, "parserClass":Ljava/lang/Class;
    if-eqz v3, :cond_1

    .line 413
    :try_start_0
    sget-object v4, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserConstructorCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Constructor;

    .line 414
    .local v4, "cons":Ljava/lang/reflect/Constructor;
    if-nez v4, :cond_0

    .line 415
    sget-object v5, Landroid/gov/nist/javax/sip/parser/ParserFactory;->constructorArgs:[Ljava/lang/Class;

    invoke-virtual {v3, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    move-object v4, v5

    .line 416
    sget-object v5, Landroid/gov/nist/javax/sip/parser/ParserFactory;->parserConstructorCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v5, v3, v4}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    :cond_0
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    .line 419
    .local v5, "args":[Ljava/lang/Object;
    aput-object p0, v5, v2

    .line 420
    invoke-virtual {v4, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/parser/HeaderParser;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 421
    .local v2, "retval":Landroid/gov/nist/javax/sip/parser/HeaderParser;
    return-object v2

    .line 423
    .end local v2    # "retval":Landroid/gov/nist/javax/sip/parser/HeaderParser;
    .end local v4    # "cons":Ljava/lang/reflect/Constructor;
    .end local v5    # "args":[Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 424
    .local v2, "ex":Ljava/lang/Exception;
    invoke-static {v2}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 425
    const/4 v4, 0x0

    return-object v4

    .line 431
    .end local v2    # "ex":Ljava/lang/Exception;
    :cond_1
    new-instance v2, Landroid/gov/nist/javax/sip/parser/HeaderParser;

    invoke-direct {v2, p0}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    return-object v2

    .line 408
    .end local v3    # "parserClass":Ljava/lang/Class;
    :cond_2
    new-instance v3, Ljava/text/ParseException;

    const-string/jumbo v4, "The header name or value is null"

    invoke-direct {v3, v4, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v3
.end method
