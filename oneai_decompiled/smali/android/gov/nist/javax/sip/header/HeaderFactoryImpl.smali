.class public Landroid/gov/nist/javax/sip/header/HeaderFactoryImpl;
.super Ljava/lang/Object;
.source "HeaderFactoryImpl.java"

# interfaces
.implements Landroid/javax/sip/header/HeaderFactory;
.implements Landroid/gov/nist/javax/sip/header/HeaderFactoryExt;


# instance fields
.field private stripAddressScopeZones:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1697
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/header/HeaderFactoryImpl;->stripAddressScopeZones:Z

    .line 1698
    const-string/jumbo v0, "android.gov.nist.core.STRIP_ADDR_SCOPES"

    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/header/HeaderFactoryImpl;->stripAddressScopeZones:Z

    .line 1700
    return-void
.end method


# virtual methods
.method public createAcceptEncodingHeader(Ljava/lang/String;)Landroid/javax/sip/header/AcceptEncodingHeader;
    .locals 2
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 89
    if-eqz p1, :cond_0

    .line 91
    new-instance v0, Landroid/gov/nist/javax/sip/header/AcceptEncoding;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/AcceptEncoding;-><init>()V

    .line 92
    .local v0, "acceptEncoding":Landroid/gov/nist/javax/sip/header/AcceptEncoding;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/AcceptEncoding;->setEncoding(Ljava/lang/String;)V

    .line 93
    return-object v0

    .line 90
    .end local v0    # "acceptEncoding":Landroid/gov/nist/javax/sip/header/AcceptEncoding;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "the encoding parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createAcceptHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sip/header/AcceptHeader;
    .locals 2
    .param p1, "contentType"    # Ljava/lang/String;
    .param p2, "contentSubType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 110
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 112
    new-instance v0, Landroid/gov/nist/javax/sip/header/Accept;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Accept;-><init>()V

    .line 113
    .local v0, "accept":Landroid/gov/nist/javax/sip/header/Accept;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Accept;->setContentType(Ljava/lang/String;)V

    .line 114
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/header/Accept;->setContentSubType(Ljava/lang/String;)V

    .line 116
    return-object v0

    .line 111
    .end local v0    # "accept":Landroid/gov/nist/javax/sip/header/Accept;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "contentType or subtype is null "

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createAcceptLanguageHeader(Ljava/util/Locale;)Landroid/javax/sip/header/AcceptLanguageHeader;
    .locals 2
    .param p1, "language"    # Ljava/util/Locale;

    .line 127
    if-eqz p1, :cond_0

    .line 129
    new-instance v0, Landroid/gov/nist/javax/sip/header/AcceptLanguage;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/AcceptLanguage;-><init>()V

    .line 130
    .local v0, "acceptLanguage":Landroid/gov/nist/javax/sip/header/AcceptLanguage;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/AcceptLanguage;->setAcceptLanguage(Ljava/util/Locale;)V

    .line 132
    return-object v0

    .line 128
    .end local v0    # "acceptLanguage":Landroid/gov/nist/javax/sip/header/AcceptLanguage;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createAlertInfoHeader(Landroid/javax/sip/address/URI;)Landroid/javax/sip/header/AlertInfoHeader;
    .locals 2
    .param p1, "alertInfo"    # Landroid/javax/sip/address/URI;

    .line 143
    if-eqz p1, :cond_0

    .line 145
    new-instance v0, Landroid/gov/nist/javax/sip/header/AlertInfo;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/AlertInfo;-><init>()V

    .line 146
    .local v0, "a":Landroid/gov/nist/javax/sip/header/AlertInfo;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/AlertInfo;->setAlertInfo(Landroid/javax/sip/address/URI;)V

    .line 147
    return-object v0

    .line 144
    .end local v0    # "a":Landroid/gov/nist/javax/sip/header/AlertInfo;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg alertInfo"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createAllowEventsHeader(Ljava/lang/String;)Landroid/javax/sip/header/AllowEventsHeader;
    .locals 2
    .param p1, "eventType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 162
    if-eqz p1, :cond_0

    .line 164
    new-instance v0, Landroid/gov/nist/javax/sip/header/AllowEvents;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/AllowEvents;-><init>()V

    .line 165
    .local v0, "allowEvents":Landroid/gov/nist/javax/sip/header/AllowEvents;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/AllowEvents;->setEventType(Ljava/lang/String;)V

    .line 166
    return-object v0

    .line 163
    .end local v0    # "allowEvents":Landroid/gov/nist/javax/sip/header/AllowEvents;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg eventType"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createAllowHeader(Ljava/lang/String;)Landroid/javax/sip/header/AllowHeader;
    .locals 2
    .param p1, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 178
    if-eqz p1, :cond_0

    .line 180
    new-instance v0, Landroid/gov/nist/javax/sip/header/Allow;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Allow;-><init>()V

    .line 181
    .local v0, "allow":Landroid/gov/nist/javax/sip/header/Allow;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Allow;->setMethod(Ljava/lang/String;)V

    .line 183
    return-object v0

    .line 179
    .end local v0    # "allow":Landroid/gov/nist/javax/sip/header/Allow;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg method"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createAuthenticationInfoHeader(Ljava/lang/String;)Landroid/javax/sip/header/AuthenticationInfoHeader;
    .locals 2
    .param p1, "response"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 198
    if-eqz p1, :cond_0

    .line 200
    new-instance v0, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;-><init>()V

    .line 201
    .local v0, "auth":Landroid/gov/nist/javax/sip/header/AuthenticationInfo;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/AuthenticationInfo;->setResponse(Ljava/lang/String;)V

    .line 203
    return-object v0

    .line 199
    .end local v0    # "auth":Landroid/gov/nist/javax/sip/header/AuthenticationInfo;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg response"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createAuthorizationHeader(Ljava/lang/String;)Landroid/javax/sip/header/AuthorizationHeader;
    .locals 2
    .param p1, "scheme"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 217
    if-eqz p1, :cond_0

    .line 219
    new-instance v0, Landroid/gov/nist/javax/sip/header/Authorization;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Authorization;-><init>()V

    .line 220
    .local v0, "auth":Landroid/gov/nist/javax/sip/header/Authorization;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Authorization;->setScheme(Ljava/lang/String;)V

    .line 222
    return-object v0

    .line 218
    .end local v0    # "auth":Landroid/gov/nist/javax/sip/header/Authorization;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg scheme "

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createCSeqHeader(ILjava/lang/String;)Landroid/javax/sip/header/CSeqHeader;
    .locals 2
    .param p1, "sequenceNumber"    # I
    .param p2, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;,
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 256
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1, p2}, Landroid/gov/nist/javax/sip/header/HeaderFactoryImpl;->createCSeqHeader(JLjava/lang/String;)Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    return-object v0
.end method

