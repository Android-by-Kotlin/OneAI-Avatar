.class public Landroid/gov/nist/javax/sip/parser/NioPipelineParser;
.super Ljava/lang/Object;
.source "NioPipelineParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;,
        Landroid/gov/nist/javax/sip/parser/NioPipelineParser$UnparsedMessage;
    }
.end annotation


# static fields
.field private static final CRLF:Ljava/lang/String; = "\r\n"

.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field callId:Ljava/lang/String;

.field contentLength:I

.field contentReadSoFar:I

.field currentStreamEnded:Z

.field isRunning:Z

.field private maxMessageSize:I

.field message:Ljava/lang/StringBuilder;

.field messageBody:[B

.field partialLine:Ljava/lang/String;

.field partialLineRead:Z

.field readingHeaderLines:Z

.field readingMessageBodyContents:Z

.field protected sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

.field private sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

.field private sizeCounter:I

.field private smp:Landroid/gov/nist/javax/sip/parser/MessageParser;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 60
    const-class v0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method protected constructor <init>()V
    .locals 3

    .line 320
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->smp:Landroid/gov/nist/javax/sip/parser/MessageParser;

    .line 74
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->isRunning:Z

    .line 75
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->currentStreamEnded:Z

    .line 76
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->readingMessageBodyContents:Z

    .line 77
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->readingHeaderLines:Z

    .line 78
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->partialLineRead:Z

    .line 79
    const-string v2, ""

    iput-object v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->partialLine:Ljava/lang/String;

    .line 166
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->message:Ljava/lang/StringBuilder;

    .line 167
    iput-object v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->messageBody:[B

    .line 168
    iput v1, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->contentLength:I

    .line 169
    iput v1, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->contentReadSoFar:I

    .line 321
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/parser/SIPMessageListener;I)V
    .locals 1
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "mhandler"    # Landroid/gov/nist/javax/sip/parser/SIPMessageListener;
    .param p3, "maxMsgSize"    # I

    .line 358
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/parser/SIPMessageListener;ZI)V

    .line 359
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/parser/SIPMessageListener;ZI)V
    .locals 1
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "sipMessageListener"    # Landroid/gov/nist/javax/sip/parser/SIPMessageListener;
    .param p3, "debug"    # Z
    .param p4, "maxMessageSize"    # I

    .line 337
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;-><init>()V

    .line 338
    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 339
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageParserFactory()Landroid/gov/nist/javax/sip/parser/MessageParserFactory;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/gov/nist/javax/sip/parser/MessageParserFactory;->createMessageParser(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)Landroid/gov/nist/javax/sip/parser/MessageParser;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->smp:Landroid/gov/nist/javax/sip/parser/MessageParser;

    .line 340
    iput-object p2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    .line 341
    iput p4, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->maxMessageSize:I

    .line 342
    iget v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->maxMessageSize:I

    iput v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sizeCounter:I

    .line 344
    return-void
.end method

.method static synthetic access$000()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 58
    sget-object v0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method

.method static synthetic access$100(Landroid/gov/nist/javax/sip/parser/NioPipelineParser;)Landroid/gov/nist/javax/sip/parser/MessageParser;
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    .line 58
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->smp:Landroid/gov/nist/javax/sip/parser/MessageParser;

    return-object v0
.end method

