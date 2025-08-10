.class public Landroid/gov/nist/javax/sip/EventScanner;
.super Ljava/lang/Object;
.source "EventScanner.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private isStopped:Z

.field private pendingEvents:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Landroid/gov/nist/javax/sip/EventWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private refCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 70
    const-class v0, Landroid/gov/nist/javax/sip/EventScanner;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/SipStackImpl;)V
    .locals 2
    .param p1, "sipStackImpl"    # Landroid/gov/nist/javax/sip/SipStackImpl;

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/EventScanner;->refCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 86
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/EventScanner;->pendingEvents:Ljava/util/concurrent/BlockingQueue;

    .line 87
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 90
    .local v0, "myThread":Ljava/lang/Thread;
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 92
    iput-object p1, p0, Landroid/gov/nist/javax/sip/EventScanner;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    .line 94
    const-string v1, "EventScannerThread"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 96
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 98
    return-void
.end method

.method private deliverDialogTerminatedEvent(Landroid/javax/sip/DialogTerminatedEvent;Landroid/gov/nist/javax/sip/EventWrapper;Landroid/javax/sip/SipListener;)V
    .locals 3
    .param p1, "sipEvent"    # Landroid/javax/sip/DialogTerminatedEvent;
    .param p2, "eventWrapper"    # Landroid/gov/nist/javax/sip/EventWrapper;
    .param p3, "sipListener"    # Landroid/javax/sip/SipListener;

    .line 461
    if-eqz p3, :cond_0

    .line 462
    :try_start_0
    invoke-interface {p3, p1}, Landroid/javax/sip/SipListener;->processDialogTerminated(Landroid/javax/sip/DialogTerminatedEvent;)V
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 468
    :catch_0
    move-exception v0

    .line 469
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v1, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 463
    .end local v0    # "ex":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 465
    .local v0, "ame":Ljava/lang/AbstractMethodError;
    sget-object v1, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 466
    sget-object v1, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "Unable to call sipListener.processDialogTerminated"

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 470
    .end local v0    # "ame":Ljava/lang/AbstractMethodError;
    :cond_0
    :goto_0
    nop

    .line 471
    :goto_1
    return-void
.end method

