.class public Landroid/gov/nist/javax/sip/stack/SSLStateMachine;
.super Ljava/lang/Object;
.source "SSLStateMachine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;,
        Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;
    }
.end annotation


# static fields
.field public static final EMPTY_BUFFER:Ljava/nio/ByteBuffer;

.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field protected channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

.field protected pendingOutboundBuffers:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;",
            ">;"
        }
    .end annotation
.end field

.field protected sslEngine:Ljavax/net/ssl/SSLEngine;

.field protected tlsRecordBuffer:Ljava/nio/ByteBuffer;

.field private unwrapLock:Ljava/lang/Object;

.field private wrapLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 58
    const-class v0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    .line 59
    const/4 v0, 0x0

    new-array v0, v0, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->EMPTY_BUFFER:Ljava/nio/ByteBuffer;

    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLEngine;Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;)V
    .locals 1
    .param p1, "sslEngine"    # Ljavax/net/ssl/SSLEngine;
    .param p2, "channel"    # Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->pendingOutboundBuffers:Ljava/util/Queue;

    .line 66
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->unwrapLock:Ljava/lang/Object;

    .line 67
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->wrapLock:Ljava/lang/Object;

    .line 70
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    .line 71
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    .line 72
    return-void
.end method

.method private clearBuffer()V
    .locals 2

    .line 265
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->tlsRecordBuffer:Ljava/nio/ByteBuffer;

    .line 266
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 267
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v1, "Buffer cleared"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 269
    :cond_0
    return-void
.end method

