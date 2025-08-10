.class public final Landroid/gov/nist/javax/sip/header/CallIdentifier;
.super Landroid/gov/nist/javax/sip/header/SIPObject;
.source "CallIdentifier.java"


# static fields
.field private static final serialVersionUID:J = 0x65834be26eebb7f1L


# instance fields
.field protected host:Ljava/lang/String;

.field protected localId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 60
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/SIPObject;-><init>()V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "cid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 79
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/SIPObject;-><init>()V

    .line 80
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/CallIdentifier;->setCallID(Ljava/lang/String;)V

    .line 81
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "localId"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;

    .line 68
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/SIPObject;-><init>()V

    .line 69
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->localId:Ljava/lang/String;

    .line 70
    iput-object p2, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->host:Ljava/lang/String;

    .line 71
    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .locals 1

    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/CallIdentifier;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 92
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->localId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->host:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 94
    const-string v0, "@"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    :cond_0
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "other"    # Ljava/lang/Object;

    .line 106
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 107
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 108
    return v0

    .line 110
    :cond_1
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/header/CallIdentifier;

    .line 111
    .local v1, "that":Landroid/gov/nist/javax/sip/header/CallIdentifier;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->localId:Ljava/lang/String;

    iget-object v3, v1, Landroid/gov/nist/javax/sip/header/CallIdentifier;->localId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_2

    .line 112
    return v0

    .line 114
    :cond_2
    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->host:Ljava/lang/String;

    iget-object v3, v1, Landroid/gov/nist/javax/sip/header/CallIdentifier;->host:Ljava/lang/String;

    const/4 v4, 0x1

    if-ne v2, v3, :cond_3

    .line 115
    return v4

    .line 116
    :cond_3
    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->host:Ljava/lang/String;

    if-nez v2, :cond_4

    iget-object v2, v1, Landroid/gov/nist/javax/sip/header/CallIdentifier;->host:Ljava/lang/String;

    if-nez v2, :cond_5

    :cond_4
    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->host:Ljava/lang/String;

    if-eqz v2, :cond_6

    iget-object v2, v1, Landroid/gov/nist/javax/sip/header/CallIdentifier;->host:Ljava/lang/String;

    if-nez v2, :cond_6

    .line 118
    :cond_5
    return v0

    .line 119
    :cond_6
    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->host:Ljava/lang/String;

    iget-object v3, v1, Landroid/gov/nist/javax/sip/header/CallIdentifier;->host:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_7

    .line 120
    return v0

    .line 122
    :cond_7
    return v4
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .line 144
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getLocalId()Ljava/lang/String;
    .locals 1

    .line 137
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->localId:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 127
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->localId:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->localId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0

    .line 128
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Hash code called before id is set"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setCallID(Ljava/lang/String;)V
    .locals 3
    .param p1, "cid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 161
    if-eqz p1, :cond_2

    .line 163
    const/16 v0, 0x40

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 164
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 165
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->localId:Ljava/lang/String;

    .line 166
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->host:Ljava/lang/String;

    goto :goto_0

    .line 168
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->localId:Ljava/lang/String;

    .line 169
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->host:Ljava/lang/String;

    .line 170
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->localId:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->host:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 174
    :goto_0
    return-void

    .line 171
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "CallID  must be token@token or token"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 162
    .end local v0    # "index":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "NULL!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setHost(Ljava/lang/String;)V
    .locals 0
    .param p1, "host"    # Ljava/lang/String;

    .line 181
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->host:Ljava/lang/String;

    .line 182
    return-void
.end method

.method public setLocalId(Ljava/lang/String;)V
    .locals 0
    .param p1, "localId"    # Ljava/lang/String;

    .line 152
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/CallIdentifier;->localId:Ljava/lang/String;

    .line 153
    return-void
.end method