.method private deliverDialogTimeoutEvent(Landroid/gov/nist/javax/sip/DialogTimeoutEvent;Landroid/gov/nist/javax/sip/EventWrapper;Landroid/javax/sip/SipListener;)V
    .locals 2
    .param p1, "dialogTimeoutEvent"    # Landroid/gov/nist/javax/sip/DialogTimeoutEvent;
    .param p2, "eventWrapper"    # Landroid/gov/nist/javax/sip/EventWrapper;
    .param p3, "sipListener"    # Landroid/javax/sip/SipListener;

    .line 413
    if-eqz p3, :cond_0

    :try_start_0
    instance-of v0, p3, Landroid/gov/nist/javax/sip/SipListenerExt;

    if-eqz v0, :cond_0

    .line 414
    move-object v0, p3

    check-cast v0, Landroid/gov/nist/javax/sip/SipListenerExt;

    invoke-interface {v0, p1}, Landroid/gov/nist/javax/sip/SipListenerExt;->processDialogTimeout(Landroid/gov/nist/javax/sip/DialogTimeoutEvent;)V

    goto :goto_0

    .line 416
    :cond_0
    sget-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 417
    sget-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v1, "DialogTimeoutEvent not delivered"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 425
    :cond_1
    :goto_0
    goto :goto_1

    .line 420
    :catch_0
    move-exception v0

    .line 424
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v1, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    .line 426
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method private deliverIOExceptionEvent(Landroid/javax/sip/IOExceptionEvent;Landroid/gov/nist/javax/sip/EventWrapper;Landroid/javax/sip/SipListener;)V
    .locals 2
    .param p1, "sipEvent"    # Landroid/javax/sip/IOExceptionEvent;
    .param p2, "eventWrapper"    # Landroid/gov/nist/javax/sip/EventWrapper;
    .param p3, "sipListener"    # Landroid/javax/sip/SipListener;

    .line 430
    if-eqz p3, :cond_0

    .line 431
    :try_start_0
    invoke-interface {p3, p1}, Landroid/javax/sip/SipListener;->processIOException(Landroid/javax/sip/IOExceptionEvent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 432
    :catch_0
    move-exception v0

    .line 433
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v1, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 434
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_0
    :goto_0
    nop

    .line 435
    :goto_1
    return-void
.end method

.method private deliverRequestEvent(Landroid/javax/sip/RequestEvent;Landroid/gov/nist/javax/sip/EventWrapper;Landroid/javax/sip/SipListener;)V
    .locals 10
    .param p1, "sipEvent"    # Landroid/javax/sip/RequestEvent;
    .param p2, "eventWrapper"    # Landroid/gov/nist/javax/sip/EventWrapper;
    .param p3, "sipListener"    # Landroid/javax/sip/SipListener;

    .line 170
    const-string v0, "Calling listener "

    const-string v1, "ACK"

    const-string v2, "Done processing Message "

    const/4 v3, 0x5

    const/16 v4, 0x20

    :try_start_0
    invoke-virtual {p1}, Landroid/javax/sip/RequestEvent;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 173
    .local v5, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    sget-object v6, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 174
    sget-object v6, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "deliverEvent : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " transaction "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " sipEvent.serverTx = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Landroid/javax/sip/RequestEvent;->getServerTransaction()Landroid/javax/sip/ServerTransaction;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 193
    :cond_0
    iget-object v6, p0, Landroid/gov/nist/javax/sip/EventScanner;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    const/4 v7, 0x1

    invoke-virtual {v6, v5, v7}, Landroid/gov/nist/javax/sip/SipStackImpl;->findTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 196
    .local v6, "tx":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    if-eqz v6, :cond_8

    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->passToListener()Z

    move-result v7

    if-nez v7, :cond_8

    .line 205
    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isInviteTransaction()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getLastResponseStatusCode()I

    move-result v7

    div-int/lit8 v7, v7, 0x64

    const/4 v8, 0x2

    if-eq v7, v8, :cond_1

    iget-object v7, p0, Landroid/gov/nist/javax/sip/EventScanner;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/SipStackImpl;->isNon2XXAckPassedToListener()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 210
    :cond_1
    iget-object v7, p0, Landroid/gov/nist/javax/sip/EventScanner;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/SipStackImpl;->isNon2XXAckPassedToListener()Z

    move-result v7

    if-nez v7, :cond_f

    .line 211
    sget-object v7, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 212
    sget-object v7, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v8, "Detected broken client sending ACK with same branch! Passing..."

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 217
    :cond_2
    sget-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 218
    sget-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "transaction already exists! "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 272
    :cond_3
    sget-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 273
    sget-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/javax/sip/RequestEvent;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-object v7, v4

    check-cast v7, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 278
    :cond_4
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v0, :cond_5

    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->passToListener()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 281
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V

    .line 285
    :cond_5
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v0, :cond_6

    .line 286
    iget-object v0, p0, Landroid/gov/nist/javax/sip/EventScanner;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    iget-object v2, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/SipStackImpl;->removePendingTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 288
    :cond_6
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 294
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->setState(I)V

    :cond_7
    return-void

    .line 222
    :cond_8
    :try_start_1
    iget-object v7, p0, Landroid/gov/nist/javax/sip/EventScanner;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTransactionId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/gov/nist/javax/sip/SipStackImpl;->findPendingTransaction(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-result-object v7

    if-eqz v7, :cond_e

    .line 223
    sget-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 224
    sget-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v7, "transaction already exists!!"

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 272
    :cond_9
    sget-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 273
    sget-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/javax/sip/RequestEvent;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-object v7, v4

    check-cast v7, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 278
    :cond_a
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v0, :cond_b

    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->passToListener()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 281
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V

    .line 285
    :cond_b
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v0, :cond_c

    .line 286
    iget-object v0, p0, Landroid/gov/nist/javax/sip/EventScanner;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    iget-object v2, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/SipStackImpl;->removePendingTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 288
    :cond_c
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 294
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->setState(I)V

    :cond_d
    return-void

    .line 232
    :cond_e
    :try_start_2
    iget-object v7, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v7, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 233
    .local v7, "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    iget-object v8, p0, Landroid/gov/nist/javax/sip/EventScanner;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v8, v7}, Landroid/gov/nist/javax/sip/SipStackImpl;->putPendingTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 237
    .end local v7    # "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_f
    :goto_0
    iget-object v7, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-virtual {v5, v7}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setTransaction(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 241
    :try_start_3
    sget-object v7, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_10

    .line 242
    sget-object v7, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 246
    sget-object v7, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 249
    :cond_10
    if-eqz p3, :cond_11

    .line 250
    invoke-interface {p3, p1}, Landroid/javax/sip/SipListener;->processRequest(Landroid/javax/sip/RequestEvent;)V

    .line 252
    :cond_11
    sget-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 253
    sget-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 257
    :cond_12
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v0, :cond_13

    .line 259
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 261
    .local v0, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    if-eqz v0, :cond_13

    .line 262
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->requestConsumed()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 270
    .end local v0    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :cond_13
    goto :goto_1

    .line 265
    :catch_0
    move-exception v0

    .line 269
    .local v0, "ex":Ljava/lang/Exception;
    :try_start_4
    sget-object v7, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7, v0}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 272
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v5    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v6    # "tx":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :goto_1
    sget-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 273
    sget-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/javax/sip/RequestEvent;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-object v5, v4

    check-cast v5, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 278
    :cond_14
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v0, :cond_15

    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->passToListener()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 281
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V

    .line 285
    :cond_15
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v0, :cond_16

    .line 286
    iget-object v0, p0, Landroid/gov/nist/javax/sip/EventScanner;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    iget-object v2, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/SipStackImpl;->removePendingTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 288
    :cond_16
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 294
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->setState(I)V

    .line 298
    :cond_17
    return-void

    .line 272
    :catchall_0
    move-exception v0

    sget-object v5, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_18

    .line 273
    sget-object v4, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/javax/sip/RequestEvent;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-object v6, v5

    check-cast v6, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 278
    :cond_18
    iget-object v2, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v2, :cond_19

    iget-object v2, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->passToListener()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 281
    iget-object v2, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V

    .line 285
    :cond_19
    iget-object v2, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v2, :cond_1a

    .line 286
    iget-object v2, p0, Landroid/gov/nist/javax/sip/EventScanner;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    iget-object v4, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-virtual {v2, v4}, Landroid/gov/nist/javax/sip/SipStackImpl;->removePendingTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 288
    :cond_1a
    iget-object v2, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 294
    iget-object v1, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v1, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->setState(I)V

    :cond_1b
    throw v0
.end method

.method private deliverResponseEvent(Landroid/javax/sip/ResponseEvent;Landroid/gov/nist/javax/sip/EventWrapper;Landroid/javax/sip/SipListener;)V
    .locals 7
    .param p1, "responseEvent"    # Landroid/javax/sip/ResponseEvent;
    .param p2, "eventWrapper"    # Landroid/gov/nist/javax/sip/EventWrapper;
    .param p3, "sipListener"    # Landroid/javax/sip/SipListener;

    .line 303
    const-string v0, "INVITE"

    :try_start_0
    invoke-virtual {p1}, Landroid/javax/sip/ResponseEvent;->getResponse()Landroid/javax/sip/message/Response;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 305
    .local v1, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual {p1}, Landroid/javax/sip/ResponseEvent;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 307
    .local v2, "sipDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :try_start_1
    sget-object v3, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v4, 0x20

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 308
    sget-object v3, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Calling listener "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFirstLine()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 312
    :cond_0
    if-eqz p3, :cond_2

    .line 313
    iget-object v3, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 314
    .local v3, "tx":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    if-eqz v3, :cond_1

    .line 315
    invoke-interface {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->setPassToListener()V

    .line 317
    :cond_1
    invoke-interface {p3, p1}, Landroid/javax/sip/SipListener;->processResponse(Landroid/javax/sip/ResponseEvent;)V

    .line 325
    .end local v3    # "tx":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    :cond_2
    if-eqz v2, :cond_6

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v3

    sget-object v5, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    invoke-virtual {v3, v5}, Landroid/javax/sip/DialogState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    :cond_3
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v3

    const/16 v5, 0x1e1

    if-eq v3, v5, :cond_4

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v3

    const/16 v5, 0x198

    if-ne v3, v5, :cond_6

    .line 329
    :cond_4
    sget-object v3, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 330
    sget-object v3, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v5, "Removing dialog on 408 or 481 response"

    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 333
    :cond_5
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->doDeferredDelete()V

    .line 353
    :cond_6
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    if-eqz v2, :cond_8

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v3

    const/16 v5, 0xc8

    if-ne v3, v5, :cond_8

    .line 357
    sget-object v3, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 358
    sget-object v3, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Warning! unacknowledged dialog. "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 364
    :cond_7
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->doDeferredDeleteIfNoAckSent(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 371
    :cond_8
    goto :goto_0

    .line 366
    :catch_0
    move-exception v3

    .line 370
    .local v3, "ex":Ljava/lang/Exception;
    :try_start_2
    sget-object v4, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v3}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    .line 375
    .end local v3    # "ex":Ljava/lang/Exception;
    :goto_0
    iget-object v3, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v3, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 376
    .local v3, "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    if-eqz v3, :cond_9

    invoke-interface {v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getInternalState()I

    move-result v4

    const/4 v5, 0x3

    if-ne v5, v4, :cond_9

    invoke-interface {v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getMethod()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 385
    invoke-interface {v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->clearState()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 389
    .end local v1    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v2    # "sipDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .end local v3    # "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    :cond_9
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v0, :cond_a

    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->passToListener()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 391
    iget-object v0, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V

    .line 394
    :cond_a
    return-void

    .line 389
    :catchall_0
    move-exception v0

    iget-object v1, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v1, :cond_b

    iget-object v1, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->passToListener()Z

    move-result v1

    if-eqz v1, :cond_b

    .line 391
    iget-object v1, p2, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->releaseSem()V

    :cond_b
    throw v0
.end method

.method private deliverTimeoutEvent(Landroid/javax/sip/TimeoutEvent;Landroid/gov/nist/javax/sip/EventWrapper;Landroid/javax/sip/SipListener;)V
    .locals 2
    .param p1, "timeoutEvent"    # Landroid/javax/sip/TimeoutEvent;
    .param p2, "eventWrapper"    # Landroid/gov/nist/javax/sip/EventWrapper;
    .param p3, "sipListener"    # Landroid/javax/sip/SipListener;

    .line 400
    if-eqz p3, :cond_0

    .line 401
    :try_start_0
    invoke-interface {p3, p1}, Landroid/javax/sip/SipListener;->processTimeout(Landroid/javax/sip/TimeoutEvent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 402
    :catch_0
    move-exception v0

    .line 406
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v1, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 407
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_0
    :goto_0
    nop

    .line 408
    :goto_1
    return-void
.end method

.method private deliverTransactionTerminatedEvent(Landroid/javax/sip/TransactionTerminatedEvent;Landroid/gov/nist/javax/sip/EventWrapper;Landroid/javax/sip/SipListener;)V
    .locals 4
    .param p1, "sipEvent"    # Landroid/javax/sip/TransactionTerminatedEvent;
    .param p2, "eventWrapper"    # Landroid/gov/nist/javax/sip/EventWrapper;
    .param p3, "sipListener"    # Landroid/javax/sip/SipListener;

    .line 439
    const-string/jumbo v0, "tx = "

    :try_start_0
    sget-object v1, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 440
    sget-object v1, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "About to deliver transactionTerminatedEvent"

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 442
    sget-object v1, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/javax/sip/TransactionTerminatedEvent;->getClientTransaction()Landroid/javax/sip/ClientTransaction;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 444
    sget-object v1, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/javax/sip/TransactionTerminatedEvent;->getServerTransaction()Landroid/javax/sip/ServerTransaction;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 447
    :cond_0
    if-eqz p3, :cond_1

    .line 448
    invoke-interface {p3, p1}, Landroid/javax/sip/SipListener;->processTransactionTerminated(Landroid/javax/sip/TransactionTerminatedEvent;)V
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 454
    :catch_0
    move-exception v0

    .line 455
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v1, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 449
    .end local v0    # "ex":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 451
    .local v0, "ame":Ljava/lang/AbstractMethodError;
    sget-object v1, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 452
    sget-object v1, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "Unable to call sipListener.processTransactionTerminated"

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 456
    .end local v0    # "ame":Ljava/lang/AbstractMethodError;
    :cond_1
    :goto_0
    nop

    .line 457
    :goto_1
    return-void
.end method


# virtual methods
.method public addEvent(Landroid/gov/nist/javax/sip/EventWrapper;)V
    .locals 4
    .param p1, "eventWrapper"    # Landroid/gov/nist/javax/sip/EventWrapper;

    .line 101
    sget-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 102
    sget-object v0, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "addEvent "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 104
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/EventScanner;->pendingEvents:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;)Z

    move-result v0

    .line 106
    .local v0, "added":Z
    if-nez v0, :cond_1

    .line 107
    sget-object v1, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "reached queue capacity limit couldn\'t addEvent "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 108
    :cond_1
    return-void
.end method

.method public deliverEvent(Landroid/gov/nist/javax/sip/EventWrapper;)V
    .locals 5
    .param p1, "eventWrapper"    # Landroid/gov/nist/javax/sip/EventWrapper;

    .line 132
    iget-object v0, p1, Landroid/gov/nist/javax/sip/EventWrapper;->sipEvent:Ljava/util/EventObject;

    .line 133
    .local v0, "sipEvent":Ljava/util/EventObject;
    sget-object v1, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 134
    sget-object v1, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "sipEvent = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "source = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/util/EventObject;->getSource()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 137
    :cond_0
    const/4 v1, 0x0

    .line 139
    .local v1, "sipListener":Landroid/javax/sip/SipListener;
    instance-of v2, v0, Landroid/javax/sip/IOExceptionEvent;

    if-nez v2, :cond_1

    .line 140
    invoke-virtual {v0}, Ljava/util/EventObject;->getSource()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/SipProviderImpl;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v1

    goto :goto_0

    .line 142
    :cond_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/EventScanner;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/SipStackImpl;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v1

    .line 145
    :goto_0
    instance-of v2, v0, Landroid/javax/sip/RequestEvent;

    if-eqz v2, :cond_2

    .line 146
    move-object v2, v0

    check-cast v2, Landroid/javax/sip/RequestEvent;

    invoke-direct {p0, v2, p1, v1}, Landroid/gov/nist/javax/sip/EventScanner;->deliverRequestEvent(Landroid/javax/sip/RequestEvent;Landroid/gov/nist/javax/sip/EventWrapper;Landroid/javax/sip/SipListener;)V

    goto :goto_1

    .line 147
    :cond_2
    instance-of v2, v0, Landroid/javax/sip/ResponseEvent;

    if-eqz v2, :cond_3

    .line 148
    move-object v2, v0

    check-cast v2, Landroid/javax/sip/ResponseEvent;

    invoke-direct {p0, v2, p1, v1}, Landroid/gov/nist/javax/sip/EventScanner;->deliverResponseEvent(Landroid/javax/sip/ResponseEvent;Landroid/gov/nist/javax/sip/EventWrapper;Landroid/javax/sip/SipListener;)V

    goto :goto_1

    .line 149
    :cond_3
    instance-of v2, v0, Landroid/javax/sip/TimeoutEvent;

    if-eqz v2, :cond_4

    .line 150
    move-object v2, v0

    check-cast v2, Landroid/javax/sip/TimeoutEvent;

    invoke-direct {p0, v2, p1, v1}, Landroid/gov/nist/javax/sip/EventScanner;->deliverTimeoutEvent(Landroid/javax/sip/TimeoutEvent;Landroid/gov/nist/javax/sip/EventWrapper;Landroid/javax/sip/SipListener;)V

    goto :goto_1

    .line 151
    :cond_4
    instance-of v2, v0, Landroid/gov/nist/javax/sip/DialogTimeoutEvent;

    if-eqz v2, :cond_5

    .line 152
    move-object v2, v0

    check-cast v2, Landroid/gov/nist/javax/sip/DialogTimeoutEvent;

    invoke-direct {p0, v2, p1, v1}, Landroid/gov/nist/javax/sip/EventScanner;->deliverDialogTimeoutEvent(Landroid/gov/nist/javax/sip/DialogTimeoutEvent;Landroid/gov/nist/javax/sip/EventWrapper;Landroid/javax/sip/SipListener;)V

    goto :goto_1

    .line 153
    :cond_5
    instance-of v2, v0, Landroid/javax/sip/IOExceptionEvent;

    if-eqz v2, :cond_6

    .line 154
    move-object v2, v0

    check-cast v2, Landroid/javax/sip/IOExceptionEvent;

    invoke-direct {p0, v2, p1, v1}, Landroid/gov/nist/javax/sip/EventScanner;->deliverIOExceptionEvent(Landroid/javax/sip/IOExceptionEvent;Landroid/gov/nist/javax/sip/EventWrapper;Landroid/javax/sip/SipListener;)V

    goto :goto_1

    .line 155
    :cond_6
    instance-of v2, v0, Landroid/javax/sip/TransactionTerminatedEvent;

    if-eqz v2, :cond_7

    .line 156
    move-object v2, v0

    check-cast v2, Landroid/javax/sip/TransactionTerminatedEvent;

    invoke-direct {p0, v2, p1, v1}, Landroid/gov/nist/javax/sip/EventScanner;->deliverTransactionTerminatedEvent(Landroid/javax/sip/TransactionTerminatedEvent;Landroid/gov/nist/javax/sip/EventWrapper;Landroid/javax/sip/SipListener;)V

    goto :goto_1

    .line 157
    :cond_7
    instance-of v2, v0, Landroid/javax/sip/DialogTerminatedEvent;

    if-eqz v2, :cond_8

    .line 158
    move-object v2, v0

    check-cast v2, Landroid/javax/sip/DialogTerminatedEvent;

    invoke-direct {p0, v2, p1, v1}, Landroid/gov/nist/javax/sip/EventScanner;->deliverDialogTerminatedEvent(Landroid/javax/sip/DialogTerminatedEvent;Landroid/gov/nist/javax/sip/EventWrapper;Landroid/javax/sip/SipListener;)V

    goto :goto_1

    .line 161
    :cond_8
    sget-object v2, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "bad event"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logFatalError(Ljava/lang/String;)V

    .line 164
    :goto_1
    return-void
.end method

.method public forceStop()V
    .locals 2

    .line 127
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/EventScanner;->isStopped:Z

    .line 128
    iget-object v0, p0, Landroid/gov/nist/javax/sip/EventScanner;->refCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 129
    return-void
.end method

.method public incrementRefcount()V
    .locals 1

    .line 81
    iget-object v0, p0, Landroid/gov/nist/javax/sip/EventScanner;->refCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 82
    return-void
.end method

.method public run()V
    .locals 7

    .line 480
    const-string v0, "Event scanner exited abnormally"

    const/4 v1, 0x0

    .line 481
    .local v1, "threadHandle":Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;
    const/16 v2, 0x20

    :try_start_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/EventScanner;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 482
    iget-object v3, p0, Landroid/gov/nist/javax/sip/EventScanner;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/core/ThreadAuditor;->addCurrentThread()Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;

    move-result-object v3

    move-object v1, v3

    .line 486
    :cond_0
    :goto_0
    const/4 v3, 0x0

    .line 491
    .local v3, "eventWrapper":Landroid/gov/nist/javax/sip/EventWrapper;
    iget-boolean v4, p0, Landroid/gov/nist/javax/sip/EventScanner;->isStopped:Z

    if-eqz v4, :cond_3

    .line 492
    sget-object v4, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 493
    sget-object v4, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v5, "Stopped event scanner!!"

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 527
    :cond_1
    sget-object v4, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 528
    iget-boolean v2, p0, Landroid/gov/nist/javax/sip/EventScanner;->isStopped:Z

    if-nez v2, :cond_2

    .line 529
    sget-object v2, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->logFatalError(Ljava/lang/String;)V

    :cond_2
    return-void

    .line 501
    :cond_3
    if-eqz v1, :cond_4

    .line 502
    :try_start_1
    invoke-virtual {v1}, Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;->ping()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 512
    :cond_4
    :try_start_2
    iget-object v4, p0, Landroid/gov/nist/javax/sip/EventScanner;->pendingEvents:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v4}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/EventWrapper;

    move-object v3, v4

    .line 513
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/EventScanner;->deliverEvent(Landroid/gov/nist/javax/sip/EventWrapper;)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 524
    goto :goto_1

    .line 519
    :catch_0
    move-exception v4

    .line 520
    .local v4, "e":Ljava/lang/Exception;
    :try_start_3
    sget-object v5, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 521
    sget-object v5, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v6, "Unexpected exception caught while delivering event -- carrying on bravely"

    invoke-interface {v5, v6, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 525
    .end local v3    # "eventWrapper":Landroid/gov/nist/javax/sip/EventWrapper;
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_5
    :goto_1
    goto :goto_0

    .line 514
    .restart local v3    # "eventWrapper":Landroid/gov/nist/javax/sip/EventWrapper;
    :catch_1
    move-exception v4

    .line 516
    .local v4, "ex":Ljava/lang/InterruptedException;
    sget-object v5, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    const/4 v6, 0x4

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 517
    sget-object v5, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v6, "Interrupted!"

    invoke-interface {v5, v6, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 527
    :cond_6
    sget-object v5, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 528
    iget-boolean v2, p0, Landroid/gov/nist/javax/sip/EventScanner;->isStopped:Z

    if-nez v2, :cond_7

    .line 529
    sget-object v2, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->logFatalError(Ljava/lang/String;)V

    :cond_7
    return-void

    .line 527
    .end local v1    # "threadHandle":Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;
    .end local v3    # "eventWrapper":Landroid/gov/nist/javax/sip/EventWrapper;
    .end local v4    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    sget-object v3, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 528
    iget-boolean v2, p0, Landroid/gov/nist/javax/sip/EventScanner;->isStopped:Z

    if-nez v2, :cond_8

    .line 529
    sget-object v2, Landroid/gov/nist/javax/sip/EventScanner;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->logFatalError(Ljava/lang/String;)V

    :cond_8
    throw v1
.end method

.method public stop()V
    .locals 1

    .line 116
    iget-object v0, p0, Landroid/gov/nist/javax/sip/EventScanner;->refCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_0

    .line 117
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/EventScanner;->isStopped:Z

    .line 119
    :cond_0
    return-void
.end method