.method private normalizeTlsRecordBuffer(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 3
    .param p1, "src"    # Ljava/nio/ByteBuffer;

    .line 271
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->tlsRecordBuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_0

    .line 272
    return-object p1

    .line 274
    :cond_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 275
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Normalize buffer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " into record buffer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->tlsRecordBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 280
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->tlsRecordBuffer:Ljava/nio/ByteBuffer;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->tlsRecordBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 281
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->tlsRecordBuffer:Ljava/nio/ByteBuffer;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->tlsRecordBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 284
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->tlsRecordBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 287
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->tlsRecordBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 288
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->tlsRecordBuffer:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method private runDelegatedTasks(Ljavax/net/ssl/SSLEngineResult;)V
    .locals 5
    .param p1, "result"    # Ljavax/net/ssl/SSLEngineResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 433
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 434
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Running delegated task for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 441
    :cond_0
    invoke-virtual {p1}, Ljavax/net/ssl/SSLEngineResult;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v0

    sget-object v2, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NEED_TASK:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    if-ne v0, v2, :cond_4

    .line 443
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getDelegatedTask()Ljava/lang/Runnable;

    move-result-object v0

    move-object v2, v0

    .local v2, "runnable":Ljava/lang/Runnable;
    if-eqz v0, :cond_1

    .line 444
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 446
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v0

    .line 447
    .local v0, "hsStatus":Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 448
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Handshake status after delegated tasks "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 450
    :cond_2
    sget-object v1, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NEED_TASK:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    if-eq v0, v1, :cond_3

    goto :goto_1

    .line 451
    :cond_3
    new-instance v1, Ljava/io/IOException;

    const-string/jumbo v3, "handshake shouldn\'t need additional tasks"

    invoke-direct {v1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 455
    .end local v0    # "hsStatus":Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    .end local v2    # "runnable":Ljava/lang/Runnable;
    :cond_4
    :goto_1
    return-void
.end method

.method private startBuffer(Ljava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "src"    # Ljava/nio/ByteBuffer;

    .line 248
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->tlsRecordBuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_0

    .line 251
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v0

    const v1, 0x81f6

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->tlsRecordBuffer:Ljava/nio/ByteBuffer;

    .line 254
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->tlsRecordBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 257
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->tlsRecordBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 259
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 260
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Allocated record buffer for reading "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->tlsRecordBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " for src = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 263
    :cond_0
    return-void
.end method

.method private unwrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "src"    # Ljava/nio/ByteBuffer;
    .param p2, "dst"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 292
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->unwrapLock:Ljava/lang/Object;

    monitor-enter v0

    .line 296
    :cond_0
    :goto_0
    :try_start_0
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->normalizeTlsRecordBuffer(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v1

    move-object p1, v1

    .line 297
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 298
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Unwrap src "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " dst "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 301
    :cond_1
    const/4 v1, 0x0

    .line 303
    .local v1, "result":Ljavax/net/ssl/SSLEngineResult;
    :try_start_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v3, p1, p2}, Ljavax/net/ssl/SSLEngine;->unwrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v1, v3

    .line 311
    nop

    .line 312
    :try_start_2
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 313
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Unwrap result "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " buffers size "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->pendingOutboundBuffers:Ljava/util/Queue;

    invoke-interface {v5}, Ljava/util/Queue;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " src="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " dst="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 317
    :cond_2
    invoke-virtual {v1}, Ljavax/net/ssl/SSLEngineResult;->getStatus()Ljavax/net/ssl/SSLEngineResult$Status;

    move-result-object v3

    sget-object v4, Ljavax/net/ssl/SSLEngineResult$Status;->BUFFER_UNDERFLOW:Ljavax/net/ssl/SSLEngineResult$Status;

    invoke-virtual {v3, v4}, Ljavax/net/ssl/SSLEngineResult$Status;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 318
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 319
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "Buffer underflow, wait for the next inbound chunk of data to feed the SSL engine"

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 321
    :cond_3
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->startBuffer(Ljava/nio/ByteBuffer;)V

    .line 322
    goto/16 :goto_2

    .line 324
    :cond_4
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->clearBuffer()V

    .line 326
    invoke-virtual {v1}, Ljavax/net/ssl/SSLEngineResult;->getStatus()Ljavax/net/ssl/SSLEngineResult$Status;

    move-result-object v3

    sget-object v4, Ljavax/net/ssl/SSLEngineResult$Status;->BUFFER_OVERFLOW:Ljavax/net/ssl/SSLEngineResult$Status;

    invoke-virtual {v3, v4}, Ljavax/net/ssl/SSLEngineResult$Status;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 327
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 328
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Buffer overflow , must prepare the buffer again. outNetBuffer remaining: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " outNetBuffer postion: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " Packet buffer size: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v5}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v5

    invoke-interface {v5}, Ljavax/net/ssl/SSLSession;->getPacketBufferSize()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " new buffer size: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v5}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v5

    invoke-interface {v5}, Ljavax/net/ssl/SSLSession;->getPacketBufferSize()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 334
    :cond_5
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v4}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v4

    invoke-interface {v4}, Ljavax/net/ssl/SSLSession;->getPacketBufferSize()I

    move-result v4

    invoke-interface {v3, v4}, Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;->prepareAppDataBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 335
    .local v3, "newBuf":Ljava/nio/ByteBuffer;
    move-object p2, v3

    .line 336
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 337
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " new outNetBuffer remaining: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " new outNetBuffer postion: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 342
    .end local v3    # "newBuf":Ljava/nio/ByteBuffer;
    :cond_6
    invoke-virtual {v1}, Ljavax/net/ssl/SSLEngineResult;->bytesProduced()I

    move-result v3

    if-lez v3, :cond_7

    .line 344
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 345
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    new-array v3, v3, [B

    .line 346
    .local v3, "a":[B
    invoke-virtual {p2, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 348
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    invoke-interface {v4, v3}, Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;->addPlaintextBytes([B)V

    .line 350
    .end local v3    # "a":[B
    :cond_7
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$1;->$SwitchMap$javax$net$ssl$SSLEngineResult$HandshakeStatus:[I

    invoke-virtual {v1}, Ljavax/net/ssl/SSLEngineResult;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v4

    invoke-virtual {v4}, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    goto/16 :goto_3

    .line 416
    :pswitch_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->wrapRemaining()V

    .line 417
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 418
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Not handshaking, but has remaining: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " buffer "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 420
    :cond_8
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-eqz v2, :cond_f

    .line 421
    goto/16 :goto_3

    .line 367
    :pswitch_1
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 368
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Handshaking just finnished, but has remaining. Will try to wrap the queues app items."

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 370
    :cond_9
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->wrapRemaining()V

    .line 371
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 372
    goto/16 :goto_3

    .line 374
    :cond_a
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 375
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Handshake passed"

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 381
    :cond_b
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    instance-of v3, v3, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    if-eqz v3, :cond_f

    .line 382
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    check-cast v3, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->setHandshakeCompleted(Z)V

    .line 383
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v3}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v3

    if-eqz v3, :cond_d

    .line 384
    sget-object v3, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Disabled:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;->getSIPStack()Landroid/gov/nist/javax/sip/SipStackImpl;

    move-result-object v4

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/SipStackImpl;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_c

    sget-object v3, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->DisabledAll:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;->getSIPStack()Landroid/gov/nist/javax/sip/SipStackImpl;

    move-result-object v4

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/SipStackImpl;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v3, :cond_c

    .line 387
    :try_start_3
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    check-cast v3, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v4}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v4

    invoke-interface {v4}, Ljavax/net/ssl/SSLSession;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->setPeerCertificates([Ljava/security/cert/Certificate;)V
    :try_end_3
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 393
    goto :goto_1

    .line 388
    :catch_0
    move-exception v3

    .line 390
    .local v3, "e":Ljavax/net/ssl/SSLPeerUnverifiedException;
    :try_start_4
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 391
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v5, "sslEngine.getSession().getPeerCertificates() are not available, which is normal if running with android.gov.nist.javax.sip.TLS_CLIENT_AUTH_TYPE=Disabled"

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 395
    .end local v3    # "e":Ljavax/net/ssl/SSLPeerUnverifiedException;
    :cond_c
    :goto_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    check-cast v3, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v4}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v4

    invoke-interface {v4}, Ljavax/net/ssl/SSLSession;->getLocalCertificates()[Ljava/security/cert/Certificate;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->setLocalCertificates([Ljava/security/cert/Certificate;)V

    .line 396
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    check-cast v3, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v4}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v4

    invoke-interface {v4}, Ljavax/net/ssl/SSLSession;->getCipherSuite()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->setCipherSuite(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 399
    :cond_d
    :try_start_5
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    invoke-interface {v3}, Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;->getSIPStack()Landroid/gov/nist/javax/sip/SipStackImpl;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->getTlsSecurityPolicy()Landroid/gov/nist/javax/sip/TlsSecurityPolicy;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;->getEncapsulatedClientTransaction()Landroid/gov/nist/javax/sip/ClientTransactionExt;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/javax/sip/TlsSecurityPolicy;->enforceTlsPolicy(Landroid/gov/nist/javax/sip/ClientTransactionExt;)V
    :try_end_5
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 406
    nop

    .line 408
    :try_start_6
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 409
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v3, "TLS Security policy passed"

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_2

    .line 404
    :catch_1
    move-exception v2

    .line 405
    .local v2, "ex":Ljava/lang/SecurityException;
    new-instance v3, Ljava/io/IOException;

    invoke-virtual {v2}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local p1    # "src":Ljava/nio/ByteBuffer;
    .end local p2    # "dst":Ljava/nio/ByteBuffer;
    throw v3

    .line 364
    .end local v2    # "ex":Ljava/lang/SecurityException;
    .restart local p1    # "src":Ljava/nio/ByteBuffer;
    .restart local p2    # "dst":Ljava/nio/ByteBuffer;
    :pswitch_2
    invoke-direct {p0, v1}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->runDelegatedTasks(Ljavax/net/ssl/SSLEngineResult;)V

    .line 365
    goto :goto_3

    .line 352
    :pswitch_3
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 353
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Unwrap has remaining: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " buffer "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 355
    :cond_e
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-eqz v2, :cond_f

    .line 356
    goto :goto_3

    .line 429
    .end local v1    # "result":Ljavax/net/ssl/SSLEngineResult;
    :cond_f
    :goto_2
    monitor-exit v0

    .line 430
    return-void

    .line 361
    .restart local v1    # "result":Ljavax/net/ssl/SSLEngineResult;
    :pswitch_4
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->wrapNonAppData()V

    .line 362
    nop

    .line 428
    .end local v1    # "result":Ljavax/net/ssl/SSLEngineResult;
    :goto_3
    goto/16 :goto_0

    .line 304
    .restart local v1    # "result":Ljavax/net/ssl/SSLEngineResult;
    :catch_2
    move-exception v3

    .line 307
    .local v3, "e":Ljava/lang/Exception;
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 308
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "A problem occured while trying to unwrap the message "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 310
    :cond_10
    nop

    .end local p1    # "src":Ljava/nio/ByteBuffer;
    .end local p2    # "dst":Ljava/nio/ByteBuffer;
    throw v3

    .line 429
    .end local v1    # "result":Ljavax/net/ssl/SSLEngineResult;
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local p1    # "src":Ljava/nio/ByteBuffer;
    .restart local p2    # "dst":Ljava/nio/ByteBuffer;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private wrapNonAppData()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 180
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;->prepareEncryptedDataBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 185
    .local v0, "encryptedDataBuffer":Ljava/nio/ByteBuffer;
    :cond_0
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    sget-object v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->EMPTY_BUFFER:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2, v0}, Ljavax/net/ssl/SSLEngine;->wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;

    move-result-object v1

    .line 186
    .local v1, "result":Ljavax/net/ssl/SSLEngineResult;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 187
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "NonAppWrap result "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " buffers size "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->pendingOutboundBuffers:Ljava/util/Queue;

    invoke-interface {v5}, Ljava/util/Queue;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 190
    :cond_1
    invoke-virtual {v1}, Ljavax/net/ssl/SSLEngineResult;->bytesProduced()I

    move-result v2

    if-lez v2, :cond_2

    .line 192
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 193
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    new-array v2, v2, [B

    .line 194
    .local v2, "msg":[B
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 196
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sendSSLMetadata([B)V

    .line 197
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 200
    .end local v2    # "msg":[B
    :cond_2
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$1;->$SwitchMap$javax$net$ssl$SSLEngineResult$HandshakeStatus:[I

    invoke-virtual {v1}, Ljavax/net/ssl/SSLEngineResult;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v4

    invoke-virtual {v4}, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->ordinal()I

    move-result v4

    aget v2, v2, v4

    packed-switch v2, :pswitch_data_0

    goto/16 :goto_1

    .line 202
    :pswitch_0
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 203
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Handshake complete!"

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 206
    :cond_3
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    instance-of v2, v2, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    if-eqz v2, :cond_5

    .line 207
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    check-cast v2, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->setHandshakeCompleted(Z)V

    .line 208
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v2}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 209
    sget-object v2, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Disabled:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;->getSIPStack()Landroid/gov/nist/javax/sip/SipStackImpl;

    move-result-object v4

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/SipStackImpl;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    sget-object v2, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->DisabledAll:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;->getSIPStack()Landroid/gov/nist/javax/sip/SipStackImpl;

    move-result-object v4

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/SipStackImpl;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_0
    .catch Ljavax/net/ssl/SSLException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_4

    .line 212
    :try_start_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    check-cast v2, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v2

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v4}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v4

    invoke-interface {v4}, Ljavax/net/ssl/SSLSession;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->setPeerCertificates([Ljava/security/cert/Certificate;)V
    :try_end_1
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljavax/net/ssl/SSLException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 218
    goto :goto_0

    .line 213
    :catch_0
    move-exception v2

    .line 215
    .local v2, "e":Ljavax/net/ssl/SSLPeerUnverifiedException;
    :try_start_2
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 216
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v4, "sslEngine.getSession().getPeerCertificates() are not available, which is normal if running with android.gov.nist.javax.sip.TLS_CLIENT_AUTH_TYPE=Disabled"

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 220
    .end local v2    # "e":Ljavax/net/ssl/SSLPeerUnverifiedException;
    :cond_4
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    check-cast v2, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v3}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v3

    invoke-interface {v3}, Ljavax/net/ssl/SSLSession;->getLocalCertificates()[Ljava/security/cert/Certificate;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->setLocalCertificates([Ljava/security/cert/Certificate;)V

    .line 221
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    check-cast v2, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v3}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v3

    invoke-interface {v3}, Ljavax/net/ssl/SSLSession;->getCipherSuite()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->setCipherSuite(Ljava/lang/String;)V

    goto :goto_1

    .line 226
    :pswitch_1
    invoke-direct {p0, v1}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->runDelegatedTasks(Ljavax/net/ssl/SSLEngineResult;)V

    .line 230
    :cond_5
    :goto_1
    invoke-virtual {v1}, Ljavax/net/ssl/SSLEngineResult;->bytesProduced()I

    move-result v2
    :try_end_2
    .catch Ljavax/net/ssl/SSLException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v2, :cond_0

    .line 231
    nop

    .line 239
    nop

    .line 240
    return-void

    .line 237
    .end local v1    # "result":Ljavax/net/ssl/SSLEngineResult;
    :catchall_0
    move-exception v1

    goto :goto_2

    .line 234
    :catch_1
    move-exception v1

    .line 236
    .local v1, "e":Ljavax/net/ssl/SSLException;
    nop

    .end local v0    # "encryptedDataBuffer":Ljava/nio/ByteBuffer;
    :try_start_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 237
    .end local v1    # "e":Ljavax/net/ssl/SSLException;
    .restart local v0    # "encryptedDataBuffer":Ljava/nio/ByteBuffer;
    :goto_2
    throw v1

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public sendSSLMetadata([B)V
    .locals 1
    .param p1, "msg"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 458
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    invoke-interface {v0, p1}, Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;->sendEncryptedData([B)V

    .line 459
    return-void
.end method

.method public unwrap(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "src"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 243
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;->prepareAppDataBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 244
    .local v0, "outputBuffer":Ljava/nio/ByteBuffer;
    invoke-direct {p0, p1, v0}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->unwrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V

    .line 245
    return-void
.end method

.method public wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;)V
    .locals 10
    .param p1, "src"    # Ljava/nio/ByteBuffer;
    .param p2, "dst"    # Ljava/nio/ByteBuffer;
    .param p3, "callback"    # Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 79
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->wrapLock:Ljava/lang/Object;

    monitor-enter v0

    .line 82
    :try_start_0
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 83
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Wrapping "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", buffers size "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->pendingOutboundBuffers:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 87
    :cond_0
    if-eqz p1, :cond_1

    .line 88
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->pendingOutboundBuffers:Ljava/util/Queue;

    new-instance v3, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;

    invoke-direct {v3, p1, p3}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;-><init>(Ljava/nio/ByteBuffer;Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;)V

    invoke-interface {v1, v3}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 90
    :cond_1
    const/4 v1, 0x0

    .line 92
    .local v1, "iter":I
    :goto_0
    const/4 v3, 0x1

    add-int/2addr v1, v3

    .line 94
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->pendingOutboundBuffers:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 97
    .local v4, "currentBuffer":Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;
    if-nez v4, :cond_2

    goto/16 :goto_3

    .line 101
    :cond_2
    :try_start_1
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-static {v4}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;->access$000(Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;)Ljava/nio/ByteBuffer;

    move-result-object v6

    invoke-virtual {v5, v6, p2}, Ljavax/net/ssl/SSLEngine;->wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;

    move-result-object v5

    .line 102
    .local v5, "result":Ljavax/net/ssl/SSLEngineResult;
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 103
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Wrap result "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " buffers size "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->pendingOutboundBuffers:Ljava/util/Queue;

    invoke-interface {v8}, Ljava/util/Queue;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 106
    :cond_3
    :try_start_2
    invoke-static {v4}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;->access$000(Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;)Ljava/nio/ByteBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v6

    if-nez v6, :cond_4

    .line 107
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->pendingOutboundBuffers:Ljava/util/Queue;

    invoke-interface {v6}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 108
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 109
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "REMOVED item from encryption queue because it has no more data, all is done, buffers size now is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->pendingOutboundBuffers:Ljava/util/Queue;

    invoke-interface {v8}, Ljava/util/Queue;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " current buffer is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 114
    :cond_4
    invoke-static {v4}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;->access$000(Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;)Ljava/nio/ByteBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    .line 116
    .local v6, "remaining":I
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 117
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Remaining "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " queue size is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->pendingOutboundBuffers:Ljava/util/Queue;

    invoke-interface {v9}, Ljava/util/Queue;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 120
    :cond_5
    invoke-virtual {v5}, Ljavax/net/ssl/SSLEngineResult;->bytesProduced()I

    move-result v7

    if-lez v7, :cond_7

    .line 122
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 123
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    new-array v3, v3, [B

    .line 124
    .local v3, "bytes":[B
    invoke-virtual {p2, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 125
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;->getCallBack()Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;

    move-result-object v7

    if-eqz v7, :cond_6

    .line 127
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;->getCallBack()Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;

    move-result-object v7

    invoke-interface {v7, v3}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;->doSend([B)V

    goto :goto_1

    .line 130
    :cond_6
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sendSSLMetadata([B)V

    .line 132
    :goto_1
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 133
    nop

    .end local v3    # "bytes":[B
    goto/16 :goto_4

    .line 134
    :cond_7
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$1;->$SwitchMap$javax$net$ssl$SSLEngineResult$HandshakeStatus:[I

    invoke-virtual {v5}, Ljavax/net/ssl/SSLEngineResult;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v8

    invoke-virtual {v8}, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_0

    goto/16 :goto_4

    .line 168
    :pswitch_0
    goto/16 :goto_3

    .line 148
    :pswitch_1
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    instance-of v7, v7, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    if-eqz v7, :cond_a

    .line 149
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    check-cast v7, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v7, v3}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->setHandshakeCompleted(Z)V

    .line 150
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v3}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v3

    if-eqz v3, :cond_a

    .line 151
    sget-object v3, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Disabled:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;->getSIPStack()Landroid/gov/nist/javax/sip/SipStackImpl;

    move-result-object v7

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/SipStackImpl;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    sget-object v3, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->DisabledAll:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;->getSIPStack()Landroid/gov/nist/javax/sip/SipStackImpl;

    move-result-object v7

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/SipStackImpl;->getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-nez v3, :cond_8

    .line 154
    :try_start_3
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    check-cast v3, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v3

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v7}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v7

    invoke-interface {v7}, Ljavax/net/ssl/SSLSession;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->setPeerCertificates([Ljava/security/cert/Certificate;)V
    :try_end_3
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 160
    goto :goto_2

    .line 155
    :catch_0
    move-exception v3

    .line 157
    .local v3, "e":Ljavax/net/ssl/SSLPeerUnverifiedException;
    :try_start_4
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 158
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v8, "sslEngine.getSession().getPeerCertificates() are not available, which is normal if running with android.gov.nist.javax.sip.TLS_CLIENT_AUTH_TYPE=Disabled"

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 162
    .end local v3    # "e":Ljavax/net/ssl/SSLPeerUnverifiedException;
    :cond_8
    :goto_2
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    check-cast v3, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v3

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v7}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v7

    invoke-interface {v7}, Ljavax/net/ssl/SSLSession;->getLocalCertificates()[Ljava/security/cert/Certificate;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->setLocalCertificates([Ljava/security/cert/Certificate;)V

    .line 163
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    check-cast v3, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v3

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->sslEngine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v7}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v7

    invoke-interface {v7}, Ljavax/net/ssl/SSLSession;->getCipherSuite()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->setCipherSuite(Ljava/lang/String;)V

    goto :goto_4

    .line 144
    :pswitch_2
    invoke-direct {p0, v5}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->runDelegatedTasks(Ljavax/net/ssl/SSLEngineResult;)V

    .line 145
    goto :goto_4

    .line 142
    :pswitch_3
    goto :goto_3

    .line 136
    :pswitch_4
    invoke-static {v4}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;->access$000(Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 137
    goto :goto_4

    .line 176
    .end local v1    # "iter":I
    .end local v4    # "currentBuffer":Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;
    .end local v5    # "result":Ljavax/net/ssl/SSLEngineResult;
    .end local v6    # "remaining":I
    :cond_9
    :goto_3
    monitor-exit v0

    .line 177
    return-void

    .line 175
    .restart local v1    # "iter":I
    :cond_a
    :goto_4
    goto/16 :goto_0

    .line 106
    .restart local v4    # "currentBuffer":Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;
    :catchall_0
    move-exception v3

    invoke-static {v4}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;->access$000(Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;)Ljava/nio/ByteBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v5

    if-nez v5, :cond_b

    .line 107
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->pendingOutboundBuffers:Ljava/util/Queue;

    invoke-interface {v5}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 108
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 109
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "REMOVED item from encryption queue because it has no more data, all is done, buffers size now is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->pendingOutboundBuffers:Ljava/util/Queue;

    invoke-interface {v6}, Ljava/util/Queue;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " current buffer is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_b
    nop

    .end local p1    # "src":Ljava/nio/ByteBuffer;
    .end local p2    # "dst":Ljava/nio/ByteBuffer;
    .end local p3    # "callback":Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;
    throw v3

    .line 176
    .end local v1    # "iter":I
    .end local v4    # "currentBuffer":Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendItem;
    .restart local p1    # "src":Ljava/nio/ByteBuffer;
    .restart local p2    # "dst":Ljava/nio/ByteBuffer;
    .restart local p3    # "callback":Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;
    :catchall_1
    move-exception v1

    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public wrapRemaining()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->channel:Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;->prepareEncryptedDataBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0, v1}, Landroid/gov/nist/javax/sip/stack/SSLStateMachine;->wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Landroid/gov/nist/javax/sip/stack/SSLStateMachine$MessageSendCallback;)V

    .line 76
    return-void
.end method
