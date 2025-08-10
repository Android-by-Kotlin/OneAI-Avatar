.class public Landroid/gov/nist/core/Host;
.super Landroid/gov/nist/core/GenericObject;
.source "Host.java"


# static fields
.field protected static final HOSTNAME:I = 0x1

.field protected static final IPV4ADDRESS:I = 0x2

.field protected static final IPV6ADDRESS:I = 0x3

.field private static final serialVersionUID:J = -0x6462c89aa1f7b990L

.field private static stripAddressScopeZones:Z


# instance fields
.field protected addressType:I

.field protected hostname:Ljava/lang/String;

.field private inetAddress:Ljava/net/InetAddress;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 65
    const/4 v0, 0x0

    sput-boolean v0, Landroid/gov/nist/core/Host;->stripAddressScopeZones:Z

    .line 73
    const-string/jumbo v0, "android.gov.nist.core.STRIP_ADDR_SCOPES"

    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Landroid/gov/nist/core/Host;->stripAddressScopeZones:Z

    .line 74
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 89
    invoke-direct {p0}, Landroid/gov/nist/core/GenericObject;-><init>()V

    .line 90
    const/4 v0, 0x1

    iput v0, p0, Landroid/gov/nist/core/Host;->addressType:I

    .line 91
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "hostName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 95
    invoke-direct {p0}, Landroid/gov/nist/core/GenericObject;-><init>()V

    .line 96
    if-eqz p1, :cond_0

    .line 99
    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Landroid/gov/nist/core/Host;->setHost(Ljava/lang/String;I)V

    .line 100
    return-void

    .line 97
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "null host name"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "addrType"    # I

    .line 106
    invoke-direct {p0}, Landroid/gov/nist/core/GenericObject;-><init>()V

    .line 107
    invoke-direct {p0, p1, p2}, Landroid/gov/nist/core/Host;->setHost(Ljava/lang/String;I)V

    .line 108
    return-void
.end method

.method private isIPv6Address(Ljava/lang/String;)Z
    .locals 2
    .param p1, "address"    # Ljava/lang/String;

    .line 301
    if-eqz p1, :cond_0

    const/16 v0, 0x3a

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isIPv6Reference(Ljava/lang/String;)Z
    .locals 4
    .param p0, "address"    # Ljava/lang/String;

    .line 309
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x5b

    if-ne v1, v2, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v3, 0x5d

    if-ne v1, v3, :cond_0

    move v0, v2

    :cond_0
    return v0
.end method

