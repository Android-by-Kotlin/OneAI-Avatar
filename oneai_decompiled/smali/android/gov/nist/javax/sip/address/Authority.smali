.class public Landroid/gov/nist/javax/sip/address/Authority;
.super Landroid/gov/nist/javax/sip/address/NetObject;
.source "Authority.java"


# static fields
.field private static final serialVersionUID:J = -0x318c6e34baa9fca6L


# instance fields
.field protected hostPort:Landroid/gov/nist/core/HostPort;

.field protected userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/address/NetObject;-><init>()V

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 223
    invoke-super {p0}, Landroid/gov/nist/javax/sip/address/NetObject;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/address/Authority;

    .line 224
    .local v0, "retval":Landroid/gov/nist/javax/sip/address/Authority;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    if-eqz v1, :cond_0

    .line 225
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v1}, Landroid/gov/nist/core/HostPort;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/core/HostPort;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    .line 226
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    if-eqz v1, :cond_1

    .line 227
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/UserInfo;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/address/UserInfo;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    .line 228
    :cond_1
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 1

    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/address/Authority;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 63
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/UserInfo;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 65
    const-string v0, "@"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/HostPort;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 68
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/HostPort;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 70
    :goto_0
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .line 79
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 80
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    .line 81
    return v0

    .line 83
    :cond_1
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/address/Authority;

    .line 84
    .local v1, "otherAuth":Landroid/gov/nist/javax/sip/address/Authority;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    iget-object v3, v1, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/HostPort;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 85
    return v0

    .line 87
    :cond_2
    iget-object v2, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    if-eqz v2, :cond_3

    iget-object v2, v1, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    if-eqz v2, :cond_3

    .line 88
    iget-object v2, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    iget-object v3, v1, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/address/UserInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 89
    return v0

    .line 92
    :cond_3
    const/4 v0, 0x1

    return v0
.end method

.method public getHost()Landroid/gov/nist/core/Host;
    .locals 1

    .line 135
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    if-nez v0, :cond_0

    .line 136
    const/4 v0, 0x0

    return-object v0

    .line 138
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v0}, Landroid/gov/nist/core/HostPort;->getHost()Landroid/gov/nist/core/Host;

    move-result-object v0

    return-object v0
.end method

.method public getHostPort()Landroid/gov/nist/core/HostPort;
    .locals 1

    .line 100
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .line 116
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    if-nez v0, :cond_0

    .line 117
    const/4 v0, 0x0

    return-object v0

    .line 119
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/address/UserInfo;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .line 146
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    if-nez v0, :cond_0

    .line 147
    const/4 v0, -0x1

    return v0

    .line 149
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v0}, Landroid/gov/nist/core/HostPort;->getPort()I

    move-result v0

    return v0
.end method

.method public getUser()Ljava/lang/String;
    .locals 1

    .line 127
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/address/UserInfo;->user:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getUserInfo()Landroid/gov/nist/javax/sip/address/UserInfo;
    .locals 1

    .line 108
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 233
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    if-eqz v0, :cond_0

    .line 234
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v0}, Landroid/gov/nist/core/HostPort;->encode()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0

    .line 233
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Null hostPort cannot compute hashcode"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removePort()V
    .locals 1

    .line 155
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    if-eqz v0, :cond_0

    .line 156
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v0}, Landroid/gov/nist/core/HostPort;->removePort()V

    .line 157
    :cond_0
    return-void
.end method

.method public removeUserInfo()V
    .locals 1

    .line 219
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    .line 220
    return-void
.end method

.method public setHost(Landroid/gov/nist/core/Host;)V
    .locals 1
    .param p1, "host"    # Landroid/gov/nist/core/Host;

    .line 184
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    if-nez v0, :cond_0

    .line 185
    new-instance v0, Landroid/gov/nist/core/HostPort;

    invoke-direct {v0}, Landroid/gov/nist/core/HostPort;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    .line 186
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/HostPort;->setHost(Landroid/gov/nist/core/Host;)V

    .line 187
    return-void
.end method

.method public setHostPort(Landroid/gov/nist/core/HostPort;)V
    .locals 0
    .param p1, "h"    # Landroid/gov/nist/core/HostPort;

    .line 204
    iput-object p1, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    .line 205
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 1
    .param p1, "passwd"    # Ljava/lang/String;

    .line 164
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    if-nez v0, :cond_0

    .line 165
    new-instance v0, Landroid/gov/nist/javax/sip/address/UserInfo;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/UserInfo;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    .line 166
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/UserInfo;->setPassword(Ljava/lang/String;)V

    .line 167
    return-void
.end method

.method public setPort(I)V
    .locals 1
    .param p1, "port"    # I

    .line 194
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    if-nez v0, :cond_0

    .line 195
    new-instance v0, Landroid/gov/nist/core/HostPort;

    invoke-direct {v0}, Landroid/gov/nist/core/HostPort;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    .line 196
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->hostPort:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/HostPort;->setPort(I)V

    .line 197
    return-void
.end method

.method public setUser(Ljava/lang/String;)V
    .locals 1
    .param p1, "user"    # Ljava/lang/String;

    .line 174
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    if-nez v0, :cond_0

    .line 175
    new-instance v0, Landroid/gov/nist/javax/sip/address/UserInfo;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/UserInfo;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    .line 176
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/UserInfo;->setUser(Ljava/lang/String;)V

    .line 177
    return-void
.end method

.method public setUserInfo(Landroid/gov/nist/javax/sip/address/UserInfo;)V
    .locals 0
    .param p1, "u"    # Landroid/gov/nist/javax/sip/address/UserInfo;

    .line 212
    iput-object p1, p0, Landroid/gov/nist/javax/sip/address/Authority;->userInfo:Landroid/gov/nist/javax/sip/address/UserInfo;

    .line 213
    return-void
.end method