.method public createCSeqHeader(JLjava/lang/String;)Landroid/javax/sip/header/CSeqHeader;
    .locals 3
    .param p1, "sequenceNumber"    # J
    .param p3, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;,
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 239
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_1

    .line 241
    if-eqz p3, :cond_0

    .line 243
    new-instance v0, Landroid/gov/nist/javax/sip/header/CSeq;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/CSeq;-><init>()V

    .line 244
    .local v0, "cseq":Landroid/gov/nist/javax/sip/header/CSeq;
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/header/CSeq;->setMethod(Ljava/lang/String;)V

    .line 245
    invoke-virtual {v0, p1, p2}, Landroid/gov/nist/javax/sip/header/CSeq;->setSeqNumber(J)V

    .line 247
    return-object v0

    .line 242
    .end local v0    # "cseq":Landroid/gov/nist/javax/sip/header/CSeq;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg method"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 240
    :cond_1
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "bad arg "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createCallIdHeader(Ljava/lang/String;)Landroid/javax/sip/header/CallIdHeader;
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 269
    if-eqz p1, :cond_0

    .line 271
    new-instance v0, Landroid/gov/nist/javax/sip/header/CallID;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/CallID;-><init>()V

    .line 272
    .local v0, "c":Landroid/gov/nist/javax/sip/header/CallID;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/CallID;->setCallId(Ljava/lang/String;)V

    .line 273
    return-object v0

    .line 270
    .end local v0    # "c":Landroid/gov/nist/javax/sip/header/CallID;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg callId"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createCallInfoHeader(Landroid/javax/sip/address/URI;)Landroid/javax/sip/header/CallInfoHeader;
    .locals 2
    .param p1, "callInfo"    # Landroid/javax/sip/address/URI;

    .line 283
    if-eqz p1, :cond_0

    .line 286
    new-instance v0, Landroid/gov/nist/javax/sip/header/CallInfo;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/CallInfo;-><init>()V

    .line 287
    .local v0, "c":Landroid/gov/nist/javax/sip/header/CallInfo;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/CallInfo;->setInfo(Landroid/javax/sip/address/URI;)V

    .line 288
    return-object v0

    .line 284
    .end local v0    # "c":Landroid/gov/nist/javax/sip/header/CallInfo;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg callInfo"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createChargingVectorHeader(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/ims/PChargingVectorHeader;
    .locals 2
    .param p1, "icid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1419
    if-eqz p1, :cond_0

    .line 1422
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;-><init>()V

    .line 1423
    .local v0, "chargingVector":Landroid/gov/nist/javax/sip/header/ims/PChargingVector;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;->setICID(Ljava/lang/String;)V

    .line 1425
    return-object v0

    .line 1420
    .end local v0    # "chargingVector":Landroid/gov/nist/javax/sip/header/ims/PChargingVector;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null icid arg!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createContactHeader()Landroid/javax/sip/header/ContactHeader;
    .locals 2

    .line 320
    new-instance v0, Landroid/gov/nist/javax/sip/header/Contact;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Contact;-><init>()V

    .line 321
    .local v0, "contact":Landroid/gov/nist/javax/sip/header/Contact;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/Contact;->setWildCardFlag(Z)V

    .line 322
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/Contact;->setExpires(I)V

    .line 324
    return-object v0
.end method

