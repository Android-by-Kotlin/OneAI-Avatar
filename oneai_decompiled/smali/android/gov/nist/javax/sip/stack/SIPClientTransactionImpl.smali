.class public Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;
.super Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;
.source "SIPClientTransactionImpl.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$ExpiresTimerTask;,
        Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$TransactionTimer;
    }
.end annotation


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private callingStateTimeoutCount:I

.field private defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

.field private defaultDialogId:Ljava/lang/String;

.field private lastRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

.field private nextHop:Landroid/javax/sip/address/Hop;

.field private notifyOnRetransmit:Z

.field private originalRequestCallId:Ljava/lang/String;

.field private originalRequestContact:Landroid/gov/nist/javax/sip/header/Contact;

.field private originalRequestEventHeader:Landroid/gov/nist/javax/sip/header/Event;

.field private originalRequestFromTag:Ljava/lang/String;

.field private originalRequestScheme:Ljava/lang/String;

.field private transient respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

.field private responsesReceived:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private sipDialogs:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private terminateDialogOnCleanUp:Z

.field private timeoutIfStillInCallingState:Z

.field private timerKStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private transient transactionTimer:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

.field private transactionTimerCancelled:Z

.field private transient transactionTimerLock:Ljava/lang/Object;

.field private viaHost:Ljava/lang/String;

.field private viaPort:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 189
    const-class v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method protected constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
    .locals 3
    .param p1, "newSIPStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "newChannelToUse"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 320
    invoke-direct {p0, p1, p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V

    .line 228
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimerLock:Ljava/lang/Object;

    .line 229
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->timerKStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 230
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimerCancelled:Z

    .line 231
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->responsesReceived:Ljava/util/Set;

    .line 233
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->terminateDialogOnCleanUp:Z

    .line 322
    invoke-static {}, Landroid/gov/nist/javax/sip/Utils;->getInstance()Landroid/gov/nist/javax/sip/Utils;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/Utils;->generateBranchId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setBranch(Ljava/lang/String;)V

    .line 323
    invoke-virtual {p0, p2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setEncapsulatedChannel(Landroid/gov/nist/javax/sip/stack/MessageChannel;)V

    .line 324
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->notifyOnRetransmit:Z

    .line 325
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->timeoutIfStillInCallingState:Z

    .line 327
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 328
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Creating clientTransaction "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 329
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 332
    :cond_0
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipDialogs:Ljava/util/Set;

    .line 333
    return-void
.end method

.method static synthetic access$000()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 188
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method

.method private final createErrorAck()Landroid/javax/sip/message/Request;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;,
            Ljava/text/ParseException;
        }
    .end annotation

    .line 1353
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v0

    .line 1354
    .local v0, "originalRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    if-eqz v0, :cond_4

    .line 1356
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isInviteTransaction()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1358
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    if-eqz v1, :cond_2

    .line 1360
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ge v1, v2, :cond_1

    .line 1361
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1362
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "lastResponse = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1364
    :cond_0
    new-instance v1, Landroid/javax/sip/SipException;

    const-string v2, "Cannot ACK a provisional response!"

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1366
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/To;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createErrorAck(Landroid/gov/nist/javax/sip/header/To;)Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v1

    return-object v1

    .line 1359
    :cond_2
    new-instance v1, Landroid/javax/sip/SipException;

    const-string/jumbo v2, "bad Transaction state"

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1357
    :cond_3
    new-instance v1, Landroid/javax/sip/SipException;

    const-string v2, "Can only ACK an INVITE!"

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1355
    :cond_4
    new-instance v1, Landroid/javax/sip/SipException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "bad state "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private inviteClientTransaction(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V
    .locals 10
    .param p1, "transactionResponse"    # Landroid/gov/nist/javax/sip/message/SIPResponse;
    .param p2, "sourceChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .param p3, "dialog"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 798
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v0

    .line 800
    .local v0, "statusCode":I
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v1

    const/16 v2, 0x12c

    const/4 v3, 0x5

    if-ne v3, v1, :cond_c

    .line 801
    const/4 v1, 0x0

    .line 803
    .local v1, "ackAlreadySent":Z
    if-eqz p3, :cond_0

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v3

    invoke-virtual {p3, v3, v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isAckSent(J)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 804
    invoke-virtual {p3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLastAckSentCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v3

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v5

    invoke-interface {v5}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_0

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFromTag()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLastAckSentFromTag()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 809
    const/4 v1, 0x1

    .line 813
    :cond_0
    const/16 v3, 0x20

    if-eqz p3, :cond_2

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v4

    invoke-interface {v4}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getMethod()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 819
    :try_start_0
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 820
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v5, "resending ACK"

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 822
    :cond_1
    invoke-virtual {p3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->resendAck()V
    :try_end_0
    .catch Landroid/javax/sip/SipException; {:try_start_0 .. :try_end_0} :catch_0

    .line 825
    goto :goto_0

    .line 823
    :catch_0
    move-exception v4

    .line 827
    :cond_2
    :goto_0
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_3

    if-eqz p3, :cond_3

    .line 828
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Dialog "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " current state "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 829
    :cond_3
    const-string/jumbo v4, "passing 2xx response up to the application"

    const-string v5, " branch id "

    const-string v6, "Client Transaction "

    const/16 v7, 0xc8

    if-nez p3, :cond_7

    if-lt v0, v7, :cond_7

    if-ge v0, v2, :cond_7

    .line 841
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 842
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " doesn\'t have any dialog and is in TERMINATED state"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 844
    :cond_4
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    if-eqz v2, :cond_6

    .line 845
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 846
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 847
    :cond_5
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v2, p1, v3, p3}, Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;->processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    goto :goto_1

    .line 849
    :cond_6
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->semRelease()V

    .line 850
    return-void

    .line 852
    :cond_7
    if-eqz p3, :cond_b

    invoke-virtual {p3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v8

    sget-object v9, Landroid/javax/sip/DialogState;->EARLY:Landroid/javax/sip/DialogState;

    if-ne v8, v9, :cond_b

    if-lt v0, v7, :cond_b

    if-ge v0, v2, :cond_b

    .line 856
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 857
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " has a early dialog and is in TERMINATED state"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 858
    :cond_8
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setRetransmission(Z)V

    .line 859
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    if-eqz v2, :cond_a

    .line 860
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 861
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 862
    :cond_9
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v2, p1, v3, p3}, Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;->processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    .line 871
    .end local v1    # "ackAlreadySent":Z
    :goto_1
    goto/16 :goto_9

    .line 864
    .restart local v1    # "ackAlreadySent":Z
    :cond_a
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->semRelease()V

    .line 865
    return-void

    .line 868
    :cond_b
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->semRelease()V

    .line 869
    return-void

    .line 871
    .end local v1    # "ackAlreadySent":Z
    :cond_c
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v1

    const/4 v4, 0x1

    const/16 v5, 0x2bb

    const/4 v6, 0x3

    const/4 v7, 0x2

    if-nez v1, :cond_14

    .line 872
    div-int/lit8 v1, v0, 0x64

    if-ne v1, v7, :cond_e

    .line 877
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->disableRetransmissionTimer()V

    .line 878
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->disableTimeoutTimer()V

    .line 879
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 882
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    if-eqz v1, :cond_d

    .line 883
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v1, p1, v2, p3}, Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;->processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    goto/16 :goto_9

    .line 885
    :cond_d
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->semRelease()V

    goto/16 :goto_9

    .line 888
    :cond_e
    div-int/lit8 v1, v0, 0x64

    if-ne v1, v4, :cond_10

    .line 889
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->disableRetransmissionTimer()V

    .line 890
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->disableTimeoutTimer()V

    .line 891
    invoke-virtual {p0, v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 893
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    if-eqz v1, :cond_f

    .line 894
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v1, p1, v2, p3}, Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;->processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    goto/16 :goto_9

    .line 896
    :cond_f
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->semRelease()V

    goto/16 :goto_9

    .line 899
    :cond_10
    if-gt v2, v0, :cond_1d

    if-gt v0, v5, :cond_1d

    .line 903
    :try_start_1
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->createErrorAck()Landroid/javax/sip/message/Request;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 908
    goto :goto_2

    .line 905
    :catch_1
    move-exception v1

    .line 906
    .local v1, "ex":Ljava/lang/Exception;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v4, "Unexpected Exception sending ACK -- sending error AcK "

    invoke-interface {v2, v4, v1}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 917
    .end local v1    # "ex":Ljava/lang/Exception;
    :goto_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v1

    if-eqz v1, :cond_11

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isBackToBackUserAgent()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 918
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseAckSem()V

    .line 921
    :cond_11
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isReliable()Z

    move-result v1

    if-nez v1, :cond_12

    .line 922
    invoke-virtual {p0, v6}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 923
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->timerD:I

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->enableTimeoutTimer(I)V

    goto :goto_3

    .line 926
    :cond_12
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 928
    :goto_3
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    if-eqz v1, :cond_13

    .line 929
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v1, p1, v2, p3}, Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;->processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    goto :goto_4

    .line 931
    :cond_13
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->semRelease()V

    .line 933
    :goto_4
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->cleanUpOnTimer()V

    goto/16 :goto_9

    .line 935
    :cond_14
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v1

    if-ne v7, v1, :cond_1c

    .line 936
    div-int/lit8 v1, v0, 0x64

    if-ne v1, v4, :cond_16

    .line 937
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    if-eqz v1, :cond_15

    .line 938
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v1, p1, v2, p3}, Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;->processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    goto/16 :goto_9

    .line 940
    :cond_15
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->semRelease()V

    goto/16 :goto_9

    .line 942
    :cond_16
    div-int/lit8 v1, v0, 0x64

    if-ne v1, v7, :cond_18

    .line 943
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 944
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    if-eqz v1, :cond_17

    .line 945
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v1, p1, v2, p3}, Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;->processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    goto/16 :goto_9

    .line 947
    :cond_17
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->semRelease()V

    goto/16 :goto_9

    .line 950
    :cond_18
    if-gt v2, v0, :cond_1d

    if-gt v0, v5, :cond_1d

    .line 953
    :try_start_2
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->createErrorAck()Landroid/javax/sip/message/Request;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 956
    goto :goto_5

    .line 954
    :catch_2
    move-exception v1

    .line 955
    .restart local v1    # "ex":Ljava/lang/Exception;
    invoke-static {v1}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 958
    .end local v1    # "ex":Ljava/lang/Exception;
    :goto_5
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v1

    if-eqz v1, :cond_19

    .line 959
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseAckSem()V

    .line 962
    :cond_19
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isReliable()Z

    move-result v1

    if-nez v1, :cond_1a

    .line 963
    invoke-virtual {p0, v6}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 964
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->timerD:I

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->enableTimeoutTimer(I)V

    goto :goto_6

    .line 966
    :cond_1a
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 968
    :goto_6
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->cleanUpOnTimer()V

    .line 971
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    if-eqz v1, :cond_1b

    .line 972
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v1, p1, v2, p3}, Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;->processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    goto :goto_9

    .line 974
    :cond_1b
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->semRelease()V

    goto :goto_9

    .line 982
    :cond_1c
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v1

    if-ne v6, v1, :cond_1d

    .line 983
    if-gt v2, v0, :cond_1d

    if-gt v0, v5, :cond_1d

    .line 986
    :try_start_3
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->createErrorAck()Landroid/javax/sip/message/Request;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_7

    .line 990
    :catchall_0
    move-exception v1

    goto :goto_8

    .line 987
    :catch_3
    move-exception v1

    .line 988
    .restart local v1    # "ex":Ljava/lang/Exception;
    :try_start_4
    invoke-static {v1}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 990
    .end local v1    # "ex":Ljava/lang/Exception;
    :goto_7
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->semRelease()V

    .line 991
    goto :goto_9

    .line 990
    :goto_8
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->semRelease()V

    throw v1

    .line 996
    :cond_1d
    :goto_9
    return-void
