.class public abstract Landroid/gov/nist/javax/sip/stack/MessageProcessor;
.super Ljava/lang/Object;
.source "MessageProcessor.java"


# static fields
.field protected static final IN6_ADDR_ANY:Ljava/lang/String; = "::0"

.field protected static final IN_ADDR_ANY:Ljava/lang/String; = "0.0.0.0"

.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private ipAddress:Ljava/net/InetAddress;

.field private listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

.field private port:I

.field private savedIpAddress:Ljava/lang/String;

.field private sentBy:Ljava/lang/String;

.field private sentByHostPort:Landroid/gov/nist/core/HostPort;

.field private sentBySet:Z

.field protected sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

.field protected transport:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 56
    const-class v0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "transport"    # Ljava/lang/String;

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->transport:Ljava/lang/String;

    .line 108
    return-void
.end method

.method protected constructor <init>(Ljava/net/InetAddress;ILjava/lang/String;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V
    .locals 0
    .param p1, "ipAddress"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "transport"    # Ljava/lang/String;
    .param p4, "transactionStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 119
    invoke-direct {p0, p3}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;-><init>(Ljava/lang/String;)V

    .line 120
    invoke-virtual {p0, p1, p2, p4}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->initialize(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 121
    return-void
.end method

.method public static getDefaultPort(Ljava/lang/String;)I
    .locals 1
    .param p0, "transport"    # Ljava/lang/String;

    .line 351
    const-string/jumbo v0, "TLS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x13c5

    goto :goto_0

    :cond_0
    const/16 v0, 0x13c4

    :goto_0
    return v0
.end method


# virtual methods
.method public abstract createMessageChannel(Landroid/gov/nist/core/HostPort;)Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract createMessageChannel(Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getDefaultTargetPort()I
.end method

.method public getIpAddress()Ljava/net/InetAddress;
    .locals 1

    .line 224
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->ipAddress:Ljava/net/InetAddress;

    return-object v0
.end method

.method public getListeningPoint()Landroid/gov/nist/javax/sip/ListeningPointImpl;
    .locals 3

    .line 191
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    if-nez v0, :cond_0

    .line 192
    sget-object v0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 193
    sget-object v0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "getListeningPoint"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " returning null listeningpoint"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 198
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    return-object v0
.end method

.method public abstract getMaximumMessageSize()I
.end method

.method public getPort()I
    .locals 1

    .line 159
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->port:I

    return v0
.end method

.method public abstract getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
.end method

.method public getSavedIpAddress()Ljava/lang/String;
    .locals 1

    .line 218
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->savedIpAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getSentBy()Ljava/lang/String;
    .locals 1

    .line 267
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentBy:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentByHostPort:Landroid/gov/nist/core/HostPort;

    if-eqz v0, :cond_0

    .line 268
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentByHostPort:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v0}, Landroid/gov/nist/core/HostPort;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentBy:Ljava/lang/String;

    .line 270
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentBy:Ljava/lang/String;

    return-object v0
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 149
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->transport:Ljava/lang/String;

    return-object v0
.end method

.method public getViaHeader()Landroid/gov/nist/javax/sip/header/Via;
    .locals 4

    .line 170
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Landroid/gov/nist/javax/sip/header/Via;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/Via;-><init>()V

    .line 171
    .local v1, "via":Landroid/gov/nist/javax/sip/header/Via;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentByHostPort:Landroid/gov/nist/core/HostPort;

    if-eqz v2, :cond_0

    .line 172
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentByHostPort:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/header/Via;->setSentBy(Landroid/gov/nist/core/HostPort;)V

    .line 173
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/header/Via;->setTransport(Ljava/lang/String;)V

    goto :goto_0

    .line 175
    :cond_0
    new-instance v2, Landroid/gov/nist/core/Host;

    invoke-direct {v2}, Landroid/gov/nist/core/Host;-><init>()V

    .line 176
    .local v2, "host":Landroid/gov/nist/core/Host;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/Host;->setHostname(Ljava/lang/String;)V

    .line 177
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/header/Via;->setHost(Landroid/gov/nist/core/Host;)V

    .line 178
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getPort()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/header/Via;->setPort(I)V

    .line 179
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/header/Via;->setTransport(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    .end local v2    # "host":Landroid/gov/nist/core/Host;
    :goto_0
    return-object v1

    .line 185
    .end local v1    # "via":Landroid/gov/nist/javax/sip/header/Via;
    :catch_0
    move-exception v1

    .line 186
    .local v1, "ex":Landroid/javax/sip/InvalidArgumentException;
    invoke-virtual {v1}, Landroid/javax/sip/InvalidArgumentException;->printStackTrace()V

    .line 187
    return-object v0

    .line 182
    .end local v1    # "ex":Landroid/javax/sip/InvalidArgumentException;
    :catch_1
    move-exception v1

    .line 183
    .local v1, "ex":Ljava/text/ParseException;
    invoke-virtual {v1}, Ljava/text/ParseException;->printStackTrace()V

    .line 184
    return-object v0
.end method

.method public abstract inUse()Z
.end method

.method public final initialize(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V
    .locals 3
    .param p1, "ipAddress"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "transactionStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 134
    iput-object p3, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 135
    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->savedIpAddress:Ljava/lang/String;

    .line 136
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->ipAddress:Ljava/net/InetAddress;

    .line 137
    iput p2, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->port:I

    .line 138
    new-instance v0, Landroid/gov/nist/core/HostPort;

    invoke-direct {v0}, Landroid/gov/nist/core/HostPort;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentByHostPort:Landroid/gov/nist/core/HostPort;

    .line 139
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentByHostPort:Landroid/gov/nist/core/HostPort;

    new-instance v1, Landroid/gov/nist/core/Host;

    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/HostPort;->setHost(Landroid/gov/nist/core/Host;)V

    .line 140
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentByHostPort:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v0, p2}, Landroid/gov/nist/core/HostPort;->setPort(I)V

    .line 141
    return-void
.end method

.method public abstract isSecure()Z
.end method

.method public isSentBySet()Z
    .locals 1

    .line 338
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentBySet:Z

    return v0
.end method

.method protected setIpAddress(Ljava/net/InetAddress;)V
    .locals 3
    .param p1, "ipAddress"    # Ljava/net/InetAddress;

    .line 230
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentByHostPort:Landroid/gov/nist/core/HostPort;

    new-instance v1, Landroid/gov/nist/core/Host;

    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/HostPort;->setHost(Landroid/gov/nist/core/Host;)V

    .line 231
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->ipAddress:Ljava/net/InetAddress;

    .line 232
    return-void
.end method

.method public setListeningPoint(Landroid/gov/nist/javax/sip/ListeningPointImpl;)V
    .locals 3
    .param p1, "lp"    # Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 202
    sget-object v0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 203
    sget-object v0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setListeningPoint"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " listeningPoint = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 207
    :cond_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getPort()I

    move-result v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getPort()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 208
    const-string/jumbo v0, "lp mismatch with provider"

    sget-object v1, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-static {v0, v1}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/String;Landroid/gov/nist/core/StackLogger;)V

    .line 210
    :cond_1
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->listeningPoint:Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 212
    return-void
.end method

.method public setSentBy(Ljava/lang/String;)V
    .locals 5
    .param p1, "sentBy"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 242
    const-string v0, ":"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 243
    .local v0, "ind":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 244
    new-instance v1, Landroid/gov/nist/core/HostPort;

    invoke-direct {v1}, Landroid/gov/nist/core/HostPort;-><init>()V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentByHostPort:Landroid/gov/nist/core/HostPort;

    .line 245
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentByHostPort:Landroid/gov/nist/core/HostPort;

    new-instance v2, Landroid/gov/nist/core/Host;

    invoke-direct {v2, p1}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/HostPort;->setHost(Landroid/gov/nist/core/Host;)V

    goto :goto_0

    .line 247
    :cond_0
    new-instance v1, Landroid/gov/nist/core/HostPort;

    invoke-direct {v1}, Landroid/gov/nist/core/HostPort;-><init>()V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentByHostPort:Landroid/gov/nist/core/HostPort;

    .line 248
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentByHostPort:Landroid/gov/nist/core/HostPort;

    new-instance v2, Landroid/gov/nist/core/Host;

    const/4 v3, 0x0

    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/HostPort;->setHost(Landroid/gov/nist/core/Host;)V

    .line 249
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 251
    .local v1, "portStr":Ljava/lang/String;
    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 252
    .local v2, "port":I
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentByHostPort:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v3, v2}, Landroid/gov/nist/core/HostPort;->setPort(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 255
    .end local v2    # "port":I
    nop

    .line 257
    .end local v1    # "portStr":Ljava/lang/String;
    :goto_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentBySet:Z

    .line 258
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->sentBy:Ljava/lang/String;

    .line 260
    return-void

    .line 253
    .restart local v1    # "portStr":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 254
    .local v2, "ex":Ljava/lang/NumberFormatException;
    new-instance v3, Ljava/text/ParseException;

    const-string v4, "Bad format encountered at "

    invoke-direct {v3, v4, v0}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v3
.end method

.method public abstract start()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract stop()V
.end method