.method public createContactHeader(Landroid/javax/sip/address/Address;)Landroid/javax/sip/header/ContactHeader;
    .locals 2
    .param p1, "address"    # Landroid/javax/sip/address/Address;

    .line 298
    if-eqz p1, :cond_0

    .line 300
    new-instance v0, Landroid/gov/nist/javax/sip/header/Contact;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Contact;-><init>()V

    .line 301
    .local v0, "contact":Landroid/gov/nist/javax/sip/header/Contact;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Contact;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 303
    return-object v0

    .line 299
    .end local v0    # "contact":Landroid/gov/nist/javax/sip/header/Contact;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg address"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createContentDispositionHeader(Ljava/lang/String;)Landroid/javax/sip/header/ContentDispositionHeader;
    .locals 2
    .param p1, "contentDisposition"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 339
    if-eqz p1, :cond_0

    .line 341
    new-instance v0, Landroid/gov/nist/javax/sip/header/ContentDisposition;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ContentDisposition;-><init>()V

    .line 342
    .local v0, "c":Landroid/gov/nist/javax/sip/header/ContentDisposition;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ContentDisposition;->setDispositionType(Ljava/lang/String;)V

    .line 344
    return-object v0

    .line 340
    .end local v0    # "c":Landroid/gov/nist/javax/sip/header/ContentDisposition;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg contentDisposition"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createContentEncodingHeader(Ljava/lang/String;)Landroid/javax/sip/header/ContentEncodingHeader;
    .locals 2
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 358
    if-eqz p1, :cond_0

    .line 360
    new-instance v0, Landroid/gov/nist/javax/sip/header/ContentEncoding;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ContentEncoding;-><init>()V

    .line 361
    .local v0, "c":Landroid/gov/nist/javax/sip/header/ContentEncoding;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ContentEncoding;->setEncoding(Ljava/lang/String;)V

    .line 363
    return-object v0

    .line 359
    .end local v0    # "c":Landroid/gov/nist/javax/sip/header/ContentEncoding;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null encoding"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createContentLanguageHeader(Ljava/util/Locale;)Landroid/javax/sip/header/ContentLanguageHeader;
    .locals 2
    .param p1, "contentLanguage"    # Ljava/util/Locale;

    .line 375
    if-eqz p1, :cond_0

    .line 377
    new-instance v0, Landroid/gov/nist/javax/sip/header/ContentLanguage;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ContentLanguage;-><init>()V

    .line 378
    .local v0, "c":Landroid/gov/nist/javax/sip/header/ContentLanguage;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ContentLanguage;->setContentLanguage(Ljava/util/Locale;)V

    .line 380
    return-object v0

    .line 376
    .end local v0    # "c":Landroid/gov/nist/javax/sip/header/ContentLanguage;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg contentLanguage"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createContentLengthHeader(I)Landroid/javax/sip/header/ContentLengthHeader;
    .locals 2
    .param p1, "contentLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 393
    if-ltz p1, :cond_0

    .line 395
    new-instance v0, Landroid/gov/nist/javax/sip/header/ContentLength;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ContentLength;-><init>()V

    .line 396
    .local v0, "c":Landroid/gov/nist/javax/sip/header/ContentLength;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ContentLength;->setContentLength(I)V

    .line 398
    return-object v0

    .line 394
    .end local v0    # "c":Landroid/gov/nist/javax/sip/header/ContentLength;
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v1, "bad contentLength"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createContentTypeHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sip/header/ContentTypeHeader;
    .locals 2
    .param p1, "contentType"    # Ljava/lang/String;
    .param p2, "contentSubType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 415
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 417
    new-instance v0, Landroid/gov/nist/javax/sip/header/ContentType;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ContentType;-><init>()V

    .line 418
    .local v0, "c":Landroid/gov/nist/javax/sip/header/ContentType;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ContentType;->setContentType(Ljava/lang/String;)V

    .line 419
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/header/ContentType;->setContentSubType(Ljava/lang/String;)V

    .line 420
    return-object v0

    .line 416
    .end local v0    # "c":Landroid/gov/nist/javax/sip/header/ContentType;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null contentType or subType"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDateHeader(Ljava/util/Calendar;)Landroid/javax/sip/header/DateHeader;
    .locals 3
    .param p1, "date"    # Ljava/util/Calendar;

    .line 430
    new-instance v0, Landroid/gov/nist/javax/sip/header/SIPDateHeader;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/SIPDateHeader;-><init>()V

    .line 431
    .local v0, "d":Landroid/gov/nist/javax/sip/header/SIPDateHeader;
    if-eqz p1, :cond_0

    .line 433
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/SIPDateHeader;->setDate(Ljava/util/Calendar;)V

    .line 435
    return-object v0

    .line 432
    :cond_0
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "null date"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public createErrorInfoHeader(Landroid/javax/sip/address/URI;)Landroid/javax/sip/header/ErrorInfoHeader;
    .locals 2
    .param p1, "errorInfo"    # Landroid/javax/sip/address/URI;

    .line 1155
    if-eqz p1, :cond_0

    .line 1157
    new-instance v0, Landroid/gov/nist/javax/sip/header/ErrorInfo;

    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/address/GenericURI;

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/header/ErrorInfo;-><init>(Landroid/gov/nist/javax/sip/address/GenericURI;)V

    return-object v0

    .line 1156
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createEventHeader(Ljava/lang/String;)Landroid/javax/sip/header/EventHeader;
    .locals 2
    .param p1, "eventType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 449
    if-eqz p1, :cond_0

    .line 451
    new-instance v0, Landroid/gov/nist/javax/sip/header/Event;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Event;-><init>()V

    .line 452
    .local v0, "event":Landroid/gov/nist/javax/sip/header/Event;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Event;->setEventType(Ljava/lang/String;)V

    .line 454
    return-object v0

    .line 450
    .end local v0    # "event":Landroid/gov/nist/javax/sip/header/Event;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null eventType"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createExpiresHeader(I)Landroid/javax/sip/header/ExpiresHeader;
    .locals 3
    .param p1, "expires"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 467
    if-ltz p1, :cond_0

    .line 469
    new-instance v0, Landroid/gov/nist/javax/sip/header/Expires;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Expires;-><init>()V

    .line 470
    .local v0, "e":Landroid/gov/nist/javax/sip/header/Expires;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Expires;->setExpires(I)V

    .line 472
    return-object v0

    .line 468
    .end local v0    # "e":Landroid/gov/nist/javax/sip/header/Expires;
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "bad value "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createExtensionHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sip/header/ExtensionHeader;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 489
    if-eqz p1, :cond_0

    .line 492
    new-instance v0, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;-><init>()V

    .line 494
    .local v0, "ext":Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;->setName(Ljava/lang/String;)V

    .line 495
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;->setValue(Ljava/lang/String;)V

    .line 497
    return-object v0

    .line 490
    .end local v0    # "ext":Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "bad name"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createFromHeader(Landroid/javax/sip/address/Address;Ljava/lang/String;)Landroid/javax/sip/header/FromHeader;
    .locals 2
    .param p1, "address"    # Landroid/javax/sip/address/Address;
    .param p2, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 512
    if-eqz p1, :cond_1

    .line 514
    new-instance v0, Landroid/gov/nist/javax/sip/header/From;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/From;-><init>()V

    .line 515
    .local v0, "from":Landroid/gov/nist/javax/sip/header/From;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/From;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 516
    if-eqz p2, :cond_0

    .line 517
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/header/From;->setTag(Ljava/lang/String;)V

    .line 519
    :cond_0
    return-object v0

    .line 513
    .end local v0    # "from":Landroid/gov/nist/javax/sip/header/From;
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null address arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;
    .locals 5
    .param p1, "headerText"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1166
    new-instance v0, Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;-><init>()V

    .line 1167
    .local v0, "smp":Landroid/gov/nist/javax/sip/parser/StringMsgParser;
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->parseSIPHeader(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v1

    .line 1168
    .local v1, "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    instance-of v2, v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    if-eqz v2, :cond_2

    .line 1169
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-gt v2, v3, :cond_1

    .line 1173
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->size()I

    move-result v2

    if-nez v2, :cond_0

    .line 1175
    const/4 v2, 0x0

    :try_start_0
    move-object v3, v1

    check-cast v3, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->getMyClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/javax/sip/header/Header;
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 1181
    :catch_0
    move-exception v3

    .line 1182
    .local v3, "ex":Ljava/lang/IllegalAccessException;
    invoke-virtual {v3}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    .line 1183
    return-object v2

    .line 1178
    .end local v3    # "ex":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v3

    .line 1179
    .local v3, "ex":Ljava/lang/InstantiationException;
    invoke-virtual {v3}, Ljava/lang/InstantiationException;->printStackTrace()V

    .line 1180
    return-object v2

    .line 1186
    .end local v3    # "ex":Ljava/lang/InstantiationException;
    :cond_0
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v2

    return-object v2

    .line 1170
    :cond_1
    new-instance v2, Ljava/text/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Only singleton allowed "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 1189
    :cond_2
    return-object v1
.end method

.method public createHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sip/header/Header;
    .locals 2
    .param p1, "headerName"    # Ljava/lang/String;
    .param p2, "headerValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1205
    if-eqz p1, :cond_0

    .line 1207
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1213
    .local v0, "hdrText":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/HeaderFactoryImpl;->createHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v1

    return-object v1

    .line 1206
    .end local v0    # "hdrText":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "header name is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createHeaders(Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .param p1, "headers"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1225
    if-eqz p1, :cond_1

    .line 1227
    new-instance v0, Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;-><init>()V

    .line 1228
    .local v0, "smp":Landroid/gov/nist/javax/sip/parser/StringMsgParser;
    invoke-static {p1}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->parseSIPHeader(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v1

    .line 1229
    .local v1, "shdr":Landroid/gov/nist/javax/sip/header/SIPHeader;
    instance-of v2, v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    if-eqz v2, :cond_0

    .line 1230
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    return-object v2

    .line 1232
    :cond_0
    new-instance v2, Ljava/text/ParseException;

    const-string v3, "List of headers of this type is not allowed in a message"

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 1226
    .end local v0    # "smp":Landroid/gov/nist/javax/sip/parser/StringMsgParser;
    .end local v1    # "shdr":Landroid/gov/nist/javax/sip/header/SIPHeader;
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createInReplyToHeader(Ljava/lang/String;)Landroid/javax/sip/header/InReplyToHeader;
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 534
    if-eqz p1, :cond_0

    .line 536
    new-instance v0, Landroid/gov/nist/javax/sip/header/InReplyTo;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/InReplyTo;-><init>()V

    .line 537
    .local v0, "inReplyTo":Landroid/gov/nist/javax/sip/header/InReplyTo;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/InReplyTo;->setCallId(Ljava/lang/String;)V

    .line 539
    return-object v0

    .line 535
    .end local v0    # "inReplyTo":Landroid/gov/nist/javax/sip/header/InReplyTo;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null callId arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createJoinHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/extensions/JoinHeader;
    .locals 1
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "toTag"    # Ljava/lang/String;
    .param p3, "fromTag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1291
    new-instance v0, Landroid/gov/nist/javax/sip/header/extensions/Join;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/extensions/Join;-><init>()V

    .line 1292
    .local v0, "join":Landroid/gov/nist/javax/sip/header/extensions/Join;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/extensions/Join;->setCallId(Ljava/lang/String;)V

    .line 1293
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/header/extensions/Join;->setFromTag(Ljava/lang/String;)V

    .line 1294
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/header/extensions/Join;->setToTag(Ljava/lang/String;)V

    .line 1296
    return-object v0
.end method

.method public createMaxForwardsHeader(I)Landroid/javax/sip/header/MaxForwardsHeader;
    .locals 3
    .param p1, "maxForwards"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 552
    if-ltz p1, :cond_0

    const/16 v0, 0xff

    if-gt p1, v0, :cond_0

    .line 555
    new-instance v0, Landroid/gov/nist/javax/sip/header/MaxForwards;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/MaxForwards;-><init>()V

    .line 556
    .local v0, "m":Landroid/gov/nist/javax/sip/header/MaxForwards;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/MaxForwards;->setMaxForwards(I)V

    .line 558
    return-object v0

    .line 553
    .end local v0    # "m":Landroid/gov/nist/javax/sip/header/MaxForwards;
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "bad maxForwards arg "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createMimeVersionHeader(II)Landroid/javax/sip/header/MimeVersionHeader;
    .locals 2
    .param p1, "majorVersion"    # I
    .param p2, "minorVersion"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 576
    if-ltz p1, :cond_0

    if-ltz p2, :cond_0

    .line 579
    new-instance v0, Landroid/gov/nist/javax/sip/header/MimeVersion;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/MimeVersion;-><init>()V

    .line 580
    .local v0, "m":Landroid/gov/nist/javax/sip/header/MimeVersion;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/MimeVersion;->setMajorVersion(I)V

    .line 581
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/header/MimeVersion;->setMinorVersion(I)V

    .line 583
    return-object v0

    .line 577
    .end local v0    # "m":Landroid/gov/nist/javax/sip/header/MimeVersion;
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v1, "bad major/minor version"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createMinExpiresHeader(I)Landroid/javax/sip/header/MinExpiresHeader;
    .locals 3
    .param p1, "minExpires"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 597
    if-ltz p1, :cond_0

    .line 599
    new-instance v0, Landroid/gov/nist/javax/sip/header/MinExpires;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/MinExpires;-><init>()V

    .line 600
    .local v0, "min":Landroid/gov/nist/javax/sip/header/MinExpires;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/MinExpires;->setExpires(I)V

    .line 602
    return-object v0

    .line 598
    .end local v0    # "min":Landroid/gov/nist/javax/sip/header/MinExpires;
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "bad minExpires "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createMinSEHeader(I)Landroid/javax/sip/header/ExtensionHeader;
    .locals 3
    .param p1, "expires"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 620
    if-ltz p1, :cond_0

    .line 622
    new-instance v0, Landroid/gov/nist/javax/sip/header/extensions/MinSE;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/extensions/MinSE;-><init>()V

    .line 623
    .local v0, "e":Landroid/gov/nist/javax/sip/header/extensions/MinSE;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/extensions/MinSE;->setExpires(I)V

    .line 625
    return-object v0

    .line 621
    .end local v0    # "e":Landroid/gov/nist/javax/sip/header/extensions/MinSE;
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "bad value "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createOrganizationHeader(Ljava/lang/String;)Landroid/javax/sip/header/OrganizationHeader;
    .locals 2
    .param p1, "organization"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 639
    if-eqz p1, :cond_0

    .line 641
    new-instance v0, Landroid/gov/nist/javax/sip/header/Organization;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Organization;-><init>()V

    .line 642
    .local v0, "o":Landroid/gov/nist/javax/sip/header/Organization;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Organization;->setOrganization(Ljava/lang/String;)V

    .line 644
    return-object v0

    .line 640
    .end local v0    # "o":Landroid/gov/nist/javax/sip/header/Organization;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "bad organization arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createPAccessNetworkInfoHeader()Landroid/gov/nist/javax/sip/header/ims/PAccessNetworkInfoHeader;
    .locals 1

    .line 1328
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PAccessNetworkInfo;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PAccessNetworkInfo;-><init>()V

    .line 1330
    .local v0, "accessNetworkInfo":Landroid/gov/nist/javax/sip/header/ims/PAccessNetworkInfo;
    return-object v0
.end method

.method public createPAssertedIdentityHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentityHeader;
    .locals 2
    .param p1, "address"    # Landroid/javax/sip/address/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;,
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1344
    if-eqz p1, :cond_0

    .line 1347
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentity;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentity;-><init>()V

    .line 1348
    .local v0, "assertedIdentity":Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentity;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentity;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 1350
    return-object v0

    .line 1345
    .end local v0    # "assertedIdentity":Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentity;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null address!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createPAssertedServiceHeader()Landroid/gov/nist/javax/sip/header/ims/PAssertedServiceHeader;
    .locals 1

    .line 1628
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PAssertedService;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PAssertedService;-><init>()V

    .line 1629
    .local v0, "pas":Landroid/gov/nist/javax/sip/header/ims/PAssertedService;
    return-object v0
.end method

.method public createPAssociatedURIHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/ims/PAssociatedURIHeader;
    .locals 2
    .param p1, "assocURI"    # Landroid/javax/sip/address/Address;

    .line 1365
    if-eqz p1, :cond_0

    .line 1368
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;-><init>()V

    .line 1369
    .local v0, "associatedURI":Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 1371
    return-object v0

    .line 1366
    .end local v0    # "associatedURI":Landroid/gov/nist/javax/sip/header/ims/PAssociatedURI;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null associatedURI!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createPCalledPartyIDHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/ims/PCalledPartyIDHeader;
    .locals 2
    .param p1, "address"    # Landroid/javax/sip/address/Address;

    .line 1386
    if-eqz p1, :cond_0

    .line 1389
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PCalledPartyID;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PCalledPartyID;-><init>()V

    .line 1390
    .local v0, "calledPartyID":Landroid/gov/nist/javax/sip/header/ims/PCalledPartyID;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ims/PCalledPartyID;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 1392
    return-object v0

    .line 1387
    .end local v0    # "calledPartyID":Landroid/gov/nist/javax/sip/header/ims/PCalledPartyID;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null address!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createPChargingFunctionAddressesHeader()Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddressesHeader;
    .locals 1

    .line 1403
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;-><init>()V

    .line 1405
    .local v0, "cfa":Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;
    return-object v0
.end method

.method public createPMediaAuthorizationHeader(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorizationHeader;
    .locals 2
    .param p1, "token"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;,
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1440
    if-eqz p1, :cond_0

    const-string v0, ""

    if-eq p1, v0, :cond_0

    .line 1444
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;-><init>()V

    .line 1445
    .local v0, "mediaAuthorization":Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;->setMediaAuthorizationToken(Ljava/lang/String;)V

    .line 1447
    return-object v0

    .line 1441
    .end local v0    # "mediaAuthorization":Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v1, "The Media-Authorization-Token parameter is null or empty"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createPPreferredIdentityHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentityHeader;
    .locals 2
    .param p1, "address"    # Landroid/javax/sip/address/Address;

    .line 1459
    if-eqz p1, :cond_0

    .line 1462
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentity;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentity;-><init>()V

    .line 1463
    .local v0, "preferredIdentity":Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentity;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentity;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 1465
    return-object v0

    .line 1460
    .end local v0    # "preferredIdentity":Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentity;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null address!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createPPreferredServiceHeader()Landroid/gov/nist/javax/sip/header/ims/PPreferredServiceHeader;
    .locals 1

    .line 1618
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PPreferredService;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PPreferredService;-><init>()V

    .line 1619
    .local v0, "pps":Landroid/gov/nist/javax/sip/header/ims/PPreferredService;
    return-object v0
.end method

.method public createPProfileKeyHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/ims/PProfileKeyHeader;
    .locals 2
    .param p1, "address"    # Landroid/javax/sip/address/Address;

    .line 1592
    if-eqz p1, :cond_0

    .line 1594
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PProfileKey;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PProfileKey;-><init>()V

    .line 1595
    .local v0, "pProfileKey":Landroid/gov/nist/javax/sip/header/ims/PProfileKey;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ims/PProfileKey;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 1597
    return-object v0

    .line 1593
    .end local v0    # "pProfileKey":Landroid/gov/nist/javax/sip/header/ims/PProfileKey;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Address is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createPServedUserHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/ims/PServedUserHeader;
    .locals 2
    .param p1, "address"    # Landroid/javax/sip/address/Address;

    .line 1606
    if-eqz p1, :cond_0

    .line 1608
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PServedUser;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PServedUser;-><init>()V

    .line 1609
    .local v0, "psu":Landroid/gov/nist/javax/sip/header/ims/PServedUser;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ims/PServedUser;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 1611
    return-object v0

    .line 1607
    .end local v0    # "psu":Landroid/gov/nist/javax/sip/header/ims/PServedUser;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Address is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createPUserDatabaseHeader(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/ims/PUserDatabaseHeader;
    .locals 2
    .param p1, "databaseName"    # Ljava/lang/String;

    .line 1575
    if-eqz p1, :cond_0

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1578
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;-><init>()V

    .line 1579
    .local v0, "pUserDatabase":Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;->setDatabaseName(Ljava/lang/String;)V

    .line 1581
    return-object v0

    .line 1576
    .end local v0    # "pUserDatabase":Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Database name is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createPVisitedNetworkIDHeader()Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkIDHeader;
    .locals 1

    .line 1475
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;-><init>()V

    .line 1477
    .local v0, "visitedNetworkID":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;
    return-object v0
.end method

.method public createPathHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/ims/PathHeader;
    .locals 2
    .param p1, "address"    # Landroid/javax/sip/address/Address;

    .line 1491
    if-eqz p1, :cond_0

    .line 1495
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/Path;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/Path;-><init>()V

    .line 1496
    .local v0, "path":Landroid/gov/nist/javax/sip/header/ims/Path;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ims/Path;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 1498
    return-object v0

    .line 1492
    .end local v0    # "path":Landroid/gov/nist/javax/sip/header/ims/Path;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null address!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createPriorityHeader(Ljava/lang/String;)Landroid/javax/sip/header/PriorityHeader;
    .locals 2
    .param p1, "priority"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 657
    if-eqz p1, :cond_0

    .line 659
    new-instance v0, Landroid/gov/nist/javax/sip/header/Priority;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Priority;-><init>()V

    .line 660
    .local v0, "p":Landroid/gov/nist/javax/sip/header/Priority;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Priority;->setPriority(Ljava/lang/String;)V

    .line 662
    return-object v0

    .line 658
    .end local v0    # "p":Landroid/gov/nist/javax/sip/header/Priority;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "bad priority arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createPrivacyHeader(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/ims/PrivacyHeader;
    .locals 2
    .param p1, "privacyType"    # Ljava/lang/String;

    .line 1510
    if-eqz p1, :cond_0

    .line 1513
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/Privacy;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sip/header/ims/Privacy;-><init>(Ljava/lang/String;)V

    .line 1515
    .local v0, "privacy":Landroid/gov/nist/javax/sip/header/ims/Privacy;
    return-object v0

    .line 1511
    .end local v0    # "privacy":Landroid/gov/nist/javax/sip/header/ims/Privacy;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null privacyType arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createProxyAuthenticateHeader(Ljava/lang/String;)Landroid/javax/sip/header/ProxyAuthenticateHeader;
    .locals 2
    .param p1, "scheme"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 676
    if-eqz p1, :cond_0

    .line 678
    new-instance v0, Landroid/gov/nist/javax/sip/header/ProxyAuthenticate;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ProxyAuthenticate;-><init>()V

    .line 679
    .local v0, "p":Landroid/gov/nist/javax/sip/header/ProxyAuthenticate;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ProxyAuthenticate;->setScheme(Ljava/lang/String;)V

    .line 681
    return-object v0

    .line 677
    .end local v0    # "p":Landroid/gov/nist/javax/sip/header/ProxyAuthenticate;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "bad scheme arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createProxyAuthorizationHeader(Ljava/lang/String;)Landroid/javax/sip/header/ProxyAuthorizationHeader;
    .locals 2
    .param p1, "scheme"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 695
    if-eqz p1, :cond_0

    .line 697
    new-instance v0, Landroid/gov/nist/javax/sip/header/ProxyAuthorization;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ProxyAuthorization;-><init>()V

    .line 698
    .local v0, "p":Landroid/gov/nist/javax/sip/header/ProxyAuthorization;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ProxyAuthorization;->setScheme(Ljava/lang/String;)V

    .line 700
    return-object v0

    .line 696
    .end local v0    # "p":Landroid/gov/nist/javax/sip/header/ProxyAuthorization;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "bad scheme arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createProxyRequireHeader(Ljava/lang/String;)Landroid/javax/sip/header/ProxyRequireHeader;
    .locals 2
    .param p1, "optionTag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 714
    if-eqz p1, :cond_0

    .line 716
    new-instance v0, Landroid/gov/nist/javax/sip/header/ProxyRequire;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ProxyRequire;-><init>()V

    .line 717
    .local v0, "p":Landroid/gov/nist/javax/sip/header/ProxyRequire;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ProxyRequire;->setOptionTag(Ljava/lang/String;)V

    .line 719
    return-object v0

    .line 715
    .end local v0    # "p":Landroid/gov/nist/javax/sip/header/ProxyRequire;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "bad optionTag arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRAckHeader(IILjava/lang/String;)Landroid/javax/sip/header/RAckHeader;
    .locals 6
    .param p1, "rSeqNumber"    # I
    .param p2, "cSeqNumber"    # I
    .param p3, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;,
            Ljava/text/ParseException;
        }
    .end annotation

    .line 759
    int-to-long v1, p1

    int-to-long v3, p2

    move-object v0, p0

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/gov/nist/javax/sip/header/HeaderFactoryImpl;->createRAckHeader(JJLjava/lang/String;)Landroid/javax/sip/header/RAckHeader;

    move-result-object v0

    return-object v0
.end method

.method public createRAckHeader(JJLjava/lang/String;)Landroid/javax/sip/header/RAckHeader;
    .locals 3
    .param p1, "rSeqNumber"    # J
    .param p3, "cSeqNumber"    # J
    .param p5, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;,
            Ljava/text/ParseException;
        }
    .end annotation

    .line 741
    if-eqz p5, :cond_1

    .line 743
    const-wide/16 v0, 0x0

    cmp-long v2, p3, v0

    if-ltz v2, :cond_0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 745
    new-instance v0, Landroid/gov/nist/javax/sip/header/RAck;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/RAck;-><init>()V

    .line 746
    .local v0, "rack":Landroid/gov/nist/javax/sip/header/RAck;
    invoke-virtual {v0, p5}, Landroid/gov/nist/javax/sip/header/RAck;->setMethod(Ljava/lang/String;)V

    .line 747
    invoke-virtual {v0, p3, p4}, Landroid/gov/nist/javax/sip/header/RAck;->setCSequenceNumber(J)V

    .line 748
    invoke-virtual {v0, p1, p2}, Landroid/gov/nist/javax/sip/header/RAck;->setRSequenceNumber(J)V

    .line 750
    return-object v0

    .line 744
    .end local v0    # "rack":Landroid/gov/nist/javax/sip/header/RAck;
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v1, "bad cseq/rseq arg"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 742
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Bad method"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRSeqHeader(I)Landroid/javax/sip/header/RSeqHeader;
    .locals 2
    .param p1, "sequenceNumber"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 769
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/HeaderFactoryImpl;->createRSeqHeader(J)Landroid/javax/sip/header/RSeqHeader;

    move-result-object v0

    return-object v0
.end method

.method public createRSeqHeader(J)Landroid/javax/sip/header/RSeqHeader;
    .locals 3
    .param p1, "sequenceNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 783
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 786
    new-instance v0, Landroid/gov/nist/javax/sip/header/RSeq;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/RSeq;-><init>()V

    .line 787
    .local v0, "rseq":Landroid/gov/nist/javax/sip/header/RSeq;
    invoke-virtual {v0, p1, p2}, Landroid/gov/nist/javax/sip/header/RSeq;->setSeqNumber(J)V

    .line 789
    return-object v0

    .line 784
    .end local v0    # "rseq":Landroid/gov/nist/javax/sip/header/RSeq;
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "invalid sequenceNumber arg "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createReasonHeader(Ljava/lang/String;ILjava/lang/String;)Landroid/javax/sip/header/ReasonHeader;
    .locals 2
    .param p1, "protocol"    # Ljava/lang/String;
    .param p2, "cause"    # I
    .param p3, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;,
            Ljava/text/ParseException;
        }
    .end annotation

    .line 808
    if-eqz p1, :cond_1

    .line 810
    if-ltz p2, :cond_0

    .line 812
    new-instance v0, Landroid/gov/nist/javax/sip/header/Reason;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Reason;-><init>()V

    .line 813
    .local v0, "reason":Landroid/gov/nist/javax/sip/header/Reason;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Reason;->setProtocol(Ljava/lang/String;)V

    .line 814
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/header/Reason;->setCause(I)V

    .line 815
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/header/Reason;->setText(Ljava/lang/String;)V

    .line 817
    return-object v0

    .line 811
    .end local v0    # "reason":Landroid/gov/nist/javax/sip/header/Reason;
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v1, "bad cause"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 809
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "bad protocol arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRecordRouteHeader(Landroid/javax/sip/address/Address;)Landroid/javax/sip/header/RecordRouteHeader;
    .locals 2
    .param p1, "address"    # Landroid/javax/sip/address/Address;

    .line 827
    if-eqz p1, :cond_0

    .line 828
    new-instance v0, Landroid/gov/nist/javax/sip/header/RecordRoute;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/RecordRoute;-><init>()V

    .line 829
    .local v0, "recordRoute":Landroid/gov/nist/javax/sip/header/RecordRoute;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/RecordRoute;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 831
    return-object v0

    .line 827
    .end local v0    # "recordRoute":Landroid/gov/nist/javax/sip/header/RecordRoute;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null argument!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createReferToHeader(Landroid/javax/sip/address/Address;)Landroid/javax/sip/header/ReferToHeader;
    .locals 2
    .param p1, "address"    # Landroid/javax/sip/address/Address;

    .line 1241
    if-eqz p1, :cond_0

    .line 1243
    new-instance v0, Landroid/gov/nist/javax/sip/header/ReferTo;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ReferTo;-><init>()V

    .line 1244
    .local v0, "referTo":Landroid/gov/nist/javax/sip/header/ReferTo;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ReferTo;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 1245
    return-object v0

    .line 1242
    .end local v0    # "referTo":Landroid/gov/nist/javax/sip/header/ReferTo;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null address!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createReferencesHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/extensions/ReferencesHeader;
    .locals 1
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "rel"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1682
    new-instance v0, Landroid/gov/nist/javax/sip/header/extensions/References;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/extensions/References;-><init>()V

    .line 1683
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/extensions/ReferencesHeader;
    invoke-interface {v0, p1}, Landroid/gov/nist/javax/sip/header/extensions/ReferencesHeader;->setCallId(Ljava/lang/String;)V

    .line 1684
    invoke-interface {v0, p2}, Landroid/gov/nist/javax/sip/header/extensions/ReferencesHeader;->setRel(Ljava/lang/String;)V

    .line 1685
    return-object v0
