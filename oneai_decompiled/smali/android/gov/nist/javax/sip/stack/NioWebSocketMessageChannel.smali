.class public Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;
.super Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
.source "NioWebSocketMessageChannel.java"


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field client:Z

.field private codec:Landroid/gov/nist/javax/sip/stack/WebSocketCodec;

.field httpClientRequestSent:Ljava/util/concurrent/atomic/AtomicBoolean;

.field httpHostHeader:Ljava/lang/String;

.field httpInput:Ljava/lang/String;

.field httpLocation:Ljava/lang/String;

.field httpMethod:Ljava/lang/String;

.field readingHttp:Z

.field private stack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 56
    const-class v0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method protected constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;Ljava/nio/channels/SocketChannel;)V
    .locals 2
    .param p1, "stack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "nioTcpMessageProcessor"    # Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    .param p3, "socketChannel"    # Ljava/nio/channels/SocketChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 73
    invoke-direct {p0, p2, p3}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;Ljava/nio/channels/SocketChannel;)V

    .line 59
    new-instance v0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;

    const/4 v1, 0x1

    invoke-direct {v0, v1, v1}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;-><init>(ZZ)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->codec:Landroid/gov/nist/javax/sip/stack/WebSocketCodec;

    .line 61
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->readingHttp:Z

    .line 62
    const-string v0, ""

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->httpInput:Ljava/lang/String;

    .line 64
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->httpClientRequestSent:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 75
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->stack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 76
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 77
    invoke-virtual {p3}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->myClientInputStream:Ljava/io/InputStream;

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)V
    .locals 3
    .param p1, "inetAddress"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p4, "nioTcpMessageProcessor"    # Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 187
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;-><init>(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)V

    .line 59
    new-instance v0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;

    const/4 v1, 0x1

    invoke-direct {v0, v1, v1}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;-><init>(ZZ)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->codec:Landroid/gov/nist/javax/sip/stack/WebSocketCodec;

    .line 61
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->readingHttp:Z

    .line 62
    const-string v0, ""

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->httpInput:Ljava/lang/String;

    .line 64
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->httpClientRequestSent:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 189
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->client:Z

    .line 190
    iput-object p3, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->stack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 191
    new-instance v0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;

    invoke-direct {v0, v2, v1}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;-><init>(ZZ)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->codec:Landroid/gov/nist/javax/sip/stack/WebSocketCodec;

    .line 192
    return-void
.end method

