.class public Landroid/gov/nist/javax/sip/header/Protocol;
.super Landroid/gov/nist/javax/sip/header/SIPObject;
.source "Protocol.java"


# static fields
.field private static final serialVersionUID:J = 0x1ec381b4ff51f3c0L


# instance fields
.field protected protocolName:Ljava/lang/String;

.field protected protocolVersion:Ljava/lang/String;

.field protected transport:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 148
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/SIPObject;-><init>()V

    .line 149
    const-string/jumbo v0, "SIP"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Protocol;->protocolName:Ljava/lang/String;

    .line 150
    const-string v0, "2.0"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Protocol;->protocolVersion:Ljava/lang/String;

    .line 151
    const-string/jumbo v0, "UDP"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Protocol;->transport:Ljava/lang/String;

    .line 152
    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .locals 1

    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Protocol;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 3
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 73
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Protocol;->protocolName:Ljava/lang/String;

    invoke-static {v0}, Landroid/gov/nist/javax/sip/Utils;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/Protocol;->protocolVersion:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Protocol;->transport:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    return-object p1
.end method

.method public getProtocol()Ljava/lang/String;
    .locals 2

    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Protocol;->protocolName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Protocol;->protocolVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProtocolName()Ljava/lang/String;
    .locals 1

    .line 86
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Protocol;->protocolName:Ljava/lang/String;

    return-object v0
.end method

.method public getProtocolVersion()Ljava/lang/String;
    .locals 1

    .line 93
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Protocol;->protocolVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 118
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Protocol;->transport:Ljava/lang/String;

    return-object v0
.end method

.method public setProtocol(Ljava/lang/String;)V
    .locals 4
    .param p1, "name_and_version"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 107
    const/16 v0, 0x2f

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 108
    .local v0, "slash":I
    const/4 v1, 0x0

    if-lez v0, :cond_0

    .line 109
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/header/Protocol;->protocolName:Ljava/lang/String;

    .line 110
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/header/Protocol;->protocolVersion:Ljava/lang/String;

    .line 112
    return-void

    .line 111
    :cond_0
    new-instance v2, Ljava/text/ParseException;

    const-string v3, "Missing \'/\' in protocol"

    invoke-direct {v2, v3, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2
.end method

.method public setProtocolName(Ljava/lang/String;)V
    .locals 0
    .param p1, "p"    # Ljava/lang/String;

    .line 126
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Protocol;->protocolName:Ljava/lang/String;

    .line 127
    return-void
.end method

.method public setProtocolVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "p"    # Ljava/lang/String;

    .line 134
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Protocol;->protocolVersion:Ljava/lang/String;

    .line 135
    return-void
.end method

.method public setTransport(Ljava/lang/String;)V
    .locals 0
    .param p1, "t"    # Ljava/lang/String;

    .line 142
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Protocol;->transport:Ljava/lang/String;

    .line 143
    return-void
.end method