.end method

.method public createReferredByHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/extensions/ReferredByHeader;
    .locals 2
    .param p1, "address"    # Landroid/javax/sip/address/Address;

    .line 1259
    if-eqz p1, :cond_0

    .line 1261
    new-instance v0, Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;-><init>()V

    .line 1262
    .local v0, "referredBy":Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 1263
    return-object v0

    .line 1260
    .end local v0    # "referredBy":Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null address!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createReplacesHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/extensions/ReplacesHeader;
    .locals 1
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "toTag"    # Ljava/lang/String;
    .param p3, "fromTag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1276
    new-instance v0, Landroid/gov/nist/javax/sip/header/extensions/Replaces;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/extensions/Replaces;-><init>()V

    .line 1277
    .local v0, "replaces":Landroid/gov/nist/javax/sip/header/extensions/Replaces;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/extensions/Replaces;->setCallId(Ljava/lang/String;)V

    .line 1278
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/header/extensions/Replaces;->setFromTag(Ljava/lang/String;)V

    .line 1279
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/header/extensions/Replaces;->setToTag(Ljava/lang/String;)V

    .line 1281
    return-object v0
.end method

.method public createReplyToHeader(Landroid/javax/sip/address/Address;)Landroid/javax/sip/header/ReplyToHeader;
    .locals 2
    .param p1, "address"    # Landroid/javax/sip/address/Address;

    .line 842
    if-eqz p1, :cond_0

    .line 844
    new-instance v0, Landroid/gov/nist/javax/sip/header/ReplyTo;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ReplyTo;-><init>()V

    .line 845
    .local v0, "replyTo":Landroid/gov/nist/javax/sip/header/ReplyTo;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ReplyTo;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 847
    return-object v0

    .line 843
    .end local v0    # "replyTo":Landroid/gov/nist/javax/sip/header/ReplyTo;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null address"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRequestLine(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/SipRequestLine;
    .locals 2
    .param p1, "requestLine"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1658
    new-instance v0, Landroid/gov/nist/javax/sip/parser/RequestLineParser;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sip/parser/RequestLineParser;-><init>(Ljava/lang/String;)V

    .line 1659
    .local v0, "requestLineParser":Landroid/gov/nist/javax/sip/parser/RequestLineParser;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/RequestLineParser;->parse()Landroid/gov/nist/javax/sip/header/RequestLine;

    move-result-object v1

    return-object v1
