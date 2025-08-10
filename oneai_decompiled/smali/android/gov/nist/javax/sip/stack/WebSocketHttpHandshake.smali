.class public Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;
.super Ljava/lang/Object;
.source "WebSocketHttpHandshake.java"


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private headers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    const-class v0, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->headers:Ljava/util/HashMap;

    return-void
.end method

.method public static computeRev13Response(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 150
    const/4 v0, 0x0

    .line 152
    .local v0, "md":Ljava/security/MessageDigest;
    :try_start_0
    const-string/jumbo v1, "SHA1"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    move-object v0, v1

    .line 153
    invoke-virtual {v0}, Ljava/security/MessageDigest;->reset()V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 157
    goto :goto_0

    .line 154
    :catch_0
    move-exception v1

    .line 156
    .local v1, "ex":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    .line 158
    .end local v1    # "ex":Ljava/security/NoSuchAlgorithmException;
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    .line 159
    .local v1, "digest":[B
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 160
    .local v2, "baos":Ljava/io/ByteArrayOutputStream;
    invoke-static {v1}, Landroid/gov/nist/javax/sip/stack/Base64;->encodeBytes([B)Ljava/lang/String;

    move-result-object v3

    .line 161
    .local v3, "encodeBase64String":Ljava/lang/String;
    return-object v3
.end method

.method private readLine(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 7
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 169
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/16 v1, 0xd

    .line 170
    .local v1, "cr":I
    const/16 v2, 0xa

    .line 172
    .local v2, "nl":I
    const/4 v3, 0x0

    .line 175
    .local v3, "gotcr":Z
    :goto_0
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v4

    .line 177
    .local v4, "input":I
    const/4 v5, -0x1

    const/4 v6, 0x0

    if-ne v4, v5, :cond_0

    .line 178
    return-object v6

    .line 181
    :cond_0
    if-ne v4, v1, :cond_1

    .line 182
    const/4 v3, 0x1

    .line 183
    goto :goto_0

    .line 185
    :cond_1
    if-ne v4, v2, :cond_2

    if-eqz v3, :cond_2

    .line 186
    nop

    .line 194
    .end local v4    # "input":I
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 187
    .restart local v4    # "input":I
    :cond_2
    if-ne v4, v2, :cond_3

    .line 190
    return-object v6

    .line 192
    :cond_3
    int-to-char v5, v4

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 193
    .end local v4    # "input":I
    goto :goto_0
.end method


# virtual methods
.method public createHttpResponse(Ljava/lang/String;)[B
    .locals 12
    .param p1, "request"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 53
    sget-object v0, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 54
    sget-object v0, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Request="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 56
    :cond_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 58
    .local v0, "is":Ljava/io/InputStream;
    const/4 v2, 0x0

    .line 60
    .local v2, "isSecure":Z
    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v3

    .line 62
    .local v3, "line":Ljava/lang/String;
    if-nez v3, :cond_1

    .line 63
    const/4 v1, 0x0

    return-object v1

    .line 66
    :cond_1
    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 67
    .local v4, "parts":[Ljava/lang/String;
    array-length v5, v4

    const/4 v6, 0x3

    const/4 v7, 0x1

    const-string/jumbo v8, "ctx"

    if-lt v5, v6, :cond_2

    .line 68
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->headers:Ljava/util/HashMap;

    aget-object v6, v4, v7

    invoke-virtual {v5, v8, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    :cond_2
    :goto_0
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_7

    .line 71
    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v3

    .line 73
    if-nez v3, :cond_3

    .line 74
    goto :goto_0

    .line 77
    :cond_3
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 78
    goto :goto_0

    .line 81
    :cond_4
    const-string v5, ":"

    const/4 v6, 0x2

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v4

    .line 82
    array-length v5, v4

    if-eq v5, v6, :cond_5

    .line 83
    goto :goto_0

    .line 85
    :cond_5
    const/4 v5, 0x0

    aget-object v6, v4, v5

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v9, "sec-websocket-key"

    invoke-virtual {v6, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 86
    const/4 v2, 0x1

    .line 88
    :cond_6
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->headers:Ljava/util/HashMap;

    aget-object v5, v4, v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    aget-object v9, v4, v7

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v5, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 90
    :cond_7
    if-eqz v2, :cond_8

    .line 91
    const/16 v5, 0x8

    new-array v5, v5, [B

    .line 92
    .local v5, "key3":[B
    invoke-virtual {v0, v5}, Ljava/io/InputStream;->read([B)I

    .line 96
    .end local v5    # "key3":[B
    :cond_8
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 97
    .local v5, "sb":Ljava/lang/StringBuilder;
    const-string v6, "\r\n"

    .line 98
    .local v6, "lineSeparator":Ljava/lang/String;
    const-string v7, "HTTP/1.1 101 Web Socket Protocol Handshake"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, "\r\n"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    const-string/jumbo v7, "Upgrade: WebSocket"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    const-string v7, "Connection: Upgrade"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    const-string/jumbo v7, "Sec-"

    if-eqz v2, :cond_9

    .line 102
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    :cond_9
    const-string/jumbo v9, "WebSocket-Origin: "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->headers:Ljava/util/HashMap;

    const-string v11, "Origin"

    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    if-eqz v2, :cond_a

    .line 109
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    :cond_a
    const-string/jumbo v9, "WebSocket-Location: ws://"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->headers:Ljava/util/HashMap;

    const-string v11, "Host"

    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->headers:Ljava/util/HashMap;

    invoke-virtual {v10, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    const-string/jumbo v8, "Sec-WebSocket-Accept: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->headers:Ljava/util/HashMap;

    const-string/jumbo v10, "Sec-WebSocket-Key"

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-static {v9}, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->computeRev13Response(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    iget-object v8, p0, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->headers:Ljava/util/HashMap;

    const-string/jumbo v9, "Protocol"

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_c

    .line 127
    if-eqz v2, :cond_b

    .line 128
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    :cond_b
    const-string/jumbo v7, "Protocol: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->headers:Ljava/util/HashMap;

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    :cond_c
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->headers:Ljava/util/HashMap;

    const-string/jumbo v8, "Sec-WebSocket-Protocol"

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_d

    .line 134
    const-string/jumbo v7, "Sec-WebSocket-Protocol: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v9, p0, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->headers:Ljava/util/HashMap;

    invoke-virtual {v9, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    :cond_d
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 140
    .local v7, "response":Ljava/lang/String;
    sget-object v8, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v8, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 141
    sget-object v1, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Response="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v1, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 143
    :cond_e
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .line 145
    .local v1, "output":[B
    return-object v1
.end method