.method private setHost(Ljava/lang/String;I)V
    .locals 3
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "type"    # I

    .line 223
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/core/Host;->inetAddress:Ljava/net/InetAddress;

    .line 225
    invoke-direct {p0, p1}, Landroid/gov/nist/core/Host;->isIPv6Address(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x3

    if-eqz v0, :cond_0

    .line 226
    iput v1, p0, Landroid/gov/nist/core/Host;->addressType:I

    goto :goto_0

    .line 228
    :cond_0
    iput p2, p0, Landroid/gov/nist/core/Host;->addressType:I

    .line 231
    :goto_0
    if-eqz p1, :cond_2

    .line 232
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    .line 235
    iget v0, p0, Landroid/gov/nist/core/Host;->addressType:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    .line 236
    iget-object v0, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    .line 240
    :cond_1
    const/4 v0, -0x1

    .line 241
    .local v0, "zoneStart":I
    iget v2, p0, Landroid/gov/nist/core/Host;->addressType:I

    if-ne v2, v1, :cond_2

    sget-boolean v1, Landroid/gov/nist/core/Host;->stripAddressScopeZones:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    const/16 v2, 0x25

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    move v0, v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    .line 245
    iget-object v1, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    .line 249
    iget-object v1, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    const-string/jumbo v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 250
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    .line 253
    .end local v0    # "zoneStart":I
    :cond_2
    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .locals 1

    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/Host;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 119
    iget v0, p0, Landroid/gov/nist/core/Host;->addressType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    invoke-static {v0}, Landroid/gov/nist/core/Host;->isIPv6Reference(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 120
    const/16 v0, 0x5b

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 122
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    :goto_0
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .line 135
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 136
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 137
    return v0

    .line 139
    :cond_1
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/core/Host;

    .line 140
    .local v0, "otherHost":Landroid/gov/nist/core/Host;
    iget-object v1, v0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    iget-object v2, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public getAddress()Ljava/lang/String;
    .locals 1

    .line 155
    iget-object v0, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    return-object v0
.end method

.method public getHostname()Ljava/lang/String;
    .locals 1

    .line 148
    iget-object v0, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    return-object v0
.end method

.method public getInetAddress()Ljava/net/InetAddress;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .line 286
    iget-object v0, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 287
    const/4 v0, 0x0

    return-object v0

    .line 288
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/Host;->inetAddress:Ljava/net/InetAddress;

    if-eqz v0, :cond_1

    .line 289
    iget-object v0, p0, Landroid/gov/nist/core/Host;->inetAddress:Ljava/net/InetAddress;

    return-object v0

    .line 290
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/Host;->inetAddress:Ljava/net/InetAddress;

    .line 291
    iget-object v0, p0, Landroid/gov/nist/core/Host;->inetAddress:Ljava/net/InetAddress;

    return-object v0
.end method

.method public getIpAddress()Ljava/lang/String;
    .locals 5

    .line 164
    const/4 v0, 0x0

    .line 165
    .local v0, "rawIpAddress":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 166
    const/4 v1, 0x0

    return-object v1

    .line 167
    :cond_0
    iget v1, p0, Landroid/gov/nist/core/Host;->addressType:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 169
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/core/Host;->inetAddress:Ljava/net/InetAddress;

    if-nez v1, :cond_1

    .line 170
    iget-object v1, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/core/Host;->inetAddress:Ljava/net/InetAddress;

    .line 171
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/core/Host;->inetAddress:Ljava/net/InetAddress;

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 174
    :goto_0
    goto :goto_2

    .line 172
    :catch_0
    move-exception v1

    .line 173
    .local v1, "ex":Ljava/net/UnknownHostException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not resolve hostname "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/core/Host;->dbgPrint(Ljava/lang/String;)V

    .end local v1    # "ex":Ljava/net/UnknownHostException;
    goto :goto_0

    .line 176
    :cond_2
    iget v1, p0, Landroid/gov/nist/core/Host;->addressType:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_5

    .line 178
    :try_start_1
    invoke-virtual {p0}, Landroid/gov/nist/core/Host;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/InetAddress;->toString()Ljava/lang/String;

    move-result-object v1

    .line 179
    .local v1, "ipv6FullForm":Ljava/lang/String;
    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 180
    .local v2, "slashIndex":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_3

    .line 181
    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    move-object v1, v3

    .line 183
    :cond_3
    iget-object v3, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    const-string/jumbo v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 184
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v4, 0x5b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x5d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v0, v3

    goto :goto_1

    .line 186
    :cond_4
    move-object v0, v1

    .line 191
    .end local v1    # "ipv6FullForm":Ljava/lang/String;
    .end local v2    # "slashIndex":I
    :goto_1
    goto :goto_2

    .line 188
    :catch_1
    move-exception v1

    .line 190
    .local v1, "e":Ljava/net/UnknownHostException;
    invoke-virtual {v1}, Ljava/net/UnknownHostException;->printStackTrace()V

    .end local v1    # "e":Ljava/net/UnknownHostException;
    goto :goto_1

    .line 193
    :cond_5
    iget-object v0, p0, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    .line 196
    :goto_2
    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 315
    invoke-virtual {p0}, Landroid/gov/nist/core/Host;->getHostname()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isHostname()Z
    .locals 2

    .line 268
    iget v0, p0, Landroid/gov/nist/core/Host;->addressType:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isIPAddress()Z
    .locals 2

    .line 276
    iget v0, p0, Landroid/gov/nist/core/Host;->addressType:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public setAddress(Ljava/lang/String;)V
    .locals 0
    .param p1, "address"    # Ljava/lang/String;

    .line 260
    invoke-virtual {p0, p1}, Landroid/gov/nist/core/Host;->setHostAddress(Ljava/lang/String;)V

    .line 261
    return-void
.end method

.method public setHostAddress(Ljava/lang/String;)V
    .locals 1
    .param p1, "address"    # Ljava/lang/String;

    .line 211
    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Landroid/gov/nist/core/Host;->setHost(Ljava/lang/String;I)V

    .line 212
    return-void
.end method

.method public setHostname(Ljava/lang/String;)V
    .locals 1
    .param p1, "h"    # Ljava/lang/String;

    .line 204
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroid/gov/nist/core/Host;->setHost(Ljava/lang/String;I)V

    .line 205
    return-void
.end method