.end method

.method public createRequireHeader(Ljava/lang/String;)Landroid/javax/sip/header/RequireHeader;
    .locals 2
    .param p1, "optionTag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 861
    if-eqz p1, :cond_0

    .line 863
    new-instance v0, Landroid/gov/nist/javax/sip/header/Require;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Require;-><init>()V

    .line 864
    .local v0, "require":Landroid/gov/nist/javax/sip/header/Require;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Require;->setOptionTag(Ljava/lang/String;)V

    .line 866
    return-object v0

    .line 862
    .end local v0    # "require":Landroid/gov/nist/javax/sip/header/Require;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null optionTag"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRetryAfterHeader(I)Landroid/javax/sip/header/RetryAfterHeader;
    .locals 2
    .param p1, "retryAfter"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 880
    if-ltz p1, :cond_0

    .line 882
    new-instance v0, Landroid/gov/nist/javax/sip/header/RetryAfter;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/RetryAfter;-><init>()V

    .line 883
    .local v0, "r":Landroid/gov/nist/javax/sip/header/RetryAfter;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/RetryAfter;->setRetryAfter(I)V

    .line 885
    return-object v0

    .line 881
    .end local v0    # "r":Landroid/gov/nist/javax/sip/header/RetryAfter;
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v1, "bad retryAfter arg"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRouteHeader(Landroid/javax/sip/address/Address;)Landroid/javax/sip/header/RouteHeader;
    .locals 2
    .param p1, "address"    # Landroid/javax/sip/address/Address;

    .line 895
    if-eqz p1, :cond_0

    .line 897
    new-instance v0, Landroid/gov/nist/javax/sip/header/Route;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Route;-><init>()V

    .line 898
    .local v0, "route":Landroid/gov/nist/javax/sip/header/Route;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Route;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 900
    return-object v0

    .line 896
    .end local v0    # "route":Landroid/gov/nist/javax/sip/header/Route;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null address arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createSIPETagHeader(Ljava/lang/String;)Landroid/javax/sip/header/SIPETagHeader;
    .locals 1
    .param p1, "etag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1305
    new-instance v0, Landroid/gov/nist/javax/sip/header/SIPETag;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sip/header/SIPETag;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public createSIPIfMatchHeader(Ljava/lang/String;)Landroid/javax/sip/header/SIPIfMatchHeader;
    .locals 1
    .param p1, "etag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1313
    new-instance v0, Landroid/gov/nist/javax/sip/header/SIPIfMatch;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sip/header/SIPIfMatch;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public createSecurityClientHeader()Landroid/gov/nist/javax/sip/header/ims/SecurityClientHeader;
    .locals 1

    .line 1554
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/SecurityClient;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/SecurityClient;-><init>()V

    .line 1555
    .local v0, "secClient":Landroid/gov/nist/javax/sip/header/ims/SecurityClient;
    return-object v0
