.class public Landroid/gov/nist/javax/sip/ListeningPointImpl;
.super Ljava/lang/Object;
.source "ListeningPointImpl.java"

# interfaces
.implements Landroid/javax/sip/ListeningPoint;
.implements Landroid/gov/nist/javax/sip/ListeningPointExt;


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field protected messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

.field port:I

.field protected sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

.field protected sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

.field protected transport:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 60
    const-class v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method protected constructor <init>(Landroid/javax/sip/SipStack;ILjava/lang/String;)V
    .locals 1
    .param p1, "sipStack"    # Landroid/javax/sip/SipStack;
    .param p2, "port"    # I
    .param p3, "transport"    # Ljava/lang/String;

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/SipStackImpl;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    .line 136
    iput p2, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->port:I

    .line 137
    iput-object p3, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->transport:Ljava/lang/String;

    .line 139
    return-void
.end method

.method public static makeKey(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "host"    # Ljava/lang/String;
    .param p1, "port"    # I
    .param p2, "transport"    # Ljava/lang/String;

    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 4

    .line 147
    new-instance v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    iget v2, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->port:I

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Landroid/gov/nist/javax/sip/ListeningPointImpl;-><init>(Landroid/javax/sip/SipStack;ILjava/lang/String;)V

    .line 149
    .local v0, "lip":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    .line 150
    return-object v0
.end method

.method public createContactHeader()Landroid/javax/sip/header/ContactHeader;
    .locals 5

    .line 229
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getIPAddress()Ljava/lang/String;

    move-result-object v0

    .line 230
    .local v0, "ipAddress":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getPort()I

    move-result v1

    .line 231
    .local v1, "port":I
    new-instance v2, Landroid/gov/nist/javax/sip/address/SipUri;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/address/SipUri;-><init>()V

    .line 232
    .local v2, "sipURI":Landroid/javax/sip/address/SipURI;
    invoke-interface {v2, v0}, Landroid/javax/sip/address/SipURI;->setHost(Ljava/lang/String;)V

    .line 233
    invoke-interface {v2, v1}, Landroid/javax/sip/address/SipURI;->setPort(I)V

    .line 234
    iget-object v3, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->transport:Ljava/lang/String;

    invoke-interface {v2, v3}, Landroid/javax/sip/address/SipURI;->setTransportParam(Ljava/lang/String;)V

    .line 235
    new-instance v3, Landroid/gov/nist/javax/sip/header/Contact;

    invoke-direct {v3}, Landroid/gov/nist/javax/sip/header/Contact;-><init>()V

    .line 236
    .local v3, "contact":Landroid/gov/nist/javax/sip/header/Contact;
    new-instance v4, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-direct {v4}, Landroid/gov/nist/javax/sip/address/AddressImpl;-><init>()V

    .line 237
    .local v4, "address":Landroid/gov/nist/javax/sip/address/AddressImpl;
    invoke-virtual {v4, v2}, Landroid/gov/nist/javax/sip/address/AddressImpl;->setURI(Landroid/javax/sip/address/URI;)V

    .line 238
    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/header/Contact;->setAddress(Landroid/javax/sip/address/Address;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 240
    return-object v3

    .line 241
    .end local v0    # "ipAddress":Ljava/lang/String;
    .end local v1    # "port":I
    .end local v2    # "sipURI":Landroid/javax/sip/address/SipURI;
    .end local v3    # "contact":Landroid/gov/nist/javax/sip/header/Contact;
    .end local v4    # "address":Landroid/gov/nist/javax/sip/address/AddressImpl;
    :catch_0
    move-exception v0

    .line 242
    .local v0, "ex":Ljava/lang/Exception;
    const-string/jumbo v1, "Unexpected exception"

    sget-object v2, Landroid/gov/nist/javax/sip/ListeningPointImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-static {v1, v2}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/String;Landroid/gov/nist/core/StackLogger;)V

    .line 243
    const/4 v1, 0x0

    return-object v1
.end method

.method public createViaHeader()Landroid/javax/sip/header/ViaHeader;
    .locals 1

    .line 273
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getViaHeader()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v0

    return-object v0
.end method

.method public getIPAddress()Ljava/lang/String;
    .locals 1

    .line 195
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getKey()Ljava/lang/String;
    .locals 3

    .line 108
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getIPAddress()Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->port:I

    iget-object v2, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->transport:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->makeKey(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .locals 1

    .line 224
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .line 169
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getPort()I

    move-result v0

    return v0
.end method

.method public getProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;
    .locals 1

    .line 187
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    return-object v0
.end method

.method public getSentBy()Ljava/lang/String;
    .locals 1

    .line 213
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getSentBy()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 178
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getViaHeader()Landroid/gov/nist/javax/sip/header/Via;
    .locals 1

    .line 220
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getViaHeader()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v0

    return-object v0
.end method

.method public isSentBySet()Z
    .locals 1

    .line 217
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->isSentBySet()Z

    move-result v0

    return v0
.end method

.method public removeSipProvider()V
    .locals 1

    .line 123
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    .line 124
    return-void
.end method

.method public sendHeartbeat(Ljava/lang/String;I)V
    .locals 8
    .param p1, "ipAddress"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 250
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 251
    return-void

    .line 252
    :cond_0
    new-instance v0, Landroid/gov/nist/core/HostPort;

    invoke-direct {v0}, Landroid/gov/nist/core/HostPort;-><init>()V

    .line 253
    .local v0, "targetHostPort":Landroid/gov/nist/core/HostPort;
    new-instance v1, Landroid/gov/nist/core/Host;

    invoke-direct {v1, p1}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/HostPort;->setHost(Landroid/gov/nist/core/Host;)V

    .line 254
    invoke-virtual {v0, p2}, Landroid/gov/nist/core/HostPort;->setPort(I)V

    .line 255
    iget-object v1, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->createMessageChannel(Landroid/gov/nist/core/HostPort;)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v1

    .line 256
    .local v1, "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    new-instance v2, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;-><init>()V

    .line 257
    .local v2, "siprequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setNullRequest()V

    .line 259
    instance-of v3, v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    if-eqz v3, :cond_1

    .line 261
    move-object v3, v1

    check-cast v3, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    .line 262
    .local v3, "connectionOrientedMessageChannel":Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getKeepAliveTimeout()J

    move-result-wide v4

    .line 263
    .local v4, "keepaliveTimeout":J
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-lez v6, :cond_1

    .line 264
    invoke-virtual {v3, v4, v5}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->rescheduleKeepAliveTimeout(J)V

    .line 267
    .end local v3    # "connectionOrientedMessageChannel":Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
    .end local v4    # "keepaliveTimeout":J
    :cond_1
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 269
    return-void
.end method

.method public setSentBy(Ljava/lang/String;)V
    .locals 1
    .param p1, "sentBy"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 204
    iget-object v0, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->setSentBy(Ljava/lang/String;)V

    .line 206
    return-void
.end method

.method public setSipProvider(Landroid/gov/nist/javax/sip/SipProviderImpl;)V
    .locals 0
    .param p1, "sipProviderImpl"    # Landroid/gov/nist/javax/sip/SipProviderImpl;

    .line 116
    iput-object p1, p0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    .line 117
    return-void
.end method
