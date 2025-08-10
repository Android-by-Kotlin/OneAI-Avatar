.class public Landroid/gov/nist/javax/sip/address/AddressFactoryImpl;
.super Ljava/lang/Object;
.source "AddressFactoryImpl.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/address/AddressFactoryEx;


# static fields
.field public static final SCHEME_PATTERN:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 49
    const-string/jumbo v0, "\\p{Alpha}[[{\\p{Alpha}][\\p{Digit}][\\+][-][\\.]]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/address/AddressFactoryImpl;->SCHEME_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    return-void
.end method


# virtual methods
.method public createAddress()Landroid/javax/sip/address/Address;
    .locals 1

    .line 65
    new-instance v0, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;-><init>()V

    return-object v0
.end method

.method public createAddress(Landroid/javax/sip/address/URI;)Landroid/javax/sip/address/Address;
    .locals 2
    .param p1, "uri"    # Landroid/javax/sip/address/URI;

    .line 92
    if-eqz p1, :cond_0

    .line 94
    new-instance v0, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;-><init>()V

    .line 95
    .local v0, "addressImpl":Landroid/gov/nist/javax/sip/address/AddressImpl;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setURI(Landroid/javax/sip/address/URI;)V

    .line 96
    return-object v0

    .line 93
    .end local v0    # "addressImpl":Landroid/gov/nist/javax/sip/address/AddressImpl;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null address"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createAddress(Ljava/lang/String;)Landroid/javax/sip/address/Address;
    .locals 3
    .param p1, "address"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 112
    if-eqz p1, :cond_1

    .line 115
    const-string v0, "*"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 116
    new-instance v1, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/address/AddressImpl;-><init>()V

    .line 117
    .local v1, "addressImpl":Landroid/gov/nist/javax/sip/address/AddressImpl;
    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setAddressType(I)V

    .line 118
    new-instance v2, Landroid/gov/nist/javax/sip/address/SipUri;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/address/SipUri;-><init>()V

    .line 119
    .local v2, "uri":Landroid/javax/sip/address/SipURI;
    invoke-interface {v2, v0}, Landroid/javax/sip/address/SipURI;->setUser(Ljava/lang/String;)V

    .line 120
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setURI(Landroid/javax/sip/address/URI;)V

    .line 121
    return-object v1

    .line 123
    .end local v1    # "addressImpl":Landroid/gov/nist/javax/sip/address/AddressImpl;
    .end local v2    # "uri":Landroid/javax/sip/address/SipURI;
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;-><init>()V

    .line 124
    .local v0, "smp":Landroid/gov/nist/javax/sip/parser/StringMsgParser;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->parseAddress(Ljava/lang/String;)Landroid/gov/nist/javax/sip/address/AddressImpl;

    move-result-object v1

    return-object v1

    .line 113
    .end local v0    # "smp":Landroid/gov/nist/javax/sip/parser/StringMsgParser;
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null address"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createAddress(Ljava/lang/String;Landroid/javax/sip/address/URI;)Landroid/javax/sip/address/Address;
    .locals 2
    .param p1, "displayName"    # Ljava/lang/String;
    .param p2, "uri"    # Landroid/javax/sip/address/URI;

    .line 80
    if-eqz p2, :cond_1

    .line 82
    new-instance v0, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;-><init>()V

    .line 83
    .local v0, "addressImpl":Landroid/gov/nist/javax/sip/address/AddressImpl;
    if-eqz p1, :cond_0

    .line 84
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setDisplayName(Ljava/lang/String;)V

    .line 85
    :cond_0
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setURI(Landroid/javax/sip/address/URI;)V

    .line 86
    return-object v0

    .line 81
    .end local v0    # "addressImpl":Landroid/gov/nist/javax/sip/address/AddressImpl;
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null  URI"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createSipURI(Ljava/lang/String;)Landroid/javax/sip/address/SipURI;
    .locals 4
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 134
    if-eqz p1, :cond_0

    .line 137
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;-><init>()V

    .line 138
    .local v0, "smp":Landroid/gov/nist/javax/sip/parser/StringMsgParser;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->parseSIPUrl(Ljava/lang/String;)Landroid/gov/nist/javax/sip/address/SipUri;

    move-result-object v1
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    .local v1, "sipUri":Landroid/gov/nist/javax/sip/address/SipUri;
    return-object v1

    .line 140
    .end local v0    # "smp":Landroid/gov/nist/javax/sip/parser/StringMsgParser;
    .end local v1    # "sipUri":Landroid/gov/nist/javax/sip/address/SipUri;
    :catch_0
    move-exception v0

    .line 141
    .local v0, "ex":Ljava/text/ParseException;
    new-instance v1, Ljava/text/ParseException;

    invoke-virtual {v0}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 135
    .end local v0    # "ex":Ljava/text/ParseException;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null URI"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createSipURI(Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sip/address/SipURI;
    .locals 5
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 152
    if-eqz p2, :cond_2

    .line 155
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "sip:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 156
    .local v0, "uriString":Ljava/lang/StringBuilder;
    if-eqz p1, :cond_0

    .line 157
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    const-string v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    :cond_0
    const/16 v1, 0x3a

    invoke-virtual {p2, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    invoke-virtual {p2, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    const/4 v3, 0x0

    if-eq v2, v1, :cond_1

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x5b

    if-eq v1, v2, :cond_1

    .line 164
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 166
    :cond_1
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/address/AddressFactoryImpl;->createSipURI(Ljava/lang/String;)Landroid/javax/sip/address/SipURI;

    move-result-object v1
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 172
    :catch_0
    move-exception v1

    .line 173
    .local v1, "ex":Ljava/text/ParseException;
    new-instance v2, Ljava/text/ParseException;

    invoke-virtual {v1}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 153
    .end local v0    # "uriString":Ljava/lang/StringBuilder;
    .end local v1    # "ex":Ljava/text/ParseException;
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null host"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createTelURL(Ljava/lang/String;)Landroid/javax/sip/address/TelURL;
    .locals 5
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 186
    if-eqz p1, :cond_1

    .line 188
    const/4 v0, 0x0

    .line 189
    .local v0, "telUrl":Ljava/lang/String;
    const-string/jumbo v1, "tel:"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 191
    move-object v0, p1

    goto :goto_0

    .line 194
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 197
    :goto_0
    :try_start_0
    new-instance v1, Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;-><init>()V

    .line 198
    .local v1, "smp":Landroid/gov/nist/javax/sip/parser/StringMsgParser;
    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->parseUrl(Ljava/lang/String;)Landroid/gov/nist/javax/sip/address/GenericURI;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/address/TelURLImpl;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 199
    .local v2, "timp":Landroid/gov/nist/javax/sip/address/TelURLImpl;
    return-object v2

    .line 200
    .end local v1    # "smp":Landroid/gov/nist/javax/sip/parser/StringMsgParser;
    .end local v2    # "timp":Landroid/gov/nist/javax/sip/address/TelURLImpl;
    :catch_0
    move-exception v1

    .line 201
    .local v1, "ex":Ljava/text/ParseException;
    new-instance v2, Ljava/text/ParseException;

    invoke-virtual {v1}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 187
    .end local v0    # "telUrl":Ljava/lang/String;
    .end local v1    # "ex":Ljava/text/ParseException;
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null url"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createURI(Ljava/lang/String;)Landroid/javax/sip/address/URI;
    .locals 6
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 216
    if-eqz p1, :cond_5

    .line 219
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Landroid/gov/nist/javax/sip/parser/URLParser;

    invoke-direct {v1, p1}, Landroid/gov/nist/javax/sip/parser/URLParser;-><init>(Ljava/lang/String;)V

    .line 220
    .local v1, "urlParser":Landroid/gov/nist/javax/sip/parser/URLParser;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->peekScheme()Ljava/lang/String;

    move-result-object v2

    .line 221
    .local v2, "scheme":Ljava/lang/String;
    if-eqz v2, :cond_4

    .line 223
    const-string/jumbo v3, "sip"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string/jumbo v3, "sips"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    .line 225
    :cond_0
    const-string/jumbo v3, "tel"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 226
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/address/AddressFactoryImpl;->createTelURL(Ljava/lang/String;)Landroid/javax/sip/address/TelURL;

    move-result-object v0

    return-object v0

    .line 229
    :cond_1
    sget-object v3, Landroid/gov/nist/javax/sip/address/AddressFactoryImpl;->SCHEME_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v3, :cond_2

    .line 234
    .end local v1    # "urlParser":Landroid/gov/nist/javax/sip/parser/URLParser;
    .end local v2    # "scheme":Ljava/lang/String;
    nop

    .line 235
    new-instance v0, Landroid/gov/nist/javax/sip/address/GenericURI;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sip/address/GenericURI;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 230
    .restart local v1    # "urlParser":Landroid/gov/nist/javax/sip/parser/URLParser;
    .restart local v2    # "scheme":Ljava/lang/String;
    :cond_2
    :try_start_1
    new-instance v3, Ljava/text/ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "the scheme "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " from the following uri "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " doesn\'t match ALPHA *(ALPHA / DIGIT / \"+\" / \"-\" / \".\" ) from RFC3261"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    .end local p1    # "uri":Ljava/lang/String;
    throw v3

    .line 224
    .restart local p1    # "uri":Ljava/lang/String;
    :cond_3
    :goto_0
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/address/AddressFactoryImpl;->createSipURI(Ljava/lang/String;)Landroid/javax/sip/address/SipURI;

    move-result-object v0

    return-object v0

    .line 222
    :cond_4
    new-instance v3, Ljava/text/ParseException;

    const-string/jumbo v4, "bad scheme"

    invoke-direct {v3, v4, v0}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    .end local p1    # "uri":Ljava/lang/String;
    throw v3
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0

    .line 232
    .end local v1    # "urlParser":Landroid/gov/nist/javax/sip/parser/URLParser;
    .end local v2    # "scheme":Ljava/lang/String;
    .restart local p1    # "uri":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 233
    .local v1, "ex":Ljava/text/ParseException;
    new-instance v2, Ljava/text/ParseException;

    invoke-virtual {v1}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 217
    .end local v1    # "ex":Ljava/text/ParseException;
    :cond_5
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