.end method

.method public createSecurityServerHeader()Landroid/gov/nist/javax/sip/header/ims/SecurityServerHeader;
    .locals 1

    .line 1544
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/SecurityServer;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/SecurityServer;-><init>()V

    .line 1545
    .local v0, "secServer":Landroid/gov/nist/javax/sip/header/ims/SecurityServer;
    return-object v0
.end method

.method public createSecurityVerifyHeader()Landroid/gov/nist/javax/sip/header/ims/SecurityVerifyHeader;
    .locals 1

    .line 1564
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/SecurityVerify;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/SecurityVerify;-><init>()V

    .line 1565
    .local v0, "secVerify":Landroid/gov/nist/javax/sip/header/ims/SecurityVerify;
    return-object v0
.end method

.method public createServerHeader(Ljava/util/List;)Landroid/javax/sip/header/ServerHeader;
    .locals 2
    .param p1, "product"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 913
    if-eqz p1, :cond_0

    .line 915
    new-instance v0, Landroid/gov/nist/javax/sip/header/Server;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Server;-><init>()V

    .line 916
    .local v0, "server":Landroid/gov/nist/javax/sip/header/Server;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Server;->setProduct(Ljava/util/List;)V

    .line 918
    return-object v0

    .line 914
    .end local v0    # "server":Landroid/gov/nist/javax/sip/header/Server;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null productList arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createServiceRouteHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/ims/ServiceRouteHeader;
    .locals 2
    .param p1, "address"    # Landroid/javax/sip/address/Address;

    .line 1528
    if-eqz p1, :cond_0

    .line 1531
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;-><init>()V

    .line 1532
    .local v0, "serviceRoute":Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 1534
    return-object v0

    .line 1529
    .end local v0    # "serviceRoute":Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null address!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createSessionExpiresHeader(I)Landroid/gov/nist/javax/sip/header/extensions/SessionExpiresHeader;
    .locals 3
    .param p1, "expires"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 1643
    if-ltz p1, :cond_0

    .line 1645
    new-instance v0, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;-><init>()V

    .line 1646
    .local v0, "s":Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;->setExpires(I)V

    .line 1648
    return-object v0

    .line 1644
    .end local v0    # "s":Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "bad value "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createStatusLine(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/SipStatusLine;
    .locals 2
    .param p1, "statusLine"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1666
    new-instance v0, Landroid/gov/nist/javax/sip/parser/StatusLineParser;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sip/parser/StatusLineParser;-><init>(Ljava/lang/String;)V

    .line 1667
    .local v0, "statusLineParser":Landroid/gov/nist/javax/sip/parser/StatusLineParser;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->parse()Landroid/gov/nist/javax/sip/header/StatusLine;

    move-result-object v1

    return-object v1