.end method

.method private nonInviteClientTransaction(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V
    .locals 8
    .param p1, "transactionResponse"    # Landroid/gov/nist/javax/sip/message/SIPResponse;
    .param p2, "sourceChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .param p3, "sipDialog"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 629
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v0

    .line 630
    .local v0, "statusCode":I
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v1

    const/4 v2, 0x3

    const/16 v3, 0x2bb

    const/16 v4, 0xc8

    const/4 v5, 0x2

    const/4 v6, 0x5

    const/4 v7, 0x1

    if-ne v7, v1, :cond_5

    .line 631
    div-int/lit8 v1, v0, 0x64

    if-ne v1, v7, :cond_1

    .line 632
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 633
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getTimerT2()I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->enableRetransmissionTimer(I)V

    .line 634
    const/16 v1, 0x40

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->enableTimeoutTimer(I)V

    .line 637
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    if-eqz v1, :cond_0

    .line 638
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v1, p1, v2, p3}, Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;->processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    goto/16 :goto_4

    .line 640
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->semRelease()V

    goto/16 :goto_4

    .line 642
    :cond_1
    if-gt v4, v0, :cond_d

    if-gt v0, v3, :cond_d

    .line 643
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isReliable()Z

    move-result v1

    if-nez v1, :cond_2

    .line 644
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 645
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->timerK:I

    int-to-long v1, v1

    invoke-direct {p0, v1, v2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->scheduleTimerK(J)V

    goto :goto_0

    .line 647
    :cond_2
    invoke-virtual {p0, v6}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 650
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    if-eqz v1, :cond_3

    .line 651
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v1, p1, v2, p3}, Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;->processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    goto :goto_1

    .line 653
    :cond_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->semRelease()V

    .line 655
    :goto_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isReliable()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v1

    if-ne v6, v1, :cond_4

    .line 656
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->cleanUpOnTerminated()V

    .line 658
    :cond_4
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->cleanUpOnTimer()V

    goto/16 :goto_4

    .line 660
    :cond_5
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v1

    if-ne v5, v1, :cond_b

    .line 661
    div-int/lit8 v1, v0, 0x64

    if-ne v1, v7, :cond_7

    .line 662
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    if-eqz v1, :cond_6

    .line 663
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v1, p1, v2, p3}, Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;->processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    goto :goto_4

    .line 665
    :cond_6
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->semRelease()V

    goto :goto_4

    .line 667
    :cond_7
    if-gt v4, v0, :cond_d

    if-gt v0, v3, :cond_d

    .line 668
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->disableRetransmissionTimer()V

    .line 669
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->disableTimeoutTimer()V

    .line 670
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isReliable()Z

    move-result v1

    if-nez v1, :cond_8

    .line 671
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 672
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->timerK:I

    int-to-long v1, v1

    invoke-direct {p0, v1, v2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->scheduleTimerK(J)V

    goto :goto_2

    .line 674
    :cond_8
    invoke-virtual {p0, v6}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 676
    :goto_2
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    if-eqz v1, :cond_9

    .line 677
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v1, p1, v2, p3}, Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;->processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    goto :goto_3

    .line 679
    :cond_9
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->semRelease()V

    .line 681
    :goto_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isReliable()Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v1

    if-ne v6, v1, :cond_a

    .line 682
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->cleanUpOnTerminated()V

    .line 684
    :cond_a
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->cleanUpOnTimer()V

    goto :goto_4

    .line 687
    :cond_b
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 688
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " Not sending response to TU! "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 690
    :cond_c
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->semRelease()V

    .line 692
    :cond_d
    :goto_4
    return-void
.end method