.method static synthetic access$200(Landroid/gov/nist/javax/sip/parser/NioPipelineParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/parser/NioPipelineParser;

    .line 58
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    return-object v0
.end method

.method private checkLimits()V
    .locals 3

    .line 388
    iget v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->maxMessageSize:I

    if-lez v0, :cond_1

    iget v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sizeCounter:I

    if-ltz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Max Message Size Exceeded "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->maxMessageSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 389
    :cond_1
    :goto_0
    return-void
.end method

.method private readChunk(Ljava/io/InputStream;[BII)I
    .locals 2
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "where"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 375
    invoke-virtual {p1, p2, p3, p4}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 376
    .local v0, "read":I
    iget v1, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sizeCounter:I

    sub-int/2addr v1, v0

    iput v1, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sizeCounter:I

    .line 377
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->checkLimits()V

    .line 378
    return v0
.end method

.method private readLine(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 12
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 395
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->partialLineRead:Z

    .line 396
    const/4 v1, 0x0

    .line 397
    .local v1, "counter":I
    const/16 v2, 0x400

    .line 398
    .local v2, "increment":I
    move v3, v2

    .line 399
    .local v3, "bufferSize":I
    new-array v4, v3, [B

    .line 401
    .local v4, "lineBuffer":[B
    const/4 v5, 0x2

    new-array v5, v5, [B

    .line 402
    .local v5, "crlfBuffer":[B
    const/4 v6, 0x0

    .line 405
    .local v6, "crlfCounter":I
    :goto_0
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->readSingleByte(Ljava/io/InputStream;)I

    move-result v7

    .line 406
    .local v7, "i":I
    const/4 v8, -0x1

    const/4 v9, 0x1

    if-ne v7, v8, :cond_0

    .line 407
    iput-boolean v9, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->partialLineRead:Z

    .line 408
    iput-boolean v9, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->currentStreamEnded:Z

    .line 409
    goto :goto_2

    .line 411
    :cond_0
    and-int/lit16 v8, v7, 0xff

    int-to-char v8, v8

    .line 413
    .local v8, "ch":C
    const/16 v10, 0xd

    if-eq v8, v10, :cond_1

    .line 414
    add-int/lit8 v10, v1, 0x1

    .end local v1    # "counter":I
    .local v10, "counter":I
    and-int/lit16 v11, v7, 0xff

    int-to-byte v11, v11

    aput-byte v11, v4, v1

    move v1, v10

    goto :goto_1

    .line 415
    .end local v10    # "counter":I
    .restart local v1    # "counter":I
    :cond_1
    if-nez v1, :cond_2

    .line 416
    add-int/lit8 v11, v6, 0x1

    .end local v6    # "crlfCounter":I
    .local v11, "crlfCounter":I
    aput-byte v10, v5, v6

    move v6, v11

    .line 418
    .end local v11    # "crlfCounter":I
    .restart local v6    # "crlfCounter":I
    :cond_2
    :goto_1
    const/16 v10, 0xa

    if-ne v8, v10, :cond_6

    .line 419
    if-ne v1, v9, :cond_3

    if-lez v6, :cond_3

    .line 420
    add-int/lit8 v11, v6, 0x1

    .end local v6    # "crlfCounter":I
    .restart local v11    # "crlfCounter":I
    aput-byte v10, v5, v6

    move v6, v11

    .line 433
    .end local v7    # "i":I
    .end local v8    # "ch":C
    .end local v11    # "crlfCounter":I
    .restart local v6    # "crlfCounter":I
    :cond_3
    :goto_2
    const-string/jumbo v7, "UTF-8"

    if-ne v1, v9, :cond_4

    if-lez v6, :cond_4

    .line 434
    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, v5, v0, v6, v7}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    return-object v8

    .line 436
    :cond_4
    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, v4, v0, v1, v7}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    move-object v0, v8

    .line 439
    .local v0, "lineRead":Ljava/lang/String;
    if-ne v6, v9, :cond_5

    .line 440
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\r"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 442
    :cond_5
    return-object v0

    .line 425
    .end local v0    # "lineRead":Ljava/lang/String;
    .restart local v7    # "i":I
    .restart local v8    # "ch":C
    :cond_6
    if-ne v1, v3, :cond_7

    .line 426
    add-int v9, v3, v2

    new-array v9, v9, [B

    .line 427
    .local v9, "tempBuffer":[B
    invoke-static {v4, v0, v9, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 428
    add-int/2addr v3, v2

    .line 429
    move-object v4, v9

    .line 432
    .end local v7    # "i":I
    .end local v8    # "ch":C
    .end local v9    # "tempBuffer":[B
    :cond_7
    goto :goto_0
.end method

.method private readMessageBody(Ljava/io/InputStream;)V
    .locals 10
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 255
    const-string/jumbo v0, "UTF-8"

    const/4 v1, 0x0

    .line 256
    .local v1, "bytesRead":I
    iget v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->contentLength:I

    const/4 v3, 0x1

    if-lez v2, :cond_0

    .line 257
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->messageBody:[B

    iget v4, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->contentReadSoFar:I

    iget v5, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->contentLength:I

    iget v6, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->contentReadSoFar:I

    sub-int/2addr v5, v6

    invoke-direct {p0, p1, v2, v4, v5}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->readChunk(Ljava/io/InputStream;[BII)I

    move-result v1

    .line 258
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 259
    iput-boolean v3, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->currentStreamEnded:Z

    .line 260
    const/4 v1, 0x0

    .line 263
    :cond_0
    iget v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->contentReadSoFar:I

    add-int/2addr v2, v1

    iput v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->contentReadSoFar:I

    .line 264
    iget v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->contentReadSoFar:I

    iget v4, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->contentLength:I

    if-ne v2, v4, :cond_3

    .line 265
    iget v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->maxMessageSize:I

    iput v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sizeCounter:I

    .line 266
    iput-boolean v3, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->readingHeaderLines:Z

    .line 267
    const/4 v2, 0x0

    iput-boolean v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->readingMessageBodyContents:Z

    .line 268
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->message:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 269
    .local v4, "msgLines":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v5, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->message:Ljava/lang/StringBuilder;

    .line 270
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->messageBody:[B

    .line 272
    .local v5, "msgBodyBytes":[B
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSelfRoutingThreadpoolExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 273
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->callId:Ljava/lang/String;

    .line 274
    .local v0, "callId":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v2, v3, :cond_1

    .line 280
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSelfRoutingThreadpoolExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    new-instance v3, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;

    new-instance v6, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$UnparsedMessage;

    invoke-direct {v6, v4, v5}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$UnparsedMessage;-><init>(Ljava/lang/String;[B)V

    invoke-direct {v3, p0, v6, v0}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser$Dispatch;-><init>(Landroid/gov/nist/javax/sip/parser/NioPipelineParser;Landroid/gov/nist/javax/sip/parser/NioPipelineParser$UnparsedMessage;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 281
    .end local v0    # "callId":Ljava/lang/String;
    goto :goto_1

    .line 277
    .restart local v0    # "callId":Ljava/lang/String;
    :cond_1
    new-instance v2, Ljava/io/IOException;

    const-string/jumbo v3, "received message with no Call-ID"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 282
    .end local v0    # "callId":Ljava/lang/String;
    :cond_2
    const/4 v3, 0x0

    .line 285
    .local v3, "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :try_start_0
    invoke-virtual {v4, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 286
    .local v6, "msgBytes":[B
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->smp:Landroid/gov/nist/javax/sip/parser/MessageParser;

    const/4 v8, 0x0

    invoke-interface {v7, v6, v2, v2, v8}, Landroid/gov/nist/javax/sip/parser/MessageParser;->parseSIPMessage([BZZLandroid/gov/nist/javax/sip/parser/ParseExceptionListener;)Landroid/gov/nist/javax/sip/message/SIPMessage;

    move-result-object v7

    move-object v3, v7

    .line 287
    invoke-virtual {v3, v5}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setMessageContent([B)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 291
    .end local v6    # "msgBytes":[B
    goto :goto_0

    .line 288
    :catch_0
    move-exception v6

    .line 289
    .local v6, "e":Ljava/text/ParseException;
    sget-object v7, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Parsing issue !  "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    new-instance v9, Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {v9, v0}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, " "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v6}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 293
    .end local v6    # "e":Ljava/text/ParseException;
    :goto_0
    iput v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->contentLength:I

    .line 294
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->processSIPMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 298
    .end local v3    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    .end local v4    # "msgLines":Ljava/lang/String;
    .end local v5    # "msgBodyBytes":[B
    :cond_3
    :goto_1
    return-void
.end method

.method private readMessageSipHeaderLines(Ljava/io/InputStream;Z)Z
    .locals 8
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "isPreviousLineCRLF"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 192
    const/4 v0, 0x0

    .line 193
    .local v0, "crlfReceived":Z
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    .line 194
    .local v1, "line":Ljava/lang/String;
    iget-boolean v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->partialLineRead:Z

    if-eqz v2, :cond_0

    .line 195
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->partialLine:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->partialLine:Ljava/lang/String;

    goto/16 :goto_3

    .line 197
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->partialLine:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 198
    const-string v2, ""

    iput-object v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->partialLine:Ljava/lang/String;

    .line 199
    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_3

    .line 200
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->message:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 203
    .local v2, "lineIgnoreCase":Ljava/lang/String;
    sget-object v3, Landroid/gov/nist/javax/sip/header/ContentLength;->NAME_LOWER:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 204
    sget-object v3, Landroid/gov/nist/javax/sip/header/ContentLength;->NAME_LOWER:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->contentLength:I

    goto :goto_0

    .line 206
    :cond_1
    sget-object v3, Landroid/gov/nist/javax/sip/header/CallID;->NAME_LOWER:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 207
    sget-object v3, Landroid/gov/nist/javax/sip/header/CallID;->NAME_LOWER:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->callId:Ljava/lang/String;

    .line 210
    .end local v2    # "lineIgnoreCase":Ljava/lang/String;
    :cond_2
    :goto_0
    goto/16 :goto_3

    .line 211
    :cond_3
    const/16 v3, 0x20

    if-eqz p2, :cond_5

    .line 214
    sget-object v5, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 215
    sget-object v5, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v6, "KeepAlive Double CRLF received, sending single CRLF as defined per RFC 5626 Section 4.4.1"

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 216
    sget-object v5, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v6, "~~~ setting isPreviousLineCRLF=false"

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 219
    :cond_4
    const/4 v0, 0x0

    .line 222
    :try_start_0
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    invoke-interface {v5}, Landroid/gov/nist/javax/sip/parser/SIPMessageListener;->sendSingleCLRF()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 223
    :catch_0
    move-exception v5

    .line 224
    .local v5, "e":Ljava/lang/Exception;
    sget-object v6, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v7, "A problem occured while trying to send a single CLRF in response to a double CLRF"

    invoke-interface {v6, v7, v5}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 225
    .end local v5    # "e":Ljava/lang/Exception;
    :goto_1
    goto :goto_2

    .line 227
    :cond_5
    const/4 v0, 0x1

    .line 228
    sget-object v5, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 229
    sget-object v5, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v6, "Received CRLF"

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 231
    :cond_6
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    if-eqz v5, :cond_7

    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    instance-of v5, v5, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    if-eqz v5, :cond_7

    .line 233
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    check-cast v5, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->cancelPingKeepAliveTimeoutTaskIfStarted()V

    .line 236
    :cond_7
    :goto_2
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->message:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_9

    .line 237
    iput-boolean v4, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->readingMessageBodyContents:Z

    .line 238
    const/4 v4, 0x0

    iput-boolean v4, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->readingHeaderLines:Z

    .line 239
    iput-boolean v4, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->partialLineRead:Z

    .line 240
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->message:Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    sget-object v2, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 242
    sget-object v2, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Content Length parsed is "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v5, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->contentLength:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 245
    :cond_8
    iput v4, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->contentReadSoFar:I

    .line 246
    iget v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->contentLength:I

    new-array v2, v2, [B

    iput-object v2, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->messageBody:[B

    .line 250
    :cond_9
    :goto_3
    return v0
.end method

.method private readSingleByte(Ljava/io/InputStream;)I
    .locals 1
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 382
    iget v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sizeCounter:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sizeCounter:I

    .line 383
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->checkLimits()V

    .line 384
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v0

    return v0
.end method


# virtual methods
.method public declared-synchronized addBytes([B)V
    .locals 1
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    monitor-enter p0

    .line 309
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->currentStreamEnded:Z

    .line 310
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 311
    .local v0, "inputStream":Ljava/io/ByteArrayInputStream;
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->readStream(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 312
    monitor-exit p0

    return-void

    .line 308
    .end local v0    # "inputStream":Ljava/io/ByteArrayInputStream;
    .end local p0    # "this":Landroid/gov/nist/javax/sip/parser/NioPipelineParser;
    .end local p1    # "bytes":[B
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public close()V
    .locals 0

    .line 164
    return-void
.end method

.method public processSIPMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .locals 3
    .param p1, "message"    # Landroid/gov/nist/javax/sip/message/SIPMessage;

    .line 302
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    invoke-interface {v0, p1}, Landroid/gov/nist/javax/sip/parser/SIPMessageListener;->processMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 305
    goto :goto_0

    .line 303
    :catch_0
    move-exception v0

    .line 304
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "Can\'t process message"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 306
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public readStream(Ljava/io/InputStream;)V
    .locals 2
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 177
    const/4 v0, 0x0

    .line 179
    .local v0, "isPreviousLineCRLF":Z
    :cond_0
    :goto_0
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->currentStreamEnded:Z

    if-eqz v1, :cond_1

    .line 189
    return-void

    .line 181
    :cond_1
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->readingHeaderLines:Z

    if-eqz v1, :cond_2

    .line 182
    invoke-direct {p0, p1, v0}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->readMessageSipHeaderLines(Ljava/io/InputStream;Z)Z

    move-result v0

    .line 184
    :cond_2
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->readingMessageBodyContents:Z

    if-eqz v1, :cond_0

    .line 185
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->readMessageBody(Ljava/io/InputStream;)V

    goto :goto_0
.end method

.method public setMessageListener(Landroid/gov/nist/javax/sip/parser/SIPMessageListener;)V
    .locals 0
    .param p1, "mlistener"    # Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    .line 371
    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/NioPipelineParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    .line 372
    return-void
.end method
