.class public Landroid/gov/nist/javax/sip/stack/WebSocketCodec;
.super Ljava/lang/Object;
.source "WebSocketCodec.java"


# static fields
.field private static final OPCODE_BINARY:B = 0x2t

.field private static final OPCODE_CLOSE:B = 0x8t

.field private static final OPCODE_CONT:B = 0x0t

.field private static final OPCODE_PING:B = 0x9t

.field private static final OPCODE_PONG:B = 0xat

.field private static final OPCODE_TEXT:B = 0x1t

.field private static logger:Landroid/gov/nist/core/StackLogger;

.field private static final trivialMask:[B


# instance fields
.field private final allowExtensions:Z

.field private closeOpcodeReceived:Z

.field private decodeBuffer:[B

.field private fragmentedFramesCount:I

.field private frameFinalFlag:Z

.field private frameOpcode:I

.field private framePayloadLength:J

.field private frameRsv:I

.field private final maskedPayload:Z

.field private maskingKey:[B

.field private payloadStartIndex:I

.field private readIndex:I

.field private totalPacketLength:J

.field private writeIndex:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    const-class v0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->logger:Landroid/gov/nist/core/StackLogger;

    .line 56
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->trivialMask:[B

    return-void

    nop

    :array_0
    .array-data 1
        0x1t
        0x1t
        0x1t
        0x1t
    .end array-data
.end method

.method public constructor <init>(ZZ)V
    .locals 2
    .param p1, "maskedPayload"    # Z
    .param p2, "allowExtensions"    # Z

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->maskingKey:[B

    .line 71
    const/4 v0, -0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->payloadStartIndex:I

    .line 74
    const/16 v0, 0x800

    new-array v0, v0, [B

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->decodeBuffer:[B

    .line 75
    const/4 v0, 0x0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->writeIndex:I

    .line 79
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->totalPacketLength:J

    .line 84
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->maskedPayload:Z

    .line 85
    iput-boolean p2, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->allowExtensions:Z

    .line 86
    return-void
.end method

.method public static applyMask([BII[B)V
    .locals 4
    .param p0, "frame"    # [B
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I
    .param p3, "mask"    # [B

    .line 295
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sub-int v1, p2, p1

    if-ge v0, v1, :cond_0

    .line 296
    add-int v1, p1, v0

    add-int v2, p1, v0

    aget-byte v2, p0, v2

    rem-int/lit8 v3, v0, 0x4

    aget-byte v3, p3, v3

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, p0, v1

    .line 295
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 298
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method protected static encode([BIZZ)[B
    .locals 1
    .param p0, "msg"    # [B
    .param p1, "rsv"    # I
    .param p2, "fin"    # Z
    .param p3, "maskPayload"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 243
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, p3, v0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->encode([BIZZB)[B

    move-result-object v0

    return-object v0
.end method

.method protected static encode([BIZZB)[B
    .locals 8
    .param p0, "msg"    # [B
    .param p1, "rsv"    # I
    .param p2, "fin"    # Z
    .param p3, "maskPayload"    # Z
    .param p4, "opcode"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 248
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 250
    .local v0, "frame":Ljava/io/ByteArrayOutputStream;
    array-length v1, p0

    int-to-long v1, v1

    .line 252
    .local v1, "length":J
    sget-object v3, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v4, 0x20

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 253
    sget-object v3, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Encoding WebSocket Frame opCode="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " length="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 256
    :cond_0
    const/4 v3, 0x0

    .line 257
    .local v3, "b0":I
    if-eqz p2, :cond_1

    .line 258
    or-int/lit16 v3, v3, 0x80

    .line 260
    :cond_1
    rem-int/lit8 v4, p1, 0x8

    shl-int/lit8 v4, v4, 0x4

    or-int/2addr v3, v4

    .line 261
    rem-int/lit16 v4, p4, 0x80

    or-int/2addr v3, v4

    .line 264
    const-wide/16 v4, 0x7d

    cmp-long v4, v1, v4

    if-gtz v4, :cond_3

    .line 265
    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 266
    long-to-int v4, v1

    int-to-byte v4, v4

    if-eqz p3, :cond_2

    or-int/lit16 v4, v4, 0x80

    :cond_2
    int-to-byte v4, v4

    .line 267
    .local v4, "b":B
    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 268
    .end local v4    # "b":B
    goto :goto_3

    :cond_3
    const-wide/32 v4, 0xffff

    cmp-long v4, v1, v4

    const/16 v5, 0x8

    if-gtz v4, :cond_5

    .line 269
    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 270
    if-eqz p3, :cond_4

    const/16 v4, 0xfe

    goto :goto_0

    :cond_4
    const/16 v4, 0x7e

    :goto_0
    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 271
    ushr-long v4, v1, v5

    long-to-int v4, v4

    int-to-byte v4, v4

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 272
    long-to-int v4, v1

    int-to-byte v4, v4

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_3

    .line 274
    :cond_5
    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 275
    if-eqz p3, :cond_6

    const/16 v4, 0xff

    goto :goto_1

    :cond_6
    const/16 v4, 0x7f

    :goto_1
    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 276
    const/4 v4, 0x0

    .local v4, "q":I
    :goto_2
    if-ge v4, v5, :cond_7

    .line 277
    rsub-int/lit8 v6, v4, 0x7

    mul-int/2addr v6, v5

    ushr-long v6, v1, v6

    long-to-int v6, v6

    int-to-byte v6, v6

    .line 278
    .local v6, "b":B
    invoke-virtual {v0, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 276
    .end local v6    # "b":B
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 281
    .end local v4    # "q":I
    :cond_7
    :goto_3
    if-eqz p3, :cond_8

    .line 282
    sget-object v4, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->trivialMask:[B

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 283
    array-length v4, p0

    sget-object v5, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->trivialMask:[B

    const/4 v6, 0x0

    invoke-static {p0, v6, v4, v5}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->applyMask([BII[B)V

    .line 285
    :cond_8
    invoke-virtual {v0, p0}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 286
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    return-object v4
.end method

.method private protocolChecks()V
    .locals 3

    .line 305
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameOpcode:I

    const/4 v1, 0x7

    const/16 v2, 0x9

    if-le v0, v1, :cond_1

    .line 308
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameFinalFlag:Z

    if-nez v0, :cond_0

    .line 309
    const-string/jumbo v0, "fragmented control frame"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->protocolViolation(Ljava/lang/String;)V

    .line 313
    :cond_0
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameOpcode:I

    const/16 v1, 0x8

    if-eq v0, v1, :cond_4

    iget v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameOpcode:I

    if-eq v0, v2, :cond_4

    iget v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameOpcode:I

    const/16 v1, 0xa

    if-eq v0, v1, :cond_4

    .line 314
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "control frame using reserved opcode "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameOpcode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->protocolViolation(Ljava/lang/String;)V

    goto :goto_0

    .line 318
    :cond_1
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameOpcode:I

    if-eqz v0, :cond_2

    iget v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameOpcode:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    iget v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameOpcode:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    .line 319
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "data frame using reserved opcode "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameOpcode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->protocolViolation(Ljava/lang/String;)V

    .line 323
    :cond_2
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->fragmentedFramesCount:I

    if-nez v0, :cond_3

    iget v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameOpcode:I

    if-nez v0, :cond_3

    .line 324
    const-string/jumbo v0, "received continuation data frame outside fragmented message"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->protocolViolation(Ljava/lang/String;)V

    .line 328
    :cond_3
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->fragmentedFramesCount:I

    if-eqz v0, :cond_4

    iget v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameOpcode:I

    if-eqz v0, :cond_4

    iget v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameOpcode:I

    if-eq v0, v2, :cond_4

    .line 329
    const-string/jumbo v0, "received non-continuation data frame while inside fragmented message"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->protocolViolation(Ljava/lang/String;)V

    .line 332
    :cond_4
    :goto_0
    return-void
.end method

.method private protocolViolation(Ljava/lang/String;)V
    .locals 1
    .param p1, "reason"    # Ljava/lang/String;

    .line 301
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readNextByte()B
    .locals 3

    .line 88
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->readIndex:I

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->writeIndex:I

    if-ge v0, v1, :cond_0

    .line 91
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->decodeBuffer:[B

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->readIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->readIndex:I

    aget-byte v0, v0, v1

    return v0

    .line 89
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method private unmask([BII)V
    .locals 1
    .param p1, "frame"    # [B
    .param p2, "startIndex"    # I
    .param p3, "endIndex"    # I

    .line 291
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->maskingKey:[B

    invoke-static {p1, p2, p3, v0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->applyMask([BII[B)V

    .line 292
    return-void
.end method


# virtual methods
.method public decode(Ljava/io/InputStream;)[B
    .locals 16
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 98
    move-object/from16 v1, p0

    :cond_0
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->decodeBuffer:[B

    array-length v0, v0

    iget v2, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->writeIndex:I

    sub-int/2addr v0, v2

    .line 99
    .local v0, "bytesLeft":I
    invoke-virtual/range {p1 .. p1}, Ljava/io/InputStream;->available()I

    move-result v2

    .line 100
    .local v2, "availToRead":I
    add-int/lit8 v3, v0, -0x1

    const/4 v4, 0x0

    const/16 v5, 0x20

    if-le v2, v3, :cond_2

    .line 101
    iget-object v3, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->decodeBuffer:[B

    array-length v3, v3

    mul-int/lit8 v3, v3, 0x2

    mul-int/lit8 v6, v2, 0x4

    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 102
    .local v3, "newSize":I
    sget-object v6, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 103
    sget-object v6, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Increasing buffer size from "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->decodeBuffer:[B

    array-length v8, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " avail "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " newSize "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 106
    :cond_1
    new-array v6, v3, [B

    .line 107
    .local v6, "resizeBuffer":[B
    iget-object v7, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->decodeBuffer:[B

    iget v8, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->writeIndex:I

    invoke-static {v7, v4, v6, v4, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 108
    iput-object v6, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->decodeBuffer:[B

    .line 111
    .end local v3    # "newSize":I
    .end local v6    # "resizeBuffer":[B
    :cond_2
    iget-object v3, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->decodeBuffer:[B

    iget v6, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->writeIndex:I

    move-object/from16 v7, p1

    invoke-virtual {v7, v3, v6, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    .line 112
    .local v3, "bytesRead":I
    if-gez v3, :cond_3

    const/4 v3, 0x0

    .line 115
    :cond_3
    iget v6, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->writeIndex:I

    add-int/2addr v6, v3

    iput v6, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->writeIndex:I

    .line 116
    .end local v0    # "bytesLeft":I
    .end local v2    # "availToRead":I
    .end local v3    # "bytesRead":I
    invoke-virtual/range {p1 .. p1}, Ljava/io/InputStream;->available()I

    move-result v0

    if-gtz v0, :cond_0

    .line 119
    iput v4, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->readIndex:I

    .line 122
    iget v0, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->writeIndex:I

    const-string v2, "Abort decode. Write index is at "

    const/4 v3, 0x4

    const/4 v6, 0x0

    if-ge v0, v3, :cond_5

    .line 123
    sget-object v0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 124
    sget-object v0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->writeIndex:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 126
    :cond_4
    return-object v6

    .line 129
    :cond_5
    invoke-direct/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->readNextByte()B

    move-result v0

    .line 130
    .local v0, "b":B
    and-int/lit16 v8, v0, 0x80

    const/4 v9, 0x1

    if-eqz v8, :cond_6

    move v8, v9

    goto :goto_0

    :cond_6
    move v8, v4

    :goto_0
    iput-boolean v8, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameFinalFlag:Z

    .line 131
    and-int/lit8 v8, v0, 0x70

    shr-int/2addr v8, v3

    iput v8, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameRsv:I

    .line 132
    and-int/lit8 v8, v0, 0xf

    iput v8, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameOpcode:I

    .line 134
    sget-object v8, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v8, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 135
    sget-object v8, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Decoding WebSocket Frame opCode="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameOpcode:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 139
    :cond_7
    iget v8, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameOpcode:I

    const/16 v10, 0x8

    if-ne v8, v10, :cond_8

    .line 141
    iput-boolean v9, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->closeOpcodeReceived:Z

    .line 146
    :cond_8
    invoke-direct/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->readNextByte()B

    move-result v8

    .line 147
    .end local v0    # "b":B
    .local v8, "b":B
    and-int/lit16 v0, v8, 0x80

    if-eqz v0, :cond_9

    goto :goto_1

    :cond_9
    move v9, v4

    .line 148
    .local v9, "frameMasked":Z
    :goto_1
    and-int/lit8 v11, v8, 0x7f

    .line 150
    .local v11, "framePayloadLen1":I
    iget v0, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameRsv:I

    if-eqz v0, :cond_a

    iget-boolean v0, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->allowExtensions:Z

    if-nez v0, :cond_a

    .line 151
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "RSV != 0 and no extension negotiated, RSV:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->frameRsv:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->protocolViolation(Ljava/lang/String;)V

    .line 152
    return-object v6

    .line 155
    :cond_a
    iget-boolean v0, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->maskedPayload:Z

    if-eqz v0, :cond_b

    if-nez v9, :cond_b

    .line 156
    const-string/jumbo v0, "unmasked client to server frame"

    invoke-direct {v1, v0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->protocolViolation(Ljava/lang/String;)V

    .line 157
    return-object v6

    .line 160
    :cond_b
    invoke-direct/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->protocolChecks()V

    .line 164
    const/16 v0, 0x7e

    if-ne v11, v0, :cond_c

    .line 165
    :try_start_0
    invoke-direct/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->readNextByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    .line 166
    .local v0, "byte1":I
    invoke-direct/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->readNextByte()B

    move-result v10

    and-int/lit16 v10, v10, 0xff

    .line 167
    .local v10, "byte2":I
    shl-int/lit8 v12, v0, 0x8

    or-int/2addr v12, v10

    .line 168
    .local v12, "value":I
    int-to-long v13, v12

    iput-wide v13, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->framePayloadLength:J

    .line 169
    .end local v0    # "byte1":I
    .end local v10    # "byte2":I
    .end local v12    # "value":I
    goto :goto_3

    .line 202
    :catch_0
    move-exception v0

    goto/16 :goto_6

    .line 169
    :cond_c
    const/16 v0, 0x7f

    if-ne v11, v0, :cond_f

    .line 170
    const-wide/16 v12, 0x0

    .line 171
    .local v12, "value":J
    const/4 v0, 0x0

    .local v0, "q":I
    :goto_2
    if-ge v0, v10, :cond_d

    .line 172
    invoke-direct/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->readNextByte()B

    move-result v14

    .line 173
    .local v14, "nextByte":B
    and-int/lit16 v15, v14, 0xff

    int-to-long v3, v15

    .line 174
    .local v3, "valuePart":J
    rsub-int/lit8 v15, v0, 0x7

    mul-int/2addr v15, v10

    shl-long/2addr v3, v15

    .line 175
    or-long/2addr v12, v3

    .line 171
    .end local v3    # "valuePart":J
    .end local v14    # "nextByte":B
    add-int/lit8 v0, v0, 0x1

    const/4 v3, 0x4

    const/4 v4, 0x0

    goto :goto_2

    .line 177
    .end local v0    # "q":I
    :cond_d
    iput-wide v12, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->framePayloadLength:J

    .line 179
    iget-wide v3, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->framePayloadLength:J

    const-wide/32 v14, 0x10000

    cmp-long v0, v3, v14

    if-gez v0, :cond_e

    .line 180
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "invalid data frame length (not using minimal length encoding): "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->framePayloadLength:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->protocolViolation(Ljava/lang/String;)V

    .line 181
    return-object v6

    .line 184
    .end local v12    # "value":J
    :cond_e
    goto :goto_3

    .line 185
    :cond_f
    int-to-long v3, v11

    iput-wide v3, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->framePayloadLength:J

    .line 188
    :goto_3
    iget-wide v3, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->framePayloadLength:J

    const-wide/16 v12, 0x0

    cmp-long v0, v3, v12

    if-gez v0, :cond_10

    .line 189
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Negative payload size: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v3, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->framePayloadLength:J

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->protocolViolation(Ljava/lang/String;)V

    .line 192
    :cond_10
    sget-object v0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 193
    sget-object v0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Decoding WebSocket Frame length="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v12, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->framePayloadLength:J

    invoke-virtual {v3, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 197
    :cond_11
    if-eqz v9, :cond_12

    .line 198
    const/4 v0, 0x0

    .restart local v0    # "q":I
    :goto_4
    const/4 v3, 0x4

    if-ge v0, v3, :cond_12

    .line 199
    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->maskingKey:[B

    invoke-direct/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->readNextByte()B

    move-result v10

    aput-byte v10, v4, v0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 205
    .end local v0    # "q":I
    :cond_12
    nop

    .line 208
    iget v0, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->readIndex:I

    iput v0, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->payloadStartIndex:I

    .line 209
    iget v0, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->readIndex:I

    int-to-long v3, v0

    iget-wide v12, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->framePayloadLength:J

    add-long/2addr v3, v12

    iput-wide v3, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->totalPacketLength:J

    .line 212
    iget v0, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->writeIndex:I

    int-to-long v3, v0

    iget-wide v12, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->totalPacketLength:J

    cmp-long v0, v3, v12

    if-gez v0, :cond_14

    .line 213
    sget-object v0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 214
    sget-object v0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->writeIndex:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " and totalPacketLength is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->totalPacketLength:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 216
    :cond_13
    return-object v6

    .line 220
    :cond_14
    if-eqz v9, :cond_15

    .line 221
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->decodeBuffer:[B

    iget v2, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->payloadStartIndex:I

    iget v3, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->payloadStartIndex:I

    int-to-long v3, v3

    iget-wide v12, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->framePayloadLength:J

    add-long/2addr v3, v12

    long-to-int v3, v3

    invoke-direct {v1, v0, v2, v3}, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->unmask([BII)V

    .line 225
    :cond_15
    iget-wide v2, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->framePayloadLength:J

    long-to-int v0, v2

    new-array v0, v0, [B

    .line 226
    .local v0, "plainTextBytes":[B
    iget-object v2, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->decodeBuffer:[B

    iget v3, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->payloadStartIndex:I

    iget-wide v12, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->framePayloadLength:J

    long-to-int v4, v12

    const/4 v6, 0x0

    invoke-static {v2, v3, v0, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 229
    const/4 v2, 0x1

    .local v2, "q":I
    :goto_5
    int-to-long v3, v2

    iget v6, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->writeIndex:I

    int-to-long v12, v6

    iget-wide v14, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->totalPacketLength:J

    sub-long/2addr v12, v14

    cmp-long v3, v3, v12

    if-gez v3, :cond_16

    .line 230
    iget-object v3, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->decodeBuffer:[B

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->decodeBuffer:[B

    iget-wide v12, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->totalPacketLength:J

    long-to-int v6, v12

    add-int/2addr v6, v2

    aget-byte v4, v4, v6

    aput-byte v4, v3, v2

    .line 229
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 232
    .end local v2    # "q":I
    :cond_16
    iget v2, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->writeIndex:I

    int-to-long v2, v2

    iget-wide v12, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->totalPacketLength:J

    sub-long/2addr v2, v12

    long-to-int v2, v2

    iput v2, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->writeIndex:I

    .line 234
    sget-object v2, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 235
    sget-object v2, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "writeIndex = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->writeIndex:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, v1, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->totalPacketLength:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 239
    :cond_17
    return-object v0

    .line 204
    .local v0, "e":Ljava/lang/IllegalStateException;
    :goto_6
    return-object v6
.end method

.method public isCloseOpcodeReceived()Z
    .locals 1

    .line 335
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/WebSocketCodec;->closeOpcodeReceived:Z

    return v0
.end method