.method private scheduleTimerK(J)V
    .locals 6
    .param p1, "time"    # J

    .line 697
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimer:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->timerKStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 698
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimerLock:Ljava/lang/Object;

    monitor-enter v0

    .line 699
    :try_start_0
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimerCancelled:Z

    if-nez v1, :cond_2

    .line 700
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimer:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    invoke-interface {v1, v3}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 701
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimer:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    .line 702
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 703
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "starting TransactionTimerK() : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getTransactionId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " time "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 706
    :cond_0
    new-instance v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$1;

    invoke-direct {v1, p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$1;-><init>(Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;)V

    .line 726
    .local v1, "task":Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    const-wide/16 v3, 0x0

    cmp-long v3, p1, v3

    if-lez v3, :cond_1

    .line 727
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v3

    iget v4, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->baseTimerInterval:I

    int-to-long v4, v4

    mul-long/2addr v4, p1

    invoke-interface {v3, v1, v4, v5}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    goto :goto_0

    .line 729
    :cond_1
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->runTask()V

    .line 731
    :goto_0
    iput-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimerCancelled:Z

    .line 733
    .end local v1    # "task":Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    :cond_2
    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 735
    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public alertIfStillInCallingStateBy(I)V
    .locals 1
    .param p1, "count"    # I

    .line 1796
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->timeoutIfStillInCallingState:Z

    .line 1797
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->callingStateTimeoutCount:I

    .line 1798
    return-void
.end method

.method public checkFromTag(Landroid/gov/nist/javax/sip/message/SIPResponse;)Z
    .locals 6
    .param p1, "sipResponse"    # Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 1512
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getOriginalRequestFromTag()Ljava/lang/String;

    move-result-object v0

    .line 1513
    .local v0, "originalFromTag":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    const/4 v2, 0x1

    if-eqz v1, :cond_5

    .line 1514
    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    move v3, v1

    :goto_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v4

    invoke-interface {v4}, Landroid/javax/sip/header/FromHeader;->getTag()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    move v4, v2

    goto :goto_1

    :cond_1
    move v4, v1

    :goto_1
    xor-int/2addr v3, v4

    const-string v4, "From tag mismatch -- dropping response"

    const/16 v5, 0x20

    if-eqz v3, :cond_3

    .line 1515
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1516
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1517
    :cond_2
    return v1

    .line 1519
    :cond_3
    if-eqz v0, :cond_5

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/header/FromHeader;->getTag()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 1522
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1523
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1524
    :cond_4
    return v1

    .line 1527
    :cond_5
    return v2
.end method

.method public cleanUp()V
    .locals 3

    .line 1857
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v0

    sget-object v1, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->None:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    if-eq v0, v1, :cond_5

    .line 1859
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1860
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "cleanup : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getTransactionId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1862
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 1863
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialogId:Ljava/lang/String;

    .line 1864
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 1868
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestBytes:[B

    if-nez v0, :cond_3

    .line 1869
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v0

    sget-object v2, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->Normal:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    if-ne v0, v2, :cond_2

    .line 1871
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getTransport()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestBytes:[B

    .line 1875
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMergeId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->mergeId:Ljava/lang/String;

    .line 1877
    :cond_3
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 1878
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->cleanUpOnTimer()V

    .line 1884
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestCallId:Ljava/lang/String;

    .line 1885
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestEventHeader:Landroid/gov/nist/javax/sip/header/Event;

    .line 1886
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestFromTag:Ljava/lang/String;

    .line 1887
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestContact:Landroid/gov/nist/javax/sip/header/Contact;

    .line 1888
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestScheme:Ljava/lang/String;

    .line 1889
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipDialogs:Ljava/util/Set;

    if-eqz v0, :cond_4

    .line 1890
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipDialogs:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 1892
    :cond_4
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->responsesReceived:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 1893
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    .line 1894
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimer:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    .line 1895
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 1896
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimerLock:Ljava/lang/Object;

    .line 1898
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->timerKStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 1900
    :cond_5
    return-void
.end method

.method protected cleanUpOnTerminated()V
    .locals 6

    .line 1904
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1905
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "removing  = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " isReliable "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isReliable()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1907
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v0

    sget-object v2, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->Normal:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    const/4 v3, 0x1

    if-ne v0, v2, :cond_1

    .line 1909
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-nez v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestBytes:[B

    if-eqz v0, :cond_1

    .line 1911
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageParserFactory()Landroid/gov/nist/javax/sip/parser/MessageParserFactory;

    move-result-object v0

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-interface {v0, v2}, Landroid/gov/nist/javax/sip/parser/MessageParserFactory;->createMessageParser(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)Landroid/gov/nist/javax/sip/parser/MessageParser;

    move-result-object v0

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestBytes:[B

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-interface {v0, v2, v3, v4, v5}, Landroid/gov/nist/javax/sip/parser/MessageParser;->parseSIPMessage([BZZLandroid/gov/nist/javax/sip/parser/ParseExceptionListener;)Landroid/gov/nist/javax/sip/message/SIPMessage;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1922
    goto :goto_0

    .line 1918
    :catch_0
    move-exception v0

    .line 1919
    .local v0, "e":Ljava/text/ParseException;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1920
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "message "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestBytes:[B

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " could not be reparsed !"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1926
    .end local v0    # "e":Ljava/text/ParseException;
    :cond_1
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1932
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->cacheClientConnections:Z

    if-nez v0, :cond_4

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isReliable()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1934
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    iget v1, v0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->useCount:I

    sub-int/2addr v1, v3

    iput v1, v0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->useCount:I

    move v0, v1

    .line 1935
    .local v0, "newUseCount":I
    if-gtz v0, :cond_3

    .line 1938
    new-instance v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$LingerTimer;

    invoke-direct {v1, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$LingerTimer;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;)V

    .line 1939
    .local v1, "myTimer":Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getConnectionLingerTimer()I

    move-result v2

    if-eqz v2, :cond_2

    .line 1940
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getConnectionLingerTimer()I

    move-result v3

    mul-int/lit16 v3, v3, 0x3e8

    int-to-long v3, v3

    invoke-interface {v2, v1, v3, v4}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    goto :goto_1

    .line 1942
    :cond_2
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->runTask()V

    .line 1946
    .end local v0    # "newUseCount":I
    .end local v1    # "myTimer":Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    :cond_3
    :goto_1
    goto :goto_2

    .line 1950
    :cond_4
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isReliable()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1951
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    iget v0, v0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->useCount:I

    .line 1952
    .local v0, "useCount":I
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1953
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Client Use Count = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1957
    .end local v0    # "useCount":I
    :cond_5
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->isReEntrantListener()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v0

    sget-object v1, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->None:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    if-eq v0, v1, :cond_6

    .line 1958
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->cleanUp()V

    .line 1970
    :cond_6
    :goto_2
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->terminateDialogOnCleanUp:Z

    if-eqz v0, :cond_7

    .line 1973
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    if-eqz v0, :cond_7

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    if-nez v0, :cond_7

    .line 1974
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    .line 1978
    :cond_7
    return-void
.end method

.method protected cleanUpOnTimer()V
    .locals 3

    .line 1803
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v0

    sget-object v1, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->None:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    if-eq v0, v1, :cond_5

    .line 1804
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1805
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "cleanupOnTimer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getTransactionId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1809
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 1810
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v0

    .line 1813
    .local v0, "dialogId":Ljava/lang/String;
    if-eqz v0, :cond_1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 1814
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialogId:Ljava/lang/String;

    .line 1815
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 1818
    .end local v0    # "dialogId":Ljava/lang/String;
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v0, :cond_3

    .line 1821
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMergeId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->mergeId:Ljava/lang/String;

    .line 1822
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setTransaction(Ljava/lang/Object;)V

    .line 1823
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setInviteTransaction(Ljava/lang/Object;)V

    .line 1824
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->cleanUp()V

    .line 1827
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestBytes:[B

    if-nez v0, :cond_2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v0

    sget-object v2, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->Normal:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    if-ne v0, v2, :cond_2

    .line 1829
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getTransport()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestBytes:[B

    .line 1831
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string v2, "INVITE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string v2, "CANCEL"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1834
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFromTag()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestFromTag:Ljava/lang/String;

    .line 1835
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestCallId:Ljava/lang/String;

    .line 1836
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    const-string v2, "Event"

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/Event;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestEventHeader:Landroid/gov/nist/javax/sip/header/Event;

    .line 1837
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getContactHeader()Landroid/gov/nist/javax/sip/header/Contact;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestContact:Landroid/gov/nist/javax/sip/header/Contact;

    .line 1838
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/address/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestScheme:Ljava/lang/String;

    .line 1839
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 1844
    :cond_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v2, "SUBSCRIBE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 1845
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 1847
    :cond_4
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 1849
    :cond_5
    return-void
.end method

.method public clearState()V
    .locals 0

    .line 1423
    return-void
.end method

.method public createAck()Landroid/javax/sip/message/Request;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 1268
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v0

    .line 1269
    .local v0, "originalRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    if-eqz v0, :cond_c

    .line 1271
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ACK"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_b

    .line 1273
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    if-eqz v1, :cond_a

    .line 1275
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ge v1, v2, :cond_1

    .line 1276
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1277
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "lastResponse = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1279
    :cond_0
    new-instance v1, Landroid/javax/sip/SipException;

    const-string v2, "Cannot ACK a provisional response!"

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1281
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/To;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createAckRequest(Landroid/gov/nist/javax/sip/header/To;)Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v1

    .line 1283
    .local v1, "ackRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getRecordRouteHeaders()Landroid/gov/nist/javax/sip/header/RecordRouteList;

    move-result-object v2

    .line 1284
    .local v2, "recordRouteList":Landroid/gov/nist/javax/sip/header/RecordRouteList;
    if-nez v2, :cond_3

    .line 1291
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getContactHeaders()Landroid/gov/nist/javax/sip/header/ContactList;

    move-result-object v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v3

    div-int/lit8 v3, v3, 0x64

    const/4 v4, 0x3

    if-eq v3, v4, :cond_2

    .line 1292
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getContactHeaders()Landroid/gov/nist/javax/sip/header/ContactList;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/ContactList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/Contact;

    .line 1293
    .local v3, "contact":Landroid/gov/nist/javax/sip/header/Contact;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/Contact;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v4

    invoke-interface {v4}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v4

    invoke-interface {v4}, Landroid/javax/sip/address/URI;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/javax/sip/address/URI;

    .line 1294
    .local v4, "uri":Landroid/javax/sip/address/URI;
    invoke-virtual {v1, v4}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setRequestURI(Landroid/javax/sip/address/URI;)V

    .line 1296
    .end local v3    # "contact":Landroid/gov/nist/javax/sip/header/Contact;
    .end local v4    # "uri":Landroid/javax/sip/address/URI;
    :cond_2
    return-object v1

    .line 1299
    :cond_3
    const-string/jumbo v3, "Route"

    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->removeHeader(Ljava/lang/String;)V

    .line 1300
    new-instance v3, Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-direct {v3}, Landroid/gov/nist/javax/sip/header/RouteList;-><init>()V

    .line 1302
    .local v3, "routeList":Landroid/gov/nist/javax/sip/header/RouteList;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/RecordRouteList;->size()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/gov/nist/javax/sip/header/RecordRouteList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v4

    .line 1303
    .local v4, "li":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/javax/sip/header/RecordRoute;>;"
    :goto_0
    invoke-interface {v4}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1304
    invoke-interface {v4}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/header/RecordRoute;

    .line 1306
    .local v5, "rr":Landroid/gov/nist/javax/sip/header/RecordRoute;
    new-instance v6, Landroid/gov/nist/javax/sip/header/Route;

    invoke-direct {v6}, Landroid/gov/nist/javax/sip/header/Route;-><init>()V

    .line 1307
    .local v6, "route":Landroid/gov/nist/javax/sip/header/Route;
    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/header/RecordRoute;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/address/AddressImpl;->clone()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v6, v7}, Landroid/gov/nist/javax/sip/header/Route;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 1308
    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/header/RecordRoute;->getParameters()Landroid/gov/nist/core/NameValueList;

    move-result-object v7

    invoke-virtual {v7}, Landroid/gov/nist/core/NameValueList;->clone()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v6, v7}, Landroid/gov/nist/javax/sip/header/Route;->setParameters(Landroid/gov/nist/core/NameValueList;)V

    .line 1309
    invoke-virtual {v3, v6}, Landroid/gov/nist/javax/sip/header/RouteList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 1310
    .end local v5    # "rr":Landroid/gov/nist/javax/sip/header/RecordRoute;
    .end local v6    # "route":Landroid/gov/nist/javax/sip/header/Route;
    goto :goto_0

    .line 1312
    :cond_4
    const/4 v5, 0x0

    .line 1313
    .local v5, "contact":Landroid/gov/nist/javax/sip/header/Contact;
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getContactHeaders()Landroid/gov/nist/javax/sip/header/ContactList;

    move-result-object v6

    if-eqz v6, :cond_5

    .line 1314
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getContactHeaders()Landroid/gov/nist/javax/sip/header/ContactList;

    move-result-object v6

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/header/ContactList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v6

    move-object v5, v6

    check-cast v5, Landroid/gov/nist/javax/sip/header/Contact;

    .line 1317
    :cond_5
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/RouteList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/header/Route;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/header/Route;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v6

    invoke-interface {v6}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v6

    check-cast v6, Landroid/javax/sip/address/SipURI;

    invoke-interface {v6}, Landroid/javax/sip/address/SipURI;->hasLrParam()Z

    move-result v6

    if-nez v6, :cond_8

    .line 1321
    const/4 v6, 0x0

    .line 1322
    .restart local v6    # "route":Landroid/gov/nist/javax/sip/header/Route;
    if-eqz v5, :cond_6

    .line 1323
    new-instance v7, Landroid/gov/nist/javax/sip/header/Route;

    invoke-direct {v7}, Landroid/gov/nist/javax/sip/header/Route;-><init>()V

    move-object v6, v7

    .line 1324
    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/header/Contact;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/javax/sip/address/AddressImpl;

    move-object v8, v7

    check-cast v8, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/address/AddressImpl;->clone()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v6, v7}, Landroid/gov/nist/javax/sip/header/Route;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 1327
    :cond_6
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/RouteList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/javax/sip/header/Route;

    .line 1328
    .local v7, "firstRoute":Landroid/gov/nist/javax/sip/header/Route;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/RouteList;->removeFirst()V

    .line 1329
    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/header/Route;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v8

    invoke-interface {v8}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v8

    .line 1330
    .local v8, "uri":Landroid/javax/sip/address/URI;
    invoke-virtual {v1, v8}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setRequestURI(Landroid/javax/sip/address/URI;)V

    .line 1332
    if-eqz v6, :cond_7

    .line 1333
    invoke-virtual {v3, v6}, Landroid/gov/nist/javax/sip/header/RouteList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 1335
    :cond_7
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->addHeader(Landroid/javax/sip/header/Header;)V

    .line 1336
    .end local v6    # "route":Landroid/gov/nist/javax/sip/header/Route;
    .end local v7    # "firstRoute":Landroid/gov/nist/javax/sip/header/Route;
    .end local v8    # "uri":Landroid/javax/sip/address/URI;
    goto :goto_1

    .line 1337
    :cond_8
    if-eqz v5, :cond_9

    .line 1338
    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/header/Contact;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v6

    invoke-interface {v6}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v6

    invoke-interface {v6}, Landroid/javax/sip/address/URI;->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/javax/sip/address/URI;

    .line 1339
    .local v6, "uri":Landroid/javax/sip/address/URI;
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setRequestURI(Landroid/javax/sip/address/URI;)V

    .line 1340
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->addHeader(Landroid/javax/sip/header/Header;)V

    .line 1343
    .end local v6    # "uri":Landroid/javax/sip/address/URI;
    :cond_9
    :goto_1
    return-object v1

    .line 1274
    .end local v1    # "ackRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v2    # "recordRouteList":Landroid/gov/nist/javax/sip/header/RecordRouteList;
    .end local v3    # "routeList":Landroid/gov/nist/javax/sip/header/RouteList;
    .end local v4    # "li":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/javax/sip/header/RecordRoute;>;"
    .end local v5    # "contact":Landroid/gov/nist/javax/sip/header/Contact;
    :cond_a
    new-instance v1, Landroid/javax/sip/SipException;

    const-string/jumbo v2, "bad Transaction state"

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1272
    :cond_b
    new-instance v1, Landroid/javax/sip/SipException;

    const-string v2, "Cannot ACK an ACK!"

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1270
    :cond_c
    new-instance v1, Landroid/javax/sip/SipException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "bad state "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public createCancel()Landroid/javax/sip/message/Request;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 1243
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v0

    .line 1244
    .local v0, "originalRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    if-eqz v0, :cond_2

    .line 1246
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v2, "INVITE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1249
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ACK"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1252
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createCancelRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v1

    .line 1253
    .local v1, "cancelRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v1, p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setInviteTransaction(Ljava/lang/Object;)V

    .line 1254
    return-object v1

    .line 1250
    .end local v1    # "cancelRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_0
    new-instance v1, Landroid/javax/sip/SipException;

    const-string v2, "Cannot Cancel ACK!"

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1247
    :cond_1
    new-instance v1, Landroid/javax/sip/SipException;

    const-string v2, "Only INIVTE may be cancelled"

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1245
    :cond_2
    new-instance v1, Landroid/javax/sip/SipException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bad state "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public fireRetransmissionTimer()V
    .locals 8

    .line 1114
    const/4 v0, 0x2

    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v1

    if-ltz v1, :cond_6

    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isMapped:Z

    if-nez v1, :cond_0

    goto/16 :goto_1

    .line 1117
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isInviteTransaction()Z

    move-result v1

    .line 1118
    .local v1, "inv":Z
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v2

    .line 1123
    .local v2, "s":I
    const/4 v3, 0x1

    if-eqz v1, :cond_1

    if-eqz v2, :cond_2

    :cond_1
    if-nez v1, :cond_5

    if-eq v3, v2, :cond_2

    if-ne v0, v2, :cond_5

    .line 1130
    :cond_2
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v4, :cond_5

    .line 1131
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v4, v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->generateTimeStampHeader:Z

    if-eqz v4, :cond_3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    const-string/jumbo v5, "Timestamp"

    invoke-virtual {v4, v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 1134
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 1135
    .local v4, "milisec":J
    new-instance v6, Landroid/gov/nist/javax/sip/header/TimeStamp;

    invoke-direct {v6}, Landroid/gov/nist/javax/sip/header/TimeStamp;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1137
    .local v6, "timeStamp":Landroid/gov/nist/javax/sip/header/TimeStamp;
    long-to-float v7, v4

    :try_start_1
    invoke-virtual {v6, v7}, Landroid/gov/nist/javax/sip/header/TimeStamp;->setTimeStamp(F)V
    :try_end_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1140
    goto :goto_0

    .line 1138
    :catch_0
    move-exception v7

    .line 1139
    .local v7, "ex":Landroid/javax/sip/InvalidArgumentException;
    :try_start_2
    invoke-static {v7}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 1141
    .end local v7    # "ex":Landroid/javax/sip/InvalidArgumentException;
    :goto_0
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v7, v6}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 1143
    .end local v4    # "milisec":J
    .end local v6    # "timeStamp":Landroid/gov/nist/javax/sip/header/TimeStamp;
    :cond_3
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-super {p0, v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 1144
    iget-boolean v4, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->notifyOnRetransmit:Z

    if-eqz v4, :cond_4

    .line 1145
    new-instance v4, Landroid/javax/sip/TimeoutEvent;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v5

    sget-object v6, Landroid/javax/sip/Timeout;->RETRANSMIT:Landroid/javax/sip/Timeout;

    invoke-direct {v4, v5, p0, v6}, Landroid/javax/sip/TimeoutEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/ClientTransaction;Landroid/javax/sip/Timeout;)V

    .line 1148
    .local v4, "txTimeout":Landroid/javax/sip/TimeoutEvent;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v5

    invoke-virtual {v5, v4, p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1150
    .end local v4    # "txTimeout":Landroid/javax/sip/TimeoutEvent;
    :cond_4
    iget-boolean v4, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->timeoutIfStillInCallingState:Z

    if-eqz v4, :cond_5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v4

    if-nez v4, :cond_5

    .line 1153
    iget v4, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->callingStateTimeoutCount:I

    sub-int/2addr v4, v3

    iput v4, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->callingStateTimeoutCount:I

    .line 1154
    iget v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->callingStateTimeoutCount:I

    if-nez v3, :cond_5

    .line 1155
    new-instance v3, Landroid/javax/sip/TimeoutEvent;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v4

    sget-object v5, Landroid/javax/sip/Timeout;->RETRANSMIT:Landroid/javax/sip/Timeout;

    invoke-direct {v3, v4, p0, v5}, Landroid/javax/sip/TimeoutEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/ClientTransaction;Landroid/javax/sip/Timeout;)V

    .line 1158
    .local v3, "timeoutEvent":Landroid/javax/sip/TimeoutEvent;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v4

    invoke-virtual {v4, v3, p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1159
    const/4 v4, 0x0

    iput-boolean v4, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->timeoutIfStillInCallingState:Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 1169
    .end local v1    # "inv":Z
    .end local v2    # "s":I
    .end local v3    # "timeoutEvent":Landroid/javax/sip/TimeoutEvent;
    :cond_5
    goto :goto_2

    .line 1115
    :cond_6
    :goto_1
    return-void

    .line 1166
    :catch_1
    move-exception v1

    .line 1167
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->raiseIOExceptionEvent()V

    .line 1168
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->raiseErrorEvent(I)V

    .line 1171
    .end local v1    # "e":Ljava/io/IOException;
    :goto_2
    return-void
.end method

.method public fireTimeoutTimer()V
    .locals 6

    .line 1178
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1179
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "fireTimeoutTimer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1181
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 1182
    .local v0, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v1

    if-eq v3, v1, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v1

    if-ne v2, v1, :cond_4

    .line 1188
    :cond_1
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v1

    sget-object v4, Landroid/javax/sip/DialogState;->EARLY:Landroid/javax/sip/DialogState;

    if-ne v1, v4, :cond_3

    .line 1189
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogCreated(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1194
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->delete()V

    goto :goto_0

    .line 1196
    :cond_3
    if-eqz v0, :cond_4

    .line 1199
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v4, "BYE"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isTerminatedOnBye()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1201
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->delete()V

    .line 1205
    :cond_4
    :goto_0
    const/4 v1, 0x3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v4

    const/4 v5, 0x5

    if-eq v1, v4, :cond_7

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v1

    if-eq v5, v1, :cond_7

    .line 1208
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->raiseErrorEvent(I)V

    .line 1210
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v3, "CANCEL"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 1211
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getInviteTransaction()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 1213
    .local v1, "inviteTx":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    if-eqz v1, :cond_6

    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getInternalState()I

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getInternalState()I

    move-result v3

    if-ne v3, v2, :cond_6

    :cond_5
    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 1222
    invoke-interface {v1, v5}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setState(I)V

    .line 1225
    .end local v1    # "inviteTx":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    :cond_6
    goto :goto_1

    .line 1228
    :cond_7
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 1231
    :cond_8
    :goto_1
    return-void
.end method

.method public getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .locals 3

    .line 1750
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 1752
    .local v0, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    if-nez v0, :cond_0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialogId:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 1753
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialogId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v0

    .line 1755
    :cond_0
    return-object v0
.end method

.method public bridge synthetic getDefaultDialog()Landroid/javax/sip/Dialog;
    .locals 1

    .line 188
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v0

    return-object v0
.end method

.method public getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .locals 2
    .param p1, "dialogId"    # Ljava/lang/String;

    .line 1701
    const/4 v0, 0x0

    .line 1702
    .local v0, "retval":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipDialogs:Ljava/util/Set;

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipDialogs:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1703
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v0

    .line 1704
    if-nez v0, :cond_0

    .line 1705
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getEarlyDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v0

    .line 1708
    :cond_0
    return-object v0
.end method

.method public getDialog()Landroid/javax/sip/Dialog;
    .locals 5

    .line 1667
    const/4 v0, 0x0

    .line 1670
    .local v0, "retval":Landroid/javax/sip/Dialog;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 1671
    .local v1, "localLastResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFromTag()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v2

    const/16 v3, 0x64

    if-eq v2, v3, :cond_0

    .line 1674
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getDialogId(Z)Ljava/lang/String;

    move-result-object v2

    .line 1675
    .local v2, "dialogId":Ljava/lang/String;
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v0

    .line 1678
    .end local v2    # "dialogId":Ljava/lang/String;
    :cond_0
    if-nez v0, :cond_1

    .line 1679
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v0

    .line 1682
    :cond_1
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1683
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " sipDialogs =  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipDialogs:Ljava/util/Set;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " default dialog "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " retval "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1686
    :cond_2
    return-object v0
.end method

.method public getNextHop()Landroid/javax/sip/address/Hop;
    .locals 1

    .line 1772
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->nextHop:Landroid/javax/sip/address/Hop;

    return-object v0
.end method

.method public getOriginalRequestCallId()Ljava/lang/String;
    .locals 1

    .line 1996
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-nez v0, :cond_0

    .line 1997
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestCallId:Ljava/lang/String;

    return-object v0

    .line 1999
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOriginalRequestContact()Landroid/gov/nist/javax/sip/header/Contact;
    .locals 1

    .line 2018
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-nez v0, :cond_0

    .line 2019
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestContact:Landroid/gov/nist/javax/sip/header/Contact;

    return-object v0

    .line 2021
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getContactHeader()Landroid/gov/nist/javax/sip/header/Contact;

    move-result-object v0

    return-object v0
.end method

.method public getOriginalRequestEvent()Landroid/gov/nist/javax/sip/header/Event;
    .locals 2

    .line 2007
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-nez v0, :cond_0

    .line 2008
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestEventHeader:Landroid/gov/nist/javax/sip/header/Event;

    return-object v0

    .line 2010
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    const-string v1, "Event"

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/Event;

    return-object v0
.end method

.method public getOriginalRequestFromTag()Ljava/lang/String;
    .locals 1

    .line 1985
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-nez v0, :cond_0

    .line 1986
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestFromTag:Ljava/lang/String;

    return-object v0

    .line 1988
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFromTag()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOriginalRequestScheme()Ljava/lang/String;
    .locals 1

    .line 2029
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-nez v0, :cond_0

    .line 2030
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequestScheme:Ljava/lang/String;

    return-object v0

    .line 2032
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/address/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOutgoingViaHeader()Landroid/gov/nist/javax/sip/header/Via;
    .locals 1

    .line 1406
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getViaHeader()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v0

    return-object v0
.end method

.method public getRequestChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .locals 1

    .line 358
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    return-object v0
.end method

.method public getViaHost()Ljava/lang/String;
    .locals 1

    .line 1398
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->viaHost:Ljava/lang/String;

    return-object v0
.end method

.method public getViaPort()I
    .locals 1

    .line 1390
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->viaPort:I

    return v0
.end method

.method public isMessagePartOfTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;)Z
    .locals 8
    .param p1, "messageToTest"    # Landroid/gov/nist/javax/sip/message/SIPMessage;

    .line 369
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v0

    .line 372
    .local v0, "topMostViaHeader":Landroid/gov/nist/javax/sip/header/Via;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v1

    .line 373
    .local v1, "messageBranch":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v5, "z9hg4bk"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    .line 380
    .local v2, "rfc3261Compliant":Z
    :goto_0
    const/4 v5, 0x0

    .line 381
    .local v5, "transactionMatches":Z
    const/4 v6, 0x3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v7

    if-ne v6, v7, :cond_3

    .line 382
    if-eqz v2, :cond_2

    .line 383
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v7

    invoke-interface {v7}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    goto :goto_1

    :cond_1
    move v3, v4

    :goto_1
    move v5, v3

    goto :goto_2

    .line 386
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTransactionId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    goto :goto_2

    .line 388
    :cond_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isTerminated()Z

    move-result v3

    if-nez v3, :cond_6

    .line 389
    if-eqz v2, :cond_4

    .line 390
    if-eqz v0, :cond_6

    .line 393
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 394
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v4

    invoke-interface {v4}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    goto :goto_2

    .line 400
    :cond_4
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 401
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTransactionId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    goto :goto_2

    .line 403
    :cond_5
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTransactionId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTransactionId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    .line 410
    :cond_6
    :goto_2
    return v5
.end method

.method public isNotifyOnRetransmit()Z
    .locals 1

    .line 1788
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->notifyOnRetransmit:Z

    return v0
.end method

.method public processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
    .locals 9
    .param p1, "sipResponse"    # Landroid/gov/nist/javax/sip/message/SIPResponse;
    .param p2, "incomingChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 1546
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v0

    .line 1547
    .local v0, "code":I
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->responsesReceived:Ljava/util/Set;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    .line 1548
    .local v1, "isRetransmission":Z
    const/16 v2, 0x64

    if-le v0, v2, :cond_0

    const/16 v3, 0xc8

    if-ge v0, v3, :cond_0

    if-eqz v1, :cond_0

    .line 1549
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    if-eqz v3, :cond_0

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {p1, v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1550
    const/4 v1, 0x0

    .line 1554
    :cond_0
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v4, 0x20

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1555
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "marking response as retransmission "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " for ctx "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1557
    :cond_1
    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setRetransmission(Z)V

    .line 1561
    const/4 v3, 0x0

    .line 1562
    .local v3, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v4

    invoke-interface {v4}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v4

    .line 1563
    .local v4, "method":Ljava/lang/String;
    const/4 v5, 0x0

    invoke-virtual {p1, v5}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getDialogId(Z)Ljava/lang/String;

    move-result-object v5

    .line 1564
    .local v5, "dialogId":Ljava/lang/String;
    const-string v6, "CANCEL"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v6, :cond_3

    .line 1567
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getInviteTransaction()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 1568
    .local v6, "ict":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    if-eqz v6, :cond_2

    .line 1569
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v3

    .line 1571
    .end local v6    # "ict":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    :cond_2
    goto :goto_0

    .line 1572
    :cond_3
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v3

    .line 1576
    :goto_0
    if-nez v3, :cond_d

    .line 1577
    if-le v0, v2, :cond_c

    const/16 v2, 0x12c

    if-ge v0, v2, :cond_c

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_4

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isRfc2543Supported()Z

    move-result v2

    if-eqz v2, :cond_c

    :cond_4
    invoke-static {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogCreated(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 1590
    monitor-enter p0

    .line 1595
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    if-eqz v2, :cond_a

    .line 1596
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFromTag()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_9

    .line 1597
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v2

    .line 1598
    .local v2, "defaultDialogId":Ljava/lang/String;
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLastResponseMethod()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_6

    const-string/jumbo v6, "SUBSCRIBE"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLastResponseMethod()Ljava/lang/String;

    move-result-object v6

    const-string v7, "NOTIFY"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    goto :goto_1

    .line 1612
    :cond_5
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v6, v5}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v6

    move-object v3, v6

    .line 1613
    if-nez v3, :cond_7

    .line 1614
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isAssigned()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1619
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v6, p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->createDialog(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v6

    move-object v3, v6

    .line 1620
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v3, v6}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setOriginalDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    goto :goto_2

    .line 1603
    :cond_6
    :goto_1
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v6, p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLastResponse(Landroid/gov/nist/javax/sip/stack/SIPTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    .line 1604
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-object v3, v6

    .line 1625
    :cond_7
    :goto_2
    if-eqz v3, :cond_8

    .line 1626
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v3, v6}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    goto :goto_3

    .line 1628
    :cond_8
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v7, "dialog is unexpectedly null"

    new-instance v8, Ljava/lang/NullPointerException;

    invoke-direct {v8}, Ljava/lang/NullPointerException;-><init>()V

    invoke-interface {v6, v7, v8}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1630
    .end local v2    # "defaultDialogId":Ljava/lang/String;
    :goto_3
    goto :goto_4

    .line 1631
    :cond_9
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v6, "Response without from-tag"

    invoke-direct {v2, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .end local v0    # "code":I
    .end local v1    # "isRetransmission":Z
    .end local v3    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .end local v4    # "method":Ljava/lang/String;
    .end local v5    # "dialogId":Ljava/lang/String;
    .end local p1    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local p2    # "incomingChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    throw v2

    .line 1636
    .restart local v0    # "code":I
    .restart local v1    # "isRetransmission":Z
    .restart local v3    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .restart local v4    # "method":Ljava/lang/String;
    .restart local v5    # "dialogId":Ljava/lang/String;
    .restart local p1    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .restart local p2    # "incomingChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    :cond_a
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v2, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isAutomaticDialogSupportEnabled:Z

    if-eqz v2, :cond_b

    .line 1637
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2, p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->createDialog(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v2

    move-object v3, v2

    .line 1638
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v3, v2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    .line 1641
    :cond_b
    :goto_4
    monitor-exit p0

    goto :goto_5

    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 1643
    :cond_c
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    goto :goto_5

    .line 1649
    :cond_d
    const/4 v2, 0x5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v6

    if-eq v2, v6, :cond_e

    .line 1650
    invoke-virtual {v3, p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLastResponse(Landroid/gov/nist/javax/sip/stack/SIPTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    .line 1653
    :cond_e
    :goto_5
    invoke-virtual {p0, p1, p2, v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    .line 1654
    return-void
.end method

.method public declared-synchronized processResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V
    .locals 4
    .param p1, "transactionResponse"    # Landroid/gov/nist/javax/sip/message/SIPResponse;
    .param p2, "sourceChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .param p3, "dialog"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;

    monitor-enter p0

    .line 525
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-gez v0, :cond_0

    .line 526
    monitor-exit p0

    return-void

    .line 529
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v0

    const/4 v1, 0x5

    const/4 v2, 0x3

    if-eq v2, v0, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v0

    if-ne v1, v0, :cond_2

    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;
    :cond_1
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v0

    div-int/lit8 v0, v0, 0x64
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_2

    .line 532
    monitor-exit p0

    return-void

    .line 535
    :cond_2
    :try_start_2
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 536
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "processing "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFirstLine()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "current state = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 538
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "dialog = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 541
    :cond_3
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 553
    :try_start_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isInviteTransaction()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 554
    invoke-direct {p0, p1, p2, p3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->inviteClientTransaction(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    goto :goto_0

    .line 556
    :cond_4
    invoke-direct {p0, p1, p2, p3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->nonInviteClientTransaction(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;Landroid/gov/nist/javax/sip/stack/SIPDialog;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 562
    :goto_0
    goto :goto_1

    .line 557
    :catch_0
    move-exception v0

    .line 558
    .local v0, "ex":Ljava/io/IOException;
    :try_start_4
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 559
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    .line 560
    :cond_5
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 561
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->raiseErrorEvent(I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 563
    .end local v0    # "ex":Ljava/io/IOException;
    :goto_1
    monitor-exit p0

    return-void

    .line 524
    .end local p1    # "transactionResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local p2    # "sourceChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .end local p3    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :catchall_0
    move-exception p1

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw p1
.end method

.method public sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .locals 7
    .param p1, "messageToSend"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 424
    const/4 v0, 0x1

    :try_start_0
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 427
    .local v1, "transactionRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 430
    .local v2, "topVia":Landroid/gov/nist/javax/sip/header/Via;
    :try_start_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/header/Via;->setBranch(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 432
    goto :goto_0

    .line 431
    :catch_0
    move-exception v3

    .line 434
    :goto_0
    :try_start_2
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v4, 0x20

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 435
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Sending Message "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 436
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "TransactionState "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 439
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const-string v4, "ACK"

    const/4 v5, 0x5

    const/4 v6, 0x2

    if-eq v6, v3, :cond_1

    :try_start_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v3

    if-nez v3, :cond_3

    .line 444
    :cond_1
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 448
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isReliable()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 449
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    goto :goto_1

    .line 451
    :cond_2
    const/4 v3, 0x3

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 453
    :goto_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->cleanUpOnTimer()V

    .line 458
    invoke-super {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 505
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isMapped:Z

    .line 506
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->startTransactionTimer()V

    return-void

    .line 467
    :cond_3
    :try_start_4
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->lastRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 468
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v3

    if-gez v3, :cond_8

    .line 471
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setOriginalRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 475
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v3

    const-string v6, "INVITE"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 476
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    goto :goto_2

    .line 477
    :cond_4
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 479
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 480
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->cleanUpOnTimer()V

    goto :goto_2

    .line 482
    :cond_5
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 484
    :goto_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isReliable()Z

    move-result v3

    if-nez v3, :cond_6

    .line 485
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->enableRetransmissionTimer()V

    .line 487
    :cond_6
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isInviteTransaction()Z

    move-result v3

    const/16 v4, 0x40

    if-eqz v3, :cond_7

    .line 488
    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->enableTimeoutTimer(I)V

    goto :goto_3

    .line 490
    :cond_7
    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->enableTimeoutTimer(I)V

    .line 496
    :cond_8
    :goto_3
    invoke-super {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 503
    nop

    .line 505
    .end local v1    # "transactionRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v2    # "topVia":Landroid/gov/nist/javax/sip/header/Via;
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isMapped:Z

    .line 506
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->startTransactionTimer()V

    .line 508
    nop

    .line 510
    return-void

    .line 498
    .restart local v1    # "transactionRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v2    # "topVia":Landroid/gov/nist/javax/sip/header/Via;
    :catch_1
    move-exception v3

    .line 500
    .local v3, "e":Ljava/io/IOException;
    :try_start_5
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 501
    nop

    .end local p1    # "messageToSend":Landroid/gov/nist/javax/sip/message/SIPMessage;
    throw v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 505
    .end local v1    # "transactionRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v2    # "topVia":Landroid/gov/nist/javax/sip/header/Via;
    .end local v3    # "e":Ljava/io/IOException;
    .restart local p1    # "messageToSend":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :catchall_0
    move-exception v1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isMapped:Z

    .line 506
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->startTransactionTimer()V

    throw v1
.end method

.method public sendRequest()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 1008
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v0

    .line 1010
    .local v0, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getInternalState()I

    move-result v1

    if-gez v1, :cond_11

    .line 1013
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1014
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "sendRequest() "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1018
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->checkHeaders()V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1023
    nop

    .line 1025
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "SUBSCRIBE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "Expires"

    if-eqz v1, :cond_1

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v1

    if-nez v1, :cond_1

    .line 1030
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1031
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "Expires header missing in outgoing subscribe -- Notifier will assume implied value on event package"

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 1039
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v3, "CANCEL"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v3, 0x0

    if-eqz v1, :cond_5

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isCancelClientTransactionChecked()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1040
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v4

    invoke-virtual {v1, v4, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->findCancelTransaction(Landroid/gov/nist/javax/sip/message/SIPRequest;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 1042
    .local v1, "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    if-eqz v1, :cond_4

    .line 1049
    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getInternalState()I

    move-result v3

    if-ltz v3, :cond_3

    .line 1051
    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->isInviteTransaction()Z

    move-result v3

    if-eqz v3, :cond_2

    .end local v1    # "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    goto :goto_0

    .line 1052
    .restart local v1    # "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    :cond_2
    new-instance v2, Landroid/javax/sip/SipException;

    const-string v3, "Cannot cancel non-invite requests RFC 3261 9.1"

    invoke-direct {v2, v3}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    throw v2

    .line 1050
    .restart local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_3
    new-instance v2, Landroid/javax/sip/SipException;

    const-string/jumbo v3, "State is null no provisional response yet -- cannot cancel RFC 3261 9.1"

    invoke-direct {v2, v3}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    throw v2

    .line 1048
    .restart local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_4
    new-instance v2, Landroid/javax/sip/SipException;

    const-string v3, "Could not find original tx to cancel. RFC 3261 9.1"

    invoke-direct {v2, v3}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    throw v2

    .line 1054
    .end local v1    # "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .restart local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_5
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v4, "BYE"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v4, "NOTIFY"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_1

    :cond_6
    :goto_0
    goto :goto_2

    .line 1055
    :cond_7
    :goto_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v1

    .line 1058
    .local v1, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isAutomaticDialogSupportEnabled()Z

    move-result v3

    if-eqz v3, :cond_9

    if-nez v1, :cond_8

    goto :goto_2

    .line 1059
    :cond_8
    new-instance v2, Landroid/javax/sip/SipException;

    const-string v3, "Dialog is present and AutomaticDialogSupport is enabled for  the provider -- Send the Request using the Dialog.sendRequest(transaction)"

    invoke-direct {v2, v3}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    throw v2

    .line 1064
    .end local v1    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .restart local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_9
    :goto_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isInviteTransaction()Z

    move-result v1

    if-eqz v1, :cond_b

    .line 1065
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v1

    .line 1067
    .restart local v1    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    if-eqz v1, :cond_b

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isBackToBackUserAgent()Z

    move-result v3

    if-eqz v3, :cond_b

    .line 1069
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->takeAckSem()Z

    move-result v3

    if-eqz v3, :cond_a

    goto :goto_3

    .line 1070
    :cond_a
    new-instance v2, Landroid/javax/sip/SipException;

    const-string v3, "Failed to take ACK semaphore"

    invoke-direct {v2, v3}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    throw v2

    .line 1075
    .end local v1    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .restart local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_b
    :goto_3
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isMapped:Z

    .line 1077
    const/4 v1, -0x1

    .line 1079
    .local v1, "expiresTime":I
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v3

    if-eqz v3, :cond_c

    .line 1080
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/header/Expires;

    .line 1081
    .local v2, "expires":Landroid/gov/nist/javax/sip/header/Expires;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/Expires;->getExpires()I

    move-result v3

    move v1, v3

    .line 1085
    .end local v2    # "expires":Landroid/gov/nist/javax/sip/header/Expires;
    :cond_c
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v2

    if-eqz v2, :cond_d

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isInviteTransaction()Z

    move-result v2

    if-eqz v2, :cond_d

    const/4 v2, -0x1

    if-eq v1, v2, :cond_d

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->expiresTimerTask:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$ExpiresTimerTask;

    if-nez v2, :cond_d

    .line 1088
    new-instance v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$ExpiresTimerTask;

    invoke-direct {v2, p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$ExpiresTimerTask;-><init>(Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;)V

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->expiresTimerTask:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$ExpiresTimerTask;

    .line 1090
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->expiresTimerTask:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$ExpiresTimerTask;

    int-to-long v4, v1

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    mul-long/2addr v4, v6

    invoke-interface {v2, v3, v4, v5}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    .line 1093
    :cond_d
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1102
    .end local v1    # "expiresTime":I
    nop

    .line 1104
    return-void

    .line 1095
    :catch_0
    move-exception v1

    .line 1096
    .local v1, "ex":Ljava/io/IOException;
    const/4 v2, 0x5

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 1097
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->expiresTimerTask:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$ExpiresTimerTask;

    if-eqz v2, :cond_e

    .line 1098
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->expiresTimerTask:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$ExpiresTimerTask;

    invoke-interface {v2, v3}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 1100
    :cond_e
    new-instance v2, Landroid/javax/sip/SipException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_f

    const-string v3, "IO Error sending request"

    goto :goto_4

    :cond_f
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    :goto_4
    invoke-direct {v2, v3, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 1019
    .end local v1    # "ex":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 1020
    .local v1, "ex":Ljava/text/ParseException;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v2

    if-eqz v2, :cond_10

    .line 1021
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v3, "missing required header"

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1022
    :cond_10
    new-instance v2, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;

    invoke-virtual {v1}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->MissingRequiredHeader:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    invoke-direct {v2, v3, v4}, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;-><init>(Ljava/lang/String;Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;)V

    throw v2

    .line 1011
    .end local v1    # "ex":Ljava/text/ParseException;
    :cond_11
    new-instance v1, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;

    const-string/jumbo v2, "Request already sent"

    sget-object v3, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->RequestAlreadySent:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    invoke-direct {v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;-><init>(Ljava/lang/String;Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;)V

    throw v1
.end method

.method public setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V
    .locals 3
    .param p1, "sipDialog"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .param p2, "dialogId"    # Ljava/lang/String;

    .line 1724
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1725
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setDialog: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " sipDialog = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1727
    :cond_0
    if-nez p1, :cond_2

    .line 1728
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/4 v1, 0x4

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1729
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v1, "NULL DIALOG!!"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1730
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "bad dialog null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1732
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialogId:Ljava/lang/String;

    if-nez v0, :cond_3

    .line 1733
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->defaultDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 1735
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isInviteTransaction()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxForkTime()I

    move-result v0

    if-eqz v0, :cond_3

    .line 1736
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addForkedClientTransaction(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V

    .line 1739
    :cond_3
    if-eqz p2, :cond_4

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipDialogs:Ljava/util/Set;

    if-eqz v0, :cond_4

    .line 1740
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipDialogs:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1743
    :cond_4
    return-void
.end method

.method public setNextHop(Landroid/javax/sip/address/Hop;)V
    .locals 0
    .param p1, "hop"    # Landroid/javax/sip/address/Hop;

    .line 1763
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->nextHop:Landroid/javax/sip/address/Hop;

    .line 1765
    return-void
.end method

.method public setNotifyOnRetransmit(Z)V
    .locals 0
    .param p1, "notifyOnRetransmit"    # Z

    .line 1780
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->notifyOnRetransmit:Z

    .line 1781
    return-void
.end method

.method public setResponseInterface(Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;)V
    .locals 3
    .param p1, "newRespondTo"    # Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    .line 340
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 341
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Setting response interface for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 342
    if-nez p1, :cond_0

    .line 343
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 344
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "WARNING -- setting to null!"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 348
    :cond_0
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->respondTo:Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    .line 350
    return-void
.end method

.method public setState(I)V
    .locals 3
    .param p1, "newState"    # I

    .line 1432
    const/4 v0, 0x5

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isReliable()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v1

    iget-boolean v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->cacheClientConnections:Z

    if-nez v1, :cond_0

    .line 1437
    const/16 v1, 0x40

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->collectionTime:I

    .line 1440
    :cond_0
    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getInternalState()I

    move-result v1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_2

    if-eq p1, v2, :cond_1

    if-ne p1, v0, :cond_2

    .line 1443
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->decrementActiveClientTransactionCount()V

    .line 1445
    :cond_2
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->setState(I)V

    .line 1446
    return-void
.end method

.method public setTerminateDialogOnCleanUp(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .line 2039
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->terminateDialogOnCleanUp:Z

    .line 2040
    return-void
.end method

.method public setViaHost(Ljava/lang/String;)V
    .locals 0
    .param p1, "host"    # Ljava/lang/String;

    .line 1382
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->viaHost:Ljava/lang/String;

    .line 1383
    return-void
.end method

.method public setViaPort(I)V
    .locals 0
    .param p1, "port"    # I

    .line 1374
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->viaPort:I

    .line 1375
    return-void
.end method

.method public startTransactionTimer()V
    .locals 8

    .line 1452
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimerStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1453
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimerLock:Ljava/lang/Object;

    if-eqz v0, :cond_1

    .line 1457
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimerLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1458
    :try_start_0
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimerCancelled:Z

    if-nez v1, :cond_0

    .line 1459
    new-instance v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$TransactionTimer;

    invoke-direct {v1, p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$TransactionTimer;-><init>(Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;)V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimer:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    .line 1460
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimer:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->baseTimerInterval:I

    int-to-long v4, v1

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->baseTimerInterval:I

    int-to-long v6, v1

    invoke-interface/range {v2 .. v7}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->scheduleWithFixedDelay(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;JJ)Z

    .line 1464
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 1467
    :cond_1
    :goto_0
    return-void
.end method

.method public stopExpiresTimer()V
    .locals 2

    .line 1501
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->expiresTimerTask:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$ExpiresTimerTask;

    if-eqz v0, :cond_0

    .line 1502
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->expiresTimerTask:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$ExpiresTimerTask;

    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 1503
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->expiresTimerTask:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$ExpiresTimerTask;

    .line 1505
    :cond_0
    return-void
.end method

.method public terminate()V
    .locals 1

    .line 1480
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->setState(I)V

    .line 1481
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->transactionTimerStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1484
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->testAndSetTransactionTerminatedEvent()Z

    .line 1485
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1490
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 1491
    .local v0, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    if-eqz v0, :cond_1

    .line 1492
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseAckSem()V

    .line 1494
    :cond_1
    return-void
.end method
