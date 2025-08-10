.class public final Landroid/gov/nist/javax/sip/stack/HopImpl;
.super Ljava/lang/Object;
.source "HopImpl.java"

# interfaces
.implements Landroid/javax/sip/address/Hop;
.implements Ljava/io/Serializable;


# instance fields
.field protected defaultRoute:Z

.field protected host:Ljava/lang/String;

.field protected port:I

.field protected transport:Ljava/lang/String;

.field protected uriRoute:Z


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 7
    .param p1, "hop"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    if-eqz p1, :cond_7

    .line 99
    const/16 v0, 0x5d

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 100
    .local v0, "brack":I
    const/16 v1, 0x3a

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 101
    .local v1, "colon":I
    const/16 v2, 0x2f

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 103
    .local v2, "slash":I
    const-string/jumbo v3, "UDP"

    const/4 v4, 0x0

    if-lez v1, :cond_1

    .line 104
    invoke-virtual {p1, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->host:Ljava/lang/String;

    .line 106
    if-lez v2, :cond_0

    .line 107
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 108
    .local v3, "portstr":Ljava/lang/String;
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->transport:Ljava/lang/String;

    goto :goto_0

    .line 110
    .end local v3    # "portstr":Ljava/lang/String;
    :cond_0
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 111
    .local v5, "portstr":Ljava/lang/String;
    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->transport:Ljava/lang/String;

    move-object v3, v5

    .line 114
    .end local v5    # "portstr":Ljava/lang/String;
    .restart local v3    # "portstr":Ljava/lang/String;
    :goto_0
    :try_start_0
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->port:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    nop

    .line 118
    .end local v3    # "portstr":Ljava/lang/String;
    goto :goto_1

    .line 115
    .restart local v3    # "portstr":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 116
    .local v4, "ex":Ljava/lang/NumberFormatException;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Bad port spec"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 119
    .end local v3    # "portstr":Ljava/lang/String;
    .end local v4    # "ex":Ljava/lang/NumberFormatException;
    :cond_1
    const/16 v5, 0x13c4

    if-lez v2, :cond_3

    .line 120
    invoke-virtual {p1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->host:Ljava/lang/String;

    .line 121
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->transport:Ljava/lang/String;

    .line 122
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->transport:Ljava/lang/String;

    const-string/jumbo v6, "TLS"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/16 v5, 0x13c5

    :cond_2
    iput v5, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->port:I

    goto :goto_1

    .line 124
    :cond_3
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->host:Ljava/lang/String;

    .line 125
    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->transport:Ljava/lang/String;

    .line 126
    iput v5, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->port:I

    .line 131
    :goto_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->host:Ljava/lang/String;

    if-eqz v3, :cond_6

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->host:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_6

    .line 135
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->host:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->host:Ljava/lang/String;

    .line 136
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->transport:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->transport:Ljava/lang/String;

    .line 138
    if-lez v0, :cond_5

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->host:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x5b

    if-ne v3, v4, :cond_4

    goto :goto_2

    .line 139
    :cond_4
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Bad IPv6 reference spec"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 148
    :cond_5
    :goto_2
    return-void

    .line 132
    :cond_6
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "no host!"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 96
    .end local v0    # "brack":I
    .end local v1    # "colon":I
    .end local v2    # "slash":I
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Null arg!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 2
    .param p1, "hostName"    # Ljava/lang/String;
    .param p2, "portNumber"    # I
    .param p3, "trans"    # Ljava/lang/String;

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->host:Ljava/lang/String;

    .line 79
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->host:Ljava/lang/String;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_0

    .line 80
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->host:Ljava/lang/String;

    const-string/jumbo v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_0

    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->host:Ljava/lang/String;

    .line 83
    :cond_0
    iput p2, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->port:I

    .line 84
    iput-object p3, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->transport:Ljava/lang/String;

    .line 85
    return-void
.end method


# virtual methods
.method public getHost()Ljava/lang/String;
    .locals 1

    .line 155
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .line 163
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->port:I

    return v0
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 169
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->transport:Ljava/lang/String;

    return-object v0
.end method

.method public isURIRoute()Z
    .locals 1

    .line 177
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->uriRoute:Z

    return v0
.end method

.method public setURIRouteFlag()V
    .locals 1

    .line 183
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->uriRoute:Z

    .line 184
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/HopImpl;->transport:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
