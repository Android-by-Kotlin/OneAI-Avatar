.class public Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;
.super Ljava/lang/Object;
.source "DigestServerAuthenticationHelper.java"


# static fields
.field public static final DEFAULT_ALGORITHM:Ljava/lang/String; = "MD5"

.field public static final DEFAULT_SCHEME:Ljava/lang/String; = "Digest"

.field private static final toHex:[C


# instance fields
.field private messageDigest:Ljava/security/MessageDigest;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 61
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->toHex:[C

    return-void

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    const-string v0, "MD5"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->messageDigest:Ljava/security/MessageDigest;

    .line 71
    return-void
.end method

.method private generateNonce()Ljava/lang/String;
    .locals 9

    .line 90
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 91
    .local v0, "date":Ljava/util/Date;
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    .line 92
    .local v1, "time":J
    new-instance v3, Ljava/util/Random;

    invoke-direct {v3}, Ljava/util/Random;-><init>()V

    .line 93
    .local v3, "rand":Ljava/util/Random;
    invoke-virtual {v3}, Ljava/util/Random;->nextLong()J

    move-result-wide v4

    .line 94
    .local v4, "pad":J
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v7, Ljava/lang/Long;

    invoke-direct {v7, v1, v2}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v7}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    new-instance v7, Ljava/lang/Long;

    invoke-direct {v7, v4, v5}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v7}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 96
    .local v6, "nonceString":Ljava/lang/String;
    iget-object v7, p0, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->messageDigest:Ljava/security/MessageDigest;

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v7

    .line 98
    .local v7, "mdbytes":[B
    invoke-static {v7}, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->toHexString([B)Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method public static toHexString([B)Ljava/lang/String;
    .locals 6
    .param p0, "b"    # [B

    .line 74
    const/4 v0, 0x0

    .line 75
    .local v0, "pos":I
    array-length v1, p0

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [C

    .line 76
    .local v1, "c":[C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_0

    .line 77
    add-int/lit8 v3, v0, 0x1

    .end local v0    # "pos":I
    .local v3, "pos":I
    sget-object v4, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->toHex:[C

    aget-byte v5, p0, v2

    shr-int/lit8 v5, v5, 0x4

    and-int/lit8 v5, v5, 0xf

    aget-char v4, v4, v5

    aput-char v4, v1, v0

    .line 78
    add-int/lit8 v0, v3, 0x1

    .end local v3    # "pos":I
    .restart local v0    # "pos":I
    sget-object v4, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->toHex:[C

    aget-byte v5, p0, v2

    and-int/lit8 v5, v5, 0xf

    aget-char v4, v4, v5

    aput-char v4, v1, v3

    .line 76
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 80
    .end local v2    # "i":I
    :cond_0
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([C)V

    return-object v2
.end method


# virtual methods
.method public doAuthenticateHashedPassword(Landroid/javax/sip/message/Request;Ljava/lang/String;)Z
    .locals 16
    .param p1, "request"    # Landroid/javax/sip/message/Request;
    .param p2, "hashedPassword"    # Ljava/lang/String;

    .line 125
    move-object/from16 v0, p0

    const-string/jumbo v1, "Proxy-Authorization"

    move-object/from16 v2, p1

    invoke-interface {v2, v1}, Landroid/javax/sip/message/Request;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v1

    check-cast v1, Landroid/javax/sip/header/ProxyAuthorizationHeader;

    .line 126
    .local v1, "authHeader":Landroid/javax/sip/header/ProxyAuthorizationHeader;
    const/4 v3, 0x0

    if-nez v1, :cond_0

    return v3

    .line 127
    :cond_0
    invoke-interface {v1}, Landroid/javax/sip/header/ProxyAuthorizationHeader;->getRealm()Ljava/lang/String;

    move-result-object v4

    .line 128
    .local v4, "realm":Ljava/lang/String;
    invoke-interface {v1}, Landroid/javax/sip/header/ProxyAuthorizationHeader;->getUsername()Ljava/lang/String;

    move-result-object v5

    .line 130
    .local v5, "username":Ljava/lang/String;
    if-eqz v5, :cond_4

    if-nez v4, :cond_1

    goto/16 :goto_0

    .line 134
    :cond_1
    invoke-interface {v1}, Landroid/javax/sip/header/ProxyAuthorizationHeader;->getNonce()Ljava/lang/String;

    move-result-object v6

    .line 135
    .local v6, "nonce":Ljava/lang/String;
    invoke-interface {v1}, Landroid/javax/sip/header/ProxyAuthorizationHeader;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v7

    .line 136
    .local v7, "uri":Landroid/javax/sip/address/URI;
    if-nez v7, :cond_2

    .line 137
    return v3

    .line 142
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface/range {p1 .. p1}, Landroid/javax/sip/message/Request;->getMethod()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v8, ":"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v7}, Landroid/javax/sip/address/URI;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 143
    .local v3, "A2":Ljava/lang/String;
    move-object/from16 v9, p2

    .line 146
    .local v9, "HA1":Ljava/lang/String;
    iget-object v10, v0, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->messageDigest:Ljava/security/MessageDigest;

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v10

    .line 147
    .local v10, "mdbytes":[B
    invoke-static {v10}, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->toHexString([B)Ljava/lang/String;

    move-result-object v11

    .line 149
    .local v11, "HA2":Ljava/lang/String;
    invoke-interface {v1}, Landroid/javax/sip/header/ProxyAuthorizationHeader;->getCNonce()Ljava/lang/String;

    move-result-object v12

    .line 150
    .local v12, "cnonce":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 151
    .local v13, "KD":Ljava/lang/String;
    if-eqz v12, :cond_3

    .line 152
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 154
    :cond_3
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 155
    .end local v13    # "KD":Ljava/lang/String;
    .local v8, "KD":Ljava/lang/String;
    iget-object v13, v0, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->messageDigest:Ljava/security/MessageDigest;

    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v10

    .line 156
    invoke-static {v10}, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->toHexString([B)Ljava/lang/String;

    move-result-object v13

    .line 157
    .local v13, "mdString":Ljava/lang/String;
    invoke-interface {v1}, Landroid/javax/sip/header/ProxyAuthorizationHeader;->getResponse()Ljava/lang/String;

    move-result-object v14

    .line 160
    .local v14, "response":Ljava/lang/String;
    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    return v15

    .line 131
    .end local v3    # "A2":Ljava/lang/String;
    .end local v6    # "nonce":Ljava/lang/String;
    .end local v7    # "uri":Landroid/javax/sip/address/URI;
    .end local v8    # "KD":Ljava/lang/String;
    .end local v9    # "HA1":Ljava/lang/String;
    .end local v10    # "mdbytes":[B
    .end local v11    # "HA2":Ljava/lang/String;
    .end local v12    # "cnonce":Ljava/lang/String;
    .end local v13    # "mdString":Ljava/lang/String;
    .end local v14    # "response":Ljava/lang/String;
    :cond_4
    :goto_0
    return v3
.end method

.method public doAuthenticatePlainTextPassword(Landroid/javax/sip/message/Request;Ljava/lang/String;)Z
    .locals 17
    .param p1, "request"    # Landroid/javax/sip/message/Request;
    .param p2, "pass"    # Ljava/lang/String;

    .line 172
    move-object/from16 v0, p0

    const-string/jumbo v1, "Proxy-Authorization"

    move-object/from16 v2, p1

    invoke-interface {v2, v1}, Landroid/javax/sip/message/Request;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v1

    check-cast v1, Landroid/javax/sip/header/ProxyAuthorizationHeader;

    .line 174
    .local v1, "authHeader":Landroid/javax/sip/header/ProxyAuthorizationHeader;
    const/4 v3, 0x0

    if-nez v1, :cond_0

    return v3

    .line 175
    :cond_0
    invoke-interface {v1}, Landroid/javax/sip/header/ProxyAuthorizationHeader;->getRealm()Ljava/lang/String;

    move-result-object v4

    .line 176
    .local v4, "realm":Ljava/lang/String;
    invoke-interface {v1}, Landroid/javax/sip/header/ProxyAuthorizationHeader;->getUsername()Ljava/lang/String;

    move-result-object v5

    .line 179
    .local v5, "username":Ljava/lang/String;
    if-eqz v5, :cond_4

    if-nez v4, :cond_1

    move-object/from16 v9, p2

    goto/16 :goto_0

    .line 184
    :cond_1
    invoke-interface {v1}, Landroid/javax/sip/header/ProxyAuthorizationHeader;->getNonce()Ljava/lang/String;

    move-result-object v6

    .line 185
    .local v6, "nonce":Ljava/lang/String;
    invoke-interface {v1}, Landroid/javax/sip/header/ProxyAuthorizationHeader;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v7

    .line 186
    .local v7, "uri":Landroid/javax/sip/address/URI;
    if-nez v7, :cond_2

    .line 187
    return v3

    .line 191
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v8, ":"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v9, p2

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 192
    .local v3, "A1":Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface/range {p1 .. p1}, Landroid/javax/sip/message/Request;->getMethod()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v7}, Landroid/javax/sip/address/URI;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 193
    .local v10, "A2":Ljava/lang/String;
    iget-object v11, v0, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->messageDigest:Ljava/security/MessageDigest;

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v11

    .line 194
    .local v11, "mdbytes":[B
    invoke-static {v11}, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->toHexString([B)Ljava/lang/String;

    move-result-object v12

    .line 197
    .local v12, "HA1":Ljava/lang/String;
    iget-object v13, v0, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->messageDigest:Ljava/security/MessageDigest;

    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v11

    .line 198
    invoke-static {v11}, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->toHexString([B)Ljava/lang/String;

    move-result-object v13

    .line 200
    .local v13, "HA2":Ljava/lang/String;
    invoke-interface {v1}, Landroid/javax/sip/header/ProxyAuthorizationHeader;->getCNonce()Ljava/lang/String;

    move-result-object v14

    .line 201
    .local v14, "cnonce":Ljava/lang/String;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 202
    .local v15, "KD":Ljava/lang/String;
    if-eqz v14, :cond_3

    .line 203
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 205
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 206
    .end local v15    # "KD":Ljava/lang/String;
    .local v2, "KD":Ljava/lang/String;
    iget-object v8, v0, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->messageDigest:Ljava/security/MessageDigest;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v15

    invoke-virtual {v8, v15}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v8

    .line 207
    .end local v11    # "mdbytes":[B
    .local v8, "mdbytes":[B
    invoke-static {v8}, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->toHexString([B)Ljava/lang/String;

    move-result-object v11

    .line 208
    .local v11, "mdString":Ljava/lang/String;
    invoke-interface {v1}, Landroid/javax/sip/header/ProxyAuthorizationHeader;->getResponse()Ljava/lang/String;

    move-result-object v15

    .line 209
    .local v15, "response":Ljava/lang/String;
    invoke-virtual {v11, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    return v16

    .line 179
    .end local v2    # "KD":Ljava/lang/String;
    .end local v3    # "A1":Ljava/lang/String;
    .end local v6    # "nonce":Ljava/lang/String;
    .end local v7    # "uri":Landroid/javax/sip/address/URI;
    .end local v8    # "mdbytes":[B
    .end local v10    # "A2":Ljava/lang/String;
    .end local v11    # "mdString":Ljava/lang/String;
    .end local v12    # "HA1":Ljava/lang/String;
    .end local v13    # "HA2":Ljava/lang/String;
    .end local v14    # "cnonce":Ljava/lang/String;
    .end local v15    # "response":Ljava/lang/String;
    :cond_4
    move-object/from16 v9, p2

    .line 180
    :goto_0
    return v3
.end method

.method public generateChallenge(Landroid/javax/sip/header/HeaderFactory;Landroid/javax/sip/message/Response;Ljava/lang/String;)V
    .locals 3
    .param p1, "headerFactory"    # Landroid/javax/sip/header/HeaderFactory;
    .param p2, "response"    # Landroid/javax/sip/message/Response;
    .param p3, "realm"    # Ljava/lang/String;

    .line 103
    :try_start_0
    const-string v0, "Digest"

    invoke-interface {p1, v0}, Landroid/javax/sip/header/HeaderFactory;->createProxyAuthenticateHeader(Ljava/lang/String;)Landroid/javax/sip/header/ProxyAuthenticateHeader;

    move-result-object v0

    .line 105
    .local v0, "proxyAuthenticate":Landroid/javax/sip/header/ProxyAuthenticateHeader;
    const-string/jumbo v1, "realm"

    invoke-interface {v0, v1, p3}, Landroid/javax/sip/header/ProxyAuthenticateHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    const-string/jumbo v1, "nonce"

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/clientauthutils/DigestServerAuthenticationHelper;->generateNonce()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/javax/sip/header/ProxyAuthenticateHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    const-string/jumbo v1, "opaque"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/javax/sip/header/ProxyAuthenticateHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    const-string/jumbo v1, "stale"

    const-string v2, "FALSE"

    invoke-interface {v0, v1, v2}, Landroid/javax/sip/header/ProxyAuthenticateHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    const-string/jumbo v1, "algorithm"

    const-string v2, "MD5"

    invoke-interface {v0, v1, v2}, Landroid/javax/sip/header/ProxyAuthenticateHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    invoke-interface {p2, v0}, Landroid/javax/sip/message/Response;->setHeader(Landroid/javax/sip/header/Header;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    .end local v0    # "proxyAuthenticate":Landroid/javax/sip/header/ProxyAuthenticateHeader;
    goto :goto_0

    .line 111
    :catch_0
    move-exception v0

    .line 112
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 115
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_0
    return-void
.end method