.method public static wrapBufferIntoWebSocketFrame([BZ)[B
    .locals 2
    .param p0, "buffer"    # [B
    .param p1, "client"    # Z

    .line 113
    const/4 v0, 0x0

    const/4 v1, 0x1

    :try_start_0
    invoke-static {p0, v0, v1, p1}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->encode([BIZZ)[B

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 114
    :catch_0
    move-exception v0

    .line 116
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 118
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method protected addBytes([B)V
    .locals 7
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 196
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([B)V

    .line 198
    .local v0, "s":Ljava/lang/String;
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->readingHttp:Z

    if-eqz v1, :cond_6

    .line 199
    const/4 v1, 0x0

    .line 200
    .local v1, "remaining":[B
    const/4 v2, 0x0

    .local v2, "q":I
    :goto_0
    array-length v3, p1

    add-int/lit8 v3, v3, -0x3

    const/4 v4, 0x0

    if-ge v2, v3, :cond_1

    .line 201
    aget-byte v3, p1, v2

    const/16 v5, 0xd

    if-ne v3, v5, :cond_0

    add-int/lit8 v3, v2, 0x1

    aget-byte v3, p1, v3

    const/16 v6, 0xa

    if-ne v3, v6, :cond_0

    add-int/lit8 v3, v2, 0x2

    aget-byte v3, p1, v3

    if-ne v3, v5, :cond_0

    add-int/lit8 v3, v2, 0x3

    aget-byte v3, p1, v3

    if-ne v3, v6, :cond_0

    .line 202
    add-int/lit8 v3, v2, 0x4

    invoke-virtual {v0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 203
    array-length v3, p1

    sub-int/2addr v3, v2

    add-int/lit8 v3, v3, -0x4

    new-array v1, v3, [B

    .line 204
    const/4 v3, 0x0

    .local v3, "w":I
    :goto_1
    array-length v4, v1

    if-ge v3, v4, :cond_0

    .line 205
    add-int/lit8 v4, v2, 0x4

    add-int/2addr v4, v3

    aget-byte v4, p1, v4

    aput-byte v4, v1, v3

    .line 204
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 200
    .end local v3    # "w":I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 209
    .end local v2    # "q":I
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->httpInput:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->httpInput:Ljava/lang/String;

    .line 210
    const-string v2, "\r\n"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 211
    :cond_2
    iput-boolean v4, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->readingHttp:Z

    .line 212
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->httpInput:Ljava/lang/String;

    const-string v3, "HTTP"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 213
    new-instance v2, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;-><init>()V

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/stack/WebSocketHttpHandshake;->createHttpResponse(Ljava/lang/String;)[B

    move-result-object v2

    .line 214
    .local v2, "response":[B
    invoke-virtual {p0, v2, v4}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->sendNonWebSocketMessage([BZ)V

    .line 215
    .end local v2    # "response":[B
    goto :goto_2

    .line 216
    :cond_3
    sget-object v2, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "HTTP Response. We are websocket client.\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->httpInput:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 219
    :cond_4
    :goto_2
    if-eqz v1, :cond_5

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->addBytes([B)V

    .line 220
    :cond_5
    return-void

    .line 221
    .end local v1    # "remaining":[B
    :cond_6
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->readingHttp:Z

    if-nez v1, :cond_a

    .line 222
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 223
    .local v1, "bios":Ljava/io/ByteArrayInputStream;
    const/4 v2, 0x0

    .line 225
    .local v2, "decodedMsg":[B
    :cond_7
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->codec:Landroid/gov/nist/javax/sip/stack/WebSocketCodec;

    invoke-virtual {v3, v1}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->decode(Ljava/io/InputStream;)[B

    move-result-object v2

    .line 228
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->codec:Landroid/gov/nist/javax/sip/stack/WebSocketCodec;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->isCloseOpcodeReceived()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 230
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v4, "Websocket close, sending polite close response"

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 231
    const/4 v3, 0x2

    new-array v3, v3, [B

    fill-array-data v3, :array_0

    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 232
    .local v3, "byteBuff":Ljava/nio/ByteBuffer;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v4, v3}, Ljava/nio/channels/SocketChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 233
    return-void

    .line 236
    .end local v3    # "byteBuff":Ljava/nio/ByteBuffer;
    :cond_8
    if-nez v2, :cond_9

    .line 237
    return-void

    .line 239
    :cond_9
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->nioParser:Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    invoke-virtual {v3, v2}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->addBytes([B)V

    .line 240
    sget-object v3, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Nio websocket bytes were added "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    array-length v5, v2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 242
    if-nez v2, :cond_7

    .line 245
    .end local v1    # "bios":Ljava/io/ByteArrayInputStream;
    .end local v2    # "decodedMsg":[B
    :cond_a
    return-void

    :array_0
    .array-data 1
        -0x78t
        0x0t
    .end array-data
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 249
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->transport:Ljava/lang/String;

    return-object v0
.end method

.method public onNewSocket([B)V
    .locals 0
    .param p1, "message"    # [B

    .line 254
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->onNewSocket([B)V

    .line 256
    return-void
.end method

.method public processMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .locals 5
    .param p1, "message"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 267
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->stack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isPatchWebSocketHeaders()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 269
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 270
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "Patching WebSocket headers"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 272
    :cond_0
    instance-of v0, p1, Landroid/javax/sip/message/Request;

    const-string v1, "Contact"

    if-eqz v0, :cond_4

    .line 288
    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/header/ContactHeader;

    .line 289
    .local v0, "contact":Landroid/javax/sip/header/ContactHeader;
    const-string/jumbo v1, "Record-Route"

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v1

    check-cast v1, Landroid/javax/sip/header/RecordRouteHeader;

    .line 290
    .local v1, "rr":Landroid/javax/sip/header/RecordRouteHeader;
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTopmostViaHeader()Landroid/javax/sip/header/ViaHeader;

    move-result-object v2

    .line 292
    .local v2, "via":Landroid/javax/sip/header/ViaHeader;
    if-nez v1, :cond_1

    .line 293
    if-eqz v0, :cond_2

    .line 294
    invoke-interface {v0}, Landroid/javax/sip/header/ContactHeader;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v3

    check-cast v3, Landroid/javax/sip/address/SipURI;

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->rewriteUri(Landroid/javax/sip/address/SipURI;)V

    goto :goto_0

    .line 297
    :cond_1
    invoke-interface {v1}, Landroid/javax/sip/header/RecordRouteHeader;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v3

    check-cast v3, Landroid/javax/sip/address/SipURI;

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->rewriteUri(Landroid/javax/sip/address/SipURI;)V

    .line 300
    :cond_2
    :goto_0
    invoke-interface {v2}, Landroid/javax/sip/header/ViaHeader;->getHost()Ljava/lang/String;

    move-result-object v3

    .line 301
    .local v3, "viaHost":Ljava/lang/String;
    const-string v4, ".invalid"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 302
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->getPeerAddress()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/javax/sip/header/ViaHeader;->setHost(Ljava/lang/String;)V

    .line 303
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->getPeerPort()I

    move-result v4

    invoke-interface {v2, v4}, Landroid/javax/sip/header/ViaHeader;->setPort(I)V

    .line 305
    .end local v0    # "contact":Landroid/javax/sip/header/ContactHeader;
    .end local v1    # "rr":Landroid/javax/sip/header/RecordRouteHeader;
    .end local v2    # "via":Landroid/javax/sip/header/ViaHeader;
    .end local v3    # "viaHost":Ljava/lang/String;
    :cond_3
    goto :goto_1

    .line 306
    :cond_4
    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/header/ContactHeader;

    .line 307
    .restart local v0    # "contact":Landroid/javax/sip/header/ContactHeader;
    if-eqz v0, :cond_5

    .line 308
    invoke-interface {v0}, Landroid/javax/sip/header/ContactHeader;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v1

    check-cast v1, Landroid/javax/sip/address/SipURI;

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->rewriteUri(Landroid/javax/sip/address/SipURI;)V

    .line 312
    .end local v0    # "contact":Landroid/javax/sip/header/ContactHeader;
    :cond_5
    :goto_1
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->processMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 313
    return-void
.end method

.method public rewriteUri(Landroid/javax/sip/address/SipURI;)V
    .locals 3
    .param p1, "uri"    # Landroid/javax/sip/address/SipURI;

    .line 317
    :try_start_0
    invoke-interface {p1}, Landroid/javax/sip/address/SipURI;->getHost()Ljava/lang/String;

    move-result-object v0

    .line 318
    .local v0, "uriHost":Ljava/lang/String;
    const-string v1, ".invalid"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 319
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->getPeerAddress()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Landroid/javax/sip/address/SipURI;->setHost(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 323
    .end local v0    # "uriHost":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 321
    :catch_0
    move-exception v0

    .line 322
    .local v0, "e":Ljava/text/ParseException;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "Cant parse address"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 324
    .end local v0    # "e":Ljava/text/ParseException;
    :goto_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->getPeerPort()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/javax/sip/address/SipURI;->setPort(I)V

    .line 325
    return-void
.end method

.method public sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;I)V
    .locals 6
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .param p2, "receiverAddress"    # Ljava/net/InetAddress;
    .param p3, "receiverPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 155
    instance-of v0, p1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v0, :cond_0

    .line 157
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->client:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->httpClientRequestSent:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 158
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 159
    .local v0, "request":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v1

    check-cast v1, Landroid/javax/sip/address/SipURI;

    .line 160
    .local v1, "requestUri":Landroid/javax/sip/address/SipURI;
    const-string v3, "Host"

    invoke-interface {v1, v3}, Landroid/javax/sip/address/SipURI;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->httpHostHeader:Ljava/lang/String;

    .line 161
    const-string v3, "Location"

    invoke-interface {v1, v3}, Landroid/javax/sip/address/SipURI;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->httpLocation:Ljava/lang/String;

    .line 162
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getMethodParam()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->httpMethod:Ljava/lang/String;

    .line 163
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->httpMethod:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->httpLocation:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " HTTP/1.1\r\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Host: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->httpHostHeader:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\r\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "Upgrade: websocket\r\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Connection: Upgrade\r\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "Sec-WebSocket-Protocol: sip\r\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "Sec-WebSocket-Version: 13\r\n\r\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 171
    .local v3, "http":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    invoke-super {p0, v4, p2, p3, v2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sendTCPMessage([BLjava/net/InetAddress;IZ)V

    .line 173
    const-wide/16 v4, 0x96

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    goto :goto_0

    .line 174
    :catch_0
    move-exception v2

    .line 176
    .local v2, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 181
    .end local v0    # "request":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v1    # "requestUri":Landroid/javax/sip/address/SipURI;
    .end local v2    # "e":Ljava/lang/InterruptedException;
    .end local v3    # "http":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-super {p0, p1, p2, p3}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;I)V

    .line 182
    return-void
.end method

.method public sendMessage([BLjava/net/InetAddress;IZ)V
    .locals 0
    .param p1, "message"    # [B
    .param p2, "receiverAddress"    # Ljava/net/InetAddress;
    .param p3, "receiverPort"    # I
    .param p4, "retry"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 149
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->sendWrapped([BLjava/net/InetAddress;IZ)V

    .line 150
    return-void
.end method

.method protected sendMessage([BZ)V
    .locals 3
    .param p1, "msg"    # [B
    .param p2, "isClient"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 83
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "sendMessage isClient  = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 85
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->lastActivityTimeStamp:J

    .line 87
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    .line 88
    .local v0, "nioHandler":Landroid/gov/nist/javax/sip/stack/NIOHandler;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 89
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->peerPort:I

    invoke-static {v1, v2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->makeKey(Ljava/net/InetAddress;I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->putSocket(Ljava/lang/String;Ljava/nio/channels/SocketChannel;)V

    .line 92
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->peerPort:I

    invoke-virtual {p0, p1, v1, v2, p2}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->sendWrapped([BLjava/net/InetAddress;IZ)V

    .line 93
    return-void
.end method

.method protected sendNonWebSocketMessage([BZ)V
    .locals 3
    .param p1, "msg"    # [B
    .param p2, "isClient"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 97
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "sendMessage isClient  = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 101
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->lastActivityTimeStamp:J

    .line 102
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    .line 103
    .local v0, "nioHandler":Landroid/gov/nist/javax/sip/stack/NIOHandler;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 104
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->peerPort:I

    invoke-static {v1, v2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->makeKey(Ljava/net/InetAddress;I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->putSocket(Ljava/lang/String;Ljava/nio/channels/SocketChannel;)V

    .line 107
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->peerAddress:Ljava/net/InetAddress;

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->peerPort:I

    invoke-super {p0, p1, v1, v2, p2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sendTCPMessage([BLjava/net/InetAddress;IZ)V

    .line 108
    return-void
.end method

.method public sendWrapped([BLjava/net/InetAddress;IZ)V
    .locals 3
    .param p1, "message"    # [B
    .param p2, "receiverAddress"    # Ljava/net/InetAddress;
    .param p3, "receiverPort"    # I
    .param p4, "retry"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 124
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->client:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->readingHttp:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->httpClientRequestSent:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 125
    const-string/jumbo v0, "null null HTTP/1.1\r\nHost: null \r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nSec-WebSocket-Protocol: sip\r\nSec-WebSocket-Version: 13\r\n\r\n"

    .line 133
    .local v0, "http":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-super {p0, v1, p2, p3, v2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sendTCPMessage([BLjava/net/InetAddress;IZ)V

    .line 135
    const-wide/16 v1, 0x96

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    goto :goto_0

    .line 136
    :catch_0
    move-exception v1

    .line 138
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 142
    .end local v0    # "http":Ljava/lang/String;
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :cond_0
    :goto_0
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->client:Z

    invoke-static {p1, v0}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageChannel;->wrapBufferIntoWebSocketFrame([BZ)[B

    move-result-object p1

    .line 143
    invoke-super {p0, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->sendTCPMessage([BLjava/net/InetAddress;IZ)V

    .line 144
    return-void
.end method