.end method

.method public createSubjectHeader(Ljava/lang/String;)Landroid/javax/sip/header/SubjectHeader;
    .locals 2
    .param p1, "subject"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 931
    if-eqz p1, :cond_0

    .line 933
    new-instance v0, Landroid/gov/nist/javax/sip/header/Subject;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Subject;-><init>()V

    .line 934
    .local v0, "s":Landroid/gov/nist/javax/sip/header/Subject;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Subject;->setSubject(Ljava/lang/String;)V

    .line 936
    return-object v0

    .line 932
    .end local v0    # "s":Landroid/gov/nist/javax/sip/header/Subject;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null subject arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createSubscriptionStateHeader(Ljava/lang/String;)Landroid/javax/sip/header/SubscriptionStateHeader;
    .locals 2
    .param p1, "subscriptionState"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 951
    if-eqz p1, :cond_0

    .line 953
    new-instance v0, Landroid/gov/nist/javax/sip/header/SubscriptionState;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/SubscriptionState;-><init>()V

    .line 954
    .local v0, "s":Landroid/gov/nist/javax/sip/header/SubscriptionState;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/SubscriptionState;->setState(Ljava/lang/String;)V

    .line 956
    return-object v0

    .line 952
    .end local v0    # "s":Landroid/gov/nist/javax/sip/header/SubscriptionState;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null subscriptionState arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createSupportedHeader(Ljava/lang/String;)Landroid/javax/sip/header/SupportedHeader;
    .locals 2
    .param p1, "optionTag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 970
    if-eqz p1, :cond_0

    .line 972
    new-instance v0, Landroid/gov/nist/javax/sip/header/Supported;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Supported;-><init>()V

    .line 973
    .local v0, "supported":Landroid/gov/nist/javax/sip/header/Supported;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Supported;->setOptionTag(Ljava/lang/String;)V

    .line 975
    return-object v0

    .line 971
    .end local v0    # "supported":Landroid/gov/nist/javax/sip/header/Supported;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null optionTag arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createTimeStampHeader(F)Landroid/javax/sip/header/TimeStampHeader;
    .locals 2
    .param p1, "timeStamp"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 988
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_0

    .line 990
    new-instance v0, Landroid/gov/nist/javax/sip/header/TimeStamp;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/TimeStamp;-><init>()V

    .line 991
    .local v0, "t":Landroid/gov/nist/javax/sip/header/TimeStamp;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/TimeStamp;->setTimeStamp(F)V

    .line 993
    return-object v0

    .line 989
    .end local v0    # "t":Landroid/gov/nist/javax/sip/header/TimeStamp;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "illegal timeStamp"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createToHeader(Landroid/javax/sip/address/Address;Ljava/lang/String;)Landroid/javax/sip/header/ToHeader;
    .locals 2
    .param p1, "address"    # Landroid/javax/sip/address/Address;
    .param p2, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1008
    if-eqz p1, :cond_1

    .line 1010
    new-instance v0, Landroid/gov/nist/javax/sip/header/To;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/To;-><init>()V

    .line 1011
    .local v0, "to":Landroid/gov/nist/javax/sip/header/To;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/To;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 1012
    if-eqz p2, :cond_0

    .line 1013
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/header/To;->setTag(Ljava/lang/String;)V

    .line 1015
    :cond_0
    return-object v0

    .line 1009
    .end local v0    # "to":Landroid/gov/nist/javax/sip/header/To;
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null address"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createUnsupportedHeader(Ljava/lang/String;)Landroid/javax/sip/header/UnsupportedHeader;
    .locals 1
    .param p1, "optionTag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1029
    if-eqz p1, :cond_0

    .line 1031
    new-instance v0, Landroid/gov/nist/javax/sip/header/Unsupported;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Unsupported;-><init>()V

    .line 1032
    .local v0, "unsupported":Landroid/gov/nist/javax/sip/header/Unsupported;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Unsupported;->setOptionTag(Ljava/lang/String;)V

    .line 1034
    return-object v0

    .line 1030
    .end local v0    # "unsupported":Landroid/gov/nist/javax/sip/header/Unsupported;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createUserAgentHeader(Ljava/util/List;)Landroid/javax/sip/header/UserAgentHeader;
    .locals 2
    .param p1, "product"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1048
    if-eqz p1, :cond_0

    .line 1050
    new-instance v0, Landroid/gov/nist/javax/sip/header/UserAgent;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/UserAgent;-><init>()V

    .line 1051
    .local v0, "userAgent":Landroid/gov/nist/javax/sip/header/UserAgent;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/UserAgent;->setProduct(Ljava/util/List;)V

    .line 1053
    return-object v0

    .line 1049
    .end local v0    # "userAgent":Landroid/gov/nist/javax/sip/header/UserAgent;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null user agent"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createViaHeader(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Landroid/javax/sip/header/ViaHeader;
    .locals 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "transport"    # Ljava/lang/String;
    .param p4, "branch"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;,
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 1074
    if-eqz p1, :cond_3

    if-eqz p3, :cond_3

    .line 1076
    new-instance v0, Landroid/gov/nist/javax/sip/header/Via;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Via;-><init>()V

    .line 1077
    .local v0, "via":Landroid/gov/nist/javax/sip/header/Via;
    if-eqz p4, :cond_0

    .line 1078
    invoke-virtual {v0, p4}, Landroid/gov/nist/javax/sip/header/Via;->setBranch(Ljava/lang/String;)V

    .line 1081
    :cond_0
    const/16 v1, 0x3a

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_2

    const/16 v1, 0x5b

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_2

    .line 1085
    iget-boolean v2, p0, Landroid/gov/nist/javax/sip/header/HeaderFactoryImpl;->stripAddressScopeZones:Z

    if-eqz v2, :cond_1

    .line 1087
    const/16 v2, 0x25

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 1088
    .local v2, "zoneStart":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 1089
    const/4 v3, 0x0

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 1091
    .end local v2    # "zoneStart":I
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1094
    :cond_2
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Via;->setHost(Ljava/lang/String;)V

    .line 1095
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/header/Via;->setPort(I)V

    .line 1096
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/header/Via;->setTransport(Ljava/lang/String;)V

    .line 1098
    return-object v0

    .line 1075
    .end local v0    # "via":Landroid/gov/nist/javax/sip/header/Via;
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createWWWAuthenticateHeader(Ljava/lang/String;)Landroid/javax/sip/header/WWWAuthenticateHeader;
    .locals 2
    .param p1, "scheme"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1112
    if-eqz p1, :cond_0

    .line 1114
    new-instance v0, Landroid/gov/nist/javax/sip/header/WWWAuthenticate;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/WWWAuthenticate;-><init>()V

    .line 1115
    .local v0, "www":Landroid/gov/nist/javax/sip/header/WWWAuthenticate;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/WWWAuthenticate;->setScheme(Ljava/lang/String;)V

    .line 1117
    return-object v0

    .line 1113
    .end local v0    # "www":Landroid/gov/nist/javax/sip/header/WWWAuthenticate;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null scheme"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createWarningHeader(Ljava/lang/String;ILjava/lang/String;)Landroid/javax/sip/header/WarningHeader;
    .locals 2
    .param p1, "agent"    # Ljava/lang/String;
    .param p2, "code"    # I
    .param p3, "comment"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;,
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 1138
    if-eqz p1, :cond_0

    .line 1140
    new-instance v0, Landroid/gov/nist/javax/sip/header/Warning;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Warning;-><init>()V

    .line 1141
    .local v0, "warning":Landroid/gov/nist/javax/sip/header/Warning;
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/Warning;->setAgent(Ljava/lang/String;)V

    .line 1142
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/header/Warning;->setCode(I)V

    .line 1143
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/header/Warning;->setText(Ljava/lang/String;)V

    .line 1145
    return-object v0

    .line 1139
    .end local v0    # "warning":Landroid/gov/nist/javax/sip/header/Warning;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPrettyEncoding(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .line 75
    invoke-static {p1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;->setPrettyEncode(Z)V

    .line 76
    return-void
.end method
