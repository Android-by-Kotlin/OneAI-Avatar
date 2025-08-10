.class public abstract Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;
.super Ljava/lang/Object;
.source "SIPTransactionImpl.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/SIPTransaction;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;,
        Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$LingerTimer;,
        Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;
    }
.end annotation


# static fields
.field private static final EXTRACT_CN:Ljava/util/regex/Pattern;

.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field protected T2:I

.field protected T4:I

.field protected transient applicationData:Ljava/lang/Object;

.field protected auditTag:J

.field protected baseTimerInterval:I

.field private branch:Ljava/lang/String;

.field protected collectionTime:I

.field private currentState:I

.field private dialogCreatingTransaction:Ljava/lang/Boolean;

.field protected transient encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

.field private transient eventListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;",
            ">;"
        }
    .end annotation
.end field

.field public expiresTimerTask:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$ExpiresTimerTask;

.field private forkId:Ljava/lang/String;

.field private inviteTransaction:Ljava/lang/Boolean;

.field protected isMapped:Z

.field protected lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

.field private maxTxLifeTimeListener:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;

.field protected mergeId:Ljava/lang/String;

.field private method:Ljava/lang/String;

.field protected originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

.field protected originalRequestBranch:Ljava/lang/String;

.field protected originalRequestBytes:[B

.field protected originalRequestCSeqNumber:J

.field protected originalRequestHasPort:Z

.field private releaseReferencesStrategy:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

.field private transient retransmissionTimerLastTickCount:I

.field private transient retransmissionTimerTicksLeft:I

.field private transient semaphore:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;

.field protected transient sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

.field private terminatedEventDelivered:Z

.field protected timeoutTimerTicksLeft:I

.field protected timerD:I

.field protected timerI:I

.field protected timerK:I

.field protected toListener:Z

.field protected transactionId:Ljava/lang/String;

.field protected transactionTimerStarted:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 90
    const-class v0, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    .line 93
    const-string v0, ".*CN\\s*=\\s*([\\w*\\.\\-_]+).*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->EXTRACT_CN:Ljava/util/regex/Pattern;

    return-void
.end method

.method protected constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
    .locals 4
    .param p1, "newParentStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "newEncapsulatedChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 353
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    const/16 v0, 0x1f4

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->baseTimerInterval:I

    .line 103
    const/16 v0, 0x1388

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->baseTimerInterval:I

    div-int/2addr v0, v1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->T4:I

    .line 109
    const/16 v0, 0xfa0

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->baseTimerInterval:I

    div-int/2addr v0, v1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->T2:I

    .line 110
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->T4:I

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->timerI:I

    .line 112
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->T4:I

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->timerK:I

    .line 114
    const/16 v0, 0x7d00

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->baseTimerInterval:I

    div-int/2addr v0, v1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->timerD:I

    .line 133
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->auditTag:J

    .line 151
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->transactionTimerStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 160
    const/4 v0, -0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->currentState:I

    .line 186
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->inviteTransaction:Ljava/lang/Boolean;

    .line 187
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->dialogCreatingTransaction:Ljava/lang/Boolean;

    .line 190
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->forkId:Ljava/lang/String;

    .line 191
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->mergeId:Ljava/lang/String;

    .line 355
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 356
    new-instance v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;

    invoke-direct {v1, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;)V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->semaphore:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;

    .line 358
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 360
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->isReliable()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 361
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    iget v2, v1, Landroid/gov/nist/javax/sip/stack/MessageChannel;->useCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Landroid/gov/nist/javax/sip/stack/MessageChannel;->useCount:I

    .line 362
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 363
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "use count for encapsulated channel"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    iget v3, v3, Landroid/gov/nist/javax/sip/stack/MessageChannel;->useCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 370
    :cond_0
    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->currentState:I

    .line 372
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->disableRetransmissionTimer()V

    .line 373
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->disableTimeoutTimer()V

    .line 374
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->eventListeners:Ljava/util/Set;

    .line 378
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->addEventListener(Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;)V

    .line 380
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->releaseReferencesStrategy:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    .line 381
    return-void
.end method

.method static synthetic access$000()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 89
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method

.method static synthetic access$102(Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;)Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;
    .locals 0
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;
    .param p1, "x1"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;

    .line 89
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->maxTxLifeTimeListener:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;

    return-object p1
.end method


# virtual methods
.method public acquireSem()Z
    .locals 5

    .line 1283
    const/4 v0, 0x0

    .line 1284
    .local v0, "retval":Z
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1285
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "acquireSem [[[["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1286
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 1288
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxListenerResponseTime:I

    const/4 v3, -0x1

    if-ne v1, v3, :cond_1

    .line 1289
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->semaphore:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->acquire()Z

    move-result v0

    goto :goto_0

    .line 1291
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->semaphore:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->tryAcquire()Z

    move-result v0

    .line 1293
    :goto_0
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1294
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "acquireSem() returning : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1296
    :cond_2
    return v0
.end method

.method public addEventListener(Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;)V
    .locals 1
    .param p1, "newListener"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;

    .line 961
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->eventListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 962
    return-void
.end method

.method public cancelMaxTxLifeTimeTimer()V
    .locals 3

    .line 1693
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->maxTxLifeTimeListener:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;

    if-eqz v0, :cond_1

    .line 1694
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1695
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cancelling MaxTxLifeTimeListener for tx "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " , tx id "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getTransactionId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " , state "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1697
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->maxTxLifeTimeListener:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;

    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 1698
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->maxTxLifeTimeListener:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;

    .line 1700
    :cond_1
    return-void
.end method

.method public abstract cleanUp()V
.end method

.method public close()V
    .locals 3

    .line 1204
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->close()V

    .line 1205
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1206
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Closing "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1208
    :cond_0
    return-void
.end method

.method public disableRetransmissionTimer()V
    .locals 1

    .line 644
    const/4 v0, -0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->retransmissionTimerTicksLeft:I

    .line 645
    return-void
.end method

.method public disableTimeoutTimer()V
    .locals 3

    .line 669
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "disableTimeoutTimer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 670
    :cond_0
    const/4 v0, -0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->timeoutTimerTicksLeft:I

    .line 671
    return-void
.end method

.method public doesCancelMatchTransaction(Landroid/gov/nist/javax/sip/message/SIPRequest;)Z
    .locals 8
    .param p1, "requestToTest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 1109
    const/4 v0, 0x0

    .line 1110
    .local v0, "transactionMatches":Z
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v1

    .line 1111
    .local v1, "origRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    if-eqz v1, :cond_5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v2

    const-string v3, "CANCEL"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_1

    .line 1115
    :cond_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v2

    .line 1116
    .local v2, "topViaHeader":Landroid/gov/nist/javax/sip/header/Via;
    if-eqz v2, :cond_4

    .line 1119
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v3

    .line 1120
    .local v3, "messageBranch":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 1124
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "z9hg4bk"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1129
    const/4 v3, 0x0

    .line 1136
    :cond_1
    const/16 v4, 0x20

    if-eqz v3, :cond_2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 1140
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/Via;->getSentBy()Landroid/gov/nist/core/HostPort;

    move-result-object v5

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v6

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/header/Via;->getSentBy()Landroid/gov/nist/core/HostPort;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/HostPort;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1143
    const/4 v0, 0x1

    .line 1144
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1145
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v5, "returning  true"

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1153
    :cond_2
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1154
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "testing against "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1157
    :cond_3
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v4

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v4

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/javax/sip/header/ToHeader;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v4

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/javax/sip/header/FromHeader;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v4

    invoke-interface {v4}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v5

    invoke-interface {v5}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v4

    invoke-interface {v4}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v4

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v6

    invoke-interface {v6}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-nez v4, :cond_4

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/gov/nist/javax/sip/header/Via;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1169
    const/4 v0, 0x1

    .line 1176
    .end local v3    # "messageBranch":Ljava/lang/String;
    :cond_4
    :goto_0
    return v0

    .line 1113
    .end local v2    # "topViaHeader":Landroid/gov/nist/javax/sip/header/Via;
    :cond_5
    :goto_1
    const/4 v2, 0x0

    return v2
.end method

.method protected enableRetransmissionTimer()V
    .locals 1

    .line 615
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->enableRetransmissionTimer(I)V

    .line 616
    return-void
.end method

.method protected enableRetransmissionTimer(I)V
    .locals 1
    .param p1, "tickCount"    # I

    .line 628
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->isInviteTransaction()Z

    move-result v0

    if-eqz v0, :cond_0

    instance-of v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    if-eqz v0, :cond_0

    .line 629
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->retransmissionTimerTicksLeft:I

    goto :goto_0

    .line 632
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getTimerT2()I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->retransmissionTimerTicksLeft:I

    .line 635
    :goto_0
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->retransmissionTimerTicksLeft:I

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->retransmissionTimerLastTickCount:I

    .line 636
    return-void
.end method

.method protected enableTimeoutTimer(I)V
    .locals 3
    .param p1, "tickCount"    # I

    .line 655
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 656
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "enableTimeoutTimer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " tickCount "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " currentTickCount = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->timeoutTimerTicksLeft:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 660
    :cond_0
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->timeoutTimerTicksLeft:I

    .line 661
    return-void
.end method

.method public extractCertIdentities()Ljava/util/List;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLPeerUnverifiedException;
        }
    .end annotation

    .line 1424
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    instance-of v0, v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    if-nez v0, :cond_1

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    instance-of v0, v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1518
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not a TLS channel"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1425
    :cond_1
    :goto_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v0

    .line 1426
    .local v1, "certIdentities":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v2

    .line 1427
    .local v2, "certs":[Ljava/security/cert/Certificate;
    const/16 v3, 0x20

    if-nez v2, :cond_3

    .line 1428
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1429
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "No certificates available"

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1431
    :cond_2
    return-object v1

    .line 1433
    :cond_3
    move-object v4, v2

    .local v4, "arr$":[Ljava/security/cert/Certificate;
    array-length v5, v4

    .local v5, "len$":I
    const/4 v0, 0x0

    move v6, v0

    .local v6, "i$":I
    :goto_1
    if-ge v6, v5, :cond_14

    aget-object v7, v4, v6

    .line 1434
    .local v7, "cert":Ljava/security/cert/Certificate;
    move-object v8, v7

    check-cast v8, Ljava/security/cert/X509Certificate;

    .line 1435
    .local v8, "x509cert":Ljava/security/cert/X509Certificate;
    const/4 v9, 0x0

    .line 1437
    .local v9, "subjAltNames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/List<*>;>;"
    :try_start_0
    invoke-virtual {v8}, Ljava/security/cert/X509Certificate;->getSubjectAlternativeNames()Ljava/util/Collection;

    move-result-object v0
    :try_end_0
    .catch Ljava/security/cert/CertificateParsingException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v9, v0

    .line 1442
    goto :goto_2

    .line 1438
    :catch_0
    move-exception v0

    move-object v10, v0

    move-object v0, v10

    .line 1439
    .local v0, "ex":Ljava/security/cert/CertificateParsingException;
    sget-object v10, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v10}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v10

    if-eqz v10, :cond_4

    .line 1440
    sget-object v10, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v11, "Error parsing TLS certificate"

    invoke-interface {v10, v11, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1444
    .end local v0    # "ex":Ljava/security/cert/CertificateParsingException;
    :cond_4
    :goto_2
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    .line 1445
    .local v10, "dnsNameType":Ljava/lang/Integer;
    const/4 v0, 0x6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 1446
    .local v11, "uriNameType":Ljava/lang/Integer;
    const/4 v12, 0x1

    if-eqz v9, :cond_10

    .line 1447
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1448
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "found subjAltNames: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v0, v13}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1451
    :cond_5
    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v14, 0x0

    if-eqz v0, :cond_b

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v15, v0

    check-cast v15, Ljava/util/List;

    .line 1454
    .local v15, "altName":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-interface {v15, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 1457
    :try_start_1
    new-instance v0, Landroid/gov/nist/javax/sip/address/AddressFactoryImpl;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/AddressFactoryImpl;-><init>()V

    invoke-interface {v15, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v0, v14}, Landroid/gov/nist/javax/sip/address/AddressFactoryImpl;->createSipURI(Ljava/lang/String;)Landroid/javax/sip/address/SipURI;

    move-result-object v0

    .line 1459
    .local v0, "altNameUri":Landroid/javax/sip/address/SipURI;
    const-string/jumbo v14, "sip"

    invoke-interface {v0}, Landroid/javax/sip/address/SipURI;->getScheme()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v14, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_6

    .line 1460
    const/4 v12, 0x1

    goto :goto_3

    .line 1462
    :cond_6
    invoke-interface {v0}, Landroid/javax/sip/address/SipURI;->getUser()Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_7

    .line 1463
    const/4 v12, 0x1

    goto :goto_3

    .line 1464
    :cond_7
    invoke-interface {v0}, Landroid/javax/sip/address/SipURI;->getHost()Ljava/lang/String;

    move-result-object v12

    .line 1465
    .local v12, "altHostName":Ljava/lang/String;
    sget-object v14, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v14, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v14

    if-eqz v14, :cond_8

    .line 1466
    sget-object v14, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v16, v0

    .end local v0    # "altNameUri":Landroid/javax/sip/address/SipURI;
    .local v16, "altNameUri":Landroid/javax/sip/address/SipURI;
    const-string/jumbo v0, "found uri "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_2

    move-object/from16 v17, v2

    const/4 v3, 0x1

    .end local v2    # "certs":[Ljava/security/cert/Certificate;
    .local v17, "certs":[Ljava/security/cert/Certificate;
    :try_start_2
    invoke-interface {v15, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", hostName "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v14, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_4

    .line 1465
    .end local v16    # "altNameUri":Landroid/javax/sip/address/SipURI;
    .end local v17    # "certs":[Ljava/security/cert/Certificate;
    .restart local v0    # "altNameUri":Landroid/javax/sip/address/SipURI;
    .restart local v2    # "certs":[Ljava/security/cert/Certificate;
    :cond_8
    move-object/from16 v16, v0

    move-object/from16 v17, v2

    .line 1469
    .end local v0    # "altNameUri":Landroid/javax/sip/address/SipURI;
    .end local v2    # "certs":[Ljava/security/cert/Certificate;
    .restart local v16    # "altNameUri":Landroid/javax/sip/address/SipURI;
    .restart local v17    # "certs":[Ljava/security/cert/Certificate;
    :goto_4
    invoke-interface {v1, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_1

    .line 1475
    nop

    .end local v12    # "altHostName":Ljava/lang/String;
    goto :goto_6

    .line 1470
    .end local v16    # "altNameUri":Landroid/javax/sip/address/SipURI;
    :catch_1
    move-exception v0

    goto :goto_5

    .end local v17    # "certs":[Ljava/security/cert/Certificate;
    .restart local v2    # "certs":[Ljava/security/cert/Certificate;
    :catch_2
    move-exception v0

    move-object/from16 v17, v2

    .line 1471
    .end local v2    # "certs":[Ljava/security/cert/Certificate;
    .local v0, "e":Ljava/text/ParseException;
    .restart local v17    # "certs":[Ljava/security/cert/Certificate;
    :goto_5
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 1472
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "certificate contains invalid uri: "

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v12, 0x1

    invoke-interface {v15, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    goto :goto_6

    .line 1454
    .end local v0    # "e":Ljava/text/ParseException;
    .end local v17    # "certs":[Ljava/security/cert/Certificate;
    .restart local v2    # "certs":[Ljava/security/cert/Certificate;
    :cond_9
    move-object/from16 v17, v2

    .line 1478
    .end local v2    # "certs":[Ljava/security/cert/Certificate;
    .end local v15    # "altName":Ljava/util/List;, "Ljava/util/List<*>;"
    .restart local v17    # "certs":[Ljava/security/cert/Certificate;
    :cond_a
    :goto_6
    move-object/from16 v2, v17

    const/16 v3, 0x20

    const/4 v12, 0x1

    goto/16 :goto_3

    .line 1451
    .end local v17    # "certs":[Ljava/security/cert/Certificate;
    .restart local v2    # "certs":[Ljava/security/cert/Certificate;
    :cond_b
    move-object/from16 v17, v2

    .line 1483
    .end local v2    # "certs":[Ljava/security/cert/Certificate;
    .end local v13    # "i$":Ljava/util/Iterator;
    .restart local v17    # "certs":[Ljava/security/cert/Certificate;
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1484
    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 1485
    .local v2, "altName":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-interface {v2, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 1486
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v12, 0x20

    invoke-interface {v3, v12}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 1487
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "found dns "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/4 v13, 0x1

    invoke-interface {v2, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v3, v12}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_8

    .line 1486
    :cond_c
    const/4 v13, 0x1

    .line 1489
    :goto_8
    invoke-interface {v2, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1491
    .end local v2    # "altName":Ljava/util/List;, "Ljava/util/List<*>;"
    :cond_d
    goto :goto_7

    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_e
    const/16 v13, 0x20

    goto :goto_b

    .line 1483
    :cond_f
    const/16 v13, 0x20

    goto :goto_b

    .line 1498
    .end local v17    # "certs":[Ljava/security/cert/Certificate;
    .local v2, "certs":[Ljava/security/cert/Certificate;
    :cond_10
    move-object/from16 v17, v2

    .end local v2    # "certs":[Ljava/security/cert/Certificate;
    .restart local v17    # "certs":[Ljava/security/cert/Certificate;
    invoke-virtual {v8}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v0

    invoke-interface {v0}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1499
    .local v2, "dname":Ljava/lang/String;
    const-string v3, ""

    .line 1501
    .local v3, "cname":Ljava/lang/String;
    :try_start_3
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->EXTRACT_CN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 1502
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v12

    if-eqz v12, :cond_12

    .line 1503
    const/4 v12, 0x1

    invoke-virtual {v0, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    move-object v3, v12

    .line 1504
    sget-object v12, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    const/16 v13, 0x20

    :try_start_4
    invoke-interface {v12, v13}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v12

    if-eqz v12, :cond_11

    .line 1505
    sget-object v12, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "found CN: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " from DN: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v12, v14}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1507
    :cond_11
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_9

    .line 1509
    .end local v0    # "matcher":Ljava/util/regex/Matcher;
    :catch_3
    move-exception v0

    goto :goto_a

    .line 1502
    .restart local v0    # "matcher":Ljava/util/regex/Matcher;
    :cond_12
    const/16 v13, 0x20

    .line 1513
    .end local v0    # "matcher":Ljava/util/regex/Matcher;
    :goto_9
    goto :goto_b

    .line 1509
    :catch_4
    move-exception v0

    const/16 v13, 0x20

    .line 1510
    .local v0, "ex":Ljava/lang/Exception;
    :goto_a
    sget-object v12, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v12}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v12

    if-eqz v12, :cond_13

    .line 1511
    sget-object v12, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v14, "exception while extracting CN"

    invoke-interface {v12, v14, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1433
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v2    # "dname":Ljava/lang/String;
    .end local v3    # "cname":Ljava/lang/String;
    .end local v7    # "cert":Ljava/security/cert/Certificate;
    .end local v8    # "x509cert":Ljava/security/cert/X509Certificate;
    .end local v9    # "subjAltNames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/List<*>;>;"
    .end local v10    # "dnsNameType":Ljava/lang/Integer;
    .end local v11    # "uriNameType":Ljava/lang/Integer;
    :cond_13
    :goto_b
    add-int/lit8 v6, v6, 0x1

    move v3, v13

    move-object/from16 v2, v17

    goto/16 :goto_1

    .line 1516
    .end local v4    # "arr$":[Ljava/security/cert/Certificate;
    .end local v5    # "len$":I
    .end local v6    # "i$":I
    .end local v17    # "certs":[Ljava/security/cert/Certificate;
    .local v2, "certs":[Ljava/security/cert/Certificate;
    :cond_14
    return-object v1
.end method

.method public fireTimer()V
    .locals 2

    .line 681
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->timeoutTimerTicksLeft:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 683
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->timeoutTimerTicksLeft:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->timeoutTimerTicksLeft:I

    if-nez v0, :cond_0

    .line 684
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->fireTimeoutTimer()V

    .line 689
    :cond_0
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->retransmissionTimerTicksLeft:I

    if-eq v0, v1, :cond_1

    .line 691
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->retransmissionTimerTicksLeft:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->retransmissionTimerTicksLeft:I

    if-nez v0, :cond_1

    .line 694
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->retransmissionTimerLastTickCount:I

    mul-int/lit8 v0, v0, 0x2

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->enableRetransmissionTimer(I)V

    .line 696
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->fireRetransmissionTimer()V

    .line 699
    :cond_1
    return-void
.end method

.method public getApplicationData()Ljava/lang/Object;
    .locals 1

    .line 1240
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->applicationData:Ljava/lang/Object;

    return-object v0
.end method

.method public getAuditTag()J
    .locals 2

    .line 1718
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->auditTag:J

    return-wide v0
.end method

.method public getBaseTimerInterval()I
    .locals 1

    .line 1612
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->baseTimerInterval:I

    return v0
.end method

.method public getBranch()Ljava/lang/String;
    .locals 1

    .line 535
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->branch:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 536
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequestBranch:Ljava/lang/String;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->branch:Ljava/lang/String;

    .line 538
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->branch:Ljava/lang/String;

    return-object v0
.end method

.method public getBranchId()Ljava/lang/String;
    .locals 1

    .line 202
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->branch:Ljava/lang/String;

    return-object v0
.end method

.method public getCSeq()J
    .locals 2

    .line 554
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequestCSeqNumber:J

    return-wide v0
.end method

.method public getCipherSuite()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .line 1363
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    instance-of v0, v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 1364
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1365
    return-object v1

    .line 1366
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->getHandshakeCompletedEvent()Ljavax/net/ssl/HandshakeCompletedEvent;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1367
    return-object v1

    .line 1368
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->getHandshakeCompletedEvent()Ljavax/net/ssl/HandshakeCompletedEvent;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/net/ssl/HandshakeCompletedEvent;->getCipherSuite()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1370
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    instance-of v0, v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    if-eqz v0, :cond_4

    .line 1371
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v0

    if-nez v0, :cond_3

    .line 1372
    return-object v1

    .line 1373
    :cond_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->getCipherSuite()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1374
    :cond_4
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not a TLS channel"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public abstract getDialog()Landroid/javax/sip/Dialog;
.end method

.method public getForkId()Ljava/lang/String;
    .locals 1

    .line 1661
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->forkId:Ljava/lang/String;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .line 714
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getHost()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getInternalState()I
    .locals 1

    .line 596
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->currentState:I

    return v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .line 722
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLastResponse()Landroid/gov/nist/javax/sip/message/SIPResponse;
    .locals 1

    .line 1056
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    return-object v0
.end method

.method public getLocalCertificates()[Ljava/security/cert/Certificate;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .line 1384
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    instance-of v0, v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 1385
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1386
    return-object v1

    .line 1387
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->getHandshakeCompletedEvent()Ljavax/net/ssl/HandshakeCompletedEvent;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1388
    return-object v1

    .line 1389
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->getHandshakeCompletedEvent()Ljavax/net/ssl/HandshakeCompletedEvent;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/net/ssl/HandshakeCompletedEvent;->getLocalCertificates()[Ljava/security/cert/Certificate;

    move-result-object v0

    return-object v0

    .line 1391
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    instance-of v0, v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    if-eqz v0, :cond_4

    .line 1392
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v0

    if-nez v0, :cond_3

    .line 1393
    return-object v1

    .line 1394
    :cond_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->getLocalCertificates()[Ljava/security/cert/Certificate;

    move-result-object v0

    return-object v0

    .line 1395
    :cond_4
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not a TLS channel"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getMergeId()Ljava/lang/String;
    .locals 1

    .line 1707
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->mergeId:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 1708
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMergeId()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1710
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->mergeId:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .locals 1

    .line 519
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    return-object v0
.end method

.method public getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .locals 1

    .line 1223
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    return-object v0
.end method

.method public getMethod()Ljava/lang/String;
    .locals 1

    .line 546
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->method:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;
    .locals 1

    .line 452
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    return-object v0
.end method

.method public getPeerAddress()Ljava/lang/String;
    .locals 1

    .line 746
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPeerCertificates()[Ljava/security/cert/Certificate;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLPeerUnverifiedException;
        }
    .end annotation

    .line 1404
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    instance-of v0, v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 1405
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1406
    return-object v1

    .line 1407
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->getHandshakeCompletedEvent()Ljavax/net/ssl/HandshakeCompletedEvent;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1408
    return-object v1

    .line 1409
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->getHandshakeCompletedEvent()Ljavax/net/ssl/HandshakeCompletedEvent;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/net/ssl/HandshakeCompletedEvent;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v0

    return-object v0

    .line 1411
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    instance-of v0, v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    if-eqz v0, :cond_4

    .line 1412
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v0

    if-nez v0, :cond_3

    .line 1413
    return-object v1

    .line 1414
    :cond_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getHandshakeCompletedListener()Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v0

    return-object v0

    .line 1415
    :cond_4
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not a TLS channel"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPeerInetAddress()Ljava/net/InetAddress;
    .locals 1

    .line 775
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public getPeerPacketSourceAddress()Ljava/net/InetAddress;
    .locals 1

    .line 771
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerPacketSourceAddress()Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public getPeerPacketSourcePort()I
    .locals 1

    .line 763
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerPacketSourcePort()I

    move-result v0

    return v0
.end method

.method public getPeerPort()I
    .locals 1

    .line 754
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerPort()I

    move-result v0

    return v0
.end method

.method public getPeerProtocol()Ljava/lang/String;
    .locals 1

    .line 779
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerProtocol()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .line 730
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPort()I

    move-result v0

    return v0
.end method

.method public getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;
    .locals 1

    .line 1537
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->releaseReferencesStrategy:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    return-object v0
.end method

.method public getRequest()Landroid/javax/sip/message/Request;
    .locals 5

    .line 460
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v0

    sget-object v1, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->None:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-nez v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequestBytes:[B

    if-eqz v0, :cond_1

    .line 461
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x8

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 462
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "reparsing original request "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequestBytes:[B

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " since it was eagerly cleaned up, but beware this is not efficient with the aggressive flag set !"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 465
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageParserFactory()Landroid/gov/nist/javax/sip/parser/MessageParserFactory;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/parser/MessageParserFactory;->createMessageParser(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)Landroid/gov/nist/javax/sip/parser/MessageParser;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequestBytes:[B

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-interface {v0, v1, v4, v2, v3}, Landroid/gov/nist/javax/sip/parser/MessageParser;->parseSIPMessage([BZZLandroid/gov/nist/javax/sip/parser/ParseExceptionListener;)Landroid/gov/nist/javax/sip/message/SIPMessage;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 471
    goto :goto_0

    .line 467
    :catch_0
    move-exception v0

    .line 468
    .local v0, "e":Ljava/text/ParseException;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 469
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "message "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequestBytes:[B

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " could not be reparsed !"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 473
    .end local v0    # "e":Ljava/text/ParseException;
    :cond_1
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    return-object v0
.end method

.method public getResponse()Landroid/javax/sip/message/Response;
    .locals 1

    .line 1064
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    return-object v0
.end method

.method public getRetransmitTimer()I
    .locals 1

    .line 1039
    const/16 v0, 0x1f4

    return v0
.end method

.method public getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .locals 1

    .line 738
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    return-object v0
.end method

.method public getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;
    .locals 1

    .line 1260
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getListeningPoint()Landroid/gov/nist/javax/sip/ListeningPointImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getSipProvider()Landroid/javax/sip/SipProvider;
    .locals 1

    .line 89
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v0

    return-object v0
.end method

.method public getState()Landroid/javax/sip/TransactionState;
    .locals 1

    .line 604
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->currentState:I

    if-gez v0, :cond_0

    .line 605
    const/4 v0, 0x0

    return-object v0

    .line 607
    :cond_0
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->currentState:I

    invoke-static {v0}, Landroid/javax/sip/TransactionState;->getObject(I)Landroid/javax/sip/TransactionState;

    move-result-object v0

    return-object v0
.end method

.method public getT2()I
    .locals 1

    .line 1628
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->T2:I

    return v0
.end method

.method public getT4()I
    .locals 1

    .line 1620
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->T4:I

    return v0
.end method

.method public getTimerD()I
    .locals 1

    .line 1558
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->timerD:I

    return v0
.end method

.method public getTimerI()I
    .locals 1

    .line 1636
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->timerI:I

    return v0
.end method

.method public getTimerK()I
    .locals 1

    .line 1644
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->timerK:I

    return v0
.end method

.method public getTimerT2()I
    .locals 1

    .line 1565
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->T2:I

    return v0
.end method

.method public getTimerT4()I
    .locals 1

    .line 1573
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->T4:I

    return v0
.end method

.method public getTransactionId()Ljava/lang/String;
    .locals 1

    .line 1072
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->transactionId:Ljava/lang/String;

    return-object v0
.end method

.method public getTransport()Ljava/lang/String;
    .locals 1

    .line 787
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getViaHeader()Landroid/gov/nist/javax/sip/header/Via;
    .locals 2

    .line 808
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getViaHeader()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v0

    .line 810
    .local v0, "channelViaHeader":Landroid/gov/nist/javax/sip/header/Via;
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->branch:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/Via;->setBranch(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 812
    goto :goto_0

    .line 811
    :catch_0
    move-exception v1

    .line 813
    :goto_0
    return-object v0
.end method

.method public getViaHost()Ljava/lang/String;
    .locals 1

    .line 1047
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getViaHeader()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getHost()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getViaPort()I
    .locals 1

    .line 1091
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getViaHeader()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getPort()I

    move-result v0

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 1080
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->transactionId:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 1081
    const/4 v0, -0x1

    return v0

    .line 1083
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->transactionId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isByeTransaction()Z
    .locals 2

    .line 511
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string v1, "BYE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isCancelTransaction()Z
    .locals 2

    .line 503
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CANCEL"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isDialogCreatingTransaction()Z
    .locals 2

    .line 481
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->dialogCreatingTransaction:Ljava/lang/Boolean;

    if-nez v0, :cond_2

    .line 482
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->isInviteTransaction()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "SUBSCRIBE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "REFER"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->dialogCreatingTransaction:Ljava/lang/Boolean;

    .line 484
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->dialogCreatingTransaction:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public isInviteTransaction()Z
    .locals 2

    .line 492
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->inviteTransaction:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 493
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string v1, "INVITE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->inviteTransaction:Ljava/lang/Boolean;

    .line 495
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->inviteTransaction:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public abstract isMessagePartOfTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;)Z
.end method

.method public isReliable()Z
    .locals 1

    .line 795
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->isReliable()Z

    move-result v0

    return v0
.end method

.method public isSecure()Z
    .locals 1

    .line 1215
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->isSecure()Z

    move-result v0

    return v0
.end method

.method public isServerTransaction()Z
    .locals 1

    .line 1019
    instance-of v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    return v0
.end method

.method public isTerminated()Z
    .locals 2

    .line 706
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->currentState:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isTransactionMapped()Z
    .locals 1

    .line 1734
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->isMapped:Z

    return v0
.end method

.method public passToListener()Z
    .locals 1

    .line 1332
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->toListener:Z

    return v0
.end method

.method public raiseErrorEvent(I)V
    .locals 4
    .param p1, "errorEventID"    # I

    .line 986
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;

    invoke-direct {v0, p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransaction;I)V

    .line 989
    .local v0, "newErrorEvent":Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->eventListeners:Ljava/util/Set;

    monitor-enter v1

    .line 990
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->eventListeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 991
    .local v2, "listenerIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 993
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;

    .line 995
    .local v3, "nextListener":Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;
    invoke-interface {v3, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;->transactionErrorEvent(Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;)V

    goto :goto_0

    .line 997
    .end local v3    # "nextListener":Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1001
    const/4 v1, 0x3

    if-eq p1, v1, :cond_1

    .line 1002
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->eventListeners:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->clear()V

    .line 1005
    const/4 v3, 0x5

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->setState(I)V

    .line 1007
    instance-of v3, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->isByeTransaction()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 1009
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v3, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    .line 1012
    :cond_1
    return-void

    .line 997
    .end local v2    # "listenerIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;>;"
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method public raiseIOExceptionEvent()V
    .locals 5

    .line 1269
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->setState(I)V

    .line 1270
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getPeerAddress()Ljava/lang/String;

    move-result-object v0

    .line 1271
    .local v0, "host":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getPeerPort()I

    move-result v1

    .line 1272
    .local v1, "port":I
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getTransport()Ljava/lang/String;

    move-result-object v2

    .line 1273
    .local v2, "transport":Ljava/lang/String;
    new-instance v3, Landroid/javax/sip/IOExceptionEvent;

    invoke-direct {v3, p0, v0, v1, v2}, Landroid/javax/sip/IOExceptionEvent;-><init>(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/String;)V

    .line 1275
    .local v3, "exceptionEvent":Landroid/javax/sip/IOExceptionEvent;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v4

    invoke-virtual {v4, v3, p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1276
    return-void
.end method

.method public releaseSem()V
    .locals 3

    .line 1307
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->toListener:Z

    .line 1308
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->semRelease()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1314
    goto :goto_0

    .line 1310
    :catch_0
    move-exception v0

    .line 1311
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "Unexpected exception releasing sem"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1316
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public removeEventListener(Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;)V
    .locals 1
    .param p1, "oldListener"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;

    .line 969
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->eventListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 970
    return-void
.end method

.method public scheduleMaxTxLifeTimeTimer()V
    .locals 9

    .line 1669
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->maxTxLifeTimeListener:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;

    const-string v1, " , state "

    const-string v2, " , tx id "

    const-string/jumbo v3, "Scheduling MaxTxLifeTimeListener for tx "

    const/16 v4, 0x20

    const-string v5, "INVITE"

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxTxLifetimeInvite()I

    move-result v0

    if-lez v0, :cond_1

    .line 1670
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1671
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getTransactionId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1673
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;

    invoke-direct {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->maxTxLifeTimeListener:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;

    .line 1674
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->maxTxLifeTimeListener:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxTxLifetimeInvite()I

    move-result v7

    mul-int/lit16 v7, v7, 0x3e8

    int-to-long v7, v7

    invoke-interface {v0, v6, v7, v8}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    .line 1678
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->maxTxLifeTimeListener:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;

    if-nez v0, :cond_3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxTxLifetimeNonInvite()I

    move-result v0

    if-lez v0, :cond_3

    .line 1679
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1680
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getTransactionId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1682
    :cond_2
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;

    invoke-direct {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->maxTxLifeTimeListener:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;

    .line 1683
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->maxTxLifeTimeListener:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxTxLifetimeNonInvite()I

    move-result v2

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    invoke-interface {v0, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    .line 1686
    :cond_3
    return-void
.end method

.method public semRelease()V
    .locals 3

    .line 1319
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1320
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "semRelease ]]]]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1321
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 1323
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->semaphore:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->release()V

    .line 1324
    return-void
.end method

.method public sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .locals 10
    .param p1, "messageToSend"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 827
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/RawMessageChannel;

    .line 828
    .local v0, "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageProcessors()[Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v1

    .local v1, "arr$":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    array-length v2, v1

    .local v2, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v2, :cond_4

    aget-object v4, v1, v3

    .line 830
    .local v4, "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getPeerAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 831
    .local v5, "addrmatch":Z
    if-eqz v5, :cond_3

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getPort()I

    move-result v6

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getPeerPort()I

    move-result v7

    if-ne v6, v7, :cond_3

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getPeerProtocol()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 835
    instance-of v6, v0, Landroid/gov/nist/javax/sip/stack/TCPMessageChannel;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v7, 0x20

    if-eqz v6, :cond_1

    .line 838
    :try_start_1
    new-instance v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$1;

    invoke-direct {v6, p0, v0, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$1;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;Landroid/gov/nist/javax/sip/stack/RawMessageChannel;Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 856
    .local v6, "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v8

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSelfRoutingThreadpoolExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v8

    invoke-interface {v8, v6}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 862
    .end local v6    # "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    goto :goto_1

    .line 858
    :catch_0
    move-exception v6

    .line 860
    .local v6, "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v8, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v9, "Error passing message in self routing TCP"

    invoke-interface {v8, v9, v6}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 863
    .end local v6    # "e":Ljava/lang/Exception;
    :goto_1
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 864
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v7, "Self routing message TCP"

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 930
    :cond_0
    :goto_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->startTransactionTimer()V

    return-void

    .line 868
    :cond_1
    :try_start_3
    instance-of v6, v0, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v6, :cond_2

    .line 871
    :try_start_4
    new-instance v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$2;

    invoke-direct {v6, p0, v0, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$2;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;Landroid/gov/nist/javax/sip/stack/RawMessageChannel;Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 888
    .local v6, "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v8

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSelfRoutingThreadpoolExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v8

    invoke-interface {v8, v6}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 892
    .end local v6    # "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    goto :goto_3

    .line 890
    :catch_1
    move-exception v6

    .line 891
    .local v6, "e":Ljava/lang/Exception;
    :try_start_5
    sget-object v8, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v9, "Error passing message in TLS self routing"

    invoke-interface {v8, v9, v6}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 893
    .end local v6    # "e":Ljava/lang/Exception;
    :goto_3
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 894
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v7, "Self routing message TLS"

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_2

    .line 897
    :cond_2
    instance-of v6, v0, Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v6, :cond_3

    .line 900
    :try_start_6
    new-instance v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$3;

    invoke-direct {v6, p0, v0, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$3;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;Landroid/gov/nist/javax/sip/stack/RawMessageChannel;Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 916
    .local v6, "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v8

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSelfRoutingThreadpoolExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v8

    invoke-interface {v8, v6}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 919
    .end local v6    # "processMessageTask":Landroid/gov/nist/javax/sip/ThreadAffinityTask;
    goto :goto_4

    .line 917
    :catch_2
    move-exception v6

    .line 918
    .local v6, "e":Ljava/lang/Exception;
    :try_start_7
    sget-object v8, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v9, "Error passing message in self routing"

    invoke-interface {v8, v9, v6}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 920
    .end local v6    # "e":Ljava/lang/Exception;
    :goto_4
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 921
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v7, "Self routing message"

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_2

    .line 828
    .end local v4    # "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .end local v5    # "addrmatch":Z
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 927
    .end local v1    # "arr$":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .end local v2    # "len$":I
    .end local v3    # "i$":I
    :cond_4
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getPeerInetAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getPeerPort()I

    move-result v3

    invoke-virtual {v1, p1, v2, v3}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;I)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 930
    .end local v0    # "channel":Landroid/gov/nist/javax/sip/stack/RawMessageChannel;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->startTransactionTimer()V

    .line 931
    nop

    .line 932
    return-void

    .line 930
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->startTransactionTimer()V

    throw v0
.end method

.method public sendMessage([BLjava/net/InetAddress;IZ)V
    .locals 2
    .param p1, "messageBytes"    # [B
    .param p2, "receiverAddress"    # Ljava/net/InetAddress;
    .param p3, "receiverPort"    # I
    .param p4, "retry"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 952
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot send unparsed message through Transaction Channel!"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setApplicationData(Ljava/lang/Object;)V
    .locals 0
    .param p1, "applicationData"    # Ljava/lang/Object;

    .line 1232
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->applicationData:Ljava/lang/Object;

    .line 1233
    return-void
.end method

.method public setAuditTag(J)V
    .locals 0
    .param p1, "auditTag"    # J

    .line 1726
    iput-wide p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->auditTag:J

    .line 1727
    return-void
.end method

.method public setBranch(Ljava/lang/String;)V
    .locals 0
    .param p1, "newBranch"    # Ljava/lang/String;

    .line 527
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->branch:Ljava/lang/String;

    .line 528
    return-void
.end method

.method public setCollectionTime(I)V
    .locals 0
    .param p1, "collectionTime"    # I

    .line 1750
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->collectionTime:I

    .line 1751
    return-void
.end method

.method public abstract setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V
.end method

.method public setEncapsulatedChannel(Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
    .locals 2
    .param p1, "messageChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 1248
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 1249
    instance-of v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    if-eqz v0, :cond_0

    .line 1250
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-object v1, p0

    check-cast v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->setEncapsulatedClientTransaction(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V

    .line 1252
    :cond_0
    return-void
.end method

.method public setForkId(Ljava/lang/String;)V
    .locals 0
    .param p1, "forkId"    # Ljava/lang/String;

    .line 1653
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->forkId:Ljava/lang/String;

    .line 1654
    return-void
.end method

.method public setOriginalRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V
    .locals 7
    .param p1, "newOriginalRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 398
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTransactionId()Ljava/lang/String;

    move-result-object v0

    .line 399
    .local v0, "newTransactionId":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTransactionId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 402
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransactionHash(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 406
    :cond_0
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 407
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v1

    iput-wide v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequestCSeqNumber:J

    .line 408
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v1

    .line 409
    .local v1, "topmostVia":Landroid/gov/nist/javax/sip/header/Via;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequestBranch:Ljava/lang/String;

    .line 410
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->hasPort()Z

    move-result v2

    iput-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequestHasPort:Z

    .line 411
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->getPort()I

    move-result v2

    .line 413
    .local v2, "originalRequestViaPort":I
    const/4 v3, -0x1

    if-ne v2, v3, :cond_2

    .line 414
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->getTransport()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "TLS"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 415
    const/16 v2, 0x13c5

    goto :goto_0

    .line 417
    :cond_1
    const/16 v2, 0x13c4

    .line 423
    :cond_2
    :goto_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->method:Ljava/lang/String;

    .line 425
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->transactionId:Ljava/lang/String;

    .line 427
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v3, p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setTransaction(Ljava/lang/Object;)V

    .line 430
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v3

    .line 431
    .local v3, "newBranch":Ljava/lang/String;
    const/16 v4, 0x20

    if-eqz v3, :cond_4

    .line 432
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 433
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Setting Branch id : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 437
    :cond_3
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->setBranch(Ljava/lang/String;)V

    goto :goto_1

    .line 440
    :cond_4
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 441
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Branch id is null - compute TID!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->encode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 443
    :cond_5
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->setBranch(Ljava/lang/String;)V

    .line 445
    :goto_1
    return-void
.end method

.method public setPassToListener()V
    .locals 2

    .line 1340
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1341
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "setPassToListener()"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1343
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->toListener:Z

    .line 1345
    return-void
.end method

.method public setReleaseReferencesStrategy(Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;)V
    .locals 0
    .param p1, "releaseReferencesStrategy"    # Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    .line 1549
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->releaseReferencesStrategy:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    .line 1550
    return-void
.end method

.method public setRetransmitTimer(I)V
    .locals 2
    .param p1, "retransmitTimer"    # I

    .line 1185
    if-lez p1, :cond_1

    .line 1188
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->transactionTimerStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1191
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->baseTimerInterval:I

    .line 1197
    return-void

    .line 1189
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Transaction timer is already started"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1186
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Retransmit timer must be positive!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setState(I)V
    .locals 4
    .param p1, "newState"    # I

    .line 563
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->currentState:I

    const/4 v1, 0x4

    const/4 v2, 0x5

    const/4 v3, 0x3

    if-ne v0, v3, :cond_0

    .line 564
    if-eq p1, v2, :cond_0

    if-eq p1, v1, :cond_0

    .line 566
    const/4 p1, 0x3

    .line 568
    :cond_0
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->currentState:I

    if-ne v0, v1, :cond_1

    .line 569
    if-eq p1, v2, :cond_1

    .line 570
    const/4 p1, 0x4

    .line 572
    :cond_1
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->currentState:I

    if-eq v0, v2, :cond_2

    .line 573
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->currentState:I

    goto :goto_0

    .line 576
    :cond_2
    iget p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->currentState:I

    .line 579
    :goto_0
    if-ne p1, v3, :cond_3

    .line 580
    const/16 v0, 0x40

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->enableTimeoutTimer(I)V

    .line 583
    :cond_3
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 584
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Transaction:setState "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " branchID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " isClient = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    instance-of v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 587
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 589
    :cond_4
    return-void
.end method

.method public setTimerD(I)V
    .locals 2
    .param p1, "interval"    # I

    .line 1581
    const/16 v0, 0x7d00

    if-lt p1, v0, :cond_0

    .line 1584
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->baseTimerInterval:I

    div-int v0, p1, v0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->timerD:I

    .line 1585
    return-void

    .line 1582
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "To be RFC 3261 compliant, the value of Timer D should be at least 32s"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setTimerT2(I)V
    .locals 1
    .param p1, "interval"    # I

    .line 1593
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->baseTimerInterval:I

    div-int v0, p1, v0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->T2:I

    .line 1594
    return-void
.end method

.method public setTimerT4(I)V
    .locals 1
    .param p1, "interval"    # I

    .line 1602
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->baseTimerInterval:I

    div-int v0, p1, v0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->T4:I

    .line 1603
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->T4:I

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->timerI:I

    .line 1604
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->T4:I

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->timerK:I

    .line 1605
    return-void
.end method

.method public setTransactionMapped(Z)V
    .locals 0
    .param p1, "transactionMapped"    # Z

    .line 1742
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->isMapped:Z

    .line 1743
    return-void
.end method

.method public declared-synchronized testAndSetTransactionTerminatedEvent()Z
    .locals 2

    monitor-enter p0

    .line 1353
    :try_start_0
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->terminatedEventDelivered:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1354
    .local v0, "retval":Z
    :goto_0
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->terminatedEventDelivered:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1355
    monitor-exit p0

    return v0

    .line 1352
    .end local v0    # "retval":Z
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
