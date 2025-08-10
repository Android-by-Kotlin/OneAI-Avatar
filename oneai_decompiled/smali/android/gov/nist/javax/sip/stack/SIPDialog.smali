.class public Landroid/gov/nist/javax/sip/stack/SIPDialog;
.super Ljava/lang/Object;
.source "SIPDialog.java"

# interfaces
.implements Landroid/javax/sip/Dialog;
.implements Landroid/gov/nist/javax/sip/DialogExt;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;,
        Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;,
        Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteTask;,
        Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;,
        Landroid/gov/nist/javax/sip/stack/SIPDialog$LingerTimer;,
        Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;,
        Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;,
        Landroid/gov/nist/javax/sip/stack/SIPDialog$AckSendingStrategyImpl;
    }
.end annotation


# static fields
.field public static final CONFIRMED_STATE:I = 0x1

.field public static final EARLY_STATE:I = 0x0

.field public static final NULL_STATE:I = -0x1

.field public static final TERMINATED_STATE:I = 0x3

.field private static logger:Landroid/gov/nist/core/StackLogger; = null

.field private static final serialVersionUID:J = -0x13d7a673d1d40265L


# instance fields
.field private transient ackLine:I

.field protected transient ackProcessed:Z

.field private transient ackSem:Ljava/util/concurrent/Semaphore;

.field private transient ackSendingStrategy:Landroid/gov/nist/javax/sip/stack/AckSendingStrategy;

.field private transient applicationData:Ljava/lang/Object;

.field public transient auditTag:J

.field protected transient byeSent:Z

.field protected callIdHeader:Landroid/javax/sip/header/CallIdHeader;

.field protected callIdHeaderString:Ljava/lang/String;

.field protected contactHeader:Landroid/gov/nist/javax/sip/header/Contact;

.field protected contactHeaderStringified:Ljava/lang/String;

.field private transient dialogDeleteIfNoAckSentTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;

.field private transient dialogDeleteTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteTask;

.field protected dialogId:Ljava/lang/String;

.field private dialogState:I

.field private transient dialogTerminatedEventDelivered:Z

.field protected transient earlyDialogId:Ljava/lang/String;

.field private earlyDialogTimeout:I

.field private transient earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

.field protected eventHeader:Landroid/javax/sip/header/EventHeader;

.field private transient eventListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;",
            ">;"
        }
    .end annotation
.end field

.field protected firstTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

.field protected firstTransactionId:Ljava/lang/String;

.field protected firstTransactionIsServerTransaction:Z

.field protected firstTransactionMergeId:Ljava/lang/String;

.field protected firstTransactionMethod:Ljava/lang/String;

.field protected firstTransactionPort:I

.field protected firstTransactionSecure:Z

.field protected firstTransactionSeen:Z

.field private transient highestSequenceNumberAcknowledged:J

.field protected hisTag:Ljava/lang/String;

.field protected transient isAcknowledged:Z

.field protected transient isAssigned:Z

.field protected isBackToBackUserAgent:Z

.field protected lastAckReceivedCSeqNumber:Ljava/lang/Long;

.field private transient lastAckSent:Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;

.field protected transient lastInviteOkReceived:J

.field protected lastInviteResponseCSeqNumber:J

.field protected lastInviteResponseCode:I

.field protected lastResponseCSeqNumber:J

.field protected lastResponseDialogId:Ljava/lang/String;

.field protected lastResponseFromTag:Ljava/lang/String;

.field protected lastResponseMethod:Ljava/lang/String;

.field protected lastResponseStatusCode:Ljava/lang/Integer;

.field protected lastResponseToTag:Ljava/lang/String;

.field private lastResponseTopMostVia:Landroid/gov/nist/javax/sip/header/Via;

.field protected lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

.field protected localParty:Landroid/javax/sip/address/Address;

.field protected localPartyStringified:Ljava/lang/String;

.field protected localSequenceNumber:J

.field protected method:Ljava/lang/String;

.field protected myTag:Ljava/lang/String;

.field protected transient nextSeqno:J

.field private originalDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

.field protected originalLocalSequenceNumber:J

.field private transient originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

.field protected transient originalRequestRecordRouteHeaders:Landroid/gov/nist/javax/sip/header/RecordRouteList;

.field protected transient originalRequestRecordRouteHeadersString:Ljava/lang/String;

.field private pendingRouteUpdateOn202Response:Z

.field private transient prevRetransmissionTicks:I

.field protected proxyAuthorizationHeader:Landroid/javax/sip/header/ProxyAuthorizationHeader;

.field protected reInviteFlag:Z

.field protected transient reInviteWaitTime:I

.field private releaseReferencesStrategy:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

.field protected remoteParty:Landroid/javax/sip/address/Address;

.field protected remotePartyStringified:Ljava/lang/String;

.field protected remoteSequenceNumber:J

.field protected remoteTarget:Landroid/javax/sip/address/Address;

.field protected remoteTargetStringified:Ljava/lang/String;

.field private responsesReceivedInForkingCase:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private transient retransmissionTicksLeft:I

.field protected routeList:Landroid/gov/nist/javax/sip/header/RouteList;

.field protected sequenceNumberValidation:Z

.field protected serverTransactionFlag:Z

.field private transient sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

.field private transient sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

.field private transient stackTrace:Ljava/lang/String;

.field protected terminateOnBye:Z

.field protected transient timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;

.field private transient timerTaskLock:Ljava/util/concurrent/Semaphore;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 150
    const-class v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method private constructor <init>(Landroid/gov/nist/javax/sip/SipProviderImpl;)V
    .locals 7
    .param p1, "provider"    # Landroid/gov/nist/javax/sip/SipProviderImpl;

    .line 751
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 237
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->auditTag:J

    .line 279
    new-instance v2, Ljava/util/concurrent/Semaphore;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackSem:Ljava/util/concurrent/Semaphore;

    .line 281
    const/16 v2, 0x64

    iput v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->reInviteWaitTime:I

    .line 289
    const-wide/16 v4, -0x1

    iput-wide v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->highestSequenceNumberAcknowledged:J

    .line 293
    iput-boolean v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sequenceNumberValidation:Z

    .line 299
    new-instance v2, Ljava/util/concurrent/Semaphore;

    invoke-direct {v2, v3}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTaskLock:Ljava/util/concurrent/Semaphore;

    .line 312
    const/16 v2, 0x13c4

    iput v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionPort:I

    .line 327
    const/16 v2, 0xb4

    iput v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyDialogTimeout:I

    .line 329
    new-instance v2, Ljava/util/HashSet;

    const/4 v6, 0x0

    invoke-direct {v2, v6}, Ljava/util/HashSet;-><init>(I)V

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->responsesReceivedInForkingCase:Ljava/util/Set;

    .line 333
    new-instance v2, Landroid/gov/nist/javax/sip/stack/SIPDialog$AckSendingStrategyImpl;

    invoke-direct {v2, p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog$AckSendingStrategyImpl;-><init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackSendingStrategy:Landroid/gov/nist/javax/sip/stack/AckSendingStrategy;

    .line 752
    iput-boolean v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->terminateOnBye:Z

    .line 753
    new-instance v2, Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/RouteList;-><init>()V

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    .line 754
    const/4 v2, -0x1

    iput v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogState:I

    .line 755
    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localSequenceNumber:J

    .line 756
    iput-wide v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteSequenceNumber:J

    .line 757
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    .line 758
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventListeners:Ljava/util/Set;

    .line 759
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getSipStack()Landroid/javax/sip/SipStack;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getEarlyDialogTimeout()I

    move-result v0

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyDialogTimeout:I

    .line 761
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/SipProviderImpl;Landroid/gov/nist/javax/sip/message/SIPResponse;)V
    .locals 3
    .param p1, "sipProvider"    # Landroid/gov/nist/javax/sip/SipProviderImpl;
    .param p2, "sipResponse"    # Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 828
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;-><init>(Landroid/gov/nist/javax/sip/SipProviderImpl;)V

    .line 829
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getSipStack()Landroid/javax/sip/SipStack;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 830
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLastResponse(Landroid/gov/nist/javax/sip/stack/SIPTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    .line 831
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localSequenceNumber:J

    .line 832
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localSequenceNumber:J

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalLocalSequenceNumber:J

    .line 833
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/FromHeader;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localParty:Landroid/javax/sip/address/Address;

    .line 834
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/ToHeader;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteParty:Landroid/javax/sip/address/Address;

    .line 835
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->method:Ljava/lang/String;

    .line 836
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->callIdHeader:Landroid/javax/sip/header/CallIdHeader;

    .line 837
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->serverTransactionFlag:Z

    .line 838
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/FromHeader;->getTag()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLocalTag(Ljava/lang/String;)V

    .line 839
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/ToHeader;->getTag()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRemoteTag(Ljava/lang/String;)V

    .line 840
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 841
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Creating a dialog : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 842
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 844
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isBackToBackUserAgent:Z

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isBackToBackUserAgent:Z

    .line 845
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addEventListener(Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;)V

    .line 846
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseReferencesStrategy:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    .line 847
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)V
    .locals 2
    .param p1, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .param p2, "sipResponse"    # Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 817
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 818
    if-eqz p2, :cond_0

    .line 820
    invoke-virtual {p0, p1, p2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLastResponse(Landroid/gov/nist/javax/sip/stack/SIPTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    .line 821
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isBackToBackUserAgent:Z

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isBackToBackUserAgent:Z

    .line 822
    return-void

    .line 819
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null SipResponse"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V
    .locals 3
    .param p1, "subscribeTx"    # Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .param p2, "notifyST"    # Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 866
    invoke-direct {p0, p2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 870
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->serverTransactionFlag:Z

    .line 872
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 873
    invoke-virtual {p0, p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->storeFirstTransactionInfo(Landroid/gov/nist/javax/sip/stack/SIPDialog;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 874
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->terminateOnBye:Z

    .line 875
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getCSeq()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localSequenceNumber:J

    .line 876
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 877
    .local v0, "not":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v1

    iput-wide v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteSequenceNumber:J

    .line 878
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setDialogId(Ljava/lang/String;)V

    .line 879
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getToTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLocalTag(Ljava/lang/String;)V

    .line 880
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFromTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRemoteTag(Ljava/lang/String;)V

    .line 883
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getLastResponse()Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLastResponse(Landroid/gov/nist/javax/sip/stack/SIPTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    .line 886
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v2

    invoke-interface {v2}, Landroid/javax/sip/header/ToHeader;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localParty:Landroid/javax/sip/address/Address;

    .line 887
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v2

    invoke-interface {v2}, Landroid/javax/sip/header/FromHeader;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteParty:Landroid/javax/sip/address/Address;

    .line 891
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addRoute(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 892
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    .line 893
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V
    .locals 4
    .param p1, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 779
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;-><init>(Landroid/gov/nist/javax/sip/SipProviderImpl;)V

    .line 781
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 782
    .local v0, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->callIdHeader:Landroid/javax/sip/header/CallIdHeader;

    .line 783
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyDialogId:Ljava/lang/String;

    .line 784
    if-eqz p1, :cond_2

    .line 786
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 791
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    .line 792
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    if-eqz v1, :cond_1

    .line 794
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isBackToBackUserAgent:Z

    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isBackToBackUserAgent:Z

    .line 796
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Z

    .line 797
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 798
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Creating a dialog : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 799
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "provider port = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint()Landroid/javax/sip/ListeningPoint;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/ListeningPoint;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 802
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 804
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addEventListener(Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;)V

    .line 805
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseReferencesStrategy:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    .line 806
    return-void

    .line 793
    :cond_1
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Null Provider!"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 785
    :cond_2
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Null tx"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static synthetic access$000(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 149
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    return-object v0
.end method

.method static synthetic access$100()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 149
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method

.method static synthetic access$200(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/SipProviderImpl;
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 149
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    return-object v0
.end method

.method static synthetic access$300(Landroid/gov/nist/javax/sip/stack/SIPDialog;I)V
    .locals 0
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .param p1, "x1"    # I

    .line 149
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->raiseErrorEvent(I)V

    return-void
.end method

.method static synthetic access$400(Landroid/gov/nist/javax/sip/stack/SIPDialog;ILandroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V
    .locals 0
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .param p1, "x1"    # I
    .param p2, "x2"    # Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 149
    invoke-direct {p0, p1, p2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->raiseErrorEvent(ILandroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V

    return-void
.end method

.method static synthetic access$500(Landroid/gov/nist/javax/sip/stack/SIPDialog;I)Z
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .param p1, "x1"    # I

    .line 149
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->toRetransmitFinalResponse(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$600(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # I
    .param p3, "x3"    # Ljava/lang/String;

    .line 149
    invoke-direct {p0, p1, p2, p3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->raiseIOException(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Landroid/gov/nist/javax/sip/stack/SIPDialog;)I
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 149
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogState:I

    return v0
.end method

.method static synthetic access$800(Landroid/gov/nist/javax/sip/stack/SIPDialog;)J
    .locals 2
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 149
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->highestSequenceNumberAcknowledged:J

    return-wide v0
.end method

.method static synthetic access$902(Landroid/gov/nist/javax/sip/stack/SIPDialog;Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;)Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;
    .locals 0
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .param p1, "x1"    # Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;

    .line 149
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogDeleteIfNoAckSentTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;

    return-object p1
.end method

.method private addRoute(Landroid/gov/nist/javax/sip/header/RecordRouteList;)V
    .locals 8
    .param p1, "recordRouteList"    # Landroid/gov/nist/javax/sip/header/RecordRouteList;

    .line 1023
    const-string v0, "NON LR route in Route set detected for dialog : "

    const-string/jumbo v1, "route = "

    const/16 v2, 0x20

    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isServer()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1027
    new-instance v3, Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-direct {v3}, Landroid/gov/nist/javax/sip/header/RouteList;-><init>()V

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    .line 1030
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/header/RecordRouteList;->size()I

    move-result v3

    invoke-virtual {p1, v3}, Landroid/gov/nist/javax/sip/header/RecordRouteList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v3

    .line 1032
    .local v3, "li":Ljava/util/ListIterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1033
    invoke-interface {v3}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/header/RecordRoute;

    .line 1035
    .local v4, "rr":Landroid/gov/nist/javax/sip/header/RecordRoute;
    new-instance v5, Landroid/gov/nist/javax/sip/header/Route;

    invoke-direct {v5}, Landroid/gov/nist/javax/sip/header/Route;-><init>()V

    .line 1036
    .local v5, "route":Landroid/gov/nist/javax/sip/header/Route;
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/RecordRoute;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/address/AddressImpl;->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 1039
    .local v6, "address":Landroid/gov/nist/javax/sip/address/AddressImpl;
    invoke-virtual {v5, v6}, Landroid/gov/nist/javax/sip/header/Route;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 1040
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/RecordRoute;->getParameters()Landroid/gov/nist/core/NameValueList;

    move-result-object v7

    invoke-virtual {v7}, Landroid/gov/nist/core/NameValueList;->clone()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v5, v7}, Landroid/gov/nist/javax/sip/header/Route;->setParameters(Landroid/gov/nist/core/NameValueList;)V

    .line 1043
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-virtual {v7, v5}, Landroid/gov/nist/javax/sip/header/RouteList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 1044
    nop

    .end local v4    # "rr":Landroid/gov/nist/javax/sip/header/RecordRoute;
    .end local v5    # "route":Landroid/gov/nist/javax/sip/header/Route;
    .end local v6    # "address":Landroid/gov/nist/javax/sip/address/AddressImpl;
    goto :goto_0

    .line 1045
    .end local v3    # "li":Ljava/util/ListIterator;
    :cond_0
    goto :goto_2

    .line 1050
    :cond_1
    new-instance v3, Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-direct {v3}, Landroid/gov/nist/javax/sip/header/RouteList;-><init>()V

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    .line 1051
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/header/RecordRouteList;->listIterator()Ljava/util/ListIterator;

    move-result-object v3

    .line 1052
    .restart local v3    # "li":Ljava/util/ListIterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/ListIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1053
    invoke-interface {v3}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/header/RecordRoute;

    .line 1055
    .restart local v4    # "rr":Landroid/gov/nist/javax/sip/header/RecordRoute;
    new-instance v5, Landroid/gov/nist/javax/sip/header/Route;

    invoke-direct {v5}, Landroid/gov/nist/javax/sip/header/Route;-><init>()V

    .line 1056
    .restart local v5    # "route":Landroid/gov/nist/javax/sip/header/Route;
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/RecordRoute;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/address/AddressImpl;->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/address/AddressImpl;

    .line 1058
    .restart local v6    # "address":Landroid/gov/nist/javax/sip/address/AddressImpl;
    invoke-virtual {v5, v6}, Landroid/gov/nist/javax/sip/header/Route;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 1059
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/RecordRoute;->getParameters()Landroid/gov/nist/core/NameValueList;

    move-result-object v7

    invoke-virtual {v7}, Landroid/gov/nist/core/NameValueList;->clone()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v5, v7}, Landroid/gov/nist/javax/sip/header/Route;->setParameters(Landroid/gov/nist/core/NameValueList;)V

    .line 1061
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-virtual {v7, v5}, Landroid/gov/nist/javax/sip/header/RouteList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1063
    nop

    .end local v4    # "rr":Landroid/gov/nist/javax/sip/header/RecordRoute;
    .end local v5    # "route":Landroid/gov/nist/javax/sip/header/Route;
    .end local v6    # "address":Landroid/gov/nist/javax/sip/address/AddressImpl;
    goto :goto_1

    .line 1066
    .end local v3    # "li":Ljava/util/ListIterator;
    :cond_2
    :goto_2
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 1067
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/RouteList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 1069
    .local v3, "it":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 1070
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/header/Route;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/Route;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v4

    invoke-interface {v4}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v4

    check-cast v4, Landroid/javax/sip/address/SipURI;

    check-cast v4, Landroid/javax/sip/address/SipURI;

    .line 1072
    .local v4, "sipUri":Landroid/javax/sip/address/SipURI;
    invoke-interface {v4}, Landroid/javax/sip/address/SipURI;->hasLrParam()Z

    move-result v5

    if-nez v5, :cond_3

    .line 1073
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1074
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 1077
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    goto :goto_4

    .line 1080
    :cond_3
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1082
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1085
    .end local v4    # "sipUri":Landroid/javax/sip/address/SipURI;
    :cond_4
    :goto_4
    goto :goto_3

    .line 1086
    .end local v3    # "it":Ljava/util/Iterator;
    :cond_5
    nop

    .line 1088
    :cond_6
    return-void

    .line 1066
    :catchall_0
    move-exception v3

    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 1067
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/RouteList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 1069
    .local v4, "it":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 1070
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/header/Route;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/header/Route;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v5

    invoke-interface {v5}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v5

    check-cast v5, Landroid/javax/sip/address/SipURI;

    check-cast v5, Landroid/javax/sip/address/SipURI;

    .line 1072
    .local v5, "sipUri":Landroid/javax/sip/address/SipURI;
    invoke-interface {v5}, Landroid/javax/sip/address/SipURI;->hasLrParam()Z

    move-result v6

    if-nez v6, :cond_7

    .line 1073
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v6

    if-eqz v6, :cond_8

    .line 1074
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 1077
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    goto :goto_6

    .line 1080
    :cond_7
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 1082
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1085
    .end local v5    # "sipUri":Landroid/javax/sip/address/SipURI;
    :cond_8
    :goto_6
    goto :goto_5

    .line 1086
    .end local v4    # "it":Ljava/util/Iterator;
    :cond_9
    throw v3
.end method

.method private declared-synchronized addRoute(Landroid/gov/nist/javax/sip/message/SIPResponse;)V
    .locals 4
    .param p1, "sipResponse"    # Landroid/gov/nist/javax/sip/message/SIPResponse;

    monitor-enter p0

    .line 1118
    const/16 v0, 0x20

    :try_start_0
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v1, :cond_0

    .line 1119
    :try_start_1
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setContact: dialogState: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "state = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1175
    :catchall_0
    move-exception v1

    goto/16 :goto_3

    .line 1123
    :cond_0
    :goto_0
    :try_start_2
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/16 v2, 0x64

    if-ne v1, v2, :cond_2

    .line 1175
    :try_start_3
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1176
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :cond_1
    :goto_1
    monitor-exit p0

    return-void

    .line 1126
    :cond_2
    :try_start_4
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogState:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    const/4 v3, 0x3

    if-ne v1, v3, :cond_3

    .line 1175
    :try_start_5
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1176
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_1

    .line 1129
    :cond_3
    :try_start_6
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogState:I

    const/4 v3, 0x1

    if-ne v1, v3, :cond_5

    .line 1133
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v1

    div-int/2addr v1, v2

    const/4 v2, 0x2

    if-ne v1, v2, :cond_4

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isServer()Z

    move-result v1

    if-nez v1, :cond_4

    .line 1134
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getContactHeaders()Landroid/gov/nist/javax/sip/header/ContactList;

    move-result-object v1

    .line 1135
    .local v1, "contactList":Landroid/gov/nist/javax/sip/header/ContactList;
    if-eqz v1, :cond_4

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v2

    invoke-interface {v2}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->isTargetRefresh(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1138
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/ContactList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/header/ContactHeader;

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRemoteTarget(Landroid/javax/sip/header/ContactHeader;)V

    .line 1142
    .end local v1    # "contactList":Landroid/gov/nist/javax/sip/header/ContactList;
    :cond_4
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->pendingRouteUpdateOn202Response:Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    if-nez v1, :cond_5

    .line 1175
    :try_start_7
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1176
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    goto :goto_1

    .line 1147
    :cond_5
    :try_start_8
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isServer()Z

    move-result v1

    if-eqz v1, :cond_6

    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->pendingRouteUpdateOn202Response:Z

    if-eqz v1, :cond_b

    .line 1151
    :cond_6
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v1

    sget-object v2, Landroid/javax/sip/DialogState;->CONFIRMED:Landroid/javax/sip/DialogState;

    if-eq v1, v2, :cond_7

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v1

    sget-object v2, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    if-ne v1, v2, :cond_8

    :cond_7
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->pendingRouteUpdateOn202Response:Z

    if-eqz v1, :cond_a

    .line 1154
    :cond_8
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getRecordRouteHeaders()Landroid/gov/nist/javax/sip/header/RecordRouteList;

    move-result-object v1

    .line 1158
    .local v1, "rrlist":Landroid/gov/nist/javax/sip/header/RecordRouteList;
    if-eqz v1, :cond_9

    .line 1159
    invoke-direct {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addRoute(Landroid/gov/nist/javax/sip/header/RecordRouteList;)V

    goto :goto_2

    .line 1162
    :cond_9
    new-instance v2, Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/RouteList;-><init>()V

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    .line 1166
    .end local v1    # "rrlist":Landroid/gov/nist/javax/sip/header/RecordRouteList;
    :cond_a
    :goto_2
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getContactHeaders()Landroid/gov/nist/javax/sip/header/ContactList;

    move-result-object v1

    .line 1167
    .local v1, "contactList":Landroid/gov/nist/javax/sip/header/ContactList;
    if-eqz v1, :cond_b

    .line 1168
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/ContactList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/header/ContactHeader;

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRemoteTarget(Landroid/javax/sip/header/ContactHeader;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 1175
    .end local v1    # "contactList":Landroid/gov/nist/javax/sip/header/ContactList;
    :cond_b
    :try_start_9
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 1176
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 1179
    :cond_c
    monitor-exit p0

    return-void

    .line 1175
    :catchall_1
    move-exception v1

    :goto_3
    :try_start_a
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1176
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    :cond_d
    throw v1

    .line 1117
    .end local p1    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :catchall_2
    move-exception p1

    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    throw p1
.end method

.method private createRequest(Ljava/lang/String;Ljava/lang/String;)Landroid/gov/nist/javax/sip/message/SIPRequest;
    .locals 12
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "topMostViaTransport"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 2428
    if-eqz p1, :cond_e

    if-eqz p2, :cond_e

    .line 2431
    const-string v0, "CANCEL"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 2434
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    if-eqz v0, :cond_c

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    invoke-virtual {v0}, Landroid/javax/sip/DialogState;->getValue()I

    move-result v0

    const/4 v1, 0x3

    const-string v2, "BYE"

    if-ne v0, v1, :cond_0

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isServer()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    invoke-virtual {v0}, Landroid/javax/sip/DialogState;->getValue()I

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 2443
    :cond_1
    const/4 v0, 0x0

    .line 2444
    .local v0, "sipUri":Landroid/gov/nist/javax/sip/address/SipUri;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTarget()Landroid/javax/sip/address/Address;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 2445
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTarget()Landroid/javax/sip/address/Address;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/address/URI;->clone()Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Landroid/gov/nist/javax/sip/address/SipUri;

    goto :goto_0

    .line 2447
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteParty()Landroid/javax/sip/address/Address;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/address/URI;->clone()Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Landroid/gov/nist/javax/sip/address/SipUri;

    .line 2448
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/SipUri;->clearUriParms()V

    .line 2451
    :goto_0
    new-instance v1, Landroid/gov/nist/javax/sip/header/CSeq;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/CSeq;-><init>()V

    move-object v7, v1

    .line 2453
    .local v7, "cseq":Landroid/gov/nist/javax/sip/header/CSeq;
    :try_start_0
    invoke-virtual {v7, p1}, Landroid/gov/nist/javax/sip/header/CSeq;->setMethod(Ljava/lang/String;)V

    .line 2454
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalSeqNumber()J

    move-result-wide v1

    invoke-virtual {v7, v1, v2}, Landroid/gov/nist/javax/sip/header/CSeq;->setSeqNumber(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2459
    goto :goto_1

    .line 2455
    :catch_0
    move-exception v1

    .line 2456
    .local v1, "ex":Ljava/lang/Exception;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2457
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v3, "Unexpected error"

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 2458
    :cond_3
    invoke-static {v1}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 2465
    .end local v1    # "ex":Ljava/lang/Exception;
    :goto_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    invoke-virtual {v1, p2}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 2467
    .local v8, "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    if-nez v8, :cond_5

    .line 2468
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v1

    const-string v2, "Cannot find listening point for transport "

    if-eqz v1, :cond_4

    .line 2469
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 2472
    :cond_4
    new-instance v1, Landroid/javax/sip/SipException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2475
    :cond_5
    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getViaHeader()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v9

    .line 2477
    .local v9, "via":Landroid/gov/nist/javax/sip/header/Via;
    new-instance v1, Landroid/gov/nist/javax/sip/header/From;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/From;-><init>()V

    move-object v10, v1

    .line 2478
    .local v10, "from":Landroid/gov/nist/javax/sip/header/From;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalParty()Landroid/javax/sip/address/Address;

    move-result-object v1

    invoke-virtual {v10, v1}, Landroid/gov/nist/javax/sip/header/From;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 2479
    new-instance v1, Landroid/gov/nist/javax/sip/header/To;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/To;-><init>()V

    move-object v11, v1

    .line 2480
    .local v11, "to":Landroid/gov/nist/javax/sip/header/To;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteParty()Landroid/javax/sip/address/Address;

    move-result-object v1

    invoke-virtual {v11, v1}, Landroid/gov/nist/javax/sip/header/To;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 2481
    move-object v1, p0

    move-object v2, v0

    move-object v3, v9

    move-object v4, v7

    move-object v5, v10

    move-object v6, v11

    invoke-virtual/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->createRequest(Landroid/gov/nist/javax/sip/address/SipUri;Landroid/gov/nist/javax/sip/header/Via;Landroid/gov/nist/javax/sip/header/CSeq;Landroid/gov/nist/javax/sip/header/From;Landroid/gov/nist/javax/sip/header/To;)Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v1

    .line 2491
    .local v1, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-static {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->isTargetRefresh(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 2492
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getTransport()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->createContactHeader()Landroid/javax/sip/header/ContactHeader;

    move-result-object v2

    .line 2496
    .local v2, "contactHeader":Landroid/javax/sip/header/ContactHeader;
    invoke-interface {v2}, Landroid/javax/sip/header/ContactHeader;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v3

    check-cast v3, Landroid/javax/sip/address/SipURI;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isSecure()Z

    move-result v4

    invoke-interface {v3, v4}, Landroid/javax/sip/address/SipURI;->setSecure(Z)V

    .line 2498
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 2506
    .end local v2    # "contactHeader":Landroid/javax/sip/header/ContactHeader;
    :cond_6
    :try_start_1
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/header/CSeq;

    move-object v7, v2

    .line 2507
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalSeqNumber()J

    move-result-wide v2

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    invoke-virtual {v7, v2, v3}, Landroid/gov/nist/javax/sip/header/CSeq;->setSeqNumber(J)V

    .line 2508
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 2509
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "SIPDialog::createRequest:setting Request Seq Number to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/header/CSeq;->getSeqNumber()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 2515
    :cond_7
    goto :goto_2

    .line 2513
    :catch_1
    move-exception v2

    .line 2514
    .local v2, "ex":Landroid/javax/sip/InvalidArgumentException;
    invoke-static {v2}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 2517
    .end local v2    # "ex":Landroid/javax/sip/InvalidArgumentException;
    :goto_2
    const-string/jumbo v2, "SUBSCRIBE"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 2518
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventHeader:Landroid/javax/sip/header/EventHeader;

    if-eqz v2, :cond_8

    .line 2519
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventHeader:Landroid/javax/sip/header/EventHeader;

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->addHeader(Landroid/javax/sip/header/Header;)V

    .line 2527
    :cond_8
    const-string v2, "NOTIFY"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 2528
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventHeader:Landroid/javax/sip/header/EventHeader;

    if-eqz v2, :cond_9

    .line 2529
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventHeader:Landroid/javax/sip/header/EventHeader;

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->addHeader(Landroid/javax/sip/header/Header;)V

    .line 2547
    :cond_9
    :try_start_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 2548
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v2}, Landroid/gov/nist/javax/sip/header/From;->setTag(Ljava/lang/String;)V

    goto :goto_3

    .line 2550
    :cond_a
    invoke-virtual {v10}, Landroid/gov/nist/javax/sip/header/From;->removeTag()V

    .line 2552
    :goto_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_b

    .line 2553
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v2}, Landroid/gov/nist/javax/sip/header/To;->setTag(Ljava/lang/String;)V

    goto :goto_4

    .line 2555
    :cond_b
    invoke-virtual {v11}, Landroid/gov/nist/javax/sip/header/To;->removeTag()V
    :try_end_2
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_2

    .line 2559
    :goto_4
    goto :goto_5

    .line 2557
    :catch_2
    move-exception v2

    .line 2558
    .local v2, "ex":Ljava/text/ParseException;
    invoke-static {v2}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 2563
    .end local v2    # "ex":Ljava/text/ParseException;
    :goto_5
    invoke-direct {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->updateRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 2567
    return-object v1

    .line 2440
    .end local v0    # "sipUri":Landroid/gov/nist/javax/sip/address/SipUri;
    .end local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v7    # "cseq":Landroid/gov/nist/javax/sip/header/CSeq;
    .end local v8    # "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    .end local v9    # "via":Landroid/gov/nist/javax/sip/header/Via;
    .end local v10    # "from":Landroid/gov/nist/javax/sip/header/From;
    .end local v11    # "to":Landroid/gov/nist/javax/sip/header/To;
    :cond_c
    new-instance v0, Landroid/javax/sip/SipException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Dialog  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not yet established or terminated "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2432
    :cond_d
    new-instance v0, Landroid/javax/sip/SipException;

    const-string v1, "Dialog.createRequest(): Invalid request"

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2429
    :cond_e
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null argument"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private doTargetRefresh(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .locals 2
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;

    .line 3764
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getContactHeaders()Landroid/gov/nist/javax/sip/header/ContactList;

    move-result-object v0

    .line 3771
    .local v0, "contactList":Landroid/gov/nist/javax/sip/header/ContactList;
    if-eqz v0, :cond_0

    .line 3773
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/ContactList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/Contact;

    .line 3774
    .local v1, "contact":Landroid/gov/nist/javax/sip/header/Contact;
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRemoteTarget(Landroid/javax/sip/header/ContactHeader;)V

    .line 3778
    .end local v1    # "contact":Landroid/gov/nist/javax/sip/header/Contact;
    :cond_0
    return-void
.end method

.method private declared-synchronized getRouteList()Landroid/gov/nist/javax/sip/header/RouteList;
    .locals 5

    monitor-enter p0

    .line 1187
    :try_start_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1188
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "getRouteList "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1191
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/RouteList;-><init>()V

    .line 1193
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/RouteList;
    new-instance v2, Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/RouteList;-><init>()V

    move-object v0, v2

    .line 1194
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    if-eqz v2, :cond_1

    .line 1195
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/RouteList;->listIterator()Ljava/util/ListIterator;

    move-result-object v2

    .line 1196
    .local v2, "li":Ljava/util/ListIterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1197
    invoke-interface {v2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/Route;

    .line 1198
    .local v3, "route":Landroid/gov/nist/javax/sip/header/Route;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/Route;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/header/Route;

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/header/RouteList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 1199
    nop

    .end local v3    # "route":Landroid/gov/nist/javax/sip/header/Route;
    goto :goto_0

    .line 1202
    .end local v2    # "li":Ljava/util/ListIterator;
    :cond_1
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1203
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "----- "

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1204
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "getRouteList for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1205
    nop

    .line 1206
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "RouteList = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/RouteList;->encode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1208
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    if-eqz v1, :cond_2

    .line 1209
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "myRouteList = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/RouteList;->encode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1211
    :cond_2
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "----- "

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1213
    :cond_3
    monitor-exit p0

    return-object v0

    .line 1186
    .end local v0    # "retval":Landroid/gov/nist/javax/sip/header/RouteList;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private static final optionPresent(Ljava/util/ListIterator;Ljava/lang/String;)Z
    .locals 2
    .param p0, "l"    # Ljava/util/ListIterator;
    .param p1, "option"    # Ljava/lang/String;

    .line 3781
    nop

    :goto_0
    invoke-interface {p0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3782
    invoke-interface {p0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/header/OptionTag;

    .line 3783
    .local v0, "opt":Landroid/javax/sip/header/OptionTag;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/javax/sip/header/OptionTag;->getOptionTag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3784
    const/4 v1, 0x1

    return v1

    .line 3785
    .end local v0    # "opt":Landroid/javax/sip/header/OptionTag;
    :cond_0
    goto :goto_0

    .line 3786
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private printRouteList()V
    .locals 3

    .line 903
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 904
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "this : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 905
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "printRouteList : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/RouteList;->encode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 908
    :cond_0
    return-void
.end method

.method private raiseErrorEvent(I)V
    .locals 1
    .param p1, "dialogTimeoutError"    # I

    .line 987
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->raiseErrorEvent(ILandroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V

    .line 988
    return-void
.end method

.method private raiseErrorEvent(ILandroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V
    .locals 4
    .param p1, "dialogTimeoutError"    # I
    .param p2, "clientTransaction"    # Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 946
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;

    invoke-direct {v0, p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;-><init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;I)V

    .line 951
    .local v0, "newErrorEvent":Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->setClientTransaction(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V

    .line 954
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventListeners:Ljava/util/Set;

    monitor-enter v1

    .line 956
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventListeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 957
    .local v2, "listenerIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 959
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;

    .line 960
    .local v3, "nextListener":Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;
    invoke-interface {v3, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;->dialogErrorEvent(Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;)V

    goto :goto_0

    .line 962
    .end local v3    # "nextListener":Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 964
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventListeners:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 970
    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    const/4 v1, 0x1

    if-eq p1, v1, :cond_1

    const/4 v1, 0x4

    if-eq p1, v1, :cond_1

    const/4 v1, 0x3

    if-eq p1, v1, :cond_1

    .line 974
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->delete()V

    .line 978
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->stopTimer()V

    .line 979
    return-void

    .line 962
    .end local v2    # "listenerIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;>;"
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method private raiseIOException(Ljava/lang/String;ILjava/lang/String;)V
    .locals 3
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "protocol"    # Ljava/lang/String;

    .line 925
    new-instance v0, Landroid/javax/sip/IOExceptionEvent;

    invoke-direct {v0, p0, p1, p2, p3}, Landroid/javax/sip/IOExceptionEvent;-><init>(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/String;)V

    .line 927
    .local v0, "ioError":Landroid/javax/sip/IOExceptionEvent;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 929
    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    .line 930
    return-void
.end method

.method private recordStackTrace()V
    .locals 6

    .line 764
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 765
    .local v0, "stringWriter":Ljava/io/StringWriter;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 766
    .local v1, "writer":Ljava/io/PrintWriter;
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 767
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    invoke-virtual {v2}, Ljava/util/Random;->nextInt()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 768
    .local v2, "stackTraceSignature":Ljava/lang/String;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "TraceRecord = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 769
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->stackTrace:Ljava/lang/String;

    .line 770
    return-void
.end method

.method private sendAck(Landroid/javax/sip/message/Request;Z)V
    .locals 9
    .param p1, "request"    # Landroid/javax/sip/message/Request;
    .param p2, "throwIOExceptionAsSipException"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 1239
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 1240
    .local v0, "ackRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1241
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "sendAck"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1243
    :cond_0
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v3, "ACK"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 1245
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v1

    if-eqz v1, :cond_f

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v1

    invoke-virtual {v1}, Landroid/javax/sip/DialogState;->getValue()I

    move-result v1

    if-nez v1, :cond_1

    goto/16 :goto_1

    .line 1255
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v1

    move-object v3, p1

    check-cast v3, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 1257
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1258
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CallID "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1260
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "RequestCallID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1264
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "dialog =  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1266
    :cond_2
    new-instance v1, Landroid/javax/sip/SipException;

    const-string v2, "Bad call ID in request"

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1269
    :cond_3
    :try_start_0
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1270
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "setting from tag For outgoing ACK= "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1273
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "setting To tag for outgoing ACK = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1276
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "ack = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1278
    :cond_4
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 1279
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/javax/sip/header/FromHeader;->setTag(Ljava/lang/String;)V

    .line 1280
    :cond_5
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 1281
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/javax/sip/header/ToHeader;->setTag(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_3

    .line 1284
    :cond_6
    nop

    .line 1286
    const/4 v1, 0x0

    .line 1287
    .local v1, "releaseAckSem":Z
    move-object v3, p1

    check-cast v3, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v3

    .line 1288
    .local v3, "cseqNo":J
    invoke-virtual {p0, v3, v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isAckSent(J)Z

    move-result v5

    if-nez v5, :cond_7

    .line 1289
    const/4 v1, 0x1

    .line 1293
    :cond_7
    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLastAckSent(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 1296
    :try_start_1
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackSendingStrategy:Landroid/gov/nist/javax/sip/stack/AckSendingStrategy;

    invoke-interface {v5, v0}, Landroid/gov/nist/javax/sip/stack/AckSendingStrategy;->send(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 1298
    const/4 v5, 0x1

    iput-boolean v5, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isAcknowledged:Z

    .line 1299
    iget-wide v5, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->highestSequenceNumberAcknowledged:J

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v7

    invoke-interface {v7}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    iput-wide v5, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->highestSequenceNumberAcknowledged:J

    .line 1302
    if-eqz v1, :cond_8

    iget-boolean v5, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isBackToBackUserAgent:Z

    if-eqz v5, :cond_8

    .line 1303
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseAckSem()V

    goto :goto_0

    .line 1305
    :cond_8
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 1306
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Not releasing ack sem for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " isAckSent "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Landroid/javax/sip/SipException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1324
    :catch_0
    move-exception v2

    .line 1325
    .local v2, "ex":Ljava/lang/Exception;
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 1326
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    .line 1327
    :cond_9
    new-instance v5, Landroid/javax/sip/SipException;

    const-string v6, "Could not create message channel"

    invoke-direct {v5, v6, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 1320
    .end local v2    # "ex":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    .line 1321
    .local v2, "ex":Landroid/javax/sip/SipException;
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v5

    if-eqz v5, :cond_a

    .line 1322
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    .line 1323
    :cond_a
    throw v2

    .line 1311
    .end local v2    # "ex":Landroid/javax/sip/SipException;
    :catch_2
    move-exception v2

    .line 1312
    .local v2, "ex":Ljava/io/IOException;
    if-nez p2, :cond_e

    .line 1314
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackSendingStrategy:Landroid/gov/nist/javax/sip/stack/AckSendingStrategy;

    invoke-interface {v5}, Landroid/gov/nist/javax/sip/stack/AckSendingStrategy;->getLastHop()Landroid/javax/sip/address/Hop;

    move-result-object v5

    .line 1315
    .local v5, "hop":Landroid/javax/sip/address/Hop;
    if-nez v5, :cond_b

    .line 1316
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v6, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getNextHop(Landroid/gov/nist/javax/sip/message/SIPRequest;)Landroid/javax/sip/address/Hop;

    move-result-object v5

    .line 1318
    :cond_b
    invoke-interface {v5}, Landroid/javax/sip/address/Hop;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v7

    invoke-interface {v5}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v6, v7, v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->raiseIOException(Ljava/lang/String;ILjava/lang/String;)V

    .line 1328
    .end local v2    # "ex":Ljava/io/IOException;
    .end local v5    # "hop":Landroid/javax/sip/address/Hop;
    :cond_c
    :goto_0
    nop

    .line 1329
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogDeleteTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteTask;

    if-eqz v2, :cond_d

    .line 1330
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v2

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogDeleteTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteTask;

    invoke-interface {v2, v5}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 1331
    const/4 v2, 0x0

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogDeleteTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteTask;

    .line 1334
    :cond_d
    return-void

    .line 1313
    .restart local v2    # "ex":Ljava/io/IOException;
    :cond_e
    new-instance v5, Landroid/javax/sip/SipException;

    const-string v6, "Could not send ack"

    invoke-direct {v5, v6, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 1282
    .end local v1    # "releaseAckSem":Z
    .end local v2    # "ex":Ljava/io/IOException;
    .end local v3    # "cseqNo":J
    :catch_3
    move-exception v1

    .line 1283
    .local v1, "ex":Ljava/text/ParseException;
    new-instance v2, Landroid/javax/sip/SipException;

    invoke-virtual {v1}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1247
    .end local v1    # "ex":Ljava/text/ParseException;
    :cond_f
    :goto_1
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/4 v2, 0x4

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 1248
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bad Dialog State for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " dialogID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1252
    :cond_10
    new-instance v1, Landroid/javax/sip/SipException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bad dialog state "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1244
    :cond_11
    new-instance v1, Landroid/javax/sip/SipException;

    const-string v2, "Bad request method -- should be ACK"

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private final setBranch(Landroid/gov/nist/javax/sip/header/Via;Ljava/lang/String;)V
    .locals 2
    .param p1, "via"    # Landroid/gov/nist/javax/sip/header/Via;
    .param p2, "method"    # Ljava/lang/String;

    .line 2624
    const-string v0, "ACK"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2625
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLastResponseStatusCode()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x12c

    if-lt v0, v1, :cond_0

    .line 2626
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseTopMostVia:Landroid/gov/nist/javax/sip/header/Via;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v0

    .local v0, "branch":Ljava/lang/String;
    goto :goto_0

    .line 2629
    .end local v0    # "branch":Ljava/lang/String;
    :cond_0
    invoke-static {}, Landroid/gov/nist/javax/sip/Utils;->getInstance()Landroid/gov/nist/javax/sip/Utils;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/Utils;->generateBranchId()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "branch":Ljava/lang/String;
    goto :goto_0

    .line 2632
    .end local v0    # "branch":Ljava/lang/String;
    :cond_1
    const-string v0, "CANCEL"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2633
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseTopMostVia:Landroid/gov/nist/javax/sip/header/Via;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v0

    .line 2639
    .restart local v0    # "branch":Ljava/lang/String;
    :goto_0
    :try_start_0
    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/header/Via;->setBranch(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2642
    goto :goto_1

    .line 2640
    :catch_0
    move-exception v1

    .line 2641
    .local v1, "e":Ljava/text/ParseException;
    invoke-virtual {v1}, Ljava/text/ParseException;->printStackTrace()V

    .line 2643
    .end local v1    # "e":Ljava/text/ParseException;
    :goto_1
    return-void

    .line 2636
    .end local v0    # "branch":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method private setCallId(Landroid/gov/nist/javax/sip/message/SIPRequest;)V
    .locals 1
    .param p1, "sipRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 2277
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->callIdHeader:Landroid/javax/sip/header/CallIdHeader;

    .line 2278
    return-void
.end method

.method private setLastAckSent(Landroid/gov/nist/javax/sip/message/SIPRequest;)V
    .locals 1
    .param p1, "lastAckSent"    # Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 4199
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;

    invoke-direct {v0, p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;-><init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckSent:Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;

    .line 4200
    return-void
.end method

.method private setLocalSequenceNumber(J)V
    .locals 4
    .param p1, "lCseq"    # J

    .line 2120
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2121
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setLocalSequenceNumber: original  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localSequenceNumber:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " new  = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2124
    :cond_0
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localSequenceNumber:J

    cmp-long v0, p1, v0

    if-lez v0, :cond_1

    .line 2126
    iput-wide p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localSequenceNumber:J

    .line 2127
    return-void

    .line 2125
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Sequence number should not decrease !"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private toRetransmitFinalResponse(I)Z
    .locals 2
    .param p1, "T2"    # I

    .line 2901
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->retransmissionTicksLeft:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->retransmissionTicksLeft:I

    if-nez v0, :cond_1

    .line 2902
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->prevRetransmissionTicks:I

    mul-int/lit8 v0, v0, 0x2

    if-gt v0, p1, :cond_0

    .line 2903
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->prevRetransmissionTicks:I

    mul-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->retransmissionTicksLeft:I

    goto :goto_0

    .line 2905
    :cond_0
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->prevRetransmissionTicks:I

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->retransmissionTicksLeft:I

    .line 2906
    :goto_0
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->retransmissionTicksLeft:I

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->prevRetransmissionTicks:I

    .line 2907
    return v1

    .line 2909
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private updateRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V
    .locals 2
    .param p1, "sipRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 3065
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRouteList()Landroid/gov/nist/javax/sip/header/RouteList;

    move-result-object v0

    .line 3066
    .local v0, "rl":Landroid/gov/nist/javax/sip/header/RouteList;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/RouteList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 3067
    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    goto :goto_0

    .line 3069
    :cond_0
    const-string/jumbo v1, "Route"

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->removeHeader(Ljava/lang/String;)V

    .line 3071
    :goto_0
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultUserAgentHeader()Landroid/javax/sip/header/UserAgentHeader;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 3072
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultUserAgentHeader()Landroid/javax/sip/header/UserAgentHeader;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 3079
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->proxyAuthorizationHeader:Landroid/javax/sip/header/ProxyAuthorizationHeader;

    if-eqz v1, :cond_2

    const-string/jumbo v1, "Proxy-Authorization"

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v1

    if-nez v1, :cond_2

    .line 3081
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->proxyAuthorizationHeader:Landroid/javax/sip/header/ProxyAuthorizationHeader;

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 3084
    :cond_2
    return-void
.end method


# virtual methods
.method ackReceived(J)V
    .locals 5
    .param p1, "cseqNumber"    # J

    .line 1376
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isAckSeen()Z

    move-result v0

    const/16 v1, 0x20

    if-eqz v0, :cond_1

    .line 1377
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1379
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v1, "Ack already seen for response -- dropping"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1381
    :cond_0
    return-void

    .line 1383
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getInviteTransaction()Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-result-object v0

    .line 1384
    .local v0, "tr":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    if-eqz v0, :cond_6

    .line 1385
    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getCSeq()J

    move-result-wide v2

    cmp-long v2, v2, p1

    if-nez v2, :cond_7

    .line 1386
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->acquireTimerTaskSem()V

    .line 1388
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    .line 1389
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v2

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;

    invoke-interface {v2, v4}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 1390
    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1393
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseTimerTaskSem()V

    .line 1394
    nop

    .line 1395
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogDeleteTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteTask;

    if-eqz v2, :cond_3

    .line 1396
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v2

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogDeleteTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteTask;

    invoke-interface {v2, v4}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 1397
    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogDeleteTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteTask;

    .line 1399
    :cond_3
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckReceivedCSeqNumber:Ljava/lang/Long;

    .line 1400
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1401
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "ackReceived for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1404
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/StackLogger;->getLineCount()I

    move-result v1

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackLine:I

    .line 1405
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->printDebugInfo()V

    .line 1407
    :cond_4
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isBackToBackUserAgent:Z

    if-eqz v1, :cond_5

    .line 1408
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseAckSem()V

    .line 1410
    :cond_5
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    goto :goto_0

    .line 1393
    :catchall_0
    move-exception v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseTimerTaskSem()V

    throw v1

    .line 1413
    :cond_6
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 1415
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "tr is null -- not updating the ack state"

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1418
    :cond_7
    :goto_0
    return-void
.end method

.method public acquireTimerTaskSem()V
    .locals 5

    .line 4281
    const/4 v0, 0x0

    .line 4283
    .local v0, "acquired":Z
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTaskLock:Ljava/util/concurrent/Semaphore;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0xa

    invoke-virtual {v1, v3, v4, v2}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    .line 4286
    goto :goto_0

    .line 4284
    :catch_0
    move-exception v1

    .line 4285
    .local v1, "ex":Ljava/lang/InterruptedException;
    const/4 v0, 0x0

    .line 4287
    .end local v1    # "ex":Ljava/lang/InterruptedException;
    :goto_0
    if-eqz v0, :cond_0

    .line 4291
    return-void

    .line 4288
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Impossible to acquire the dialog timer task lock"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public addEventListener(Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;)V
    .locals 1
    .param p1, "newListener"    # Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;

    .line 1442
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1443
    return-void
.end method

.method public declared-synchronized addRoute(Landroid/gov/nist/javax/sip/message/SIPRequest;)V
    .locals 3
    .param p1, "sipRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;

    monitor-enter p0

    .line 1771
    :try_start_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1772
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setContact: dialogState: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "state = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1777
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :cond_0
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->isTargetRefresh(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1779
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->doTargetRefresh(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 1781
    :cond_1
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogState:I

    if-eq v0, v1, :cond_6

    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    goto :goto_1

    .line 1788
    :cond_2
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getContactHeaders()Landroid/gov/nist/javax/sip/header/ContactList;

    move-result-object v0

    .line 1789
    .local v0, "contactList":Landroid/gov/nist/javax/sip/header/ContactList;
    if-eqz v0, :cond_3

    .line 1790
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/ContactList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v1

    check-cast v1, Landroid/javax/sip/header/ContactHeader;

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRemoteTarget(Landroid/javax/sip/header/ContactHeader;)V

    .line 1794
    :cond_3
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getToTag()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_4

    .line 1795
    monitor-exit p0

    return-void

    .line 1798
    :cond_4
    :try_start_1
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRecordRouteHeaders()Landroid/gov/nist/javax/sip/header/RecordRouteList;

    move-result-object v1

    .line 1801
    .local v1, "rrlist":Landroid/gov/nist/javax/sip/header/RecordRouteList;
    if-eqz v1, :cond_5

    .line 1802
    invoke-direct {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addRoute(Landroid/gov/nist/javax/sip/header/RecordRouteList;)V

    goto :goto_0

    .line 1805
    :cond_5
    new-instance v2, Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/RouteList;-><init>()V

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1808
    :goto_0
    monitor-exit p0

    return-void

    .line 1783
    .end local v0    # "contactList":Landroid/gov/nist/javax/sip/header/ContactList;
    .end local v1    # "rrlist":Landroid/gov/nist/javax/sip/header/RecordRouteList;
    :cond_6
    :goto_1
    monitor-exit p0

    return-void

    .line 1770
    .end local p1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public addTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Z
    .locals 8
    .param p1, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 1910
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v0

    .line 1913
    .local v0, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionSeen:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionId:Ljava/lang/String;

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getBranchId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getMethod()Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionMethod:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1916
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setReInviteFlag(Z)V

    .line 1917
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackProcessed:Z

    .line 1920
    :cond_0
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1921
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "SipDialog.addTransaction() "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " transaction = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1926
    :cond_1
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionSeen:Z

    if-nez v1, :cond_7

    .line 1930
    invoke-virtual {p0, p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->storeFirstTransactionInfo(Landroid/gov/nist/javax/sip/stack/SIPDialog;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1931
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v4, "SUBSCRIBE"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1932
    const-string v1, "Event"

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v1

    check-cast v1, Landroid/javax/sip/header/EventHeader;

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventHeader:Landroid/javax/sip/header/EventHeader;

    .line 1935
    :cond_2
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLocalParty(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 1936
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRemoteParty(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 1937
    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setCallId(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 1938
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-nez v1, :cond_3

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->isInviteTransaction()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1940
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    goto :goto_0

    .line 1941
    :cond_3
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v1, :cond_4

    .line 1942
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRecordRouteHeaders()Landroid/gov/nist/javax/sip/header/RecordRouteList;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeaders:Landroid/gov/nist/javax/sip/header/RecordRouteList;

    .line 1945
    :cond_4
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->method:Ljava/lang/String;

    if-nez v1, :cond_5

    .line 1946
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->method:Ljava/lang/String;

    .line 1949
    :cond_5
    instance-of v1, p1, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v1, :cond_6

    .line 1950
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/FromHeader;->getTag()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->hisTag:Ljava/lang/String;

    goto/16 :goto_2

    .line 1953
    :cond_6
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v4

    invoke-direct {p0, v4, v5}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLocalSequenceNumber(J)V

    .line 1954
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalSeqNumber()J

    move-result-wide v4

    iput-wide v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalLocalSequenceNumber:J

    .line 1955
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/FromHeader;->getTag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLocalTag(Ljava/lang/String;)V

    .line 1956
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->myTag:Ljava/lang/String;

    if-nez v1, :cond_a

    .line 1957
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 1958
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v4, "The request\'s From header is missing the required Tag parameter."

    invoke-interface {v1, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    goto :goto_2

    .line 1962
    :cond_7
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getMethod()Ljava/lang/String;

    move-result-object v1

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionMethod:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionIsServerTransaction:Z

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->isServerTransaction()Z

    move-result v4

    if-eq v1, v4, :cond_9

    .line 1969
    invoke-virtual {p0, p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->storeFirstTransactionInfo(Landroid/gov/nist/javax/sip/stack/SIPDialog;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1971
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLocalParty(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 1972
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRemoteParty(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 1973
    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setCallId(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 1974
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->isInviteTransaction()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 1975
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    goto :goto_1

    .line 1977
    :cond_8
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRecordRouteHeaders()Landroid/gov/nist/javax/sip/header/RecordRouteList;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeaders:Landroid/gov/nist/javax/sip/header/RecordRouteList;

    .line 1980
    :goto_1
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->method:Ljava/lang/String;

    goto :goto_2

    .line 1982
    :cond_9
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-nez v1, :cond_a

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->isInviteTransaction()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 1985
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 1987
    :cond_a
    :goto_2
    instance-of v1, p1, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v1, :cond_b

    .line 1988
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRemoteSequenceNumber(J)V

    .line 1996
    :cond_b
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 1997
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "isBackToBackUserAgent = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isBackToBackUserAgent:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2000
    :cond_c
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->isInviteTransaction()Z

    move-result v1

    if-eqz v1, :cond_e

    .line 2001
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 2002
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "SIPDialog::setLastTransaction:dialog= "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " lastTransaction = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2004
    :cond_d
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 2008
    :cond_e
    :try_start_0
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/message/Request;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v4, "REFER"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    instance-of v1, p1, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v1, :cond_10

    .line 2015
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v4

    .line 2016
    .local v4, "lastReferCSeq":J
    new-instance v1, Landroid/gov/nist/javax/sip/header/Event;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/Event;-><init>()V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventHeader:Landroid/javax/sip/header/EventHeader;

    .line 2017
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventHeader:Landroid/javax/sip/header/EventHeader;

    const-string/jumbo v6, "refer"

    invoke-interface {v1, v6}, Landroid/javax/sip/header/EventHeader;->setEventType(Ljava/lang/String;)V

    .line 2018
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 2019
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "SIPDialog::setLastTransaction:lastReferCSeq = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2021
    :cond_f
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventHeader:Landroid/javax/sip/header/EventHeader;

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v6}, Landroid/javax/sip/header/EventHeader;->setEventId(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2025
    .end local v4    # "lastReferCSeq":J
    :cond_10
    goto :goto_3

    .line 2023
    :catch_0
    move-exception v1

    .line 2024
    .local v1, "ex":Ljava/lang/Exception;
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v5, "Unexpected exception in REFER processing"

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logFatalError(Ljava/lang/String;)V

    .line 2027
    .end local v1    # "ex":Ljava/lang/Exception;
    :goto_3
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 2028
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Transaction Added "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->myTag:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->hisTag:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2030
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "TID = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getTransactionId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->isServerTransaction()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2033
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 2035
    :cond_11
    return v2
.end method

.method public checkRetransmissionForForking(Landroid/gov/nist/javax/sip/message/SIPResponse;)V
    .locals 10
    .param p1, "response"    # Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 4464
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v0

    .line 4465
    .local v0, "statusCode":I
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeqHeader()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v1

    .line 4466
    .local v1, "responseMethod":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v2

    invoke-interface {v2}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v2

    .line 4471
    .local v2, "responseCSeqNumber":J
    const-string/jumbo v4, "RSeq"

    invoke-virtual {p1, v4}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/header/RSeq;

    .line 4472
    .local v4, "rseq":Landroid/gov/nist/javax/sip/header/RSeq;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 4473
    .local v5, "retransCondition":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 4474
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/RSeq;->getSeqNumber()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 4476
    :cond_0
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->responsesReceivedInForkingCase:Ljava/util/Set;

    invoke-interface {v6, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v6

    xor-int/lit8 v6, v6, 0x1

    .line 4477
    .local v6, "isRetransmission":Z
    invoke-virtual {p1, v6}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setRetransmission(Z)V

    .line 4478
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v8, 0x20

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 4479
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "marking response as retransmission "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " for dialog "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 4482
    :cond_1
    return-void
.end method

.method protected cleanUp()V
    .locals 3

    .line 4380
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v0

    sget-object v1, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->None:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    if-eq v0, v1, :cond_4

    .line 4381
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->cleanUpOnAck()V

    .line 4382
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4383
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "dialog cleanup : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 4386
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventListeners:Ljava/util/Set;

    if-eqz v0, :cond_1

    .line 4387
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 4389
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTaskLock:Ljava/util/concurrent/Semaphore;

    .line 4390
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackSem:Ljava/util/concurrent/Semaphore;

    .line 4391
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->contactHeader:Landroid/gov/nist/javax/sip/header/Contact;

    .line 4392
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventHeader:Landroid/javax/sip/header/EventHeader;

    .line 4393
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionId:Ljava/lang/String;

    .line 4394
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionMethod:Ljava/lang/String;

    .line 4398
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseDialogId:Ljava/lang/String;

    .line 4399
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseMethod:Ljava/lang/String;

    .line 4400
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseTopMostVia:Landroid/gov/nist/javax/sip/header/Via;

    .line 4401
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeaders:Landroid/gov/nist/javax/sip/header/RecordRouteList;

    if-eqz v1, :cond_2

    .line 4402
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeaders:Landroid/gov/nist/javax/sip/header/RecordRouteList;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/RecordRouteList;->clear()V

    .line 4403
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeaders:Landroid/gov/nist/javax/sip/header/RecordRouteList;

    .line 4404
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeadersString:Ljava/lang/String;

    .line 4406
    :cond_2
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    if-eqz v1, :cond_3

    .line 4407
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/RouteList;->clear()V

    .line 4408
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    .line 4410
    :cond_3
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->responsesReceivedInForkingCase:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 4412
    :cond_4
    return-void
.end method

.method protected cleanUpOnAck()V
    .locals 3

    .line 4327
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v0

    sget-object v1, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->None:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    if-eq v0, v1, :cond_b

    .line 4328
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4329
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "cleanupOnAck : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 4332
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 4333
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeaders:Landroid/gov/nist/javax/sip/header/RecordRouteList;

    if-eqz v0, :cond_1

    .line 4334
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeaders:Landroid/gov/nist/javax/sip/header/RecordRouteList;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/RecordRouteList;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeadersString:Ljava/lang/String;

    .line 4337
    :cond_1
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeaders:Landroid/gov/nist/javax/sip/header/RecordRouteList;

    .line 4338
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 4340
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v0, :cond_4

    .line 4341
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 4342
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->cleanUp()V

    .line 4344
    :cond_3
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 4346
    :cond_4
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v0, :cond_6

    .line 4347
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 4348
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->cleanUp()V

    .line 4350
    :cond_5
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 4352
    :cond_6
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->callIdHeader:Landroid/javax/sip/header/CallIdHeader;

    if-eqz v0, :cond_7

    .line 4353
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->callIdHeader:Landroid/javax/sip/header/CallIdHeader;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->callIdHeaderString:Ljava/lang/String;

    .line 4354
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->callIdHeader:Landroid/javax/sip/header/CallIdHeader;

    .line 4356
    :cond_7
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->contactHeader:Landroid/gov/nist/javax/sip/header/Contact;

    if-eqz v0, :cond_8

    .line 4357
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->contactHeader:Landroid/gov/nist/javax/sip/header/Contact;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Contact;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->contactHeaderStringified:Ljava/lang/String;

    .line 4358
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->contactHeader:Landroid/gov/nist/javax/sip/header/Contact;

    .line 4360
    :cond_8
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteTarget:Landroid/javax/sip/address/Address;

    if-eqz v0, :cond_9

    .line 4361
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteTarget:Landroid/javax/sip/address/Address;

    invoke-interface {v0}, Landroid/javax/sip/address/Address;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteTargetStringified:Ljava/lang/String;

    .line 4362
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteTarget:Landroid/javax/sip/address/Address;

    .line 4364
    :cond_9
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteParty:Landroid/javax/sip/address/Address;

    if-eqz v0, :cond_a

    .line 4365
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteParty:Landroid/javax/sip/address/Address;

    invoke-interface {v0}, Landroid/javax/sip/address/Address;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remotePartyStringified:Ljava/lang/String;

    .line 4366
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteParty:Landroid/javax/sip/address/Address;

    .line 4368
    :cond_a
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localParty:Landroid/javax/sip/address/Address;

    if-eqz v0, :cond_b

    .line 4369
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localParty:Landroid/javax/sip/address/Address;

    invoke-interface {v0}, Landroid/javax/sip/address/Address;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localPartyStringified:Ljava/lang/String;

    .line 4370
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localParty:Landroid/javax/sip/address/Address;

    .line 4373
    :cond_b
    return-void
.end method

.method public createAck(J)Landroid/javax/sip/message/Request;
    .locals 10
    .param p1, "cseqno"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;,
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 3111
    const-string v0, "ACK"

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->method:Ljava/lang/String;

    const-string v2, "INVITE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 3115
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-lez v1, :cond_17

    .line 3117
    const-wide v1, 0xffffffffL

    cmp-long v1, p1, v1

    if-gtz v1, :cond_16

    .line 3121
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTarget()Landroid/javax/sip/address/Address;

    move-result-object v1

    if-eqz v1, :cond_15

    .line 3125
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3126
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "createAck "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " cseqno "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3132
    :cond_0
    iget-wide v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastInviteOkReceived:J

    cmp-long v1, v3, p1

    if-gez v1, :cond_2

    .line 3133
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3134
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "WARNING : Attempt to crete ACK without OK "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3136
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LAST RESPONSE = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLastResponseStatusCode()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3139
    :cond_1
    new-instance v0, Landroid/javax/sip/SipException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Dialog not yet established -- no OK response! lastInviteOkReceived="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastInviteOkReceived:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " cseqno="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3149
    :cond_2
    const/4 v1, 0x0

    .line 3151
    .local v1, "uri4transport":Landroid/javax/sip/address/SipURI;
    :try_start_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    if-eqz v3, :cond_3

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/RouteList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 3152
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/RouteList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/Route;

    .line 3153
    .local v3, "r":Landroid/gov/nist/javax/sip/header/Route;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/Route;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v4

    invoke-interface {v4}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v4

    check-cast v4, Landroid/javax/sip/address/SipURI;

    move-object v1, v4

    .line 3154
    .end local v3    # "r":Landroid/gov/nist/javax/sip/header/Route;
    goto :goto_0

    .line 3155
    :cond_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTarget()Landroid/javax/sip/address/Address;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v3

    check-cast v3, Landroid/javax/sip/address/SipURI;

    move-object v1, v3

    .line 3158
    :goto_0
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->getTransportParam()Ljava/lang/String;

    move-result-object v3

    .line 3161
    .local v3, "transport":Ljava/lang/String;
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->isSecure()Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string/jumbo v5, "UDP"

    const-string/jumbo v6, "TLS"

    if-eqz v4, :cond_6

    .line 3163
    if-eqz v3, :cond_5

    :try_start_1
    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    goto :goto_1

    .line 3164
    :cond_4
    new-instance v0, Landroid/javax/sip/SipException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot create ACK - impossible to use sips uri with transport UDP:"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local p1    # "cseqno":J
    throw v0

    .line 3166
    .restart local p1    # "cseqno":J
    :cond_5
    :goto_1
    move-object v3, v6

    .line 3168
    :cond_6
    if-eqz v3, :cond_7

    .line 3169
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    invoke-virtual {v4, v3}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .local v4, "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    goto :goto_2

    .line 3172
    .end local v4    # "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    :cond_7
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->isSecure()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 3173
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    invoke-virtual {v4, v6}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .restart local v4    # "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    goto :goto_2

    .line 3176
    .end local v4    # "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    :cond_8
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    invoke-virtual {v4, v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 3178
    .restart local v4    # "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    if-nez v4, :cond_9

    .line 3179
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    const-string/jumbo v6, "TCP"

    invoke-virtual {v5, v6}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    move-object v4, v5

    .line 3186
    :cond_9
    :goto_2
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 3187
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "uri4transport =  "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3190
    :cond_a
    if-nez v4, :cond_e

    .line 3191
    invoke-interface {v1}, Landroid/javax/sip/address/SipURI;->isSecure()Z

    move-result v5

    if-nez v5, :cond_c

    .line 3193
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 3194
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No Listening point for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " Using last response topmost"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3198
    :cond_b
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseTopMostVia:Landroid/gov/nist/javax/sip/header/Via;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/header/Via;->getTransport()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    move-object v4, v5

    .line 3203
    :cond_c
    if-nez v4, :cond_e

    .line 3204
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/4 v2, 0x4

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 3205
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "remoteTargetURI "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTarget()Landroid/javax/sip/address/Address;

    move-result-object v5

    invoke-interface {v5}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 3208
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "uri4transport = "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 3210
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No LP found for transport="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 3213
    :cond_d
    new-instance v0, Landroid/javax/sip/SipException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Cannot create ACK - no ListeningPoint for transport towards next hop found:"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local p1    # "cseqno":J
    throw v0

    .line 3219
    .restart local p1    # "cseqno":J
    :cond_e
    new-instance v5, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-direct {v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;-><init>()V

    .line 3220
    .local v5, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v5, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setMethod(Ljava/lang/String;)V

    .line 3221
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTarget()Landroid/javax/sip/address/Address;

    move-result-object v6

    invoke-interface {v6}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v6

    invoke-interface {v6}, Landroid/javax/sip/address/URI;->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/address/SipUri;

    invoke-virtual {v5, v6}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setRequestURI(Landroid/javax/sip/address/URI;)V

    .line 3223
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setCallId(Landroid/javax/sip/header/CallIdHeader;)V

    .line 3224
    new-instance v6, Landroid/gov/nist/javax/sip/header/CSeq;

    invoke-direct {v6, p1, p2, v0}, Landroid/gov/nist/javax/sip/header/CSeq;-><init>(JLjava/lang/String;)V

    invoke-virtual {v5, v6}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setCSeq(Landroid/javax/sip/header/CSeqHeader;)V

    .line 3225
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3233
    .local v0, "vias":Ljava/util/List;, "Ljava/util/List<Landroid/gov/nist/javax/sip/header/Via;>;"
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseTopMostVia:Landroid/gov/nist/javax/sip/header/Via;

    .line 3234
    .local v6, "via":Landroid/gov/nist/javax/sip/header/Via;
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 3235
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "lastResponseTopMostVia "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseTopMostVia:Landroid/gov/nist/javax/sip/header/Via;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3237
    :cond_f
    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/header/Via;->removeParameters()V

    .line 3238
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v7, :cond_10

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v7

    if-eqz v7, :cond_10

    .line 3240
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v7

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/header/Via;->getParameters()Landroid/gov/nist/core/NameValueList;

    move-result-object v7

    .line 3242
    .local v7, "originalRequestParameters":Landroid/gov/nist/core/NameValueList;
    if-eqz v7, :cond_10

    invoke-virtual {v7}, Landroid/gov/nist/core/NameValueList;->size()I

    move-result v8

    if-lez v8, :cond_10

    .line 3244
    invoke-virtual {v7}, Landroid/gov/nist/core/NameValueList;->clone()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v6, v8}, Landroid/gov/nist/javax/sip/header/Via;->setParameters(Landroid/gov/nist/core/NameValueList;)V

    .line 3248
    .end local v7    # "originalRequestParameters":Landroid/gov/nist/core/NameValueList;
    :cond_10
    invoke-static {}, Landroid/gov/nist/javax/sip/Utils;->getInstance()Landroid/gov/nist/javax/sip/Utils;

    move-result-object v7

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/Utils;->generateBranchId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/gov/nist/javax/sip/header/Via;->setBranch(Ljava/lang/String;)V

    .line 3249
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3250
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 3251
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Adding via to the ACK we are creating : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " lastResponseTopMostVia "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseTopMostVia:Landroid/gov/nist/javax/sip/header/Via;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3253
    :cond_11
    invoke-virtual {v5, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setVia(Ljava/util/List;)V

    .line 3255
    new-instance v2, Landroid/gov/nist/javax/sip/header/From;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/From;-><init>()V

    .line 3256
    .local v2, "from":Landroid/gov/nist/javax/sip/header/From;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalParty()Landroid/javax/sip/address/Address;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/gov/nist/javax/sip/header/From;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 3257
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->myTag:Ljava/lang/String;

    invoke-virtual {v2, v7}, Landroid/gov/nist/javax/sip/header/From;->setTag(Ljava/lang/String;)V

    .line 3258
    invoke-virtual {v5, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setFrom(Landroid/javax/sip/header/FromHeader;)V

    .line 3259
    new-instance v7, Landroid/gov/nist/javax/sip/header/To;

    invoke-direct {v7}, Landroid/gov/nist/javax/sip/header/To;-><init>()V

    .line 3260
    .local v7, "to":Landroid/gov/nist/javax/sip/header/To;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteParty()Landroid/javax/sip/address/Address;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/gov/nist/javax/sip/header/To;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 3261
    iget-object v8, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->hisTag:Ljava/lang/String;

    if-eqz v8, :cond_12

    .line 3262
    iget-object v8, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->hisTag:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroid/gov/nist/javax/sip/header/To;->setTag(Ljava/lang/String;)V

    .line 3263
    :cond_12
    invoke-virtual {v5, v7}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setTo(Landroid/javax/sip/header/ToHeader;)V

    .line 3264
    new-instance v8, Landroid/gov/nist/javax/sip/header/MaxForwards;

    const/16 v9, 0x46

    invoke-direct {v8, v9}, Landroid/gov/nist/javax/sip/header/MaxForwards;-><init>(I)V

    invoke-virtual {v5, v8}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setMaxForwards(Landroid/javax/sip/header/MaxForwardsHeader;)V

    .line 3266
    iget-object v8, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v8, :cond_14

    .line 3267
    iget-object v8, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getAuthorization()Landroid/gov/nist/javax/sip/header/Authorization;

    move-result-object v8

    .line 3269
    .local v8, "authorization":Landroid/gov/nist/javax/sip/header/Authorization;
    if-eqz v8, :cond_13

    .line 3270
    invoke-virtual {v5, v8}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 3274
    :cond_13
    iget-object v9, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRecordRouteHeaders()Landroid/gov/nist/javax/sip/header/RecordRouteList;

    move-result-object v9

    iput-object v9, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeaders:Landroid/gov/nist/javax/sip/header/RecordRouteList;

    .line 3276
    const/4 v9, 0x0

    iput-object v9, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 3282
    .end local v8    # "authorization":Landroid/gov/nist/javax/sip/header/Authorization;
    :cond_14
    invoke-direct {p0, v5}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->updateRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 3284
    return-object v5

    .line 3285
    .end local v0    # "vias":Ljava/util/List;, "Ljava/util/List<Landroid/gov/nist/javax/sip/header/Via;>;"
    .end local v1    # "uri4transport":Landroid/javax/sip/address/SipURI;
    .end local v2    # "from":Landroid/gov/nist/javax/sip/header/From;
    .end local v3    # "transport":Ljava/lang/String;
    .end local v4    # "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    .end local v5    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v6    # "via":Landroid/gov/nist/javax/sip/header/Via;
    .end local v7    # "to":Landroid/gov/nist/javax/sip/header/To;
    :catch_0
    move-exception v0

    .line 3286
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 3287
    new-instance v1, Landroid/javax/sip/SipException;

    const-string/jumbo v2, "unexpected exception "

    invoke-direct {v1, v2, v0}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 3122
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_15
    new-instance v0, Landroid/javax/sip/SipException;

    const-string v1, "Cannot create ACK - no remote Target!"

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3118
    :cond_16
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v1, "bad cseq > 4294967295"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3116
    :cond_17
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v1, "bad cseq <= 0 "

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3112
    :cond_18
    new-instance v0, Landroid/javax/sip/SipException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Dialog was not created with an INVITE"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->method:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createPrack(Landroid/javax/sip/message/Response;)Landroid/javax/sip/message/Request;
    .locals 7
    .param p1, "relResponse"    # Landroid/javax/sip/message/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/DialogDoesNotExistException;,
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 3031
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v1, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    invoke-virtual {v0, v1}, Landroid/javax/sip/DialogState;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 3036
    const-string/jumbo v0, "RSeq"

    invoke-interface {p1, v0}, Landroid/javax/sip/message/Response;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/RSeq;

    if-eqz v1, :cond_1

    .line 3041
    :try_start_0
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 3042
    .local v1, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    const-string/jumbo v2, "PRACK"

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/Via;->getTransport()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->createRequest(Ljava/lang/String;Ljava/lang/String;)Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v2

    .line 3044
    .local v2, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/header/ToHeader;->getTag()Ljava/lang/String;

    move-result-object v3

    .line 3045
    .local v3, "toHeaderTag":Ljava/lang/String;
    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setToTag(Ljava/lang/String;)V

    .line 3046
    new-instance v4, Landroid/gov/nist/javax/sip/header/RAck;

    invoke-direct {v4}, Landroid/gov/nist/javax/sip/header/RAck;-><init>()V

    .line 3047
    .local v4, "rack":Landroid/gov/nist/javax/sip/header/RAck;
    invoke-interface {p1, v0}, Landroid/javax/sip/message/Response;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/RSeq;

    .line 3048
    .local v0, "rseq":Landroid/gov/nist/javax/sip/header/RSeq;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v5

    invoke-interface {v5}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/gov/nist/javax/sip/header/RAck;->setMethod(Ljava/lang/String;)V

    .line 3049
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v5

    invoke-interface {v5}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v5

    long-to-int v5, v5

    int-to-long v5, v5

    invoke-virtual {v4, v5, v6}, Landroid/gov/nist/javax/sip/header/RAck;->setCSequenceNumber(J)V

    .line 3050
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/RSeq;->getSeqNumber()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Landroid/gov/nist/javax/sip/header/RAck;->setRSequenceNumber(J)V

    .line 3051
    invoke-virtual {v2, v4}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 3052
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->proxyAuthorizationHeader:Landroid/javax/sip/header/ProxyAuthorizationHeader;

    if-eqz v5, :cond_0

    .line 3053
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->proxyAuthorizationHeader:Landroid/javax/sip/header/ProxyAuthorizationHeader;

    invoke-virtual {v2, v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->addHeader(Landroid/javax/sip/header/Header;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 3055
    :cond_0
    return-object v2

    .line 3056
    .end local v0    # "rseq":Landroid/gov/nist/javax/sip/header/RSeq;
    .end local v1    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v2    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v3    # "toHeaderTag":Ljava/lang/String;
    .end local v4    # "rack":Landroid/gov/nist/javax/sip/header/RAck;
    :catch_0
    move-exception v0

    .line 3057
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 3058
    const/4 v1, 0x0

    return-object v1

    .line 3037
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_1
    new-instance v0, Landroid/javax/sip/SipException;

    const-string v1, "Missing RSeq Header"

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3033
    :cond_2
    new-instance v0, Landroid/javax/sip/DialogDoesNotExistException;

    const-string v1, "Dialog not initialized or terminated"

    invoke-direct {v0, v1}, Landroid/javax/sip/DialogDoesNotExistException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createReliableProvisionalResponse(I)Landroid/javax/sip/message/Response;
    .locals 7
    .param p1, "statusCode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;,
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 3797
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionIsServerTransaction:Z

    if-eqz v0, :cond_6

    .line 3808
    const/16 v0, 0x64

    if-le p1, v0, :cond_5

    const/16 v0, 0xc7

    if-gt p1, v0, :cond_5

    .line 3810
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 3811
    .local v0, "request":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v2, "INVITE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 3814
    const-string/jumbo v1, "Supported"

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeaders(Ljava/lang/String;)Ljava/util/ListIterator;

    move-result-object v1

    .line 3815
    .local v1, "list":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    const-string v2, "100rel"

    if-eqz v1, :cond_0

    invoke-static {v1, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->optionPresent(Ljava/util/ListIterator;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 3816
    :cond_0
    const-string/jumbo v3, "Require"

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeaders(Ljava/lang/String;)Ljava/util/ListIterator;

    move-result-object v1

    .line 3817
    if-eqz v1, :cond_3

    invoke-static {v1, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->optionPresent(Ljava/util/ListIterator;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 3823
    :cond_1
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v3

    .line 3835
    .local v3, "response":Landroid/gov/nist/javax/sip/message/SIPResponse;
    new-instance v4, Landroid/gov/nist/javax/sip/header/Require;

    invoke-direct {v4}, Landroid/gov/nist/javax/sip/header/Require;-><init>()V

    .line 3837
    .local v4, "require":Landroid/gov/nist/javax/sip/header/Require;
    :try_start_0
    invoke-virtual {v4, v2}, Landroid/gov/nist/javax/sip/header/Require;->setOptionTag(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 3840
    goto :goto_0

    .line 3838
    :catch_0
    move-exception v2

    .line 3839
    .local v2, "ex":Ljava/lang/Exception;
    invoke-static {v2}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 3841
    .end local v2    # "ex":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/message/SIPResponse;->addHeader(Landroid/javax/sip/header/Header;)V

    .line 3842
    new-instance v2, Landroid/gov/nist/javax/sip/header/RSeq;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/RSeq;-><init>()V

    .line 3847
    .local v2, "rseq":Landroid/gov/nist/javax/sip/header/RSeq;
    const-wide/16 v5, 0x1

    invoke-virtual {v2, v5, v6}, Landroid/gov/nist/javax/sip/header/RSeq;->setSeqNumber(J)V

    .line 3854
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRecordRouteHeaders()Landroid/gov/nist/javax/sip/header/RecordRouteList;

    move-result-object v5

    .line 3855
    .local v5, "rrl":Landroid/gov/nist/javax/sip/header/RecordRouteList;
    if-eqz v5, :cond_2

    .line 3856
    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/header/RecordRouteList;->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/header/RecordRouteList;

    .line 3857
    .local v6, "rrlclone":Landroid/gov/nist/javax/sip/header/RecordRouteList;
    invoke-virtual {v3, v6}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 3860
    .end local v6    # "rrlclone":Landroid/gov/nist/javax/sip/header/RecordRouteList;
    :cond_2
    return-object v3

    .line 3818
    .end local v2    # "rseq":Landroid/gov/nist/javax/sip/header/RSeq;
    .end local v3    # "response":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v4    # "require":Landroid/gov/nist/javax/sip/header/Require;
    .end local v5    # "rrl":Landroid/gov/nist/javax/sip/header/RecordRouteList;
    :cond_3
    new-instance v2, Landroid/javax/sip/SipException;

    const-string v3, "No Supported/Require 100rel header in the request"

    invoke-direct {v2, v3}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 3812
    .end local v1    # "list":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :cond_4
    new-instance v1, Landroid/javax/sip/SipException;

    const-string v2, "Bad method"

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 3809
    .end local v0    # "request":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_5
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string v1, "Bad status code "

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3798
    :cond_6
    new-instance v0, Landroid/javax/sip/SipException;

    const-string v1, "Not a Server Dialog!"

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRequest(Landroid/gov/nist/javax/sip/address/SipUri;Landroid/gov/nist/javax/sip/header/Via;Landroid/gov/nist/javax/sip/header/CSeq;Landroid/gov/nist/javax/sip/header/From;Landroid/gov/nist/javax/sip/header/To;)Landroid/gov/nist/javax/sip/message/SIPRequest;
    .locals 4
    .param p1, "requestURI"    # Landroid/gov/nist/javax/sip/address/SipUri;
    .param p2, "via"    # Landroid/gov/nist/javax/sip/header/Via;
    .param p3, "cseq"    # Landroid/gov/nist/javax/sip/header/CSeq;
    .param p4, "from"    # Landroid/gov/nist/javax/sip/header/From;
    .param p5, "to"    # Landroid/gov/nist/javax/sip/header/To;

    .line 2588
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;-><init>()V

    .line 2589
    .local v0, "newRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {p3}, Landroid/gov/nist/javax/sip/header/CSeq;->getMethod()Ljava/lang/String;

    move-result-object v1

    .line 2591
    .local v1, "method":Ljava/lang/String;
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setMethod(Ljava/lang/String;)V

    .line 2592
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setRequestURI(Landroid/javax/sip/address/URI;)V

    .line 2593
    invoke-direct {p0, p2, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setBranch(Landroid/gov/nist/javax/sip/header/Via;Ljava/lang/String;)V

    .line 2594
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 2595
    invoke-virtual {v0, p3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 2596
    invoke-virtual {v0, p4}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 2597
    invoke-virtual {v0, p5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 2598
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 2602
    :try_start_0
    new-instance v2, Landroid/gov/nist/javax/sip/header/MaxForwards;

    const/16 v3, 0x46

    invoke-direct {v2, v3}, Landroid/gov/nist/javax/sip/header/MaxForwards;-><init>(I)V

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2605
    goto :goto_0

    .line 2603
    :catch_0
    move-exception v2

    .line 2607
    :goto_0
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultUserAgentHeader()Landroid/javax/sip/header/UserAgentHeader;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 2608
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultUserAgentHeader()Landroid/javax/sip/header/UserAgentHeader;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 2611
    :cond_0
    return-object v0
.end method

.method public createRequest(Ljava/lang/String;)Landroid/javax/sip/message/Request;
    .locals 3
    .param p1, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 2398
    const-string v0, "ACK"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "PRACK"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 2402
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseTopMostVia:Landroid/gov/nist/javax/sip/header/Via;

    if-eqz v0, :cond_0

    .line 2403
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseTopMostVia:Landroid/gov/nist/javax/sip/header/Via;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getTransport()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->createRequest(Ljava/lang/String;Ljava/lang/String;)Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v0

    return-object v0

    .line 2406
    :cond_0
    new-instance v0, Landroid/javax/sip/SipException;

    const-string v1, "Dialog not yet established -- no response!"

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2399
    :cond_1
    new-instance v0, Landroid/javax/sip/SipException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid method specified for createRequest:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public delete()V
    .locals 1

    .line 2250
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    .line 2251
    return-void
.end method

.method public disableSequenceNumberValidation()V
    .locals 1

    .line 4277
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sequenceNumberValidation:Z

    .line 4278
    return-void
.end method

.method public doDeferredDelete()V
    .locals 5

    .line 1516
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1517
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    goto :goto_0

    .line 1519
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteTask;

    invoke-direct {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteTask;-><init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogDeleteTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteTask;

    .line 1521
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1522
    const/16 v0, 0x1f4

    .line 1523
    .local v0, "delay":I
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v1, :cond_1

    .line 1524
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getBaseTimerInterval()I

    move-result v0

    .line 1526
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogDeleteTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteTask;

    mul-int/lit8 v3, v0, 0x40

    int-to-long v3, v3

    invoke-interface {v1, v2, v3, v4}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    .line 1530
    .end local v0    # "delay":I
    goto :goto_0

    .line 1531
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->delete()V

    .line 1535
    :goto_0
    return-void
.end method

.method public declared-synchronized doDeferredDeleteIfNoAckSent(J)V
    .locals 5
    .param p1, "seqno"    # J

    monitor-enter p0

    .line 4214
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    if-nez v0, :cond_0

    .line 4215
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    goto :goto_0

    .line 4216
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogDeleteIfNoAckSentTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;

    if-nez v0, :cond_2

    .line 4218
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;

    invoke-direct {v0, p0, p1, p2}, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;-><init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;J)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogDeleteIfNoAckSentTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;

    .line 4219
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4220
    const/16 v0, 0x1f4

    .line 4221
    .local v0, "delay":I
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v1, :cond_1

    .line 4222
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getBaseTimerInterval()I

    move-result v1

    move v0, v1

    .line 4224
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogDeleteIfNoAckSentTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getAckTimeoutFactor()I

    move-result v3

    mul-int/2addr v3, v0

    int-to-long v3, v3

    invoke-interface {v1, v2, v3, v4}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4230
    .end local v0    # "delay":I
    :cond_2
    :goto_0
    monitor-exit p0

    return-void

    .line 4213
    .end local p1    # "seqno":J
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public getApplicationData()Ljava/lang/Object;
    .locals 1

    .line 1468
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->applicationData:Ljava/lang/Object;

    return-object v0
.end method

.method public getCallId()Landroid/javax/sip/header/CallIdHeader;
    .locals 3

    .line 2261
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->callIdHeader:Landroid/javax/sip/header/CallIdHeader;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->callIdHeaderString:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 2263
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sip/parser/CallIDParser;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->callIdHeaderString:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/parser/CallIDParser;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/CallIDParser;->parse()Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/header/CallIdHeader;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->callIdHeader:Landroid/javax/sip/header/CallIdHeader;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2268
    goto :goto_0

    .line 2265
    :catch_0
    move-exception v0

    .line 2266
    .local v0, "e":Ljava/text/ParseException;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "error reparsing the call id header"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 2270
    .end local v0    # "e":Ljava/text/ParseException;
    :cond_0
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->callIdHeader:Landroid/javax/sip/header/CallIdHeader;

    return-object v0
.end method

.method public getDialogId()Ljava/lang/String;
    .locals 1

    .line 1850
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogId:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseDialogId:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1851
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseDialogId:Ljava/lang/String;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogId:Ljava/lang/String;

    .line 1853
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogId:Ljava/lang/String;

    return-object v0
.end method

.method getEarlyDialogId()Ljava/lang/String;
    .locals 1

    .line 4124
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyDialogId:Ljava/lang/String;

    return-object v0
.end method

.method getEventHeader()Landroid/javax/sip/header/EventHeader;
    .locals 1

    .line 4245
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventHeader:Landroid/javax/sip/header/EventHeader;

    return-object v0
.end method

.method public getFirstTransaction()Landroid/javax/sip/Transaction;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1717
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "This method has been deprecated and is no longer supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFirstTransactionInt()Landroid/javax/sip/Transaction;
    .locals 3

    .line 1728
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v0, :cond_0

    .line 1729
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    return-object v0

    .line 1731
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionId:Ljava/lang/String;

    iget-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionIsServerTransaction:Z

    invoke-virtual {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->findTransaction(Ljava/lang/String;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v0

    return-object v0
.end method

.method public getInviteTransaction()Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .locals 2

    .line 2104
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;

    .line 2105
    .local v0, "t":Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;
    if-eqz v0, :cond_0

    .line 2106
    iget-object v1, v0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->transaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    return-object v1

    .line 2108
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getLastAckSentCSeq()Landroid/javax/sip/header/CSeqHeader;
    .locals 1

    .line 1640
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckSent:Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckSent:Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getLastAckSentDialogId()Ljava/lang/String;
    .locals 1

    .line 1646
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckSent:Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckSent:Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;->getDialogId()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getLastAckSentFromTag()Ljava/lang/String;
    .locals 1

    .line 1643
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckSent:Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckSent:Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;->getFromTag()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getLastResponseCSeqNumber()J
    .locals 2

    .line 4320
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseCSeqNumber:J

    return-wide v0
.end method

.method public getLastResponseMethod()Ljava/lang/String;
    .locals 1

    .line 4312
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseMethod:Ljava/lang/String;

    return-object v0
.end method

.method public getLastResponseStatusCode()Ljava/lang/Integer;
    .locals 1

    .line 4316
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseStatusCode:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLastResponseTopMostVia()Landroid/gov/nist/javax/sip/header/Via;
    .locals 1

    .line 4435
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseTopMostVia:Landroid/gov/nist/javax/sip/header/Via;

    return-object v0
.end method

.method public getLastTransaction()Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    .locals 1

    .line 2097
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    return-object v0
.end method

.method public getLocalParty()Landroid/javax/sip/address/Address;
    .locals 3

    .line 2289
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localParty:Landroid/javax/sip/address/Address;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localPartyStringified:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 2291
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sip/parser/AddressParser;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localPartyStringified:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParser;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParser;->address(Z)Landroid/gov/nist/javax/sip/address/AddressImpl;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localParty:Landroid/javax/sip/address/Address;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2296
    goto :goto_0

    .line 2293
    :catch_0
    move-exception v0

    .line 2294
    .local v0, "e":Ljava/text/ParseException;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "error reparsing the localParty"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 2298
    .end local v0    # "e":Ljava/text/ParseException;
    :cond_0
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localParty:Landroid/javax/sip/address/Address;

    return-object v0
.end method

.method public getLocalSeqNumber()J
    .locals 2

    .line 2192
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localSequenceNumber:J

    return-wide v0
.end method

.method public getLocalSequenceNumber()I
    .locals 2

    .line 2173
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localSequenceNumber:J

    long-to-int v0, v0

    return v0
.end method

.method public getLocalTag()Ljava/lang/String;
    .locals 1

    .line 2210
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->myTag:Ljava/lang/String;

    return-object v0
.end method

.method public getMergeId()Ljava/lang/String;
    .locals 1

    .line 4298
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionMergeId:Ljava/lang/String;

    return-object v0
.end method

.method public getMethod()Ljava/lang/String;
    .locals 1

    .line 2954
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->method:Ljava/lang/String;

    return-object v0
.end method

.method public getMyContactHeader()Landroid/gov/nist/javax/sip/header/Contact;
    .locals 3

    .line 4041
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->contactHeader:Landroid/gov/nist/javax/sip/header/Contact;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->contactHeaderStringified:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 4043
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sip/parser/ContactParser;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->contactHeaderStringified:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/parser/ContactParser;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/ContactParser;->parse()Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/Contact;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->contactHeader:Landroid/gov/nist/javax/sip/header/Contact;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4048
    goto :goto_0

    .line 4045
    :catch_0
    move-exception v0

    .line 4046
    .local v0, "e":Ljava/text/ParseException;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "error reparsing the contact header"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 4050
    .end local v0    # "e":Ljava/text/ParseException;
    :cond_0
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->contactHeader:Landroid/gov/nist/javax/sip/header/Contact;

    return-object v0
.end method

.method public getOriginalDialog()Landroid/javax/sip/Dialog;
    .locals 1

    .line 4511
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    return-object v0
.end method

.method public getOriginalLocalSequenceNumber()J
    .locals 2

    .line 2183
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalLocalSequenceNumber:J

    return-wide v0
.end method

.method protected getOriginalRequestRecordRouteHeaders()Landroid/gov/nist/javax/sip/header/RecordRouteList;
    .locals 3

    .line 4415
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeaders:Landroid/gov/nist/javax/sip/header/RecordRouteList;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeadersString:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 4418
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeadersString:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;->parse()Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/RecordRouteList;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeaders:Landroid/gov/nist/javax/sip/header/RecordRouteList;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4425
    goto :goto_0

    .line 4420
    :catch_0
    move-exception v0

    .line 4421
    .local v0, "e":Ljava/text/ParseException;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "error reparsing the originalRequest RecordRoute Headers"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 4426
    .end local v0    # "e":Ljava/text/ParseException;
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeadersString:Ljava/lang/String;

    .line 4428
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalRequestRecordRouteHeaders:Landroid/gov/nist/javax/sip/header/RecordRouteList;

    return-object v0
.end method

.method public getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;
    .locals 1

    .line 4444
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseReferencesStrategy:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    return-object v0
.end method

.method public getRemoteParty()Landroid/javax/sip/address/Address;
    .locals 3

    .line 2322
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteParty:Landroid/javax/sip/address/Address;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remotePartyStringified:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 2324
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sip/parser/AddressParser;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remotePartyStringified:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParser;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParser;->address(Z)Landroid/gov/nist/javax/sip/address/AddressImpl;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteParty:Landroid/javax/sip/address/Address;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2329
    goto :goto_0

    .line 2326
    :catch_0
    move-exception v0

    .line 2327
    .local v0, "e":Ljava/text/ParseException;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "error reparsing the remoteParty"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 2331
    .end local v0    # "e":Ljava/text/ParseException;
    :cond_0
    :goto_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2332
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "gettingRemoteParty "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteParty:Landroid/javax/sip/address/Address;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2335
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteParty:Landroid/javax/sip/address/Address;

    return-object v0
.end method

.method public getRemoteSeqNumber()J
    .locals 2

    .line 2201
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteSequenceNumber:J

    return-wide v0
.end method

.method public getRemoteSequenceNumber()I
    .locals 2

    .line 2161
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteSequenceNumber:J

    long-to-int v0, v0

    return v0
.end method

.method public getRemoteTag()Ljava/lang/String;
    .locals 1

    .line 2220
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->hisTag:Ljava/lang/String;

    return-object v0
.end method

.method public getRemoteTarget()Landroid/javax/sip/address/Address;
    .locals 3

    .line 2347
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteTarget:Landroid/javax/sip/address/Address;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteTargetStringified:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 2349
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sip/parser/AddressParser;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteTargetStringified:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParser;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParser;->address(Z)Landroid/gov/nist/javax/sip/address/AddressImpl;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteTarget:Landroid/javax/sip/address/Address;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2354
    goto :goto_0

    .line 2351
    :catch_0
    move-exception v0

    .line 2352
    .local v0, "e":Ljava/text/ParseException;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "error reparsing the remoteTarget"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 2356
    .end local v0    # "e":Ljava/text/ParseException;
    :cond_0
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteTarget:Landroid/javax/sip/address/Address;

    return-object v0
.end method

.method public getRouteSet()Ljava/util/Iterator;
    .locals 1

    .line 1758
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    if-nez v0, :cond_0

    .line 1759
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    invoke-virtual {v0}, Ljava/util/LinkedList;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    return-object v0

    .line 1761
    :cond_0
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRouteList()Landroid/gov/nist/javax/sip/header/RouteList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/RouteList;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;
    .locals 1

    .line 3300
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    return-object v0
.end method

.method public bridge synthetic getSipProvider()Landroid/javax/sip/SipProvider;
    .locals 1

    .line 149
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v0

    return-object v0
.end method

.method getStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .locals 1

    .line 1359
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    return-object v0
.end method

.method public getState()Landroid/javax/sip/DialogState;
    .locals 2

    .line 2365
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogState:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 2366
    const/4 v0, 0x0

    return-object v0

    .line 2367
    :cond_0
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogState:I

    invoke-static {v0}, Landroid/javax/sip/DialogState;->getObject(I)Landroid/javax/sip/DialogState;

    move-result-object v0

    return-object v0
.end method

.method public handleAck(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)Z
    .locals 7
    .param p1, "ackTransaction"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 4064
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isAckSeen()Z

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x20

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteSeqNumber()J

    move-result-wide v3

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getCSeq()J

    move-result-wide v5

    cmp-long v0, v3, v5

    if-nez v0, :cond_2

    .line 4066
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4067
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "SIPDialog::handleAck: ACK already seen by dialog -- dropping Ack retransmission"

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 4071
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->acquireTimerTaskSem()V

    .line 4073
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;

    if-eqz v0, :cond_1

    .line 4074
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;

    invoke-interface {v0, v2}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 4075
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4078
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseTimerTaskSem()V

    .line 4079
    nop

    .line 4080
    return v1

    .line 4078
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseTimerTaskSem()V

    throw v0

    .line 4081
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v3, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    if-ne v0, v3, :cond_4

    .line 4082
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 4083
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "SIPDialog::handleAck: Dialog is terminated -- dropping ACK"

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 4085
    :cond_3
    return v1

    .line 4088
    :cond_4
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 4089
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "SIPDialog::handleAck: lastResponseCSeqNumber = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastInviteOkReceived:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ackTxCSeq "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getCSeq()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 4091
    :cond_5
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseStatusCode:Ljava/lang/Integer;

    if-eqz v0, :cond_7

    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastInviteResponseCode:I

    div-int/lit8 v0, v0, 0x64

    const/4 v3, 0x2

    if-ne v0, v3, :cond_7

    iget-wide v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastInviteResponseCSeqNumber:J

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getCSeq()J

    move-result-wide v5

    cmp-long v0, v3, v5

    if-nez v0, :cond_7

    .line 4095
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseDialogId:Ljava/lang/String;

    invoke-interface {p1, p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    .line 4099
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getCSeq()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackReceived(J)V

    .line 4100
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 4101
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "SIPDialog::handleACK: ACK for 2XX response --- sending to TU "

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 4103
    :cond_6
    const/4 v0, 0x1

    return v0

    .line 4111
    :cond_7
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 4112
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, " INVITE transaction not found"

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 4114
    :cond_8
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isBackToBackUserAgent()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 4115
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseAckSem()V

    .line 4117
    :cond_9
    return v1
.end method

.method public handlePrack(Landroid/gov/nist/javax/sip/message/SIPRequest;)Z
    .locals 11
    .param p1, "prackRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 3879
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isServer()Z

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x20

    if-nez v0, :cond_1

    .line 3880
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3881
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "Dropping Prack -- not a server Dialog"

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3883
    :cond_0
    return v1

    .line 3885
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getFirstTransactionInt()Landroid/javax/sip/Transaction;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 3887
    .local v0, "sipServerTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getReliableProvisionalResponse()[B

    move-result-object v3

    .line 3890
    .local v3, "sipResponse":[B
    if-nez v3, :cond_3

    .line 3891
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 3892
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Dropping Prack -- ReliableResponse not found"

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3894
    :cond_2
    return v1

    .line 3897
    :cond_3
    const-string/jumbo v4, "RAck"

    invoke-virtual {p1, v4}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/header/RAck;

    .line 3899
    .local v4, "rack":Landroid/gov/nist/javax/sip/header/RAck;
    if-nez v4, :cond_5

    .line 3900
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 3901
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v5, "Dropping Prack -- rack header not found"

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3903
    :cond_4
    return v1

    .line 3906
    :cond_5
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/RAck;->getMethod()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getPendingReliableResponseMethod()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const-string v6, "Dropping Prack -- CSeq Header does not match PRACK"

    if-nez v5, :cond_7

    .line 3908
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 3909
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3911
    :cond_6
    return v1

    .line 3914
    :cond_7
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/RAck;->getCSeqNumberLong()J

    move-result-wide v7

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getPendingReliableCSeqNumber()J

    move-result-wide v9

    cmp-long v5, v7, v9

    if-eqz v5, :cond_9

    .line 3916
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 3917
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3919
    :cond_8
    return v1

    .line 3922
    :cond_9
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/RAck;->getRSequenceNumber()J

    move-result-wide v5

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getPendingReliableRSeqNumber()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-eqz v5, :cond_b

    .line 3924
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 3925
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v5, "Dropping Prack -- RSeq Header does not match PRACK"

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3927
    :cond_a
    return v1

    .line 3930
    :cond_b
    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->prackRecieved()Z

    move-result v1

    return v1
.end method

.method public hashCode()I
    .locals 1

    .line 4486
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->callIdHeader:Landroid/javax/sip/header/CallIdHeader;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->callIdHeaderString:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 4489
    const/4 v0, 0x0

    return v0

    .line 4491
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public incrementLocalSequenceNumber()V
    .locals 4

    .line 2149
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localSequenceNumber:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localSequenceNumber:J

    .line 2150
    return-void
.end method

.method public isAckSeen()Z
    .locals 7

    .line 1604
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckReceivedCSeqNumber:Ljava/lang/Long;

    const-string/jumbo v1, "SIPDialog::isAckSeen:"

    const/4 v2, 0x0

    const/16 v3, 0x20

    if-nez v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseStatusCode:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v4, 0xc8

    if-ne v0, v4, :cond_1

    .line 1606
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1608
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, "lastAckReceived is null -- returning false"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1611
    :cond_0
    return v2

    .line 1612
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseMethod:Ljava/lang/String;

    if-nez v0, :cond_3

    .line 1613
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1615
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, "lastResponse is null -- returning false"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1618
    :cond_2
    return v2

    .line 1619
    :cond_3
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckReceivedCSeqNumber:Ljava/lang/Long;

    const/4 v4, 0x1

    if-nez v0, :cond_5

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseStatusCode:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    div-int/lit8 v0, v0, 0x64

    const/4 v5, 0x2

    if-le v0, v5, :cond_5

    .line 1621
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1623
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "lastResponse statusCode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseStatusCode:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1627
    :cond_4
    return v4

    .line 1629
    :cond_5
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1630
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "SIPDialog::isAckSeen:lastAckReceivedCSeqNumber = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckReceivedCSeqNumber:Ljava/lang/Long;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " remoteCSeqNumber = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteSeqNumber()J

    move-result-wide v5

    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1632
    :cond_6
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckReceivedCSeqNumber:Ljava/lang/Long;

    if-eqz v0, :cond_7

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckReceivedCSeqNumber:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteSeqNumber()J

    move-result-wide v5

    cmp-long v0, v0, v5

    if-ltz v0, :cond_7

    move v2, v4

    :cond_7
    return v2
.end method

.method public isAckSent()Z
    .locals 2

    .line 1693
    const-wide/16 v0, -0x1

    invoke-virtual {p0, v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isAckSent(J)Z

    move-result v0

    return v0
.end method

.method public isAckSent(J)Z
    .locals 5
    .param p1, "cseqNo"    # J

    .line 1701
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLastTransaction()Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 1702
    return v1

    .line 1703
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLastTransaction()Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v0

    instance-of v0, v0, Landroid/javax/sip/ClientTransaction;

    if-eqz v0, :cond_3

    .line 1704
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckSent:Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 1705
    return v2

    .line 1707
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLastAckSentCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v3

    cmp-long v0, p1, v3

    if-gtz v0, :cond_2

    goto :goto_0

    :cond_2
    move v1, v2

    :goto_0
    return v1

    .line 1711
    :cond_3
    return v1
.end method

.method public isAssigned()Z
    .locals 1

    .line 4029
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isAssigned:Z

    return v0
.end method

.method public isAtleastOneAckSent()Z
    .locals 1

    .line 4206
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isAcknowledged:Z

    return v0
.end method

.method public isBackToBackUserAgent()Z
    .locals 1

    .line 4210
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isBackToBackUserAgent:Z

    return v0
.end method

.method isBlockedForReInvite()Z
    .locals 1

    .line 4154
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackSem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->availablePermits()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isForked()Z
    .locals 1

    .line 4506
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isLastAckPresent()Z
    .locals 1

    .line 1685
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckSent:Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isReInvite()Z
    .locals 1

    .line 1839
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->reInviteFlag:Z

    return v0
.end method

.method public declared-synchronized isRequestConsumable(Landroid/gov/nist/javax/sip/message/SIPRequest;)Z
    .locals 6
    .param p1, "dialogRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;

    monitor-enter p0

    .line 1496
    :try_start_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ACK"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1500
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isSequenceNumberValidation()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 1501
    monitor-exit p0

    return v1

    .line 1506
    :cond_0
    :try_start_1
    iget-wide v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteSequenceNumber:J

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    cmp-long v0, v2, v4

    if-gez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    monitor-exit p0

    return v1

    .line 1497
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :cond_2
    :try_start_2
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Illegal method"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1495
    .end local p1    # "dialogRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public isSecure()Z
    .locals 1

    .line 2379
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionSecure:Z

    return v0
.end method

.method public isSequenceNumberValidation()Z
    .locals 1

    .line 4273
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sequenceNumberValidation:Z

    return v0
.end method

.method public isServer()Z
    .locals 1

    .line 1826
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionSeen:Z

    if-nez v0, :cond_0

    .line 1827
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->serverTransactionFlag:Z

    return v0

    .line 1829
    :cond_0
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionIsServerTransaction:Z

    return v0
.end method

.method isTerminatedOnBye()Z
    .locals 1

    .line 1368
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->terminateOnBye:Z

    return v0
.end method

.method public printDebugInfo()V
    .locals 4

    .line 1584
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1585
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "isServer = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isServer()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1586
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "localTag = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1587
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "remoteTag = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1588
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "localSequenceNumer = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalSeqNumber()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1590
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "remoteSequenceNumer = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteSeqNumber()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1592
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ackLine:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackLine:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1595
    :cond_0
    return-void
.end method

.method releaseAckSem()V
    .locals 6

    .line 4132
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    const-string v2, " sem="

    if-eqz v0, :cond_0

    .line 4133
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "releaseAckSem-enter]]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackSem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " b2bua="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isBackToBackUserAgent:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 4135
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 4137
    :cond_0
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isBackToBackUserAgent:Z

    if-eqz v0, :cond_2

    .line 4138
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    const-string/jumbo v3, "releaseAckSem]]"

    if-eqz v0, :cond_1

    .line 4139
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackSem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 4141
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 4143
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackSem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->availablePermits()I

    move-result v0

    if-nez v0, :cond_2

    .line 4144
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackSem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 4145
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4146
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackSem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 4151
    :cond_2
    return-void
.end method

.method public releaseTimerTaskSem()V
    .locals 1

    .line 4294
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTaskLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 4295
    return-void
.end method

.method public removeEventListener(Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;)V
    .locals 1
    .param p1, "oldListener"    # Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;

    .line 1452
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1453
    return-void
.end method

.method public declared-synchronized requestConsumed()V
    .locals 4

    monitor-enter p0

    .line 1476
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteSeqNumber()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->nextSeqno:J

    .line 1478
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1479
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Request Consumed -- next consumable Request Seqno = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->nextSeqno:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1484
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :cond_0
    monitor-exit p0

    return-void

    .line 1475
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public resendAck()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 2924
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckSent:Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;

    if-eqz v0, :cond_1

    .line 2926
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastAckSent:Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;->reparseRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v0

    .line 2927
    .local v0, "lastAckSentParsed":Landroid/gov/nist/javax/sip/message/SIPRequest;
    const-string/jumbo v1, "Timestamp"

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->generateTimeStampHeader:Z

    if-eqz v1, :cond_0

    .line 2929
    new-instance v1, Landroid/gov/nist/javax/sip/header/TimeStamp;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/TimeStamp;-><init>()V

    .line 2931
    .local v1, "ts":Landroid/gov/nist/javax/sip/header/TimeStamp;
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    long-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/header/TimeStamp;->setTimeStamp(F)V

    .line 2932
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V
    :try_end_0
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2935
    goto :goto_0

    .line 2933
    :catch_0
    move-exception v2

    .line 2937
    .end local v1    # "ts":Landroid/gov/nist/javax/sip/header/TimeStamp;
    :cond_0
    :goto_0
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sendAck(Landroid/javax/sip/message/Request;Z)V

    .line 2938
    .end local v0    # "lastAckSentParsed":Landroid/gov/nist/javax/sip/message/SIPRequest;
    goto :goto_1

    .line 2939
    :cond_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2940
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "SIPDialog::resendAck:lastAck sent is NULL hence not resending ACK"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2944
    :cond_2
    :goto_1
    return-void
.end method

.method public sendAck(Landroid/javax/sip/message/Request;)V
    .locals 1
    .param p1, "request"    # Landroid/javax/sip/message/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 2388
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sendAck(Landroid/javax/sip/message/Request;Z)V

    .line 2389
    return-void
.end method

.method public sendReliableProvisionalResponse(Landroid/javax/sip/message/Response;)V
    .locals 6
    .param p1, "relResponse"    # Landroid/javax/sip/message/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 3942
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isServer()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 3946
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 3948
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-interface {p1}, Landroid/javax/sip/message/Response;->getStatusCode()I

    move-result v1

    const/16 v2, 0x64

    if-eq v1, v2, :cond_5

    .line 3952
    invoke-interface {p1}, Landroid/javax/sip/message/Response;->getStatusCode()I

    move-result v1

    div-int/2addr v1, v2

    const/4 v2, 0x2

    if-gt v1, v2, :cond_4

    .line 3959
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 3963
    const-string/jumbo v1, "Require"

    invoke-interface {p1, v1}, Landroid/javax/sip/message/Response;->getHeaders(Ljava/lang/String;)Ljava/util/ListIterator;

    move-result-object v1

    .line 3965
    .local v1, "requireList":Ljava/util/ListIterator;
    const/4 v2, 0x0

    .line 3967
    .local v2, "found":Z
    const-string v3, "100rel"

    if-eqz v1, :cond_1

    .line 3969
    :goto_0
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    if-nez v2, :cond_1

    .line 3970
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/javax/sip/header/RequireHeader;

    .line 3971
    .local v4, "rh":Landroid/javax/sip/header/RequireHeader;
    invoke-interface {v4}, Landroid/javax/sip/header/RequireHeader;->getOptionTag()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 3972
    const/4 v2, 0x1

    .line 3974
    .end local v4    # "rh":Landroid/javax/sip/header/RequireHeader;
    :cond_0
    goto :goto_0

    .line 3977
    :cond_1
    if-nez v2, :cond_2

    .line 3978
    new-instance v4, Landroid/gov/nist/javax/sip/header/Require;

    invoke-direct {v4, v3}, Landroid/gov/nist/javax/sip/header/Require;-><init>(Ljava/lang/String;)V

    move-object v3, v4

    .line 3979
    .local v3, "require":Landroid/gov/nist/javax/sip/header/Require;
    invoke-interface {p1, v3}, Landroid/javax/sip/message/Response;->addHeader(Landroid/javax/sip/header/Header;)V

    .line 3980
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v5, 0x20

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 3981
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v5, "Require header with optionTag 100rel is needed -- adding one"

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3988
    .end local v3    # "require":Landroid/gov/nist/javax/sip/header/Require;
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getFirstTransactionInt()Landroid/javax/sip/Transaction;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 3994
    .local v3, "serverTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    invoke-virtual {p0, v3, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLastResponse(Landroid/gov/nist/javax/sip/stack/SIPTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    .line 3996
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getDialogId(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setDialogId(Ljava/lang/String;)V

    .line 3998
    invoke-interface {v3, p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->sendReliableProvisionalResponse(Landroid/javax/sip/message/Response;)V

    .line 4000
    invoke-virtual {p0, v3, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->startRetransmitTimer(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;Landroid/javax/sip/message/Response;)V

    .line 4002
    return-void

    .line 3960
    .end local v1    # "requireList":Ljava/util/ListIterator;
    .end local v2    # "found":Z
    .end local v3    # "serverTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_3
    new-instance v1, Landroid/javax/sip/SipException;

    const-string v2, "Badly formatted response -- To tag mandatory for Reliable Provisional Response"

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 3953
    :cond_4
    new-instance v1, Landroid/javax/sip/SipException;

    const-string/jumbo v2, "Response code is not a 1xx response - should be in the range 101 to 199 "

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 3949
    :cond_5
    new-instance v1, Landroid/javax/sip/SipException;

    const-string v2, "Cannot send 100 as a reliable provisional response"

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 3943
    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :cond_6
    new-instance v0, Landroid/javax/sip/SipException;

    const-string v1, "Not a Server Dialog"

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public sendRequest(Landroid/javax/sip/ClientTransaction;)V
    .locals 1
    .param p1, "clientTransactionId"    # Landroid/javax/sip/ClientTransaction;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/TransactionDoesNotExistException;,
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 2653
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isBackToBackUserAgent:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sendRequest(Landroid/javax/sip/ClientTransaction;Z)V

    .line 2654
    return-void
.end method

.method public sendRequest(Landroid/javax/sip/ClientTransaction;Z)V
    .locals 13
    .param p1, "clientTransaction"    # Landroid/javax/sip/ClientTransaction;
    .param p2, "allowInterleaving"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/TransactionDoesNotExistException;,
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 2660
    if-eqz p1, :cond_1e

    .line 2664
    const/16 v0, 0x20

    if-nez p2, :cond_1

    invoke-interface {p1}, Landroid/javax/sip/ClientTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/message/Request;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v2, "INVITE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2667
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2668
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "SIPDialog::sendRequest "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " clientTransaction = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2670
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getReinviteExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;

    invoke-direct {v1, p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;-><init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;Landroid/javax/sip/ClientTransaction;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 2672
    return-void

    .line 2675
    :cond_1
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v1

    .line 2678
    .local v1, "dialogRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    const-string/jumbo v2, "Proxy-Authorization"

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/header/ProxyAuthorizationHeader;

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->proxyAuthorizationHeader:Landroid/javax/sip/header/ProxyAuthorizationHeader;

    .line 2681
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2682
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "SIPDialog::sendRequest:dialog.sendRequest  dialog = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\ndialogRequest = \n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2686
    :cond_2
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ACK"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1d

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    const-string v3, "CANCEL"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1d

    .line 2692
    iget-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->byeSent:Z

    const-string v3, "BYE"

    if-eqz v2, :cond_4

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isTerminatedOnBye()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 2694
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2695
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "BYE already sent for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 2697
    :cond_3
    new-instance v0, Landroid/javax/sip/SipException;

    const-string v2, "Cannot send request; BYE already sent"

    invoke-direct {v0, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2700
    :cond_4
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v2

    if-nez v2, :cond_5

    .line 2701
    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getOutgoingViaHeader()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v2

    .line 2703
    .local v2, "via":Landroid/gov/nist/javax/sip/header/Via;
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->addHeader(Landroid/javax/sip/header/Header;)V

    .line 2705
    .end local v2    # "via":Landroid/gov/nist/javax/sip/header/Via;
    :cond_5
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v2

    invoke-interface {v2}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v4

    invoke-interface {v4}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 2708
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 2709
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CallID "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 2711
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "SIPDialog::sendRequest:RequestCallID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 2714
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "dialog =  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 2716
    :cond_6
    new-instance v0, Landroid/javax/sip/SipException;

    const-string v2, "Bad call ID in request"

    invoke-direct {v0, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2720
    :cond_7
    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogId:Ljava/lang/String;

    invoke-interface {v2, p0, v4}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    .line 2723
    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Z

    .line 2726
    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    const/4 v4, 0x1

    invoke-interface {v2, v4}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setTransactionMapped(Z)V

    .line 2728
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/header/From;

    .line 2729
    .local v2, "from":Landroid/gov/nist/javax/sip/header/From;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/header/To;

    .line 2733
    .local v5, "to":Landroid/gov/nist/javax/sip/header/To;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_9

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/From;->getTag()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_9

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/From;->getTag()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    goto :goto_0

    .line 2735
    :cond_8
    new-instance v0, Landroid/javax/sip/SipException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "From tag mismatch expecting  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2738
    :cond_9
    :goto_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_a

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/header/To;->getTag()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_a

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/header/To;->getTag()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_a

    .line 2740
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 2741
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "SIPDialog::sendRequest:To header tag mismatch expecting "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 2749
    :cond_a
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_c

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v6

    const-string v7, "NOTIFY"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 2751
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getMethod()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "SUBSCRIBE"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b

    .line 2754
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/From;->getTag()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLocalTag(Ljava/lang/String;)V

    goto :goto_1

    .line 2752
    :cond_b
    new-instance v0, Landroid/javax/sip/SipException;

    const-string/jumbo v3, "Trying to send NOTIFY without SUBSCRIBE Dialog!"

    invoke-direct {v0, v3}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2759
    :cond_c
    :goto_1
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_d

    .line 2760
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/gov/nist/javax/sip/header/From;->setTag(Ljava/lang/String;)V

    .line 2761
    :cond_d
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_e

    .line 2762
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/gov/nist/javax/sip/header/To;->setTag(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2768
    :cond_e
    goto :goto_2

    .line 2764
    :catch_0
    move-exception v6

    .line 2766
    .local v6, "ex":Ljava/text/ParseException;
    invoke-static {v6}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 2770
    .end local v6    # "ex":Ljava/text/ParseException;
    :goto_2
    move-object v6, p1

    check-cast v6, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getNextHop()Landroid/javax/sip/address/Hop;

    move-result-object v6

    .line 2771
    .local v6, "hop":Landroid/javax/sip/address/Hop;
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 2772
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "SIPDialog::sendRequest:Using hop = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v6}, Landroid/javax/sip/address/Hop;->getHost()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v6}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2777
    :cond_f
    :try_start_1
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v8

    invoke-interface {v6}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v8

    invoke-interface {v8}, Landroid/javax/sip/ListeningPoint;->getIPAddress()Ljava/lang/String;

    move-result-object v8

    iget v9, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionPort:I

    invoke-virtual {v7, v8, v9, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->createRawMessageChannel(Ljava/lang/String;ILandroid/javax/sip/address/Hop;)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v7

    .line 2781
    .local v7, "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    move-object v8, p1

    check-cast v8, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-interface {v8}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v8

    .line 2787
    .local v8, "oldChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->uncache()V

    .line 2790
    iget-object v9, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v9, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->cacheClientConnections:Z

    if-nez v9, :cond_10

    .line 2791
    iget v9, v8, Landroid/gov/nist/javax/sip/stack/MessageChannel;->useCount:I

    sub-int/2addr v9, v4

    iput v9, v8, Landroid/gov/nist/javax/sip/stack/MessageChannel;->useCount:I

    .line 2792
    sget-object v9, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v9, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v9

    if-eqz v9, :cond_10

    .line 2793
    sget-object v9, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "SIPDialog::sendRequest:oldChannel: useCount "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v8, Landroid/gov/nist/javax/sip/stack/MessageChannel;->useCount:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2798
    :cond_10
    if-nez v7, :cond_14

    .line 2816
    sget-object v9, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v9, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v9

    if-eqz v9, :cond_11

    .line 2817
    sget-object v9, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v10, "Null message channel using outbound proxy !"

    invoke-interface {v9, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2819
    :cond_11
    iget-object v9, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v9, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getRouter(Landroid/gov/nist/javax/sip/message/SIPRequest;)Landroid/javax/sip/address/Router;

    move-result-object v9

    invoke-interface {v9}, Landroid/javax/sip/address/Router;->getOutboundProxy()Landroid/javax/sip/address/Hop;

    move-result-object v9

    .line 2821
    .local v9, "outboundProxy":Landroid/javax/sip/address/Hop;
    if-eqz v9, :cond_13

    .line 2823
    iget-object v10, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v11

    invoke-interface {v9}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v11

    invoke-interface {v11}, Landroid/javax/sip/ListeningPoint;->getIPAddress()Ljava/lang/String;

    move-result-object v11

    iget v12, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionPort:I

    invoke-virtual {v10, v11, v12, v9}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->createRawMessageChannel(Ljava/lang/String;ILandroid/javax/sip/address/Hop;)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v10

    move-object v7, v10

    .line 2827
    if-eqz v7, :cond_12

    .line 2828
    move-object v10, p1

    check-cast v10, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-interface {v10, v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setEncapsulatedChannel(Landroid/gov/nist/javax/sip/stack/MessageChannel;)V

    .line 2830
    .end local v9    # "outboundProxy":Landroid/javax/sip/address/Hop;
    :cond_12
    goto :goto_3

    .line 2822
    .restart local v9    # "outboundProxy":Landroid/javax/sip/address/Hop;
    :cond_13
    new-instance v0, Landroid/javax/sip/SipException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No route found! hop="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v1    # "dialogRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v2    # "from":Landroid/gov/nist/javax/sip/header/From;
    .end local v5    # "to":Landroid/gov/nist/javax/sip/header/To;
    .end local v6    # "hop":Landroid/javax/sip/address/Hop;
    .end local p1    # "clientTransaction":Landroid/javax/sip/ClientTransaction;
    .end local p2    # "allowInterleaving":Z
    throw v0

    .line 2831
    .end local v9    # "outboundProxy":Landroid/javax/sip/address/Hop;
    .restart local v1    # "dialogRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v2    # "from":Landroid/gov/nist/javax/sip/header/From;
    .restart local v5    # "to":Landroid/gov/nist/javax/sip/header/To;
    .restart local v6    # "hop":Landroid/javax/sip/address/Hop;
    .restart local p1    # "clientTransaction":Landroid/javax/sip/ClientTransaction;
    .restart local p2    # "allowInterleaving":Z
    :cond_14
    move-object v9, p1

    check-cast v9, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-interface {v9, v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setEncapsulatedChannel(Landroid/gov/nist/javax/sip/stack/MessageChannel;)V

    .line 2834
    sget-object v9, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v9, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v9

    if-eqz v9, :cond_15

    .line 2835
    sget-object v9, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "SIPDialog::sendRequest:using message channel "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2842
    :cond_15
    :goto_3
    if-eqz v7, :cond_16

    .line 2843
    iget v9, v7, Landroid/gov/nist/javax/sip/stack/MessageChannel;->useCount:I

    add-int/2addr v9, v4

    iput v9, v7, Landroid/gov/nist/javax/sip/stack/MessageChannel;->useCount:I

    .line 2846
    :cond_16
    iget-object v9, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v9, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->cacheClientConnections:Z

    if-nez v9, :cond_17

    if-eqz v8, :cond_17

    iget v9, v8, Landroid/gov/nist/javax/sip/stack/MessageChannel;->useCount:I

    if-gtz v9, :cond_17

    .line 2848
    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 2853
    .end local v7    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .end local v8    # "oldChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    :cond_17
    nop

    .line 2857
    :try_start_2
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v7

    if-nez v7, :cond_18

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalSeqNumber()J

    move-result-wide v7

    goto :goto_4

    :cond_18
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v7

    invoke-interface {v7}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v7

    .line 2858
    .local v7, "cseqNumber":J
    :goto_4
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalSeqNumber()J

    move-result-wide v9

    cmp-long v9, v7, v9

    if-lez v9, :cond_19

    .line 2859
    invoke-direct {p0, v7, v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLocalSequenceNumber(J)V

    goto :goto_5

    .line 2861
    :cond_19
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalSeqNumber()J

    move-result-wide v9

    const-wide/16 v11, 0x1

    add-long/2addr v9, v11

    invoke-direct {p0, v9, v10}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLocalSequenceNumber(J)V

    .line 2863
    :goto_5
    sget-object v9, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v9, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 2864
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "SIPDialog::sendRequest:setting Seq Number to "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalSeqNumber()J

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2868
    :cond_1a
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalSeqNumber()J

    move-result-wide v9

    invoke-interface {v0, v9, v10}, Landroid/javax/sip/header/CSeqHeader;->setSeqNumber(J)V
    :try_end_2
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_2 .. :try_end_2} :catch_1

    .line 2871
    .end local v7    # "cseqNumber":J
    goto :goto_6

    .line 2869
    :catch_1
    move-exception v0

    .line 2870
    .local v0, "ex":Landroid/javax/sip/InvalidArgumentException;
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-virtual {v0}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->logFatalError(Ljava/lang/String;)V

    .line 2874
    .end local v0    # "ex":Landroid/javax/sip/InvalidArgumentException;
    :goto_6
    :try_start_3
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 2881
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 2882
    iput-boolean v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->byeSent:Z

    .line 2887
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isTerminatedOnBye()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 2888
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 2893
    :cond_1b
    nop

    .line 2895
    return-void

    .line 2891
    :catch_2
    move-exception v0

    .line 2892
    .local v0, "ex":Ljava/io/IOException;
    new-instance v3, Landroid/javax/sip/SipException;

    const-string/jumbo v4, "error sending message"

    invoke-direct {v3, v4, v0}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 2849
    .end local v0    # "ex":Ljava/io/IOException;
    :catch_3
    move-exception v0

    .line 2850
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 2851
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v0}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    .line 2852
    :cond_1c
    new-instance v3, Landroid/javax/sip/SipException;

    const-string v4, "Could not create message channel"

    invoke-direct {v3, v4, v0}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 2688
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v2    # "from":Landroid/gov/nist/javax/sip/header/From;
    .end local v5    # "to":Landroid/gov/nist/javax/sip/header/To;
    .end local v6    # "hop":Landroid/javax/sip/address/Hop;
    :cond_1d
    new-instance v0, Landroid/javax/sip/SipException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bad Request Method. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2661
    .end local v1    # "dialogRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_1e
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null parameter"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setAckSendingStrategy(Landroid/gov/nist/javax/sip/stack/AckSendingStrategy;)V
    .locals 0
    .param p1, "ackSendingStrategy"    # Landroid/gov/nist/javax/sip/stack/AckSendingStrategy;

    .line 4519
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackSendingStrategy:Landroid/gov/nist/javax/sip/stack/AckSendingStrategy;

    .line 4520
    return-void
.end method

.method public setApplicationData(Ljava/lang/Object;)V
    .locals 0
    .param p1, "applicationData"    # Ljava/lang/Object;

    .line 1459
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->applicationData:Ljava/lang/Object;

    .line 1460
    return-void
.end method

.method public setAssigned()V
    .locals 1

    .line 4020
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isAssigned:Z

    .line 4021
    return-void
.end method

.method public setBackToBackUserAgent()V
    .locals 1

    .line 4238
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isBackToBackUserAgent:Z

    .line 4239
    return-void
.end method

.method public setDialogId(Ljava/lang/String;)V
    .locals 1
    .param p1, "dialogId"    # Ljava/lang/String;

    .line 1814
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v0, :cond_0

    .line 1815
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v0, p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    .line 1817
    :cond_0
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogId:Ljava/lang/String;

    .line 1818
    return-void
.end method

.method public setEarlyDialogTimeoutSeconds(I)V
    .locals 3
    .param p1, "seconds"    # I

    .line 4457
    if-lez p1, :cond_0

    .line 4460
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyDialogTimeout:I

    .line 4461
    return-void

    .line 4458
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid value "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setEventHeader(Landroid/javax/sip/header/EventHeader;)V
    .locals 0
    .param p1, "eventHeader"    # Landroid/javax/sip/header/EventHeader;

    .line 4253
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->eventHeader:Landroid/javax/sip/header/EventHeader;

    .line 4254
    return-void
.end method

.method public setLastResponse(Landroid/gov/nist/javax/sip/stack/SIPTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)V
    .locals 16
    .param p1, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    .param p2, "sipResponse"    # Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 3351
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    const-string v4, "EarlyStateTimerTask craeted "

    const-string v5, "INVITE"

    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v0

    iput-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->callIdHeader:Landroid/javax/sip/header/CallIdHeader;

    .line 3352
    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v6

    .line 3353
    .local v6, "statusCode":I
    const/16 v0, 0x64

    const/16 v7, 0x20

    if-ne v6, v0, :cond_1

    .line 3354
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3355
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Invalid status code - 100 in setLastResponse - ignoring"

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3358
    :cond_0
    return-void

    .line 3361
    :cond_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3362
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 3366
    :cond_2
    const/4 v8, 0x0

    :try_start_0
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseStatusCode:Ljava/lang/Integer;

    .line 3369
    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/Via;

    iput-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseTopMostVia:Landroid/gov/nist/javax/sip/header/Via;

    .line 3370
    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeqHeader()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v0

    move-object v9, v0

    .line 3371
    .local v9, "cseqMethod":Ljava/lang/String;
    iput-object v9, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseMethod:Ljava/lang/String;

    .line 3372
    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v10

    .line 3374
    .local v10, "responseCSeqNumber":J
    div-int/lit8 v0, v6, 0x64

    const/4 v13, 0x1

    if-ne v0, v13, :cond_3

    move v0, v13

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    :goto_0
    move v14, v0

    .line 3375
    .local v14, "is100ClassResponse":Z
    div-int/lit8 v0, v6, 0x64

    const/4 v15, 0x2

    if-ne v0, v15, :cond_4

    move v0, v13

    goto :goto_1

    :cond_4
    const/4 v0, 0x0

    :goto_1
    move v15, v0

    .line 3377
    .local v15, "is200ClassResponse":Z
    iput-wide v10, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseCSeqNumber:J

    .line 3378
    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 3379
    iput-wide v10, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastInviteResponseCSeqNumber:J

    .line 3380
    iput v6, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastInviteResponseCode:I

    .line 3382
    :cond_5
    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 3383
    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseToTag:Ljava/lang/String;

    .line 3385
    :cond_6
    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFromTag()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 3386
    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFromTag()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseFromTag:Ljava/lang/String;

    .line 3388
    :cond_7
    if-eqz v2, :cond_8

    .line 3389
    invoke-interface/range {p1 .. p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->isServerTransaction()Z

    move-result v0

    invoke-virtual {v3, v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getDialogId(Z)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseDialogId:Ljava/lang/String;

    .line 3392
    :cond_8
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setAssigned()V

    .line 3394
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 3395
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "sipDialog: setLastResponse:"

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " lastResponse = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseStatusCode:Ljava/lang/Integer;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " response "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " topMostViaHeader "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseTopMostVia:Landroid/gov/nist/javax/sip/header/Via;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v0, v12}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3402
    :cond_9
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v12, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    if-ne v0, v12, :cond_10

    .line 3403
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 3404
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v7, "sipDialog: setLastResponse -- dialog is terminated - ignoring "

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3410
    :cond_a
    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const/16 v0, 0xc8

    if-ne v6, v0, :cond_b

    .line 3413
    iget-wide v12, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastInviteOkReceived:J

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v12

    iput-wide v12, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastInviteOkReceived:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 3687
    :cond_b
    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    if-eqz v2, :cond_f

    instance-of v0, v2, Landroid/javax/sip/ClientTransaction;

    if-eqz v0, :cond_f

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v5, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    if-eq v0, v5, :cond_f

    .line 3689
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->acquireTimerTaskSem()V

    .line 3691
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v5, Landroid/javax/sip/DialogState;->EARLY:Landroid/javax/sip/DialogState;

    if-ne v0, v5, :cond_d

    .line 3692
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    if-eqz v0, :cond_c

    .line 3693
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    invoke-interface {v0, v5}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 3696
    :cond_c
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyDialogTimeout:I

    mul-int/lit16 v5, v5, 0x3e8

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3699
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;-><init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    iput-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    .line 3700
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    if-eqz v0, :cond_e

    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 3701
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    iget v5, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyDialogTimeout:I

    mul-int/lit16 v5, v5, 0x3e8

    int-to-long v7, v5

    invoke-interface {v0, v4, v7, v8}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    goto :goto_2

    .line 3705
    :cond_d
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    if-eqz v0, :cond_e

    .line 3706
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    invoke-interface {v0, v4}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 3708
    iput-object v8, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3713
    :cond_e
    :goto_2
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseTimerTaskSem()V

    .line 3714
    goto :goto_3

    .line 3713
    :catchall_0
    move-exception v0

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseTimerTaskSem()V

    throw v0

    :cond_f
    :goto_3
    return-void

    .line 3418
    :cond_10
    :try_start_2
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 3419
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 3420
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "cseqMethod = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v0, v12}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3422
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "dialogState = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v0, v12}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3424
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "method = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getMethod()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v0, v12}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3426
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "statusCode = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v0, v12}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3428
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "transaction = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v0, v12}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 3435
    :cond_11
    const-string/jumbo v0, "REFER"

    const-string v12, "BYE"

    const-string v13, "NOTIFY"

    const-string/jumbo v7, "SUBSCRIBE"

    if-eqz v2, :cond_1b

    :try_start_3
    instance-of v8, v2, Landroid/javax/sip/ClientTransaction;

    if-eqz v8, :cond_12

    goto/16 :goto_4

    .line 3601
    :cond_12
    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_13

    if-eqz v15, :cond_13

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isTerminatedOnBye()Z

    move-result v8

    if-eqz v8, :cond_13

    .line 3608
    const/4 v0, 0x3

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    goto/16 :goto_7

    .line 3610
    :cond_13
    const/4 v8, 0x0

    .line 3612
    .local v8, "doPutDialog":Z
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v12

    if-nez v12, :cond_14

    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v12

    invoke-interface {v12}, Landroid/javax/sip/header/ToHeader;->getTag()Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_14

    invoke-static {v9}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogCreated(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_14

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getMethod()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_14

    .line 3616
    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v12

    invoke-interface {v12}, Landroid/javax/sip/header/ToHeader;->getTag()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1, v12}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLocalTag(Ljava/lang/String;)V

    .line 3617
    const/4 v8, 0x1

    .line 3620
    :cond_14
    if-nez v15, :cond_18

    .line 3621
    if-eqz v14, :cond_15

    .line 3622
    if-eqz v8, :cond_2c

    .line 3624
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    .line 3625
    const/4 v0, 0x1

    invoke-virtual {v3, v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getDialogId(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setDialogId(Ljava/lang/String;)V

    .line 3626
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->putDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    goto/16 :goto_7

    .line 3641
    :cond_15
    const/16 v0, 0x1e9

    if-ne v6, v0, :cond_17

    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 3645
    :cond_16
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v7, 0x20

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 3647
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v7, "RFC 3265 : Not setting dialog to TERMINATED for 489"

    invoke-interface {v0, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 3656
    :cond_17
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isReInvite()Z

    move-result v0

    if-nez v0, :cond_2c

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v7, Landroid/javax/sip/DialogState;->CONFIRMED:Landroid/javax/sip/DialogState;

    if-eq v0, v7, :cond_2c

    .line 3658
    const/4 v0, 0x3

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    goto/16 :goto_7

    .line 3669
    :cond_18
    iget v12, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogState:I

    if-gtz v12, :cond_1a

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_19

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_19

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 3674
    :cond_19
    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    .line 3677
    :cond_1a
    if-eqz v8, :cond_2c

    .line 3678
    const/4 v0, 0x1

    invoke-virtual {v3, v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getDialogId(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setDialogId(Ljava/lang/String;)V

    .line 3679
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->putDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    goto/16 :goto_7

    .line 3436
    .end local v8    # "doPutDialog":Z
    :cond_1b
    :goto_4
    invoke-static {v9}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogCreated(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_29

    .line 3438
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    if-nez v0, :cond_1d

    if-eqz v14, :cond_1d

    .line 3445
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    .line 3446
    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1c

    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->rfc2543Supported:Z

    if-eqz v0, :cond_27

    :cond_1c
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_27

    .line 3448
    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRemoteTag(Ljava/lang/String;)V

    .line 3449
    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getDialogId(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setDialogId(Ljava/lang/String;)V

    .line 3450
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->putDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 3451
    invoke-direct {v1, v3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addRoute(Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    goto/16 :goto_5

    .line 3453
    :cond_1d
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    if-eqz v0, :cond_1f

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v8, Landroid/javax/sip/DialogState;->EARLY:Landroid/javax/sip/DialogState;

    invoke-virtual {v0, v8}, Landroid/javax/sip/DialogState;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    if-eqz v14, :cond_1f

    .line 3461
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    if-eqz v2, :cond_27

    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1e

    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->rfc2543Supported:Z

    if-eqz v0, :cond_27

    .line 3464
    :cond_1e
    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRemoteTag(Ljava/lang/String;)V

    .line 3465
    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getDialogId(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setDialogId(Ljava/lang/String;)V

    .line 3466
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->putDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 3467
    invoke-direct {v1, v3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addRoute(Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    goto/16 :goto_5

    .line 3469
    :cond_1f
    if-eqz v15, :cond_25

    .line 3475
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v8, 0x20

    invoke-interface {v0, v8}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_20

    .line 3477
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "pendingRouteUpdateOn202Response : "

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v12, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->pendingRouteUpdateOn202Response:Z

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v0, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3482
    :cond_20
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_21

    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->rfc2543Supported:Z

    if-eqz v0, :cond_24

    :cond_21
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v8, Landroid/javax/sip/DialogState;->CONFIRMED:Landroid/javax/sip/DialogState;

    if-ne v0, v8, :cond_22

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v8, Landroid/javax/sip/DialogState;->CONFIRMED:Landroid/javax/sip/DialogState;

    if-ne v0, v8, :cond_24

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    iget-boolean v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->pendingRouteUpdateOn202Response:Z

    if-eqz v0, :cond_24

    if-eqz v15, :cond_24

    .line 3490
    :cond_22
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v8, Landroid/javax/sip/DialogState;->CONFIRMED:Landroid/javax/sip/DialogState;

    if-eq v0, v8, :cond_23

    .line 3491
    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRemoteTag(Ljava/lang/String;)V

    .line 3492
    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getDialogId(Z)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setDialogId(Ljava/lang/String;)V

    .line 3495
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->putDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 3496
    invoke-direct {v1, v3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addRoute(Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    .line 3497
    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    .line 3511
    :cond_23
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    if-eqz v15, :cond_24

    iget-boolean v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->pendingRouteUpdateOn202Response:Z

    if-eqz v0, :cond_24

    .line 3514
    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRemoteTag(Ljava/lang/String;)V

    .line 3515
    invoke-direct {v1, v3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addRoute(Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    .line 3516
    const/4 v0, 0x0

    iput-boolean v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->pendingRouteUpdateOn202Response:Z

    .line 3521
    :cond_24
    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 3522
    iget-wide v7, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastInviteOkReceived:J

    invoke-static {v10, v11, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    iput-wide v7, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastInviteOkReceived:J

    .line 3524
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    if-eqz v0, :cond_27

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    invoke-virtual {v0}, Landroid/javax/sip/DialogState;->getValue()I

    move-result v0

    const/4 v7, 0x1

    if-ne v0, v7, :cond_27

    if-eqz v2, :cond_27

    .line 3527
    invoke-direct {v1, v3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->doTargetRefresh(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    goto :goto_5

    .line 3531
    :cond_25
    const/16 v0, 0x12c

    if-lt v6, v0, :cond_27

    const/16 v0, 0x2bb

    if-gt v6, v0, :cond_27

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    if-eqz v0, :cond_26

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    invoke-virtual {v0}, Landroid/javax/sip/DialogState;->getValue()I

    move-result v0

    if-nez v0, :cond_27

    .line 3544
    :cond_26
    const/4 v0, 0x3

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    .line 3562
    :cond_27
    :goto_5
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v7, Landroid/javax/sip/DialogState;->CONFIRMED:Landroid/javax/sip/DialogState;

    if-eq v0, v7, :cond_2c

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v7, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    if-eq v0, v7, :cond_2c

    .line 3564
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getOriginalRequestRecordRouteHeaders()Landroid/gov/nist/javax/sip/header/RecordRouteList;

    move-result-object v0

    if-eqz v0, :cond_2c

    .line 3565
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getOriginalRequestRecordRouteHeaders()Landroid/gov/nist/javax/sip/header/RecordRouteList;

    move-result-object v0

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getOriginalRequestRecordRouteHeaders()Landroid/gov/nist/javax/sip/header/RecordRouteList;

    move-result-object v7

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/header/RecordRouteList;->size()I

    move-result v7

    invoke-virtual {v0, v7}, Landroid/gov/nist/javax/sip/header/RecordRouteList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    .line 3569
    .local v0, "it":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/javax/sip/header/RecordRoute;>;"
    :goto_6
    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v7

    if-eqz v7, :cond_28

    .line 3570
    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/javax/sip/header/RecordRoute;

    .line 3571
    .local v7, "rr":Landroid/gov/nist/javax/sip/header/RecordRoute;
    iget-object v8, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/header/RouteList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v8

    check-cast v8, Landroid/gov/nist/javax/sip/header/Route;

    .line 3572
    .local v8, "route":Landroid/gov/nist/javax/sip/header/Route;
    if-eqz v8, :cond_28

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/header/RecordRoute;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v12

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/header/Route;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v13

    invoke-interface {v12, v13}, Landroid/javax/sip/address/Address;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_28

    .line 3575
    iget-object v12, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    invoke-virtual {v12}, Landroid/gov/nist/javax/sip/header/RouteList;->removeFirst()V

    .line 3578
    .end local v7    # "rr":Landroid/gov/nist/javax/sip/header/RecordRoute;
    .end local v8    # "route":Landroid/gov/nist/javax/sip/header/Route;
    goto :goto_6

    .line 3579
    .end local v0    # "it":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/javax/sip/header/RecordRoute;>;"
    :cond_28
    goto :goto_7

    .line 3582
    :cond_29
    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2b

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getMethod()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2a

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getMethod()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2b

    :cond_2a
    if-eqz v15, :cond_2b

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    if-nez v0, :cond_2b

    .line 3588
    const/4 v0, 0x1

    invoke-virtual {v3, v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getDialogId(Z)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setDialogId(Ljava/lang/String;)V

    .line 3589
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->putDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 3590
    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    goto :goto_7

    .line 3592
    :cond_2b
    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    if-eqz v15, :cond_2c

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isTerminatedOnBye()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 3596
    const/4 v0, 0x3

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 3687
    .end local v9    # "cseqMethod":Ljava/lang/String;
    .end local v10    # "responseCSeqNumber":J
    .end local v14    # "is100ClassResponse":Z
    .end local v15    # "is200ClassResponse":Z
    :cond_2c
    :goto_7
    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    if-eqz v2, :cond_30

    instance-of v0, v2, Landroid/javax/sip/ClientTransaction;

    if-eqz v0, :cond_30

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v5, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    if-eq v0, v5, :cond_30

    .line 3689
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->acquireTimerTaskSem()V

    .line 3691
    :try_start_4
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v5, Landroid/javax/sip/DialogState;->EARLY:Landroid/javax/sip/DialogState;

    if-ne v0, v5, :cond_2e

    .line 3692
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    if-eqz v0, :cond_2d

    .line 3693
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    invoke-interface {v0, v5}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 3696
    :cond_2d
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyDialogTimeout:I

    mul-int/lit16 v5, v5, 0x3e8

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3699
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;-><init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    iput-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    .line 3700
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    if-eqz v0, :cond_2f

    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 3701
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    iget v5, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyDialogTimeout:I

    mul-int/lit16 v5, v5, 0x3e8

    int-to-long v7, v5

    invoke-interface {v0, v4, v7, v8}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    goto :goto_8

    .line 3705
    :cond_2e
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    if-eqz v0, :cond_2f

    .line 3706
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    invoke-interface {v0, v4}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 3708
    const/4 v4, 0x0

    iput-object v4, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 3713
    :cond_2f
    :goto_8
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseTimerTaskSem()V

    .line 3714
    nop

    .line 3713
    goto :goto_9

    :catchall_1
    move-exception v0

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseTimerTaskSem()V

    throw v0

    .line 3718
    :cond_30
    :goto_9
    return-void

    .line 3687
    :catchall_2
    move-exception v0

    invoke-virtual/range {p2 .. p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v7

    invoke-interface {v7}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_34

    if-eqz v2, :cond_34

    instance-of v5, v2, Landroid/javax/sip/ClientTransaction;

    if-eqz v5, :cond_34

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v5

    sget-object v7, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    if-eq v5, v7, :cond_34

    .line 3689
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->acquireTimerTaskSem()V

    .line 3691
    :try_start_5
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v5

    sget-object v7, Landroid/javax/sip/DialogState;->EARLY:Landroid/javax/sip/DialogState;

    if-ne v5, v7, :cond_32

    .line 3692
    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    if-eqz v5, :cond_31

    .line 3693
    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v5

    iget-object v7, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    invoke-interface {v5, v7}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 3696
    :cond_31
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v7, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyDialogTimeout:I

    mul-int/lit16 v7, v7, 0x3e8

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v5, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3699
    new-instance v4, Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    invoke-direct {v4, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;-><init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    iput-object v4, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    .line 3700
    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v4

    if-eqz v4, :cond_33

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v4

    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->isStarted()Z

    move-result v4

    if-eqz v4, :cond_33

    .line 3701
    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v4

    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    iget v7, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyDialogTimeout:I

    mul-int/lit16 v7, v7, 0x3e8

    int-to-long v7, v7

    invoke-interface {v4, v5, v7, v8}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    goto :goto_a

    .line 3705
    :cond_32
    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    if-eqz v4, :cond_33

    .line 3706
    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v4

    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    invoke-interface {v4, v5}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 3708
    const/4 v4, 0x0

    iput-object v4, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 3713
    :cond_33
    :goto_a
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseTimerTaskSem()V

    .line 3714
    goto :goto_b

    .line 3713
    :catchall_3
    move-exception v0

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseTimerTaskSem()V

    throw v0

    :cond_34
    :goto_b
    throw v0
.end method

.method protected setLocalParty(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .locals 1
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;

    .line 2302
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isServer()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2303
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/FromHeader;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localParty:Landroid/javax/sip/address/Address;

    goto :goto_0

    .line 2305
    :cond_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/ToHeader;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->localParty:Landroid/javax/sip/address/Address;

    .line 2307
    :goto_0
    return-void
.end method

.method protected setLocalTag(Ljava/lang/String;)V
    .locals 3
    .param p1, "mytag"    # Ljava/lang/String;

    .line 2232
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2233
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "set Local tag "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " dialog = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2235
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 2238
    :cond_0
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->myTag:Ljava/lang/String;

    .line 2240
    return-void
.end method

.method public setOriginalDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V
    .locals 0
    .param p1, "originalDialog"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 4500
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->originalDialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 4502
    return-void
.end method

.method public setPendingRouteUpdateOn202Response(Landroid/gov/nist/javax/sip/message/SIPRequest;)V
    .locals 1
    .param p1, "sipRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 4302
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->pendingRouteUpdateOn202Response:Z

    .line 4304
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFromHeader()Landroid/javax/sip/header/FromHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/FromHeader;->getTag()Ljava/lang/String;

    move-result-object v0

    .line 4305
    .local v0, "fromTag":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 4306
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRemoteTag(Ljava/lang/String;)V

    .line 4309
    :cond_0
    return-void
.end method

.method protected setReInviteFlag(Z)V
    .locals 0
    .param p1, "reInviteFlag"    # Z

    .line 4269
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->reInviteFlag:Z

    .line 4270
    return-void
.end method

.method public setReleaseReferencesStrategy(Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;)V
    .locals 0
    .param p1, "releaseReferencesStrategy"    # Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    .line 4453
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseReferencesStrategy:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    .line 4454
    return-void
.end method

.method protected setRemoteParty(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .locals 3
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;

    .line 998
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isServer()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1000
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/ToHeader;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteParty:Landroid/javax/sip/address/Address;

    goto :goto_0

    .line 1002
    :cond_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/FromHeader;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteParty:Landroid/javax/sip/address/Address;

    .line 1005
    :goto_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1006
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "settingRemoteParty "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteParty:Landroid/javax/sip/address/Address;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1009
    :cond_1
    return-void
.end method

.method public setRemoteSequenceNumber(J)V
    .locals 3
    .param p1, "rCseq"    # J

    .line 2137
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2138
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setRemoteSeqno "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2140
    :cond_0
    iput-wide p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteSequenceNumber:J

    .line 2141
    return-void
.end method

.method protected setRemoteTag(Ljava/lang/String;)V
    .locals 4
    .param p1, "hisTag"    # Ljava/lang/String;

    .line 2045
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2046
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setRemoteTag(): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " remoteTag = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->hisTag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " new tag = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2050
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->hisTag:Ljava/lang/String;

    if-eqz v0, :cond_7

    if-eqz p1, :cond_7

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->hisTag:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 2052
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    sget-object v2, Landroid/javax/sip/DialogState;->EARLY:Landroid/javax/sip/DialogState;

    if-eq v0, v2, :cond_2

    .line 2053
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2054
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v1, "Dialog is already established -- ignoring remote tag re-assignment"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2057
    :cond_1
    return-void

    .line 2058
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isRemoteTagReassignmentAllowed()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 2059
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2060
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "UNSAFE OPERATION !  tag re-assignment "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->hisTag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " trying to set to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " can cause unexpected effects "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2066
    :cond_3
    const/4 v0, 0x0

    .line 2067
    .local v0, "removed":Z
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v2

    if-ne v2, p0, :cond_4

    .line 2068
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeDialog(Ljava/lang/String;)V

    .line 2069
    const/4 v0, 0x1

    .line 2073
    :cond_4
    const/4 v2, 0x0

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogId:Ljava/lang/String;

    .line 2074
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->hisTag:Ljava/lang/String;

    .line 2075
    if-eqz v0, :cond_6

    .line 2076
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 2077
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "ReInserting Dialog"

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2079
    :cond_5
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->putDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 2081
    .end local v0    # "removed":Z
    :cond_6
    goto :goto_0

    .line 2083
    :cond_7
    if-eqz p1, :cond_8

    .line 2084
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->hisTag:Ljava/lang/String;

    goto :goto_0

    .line 2086
    :cond_8
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 2087
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "setRemoteTag : called with null argument "

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 2091
    :cond_9
    :goto_0
    return-void
.end method

.method protected setRemoteTarget(Landroid/javax/sip/header/ContactHeader;)V
    .locals 3
    .param p1, "contact"    # Landroid/javax/sip/header/ContactHeader;

    .line 1099
    invoke-interface {p1}, Landroid/javax/sip/header/ContactHeader;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteTarget:Landroid/javax/sip/address/Address;

    .line 1100
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1101
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Dialog.setRemoteTarget: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->remoteTarget:Landroid/javax/sip/address/Address;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1103
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 1106
    :cond_0
    return-void
.end method

.method public setResponseTags(Landroid/gov/nist/javax/sip/message/SIPResponse;)V
    .locals 3
    .param p1, "sipResponse"    # Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 3321
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 3324
    :cond_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFromTag()Ljava/lang/String;

    move-result-object v0

    .line 3325
    .local v0, "responseFromTag":Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 3326
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3327
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setToTag(Ljava/lang/String;)V

    goto :goto_0

    .line 3328
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 3329
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setToTag(Ljava/lang/String;)V

    goto :goto_0

    .line 3332
    :cond_2
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 3333
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "No from tag in response! Not RFC 3261 compatible."

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 3337
    :cond_3
    :goto_0
    return-void

    .line 3322
    .end local v0    # "responseFromTag":Ljava/lang/String;
    :cond_4
    :goto_1
    return-void
.end method

.method protected setRetransmissionTicks()V
    .locals 1

    .line 2914
    const/4 v0, 0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->retransmissionTicksLeft:I

    .line 2915
    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->prevRetransmissionTicks:I

    .line 2916
    return-void
.end method

.method setRouteList(Landroid/gov/nist/javax/sip/header/RouteList;)V
    .locals 0
    .param p1, "routeList"    # Landroid/gov/nist/javax/sip/header/RouteList;

    .line 1217
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->routeList:Landroid/gov/nist/javax/sip/header/RouteList;

    .line 1218
    return-void
.end method

.method setServerTransactionFlag(Z)V
    .locals 0
    .param p1, "serverTransactionFlag"    # Z

    .line 4261
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->serverTransactionFlag:Z

    .line 4262
    return-void
.end method

.method public setSipProvider(Landroid/gov/nist/javax/sip/SipProviderImpl;)V
    .locals 0
    .param p1, "sipProvider"    # Landroid/gov/nist/javax/sip/SipProviderImpl;

    .line 3308
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    .line 3309
    return-void
.end method

.method setStack(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V
    .locals 0
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 1348
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 1350
    return-void
.end method

.method public setState(I)V
    .locals 4
    .param p1, "state"    # I

    .line 1545
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1546
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "SIPDialog::setState:Setting dialog state for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "newState = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1548
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 1549
    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogState:I

    if-eq p1, v0, :cond_0

    .line 1550
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1551
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "SIPDialog::setState:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "  old dialog state is "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1553
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  New dialog state is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Landroid/javax/sip/DialogState;->getObject(I)Landroid/javax/sip/DialogState;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1559
    :cond_0
    if-nez p1, :cond_1

    .line 1560
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addEventListener(Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;)V

    .line 1563
    :cond_1
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogState:I

    .line 1565
    const/4 v0, 0x3

    if-ne p1, v0, :cond_4

    .line 1566
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->removeEventListener(Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;)V

    .line 1567
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1568
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getConnectionLingerTimer()I

    move-result v0

    if-lez v0, :cond_2

    .line 1569
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    new-instance v1, Landroid/gov/nist/javax/sip/stack/SIPDialog$LingerTimer;

    invoke-direct {v1, p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog$LingerTimer;-><init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getConnectionLingerTimer()I

    move-result v2

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    invoke-interface {v0, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    goto :goto_0

    .line 1572
    :cond_2
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPDialog$LingerTimer;

    invoke-direct {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog$LingerTimer;-><init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog$LingerTimer;->runTask()V

    .line 1575
    :cond_3
    :goto_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->stopTimer()V

    .line 1578
    :cond_4
    return-void
.end method

.method public startRetransmitTimer(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;Landroid/javax/sip/message/Response;)V
    .locals 3
    .param p1, "sipServerTx"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .param p2, "response"    # Landroid/javax/sip/message/Response;

    .line 3730
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3731
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "startRetransmitTimer() "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p2}, Landroid/javax/sip/message/Response;->getStatusCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " method "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3735
    :cond_0
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isInviteTransaction()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Landroid/javax/sip/message/Response;->getStatusCode()I

    move-result v0

    div-int/lit8 v0, v0, 0x64

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 3737
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->startTimer(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 3739
    :cond_1
    return-void
.end method

.method protected startTimer(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    .locals 7
    .param p1, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 2964
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;

    const/16 v1, 0x20

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->transaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-ne v0, p1, :cond_1

    .line 2965
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2966
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Timer already running for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2968
    :cond_0
    return-void

    .line 2970
    :cond_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2971
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Starting dialog timer for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2974
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->acquireTimerTaskSem()V

    .line 2976
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;

    if-eqz v0, :cond_3

    .line 2977
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;

    iput-object p1, v0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->transaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    goto :goto_0

    .line 2979
    :cond_3
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;

    invoke-direct {v0, p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;-><init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;

    .line 2980
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2981
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getBaseTimerInterval()I

    move-result v0

    int-to-long v3, v0

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getBaseTimerInterval()I

    move-result v0

    int-to-long v5, v0

    invoke-interface/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->scheduleWithFixedDelay(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;JJ)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2987
    :cond_4
    :goto_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseTimerTaskSem()V

    .line 2988
    nop

    .line 2990
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRetransmissionTicks()V

    .line 2991
    return-void

    .line 2987
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseTimerTaskSem()V

    throw v0
.end method

.method protected stopTimer()V
    .locals 3

    .line 2999
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->acquireTimerTaskSem()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 3001
    :try_start_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 3002
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;

    invoke-interface {v0, v2}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 3003
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->timerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;

    .line 3005
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    if-eqz v0, :cond_1

    .line 3006
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;

    invoke-interface {v0, v2}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 3007
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->earlyStateTimerTask:Landroid/gov/nist/javax/sip/stack/SIPDialog$EarlyStateTimerTask;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3010
    :cond_1
    :try_start_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseTimerTaskSem()V

    .line 3011
    nop

    .line 3013
    goto :goto_0

    .line 3010
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->releaseTimerTaskSem()V

    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 3012
    :catch_0
    move-exception v0

    .line 3014
    :goto_0
    return-void
.end method

.method protected storeFirstTransactionInfo(Landroid/gov/nist/javax/sip/stack/SIPDialog;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V
    .locals 3
    .param p1, "dialog"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .param p2, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 1859
    const/4 v0, 0x1

    iput-boolean v0, p1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionSeen:Z

    .line 1860
    iput-object p2, p1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 1861
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->isServerTransaction()Z

    move-result v0

    iput-boolean v0, p1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionIsServerTransaction:Z

    .line 1863
    iget-boolean v0, p1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionIsServerTransaction:Z

    const-string/jumbo v1, "sips"

    if-eqz v0, :cond_0

    .line 1864
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/message/Request;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/address/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionSecure:Z

    goto :goto_0

    .line 1867
    :cond_0
    move-object v0, p2

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getOriginalRequestScheme()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionSecure:Z

    .line 1870
    :goto_0
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getPort()I

    move-result v0

    iput v0, p1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionPort:I

    .line 1871
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getBranchId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionId:Ljava/lang/String;

    .line 1872
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getMethod()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionMethod:Ljava/lang/String;

    .line 1873
    instance-of v0, p2, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v0, :cond_1

    iget-object v0, p1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionMethod:Ljava/lang/String;

    const-string v1, "INVITE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1875
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionMergeId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeMergeDialog(Ljava/lang/String;)V

    .line 1876
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getMergeId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionMergeId:Ljava/lang/String;

    .line 1877
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->putMergeDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    .line 1880
    :cond_1
    invoke-interface {p2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->isServerTransaction()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1881
    move-object v0, p2

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 1882
    .local v0, "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getLastResponse()Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v1

    .line 1883
    .local v1, "response":Landroid/gov/nist/javax/sip/message/SIPResponse;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getContactHeader()Landroid/gov/nist/javax/sip/header/Contact;

    move-result-object v2

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    :goto_1
    iput-object v2, p1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->contactHeader:Landroid/gov/nist/javax/sip/header/Contact;

    .line 1885
    .end local v0    # "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v1    # "response":Landroid/gov/nist/javax/sip/message/SIPResponse;
    goto :goto_2

    .line 1886
    :cond_3
    move-object v0, p2

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 1887
    .local v0, "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    if-eqz v0, :cond_4

    .line 1888
    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getOriginalRequestContact()Landroid/gov/nist/javax/sip/header/Contact;

    move-result-object v1

    iput-object v1, p1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->contactHeader:Landroid/gov/nist/javax/sip/header/Contact;

    .line 1891
    .end local v0    # "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    :cond_4
    :goto_2
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1892
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "firstTransaction = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1893
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "firstTransactionIsServerTransaction = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionIsServerTransaction:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1894
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "firstTransactionSecure = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionSecure:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1895
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "firstTransactionPort = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionPort:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1896
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "firstTransactionId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1897
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "firstTransactionMethod = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionMethod:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1898
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "firstTransactionMergeId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionMergeId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1900
    :cond_5
    return-void
.end method

.method takeAckSem()Z
    .locals 7

    .line 4158
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    const-string v2, " sem="

    if-eqz v0, :cond_0

    .line 4159
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "[takeAckSem "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackSem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 4163
    :cond_0
    const/4 v0, 0x0

    :try_start_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackSem:Ljava/util/concurrent/Semaphore;

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v5, 0x2

    invoke-virtual {v3, v5, v6, v4}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 4164
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 4165
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Cannot aquire ACK semaphore "

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 4169
    :cond_1
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 4170
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Semaphore previously acquired at "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->stackTrace:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackSem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 4173
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 4176
    :cond_2
    return v0

    .line 4179
    :cond_3
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 4182
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->recordStackTrace()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4189
    :cond_4
    nop

    .line 4190
    const/4 v0, 0x1

    return v0

    .line 4185
    :catch_0
    move-exception v1

    .line 4186
    .local v1, "ex":Ljava/lang/InterruptedException;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "Cannot aquire ACK semaphore"

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 4187
    return v0
.end method

.method public terminateOnBye(Z)V
    .locals 0
    .param p1, "terminateFlag"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 4011
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->terminateOnBye:Z

    .line 4012
    return-void
.end method

.method declared-synchronized testAndSetIsDialogTerminatedEventDelivered()Z
    .locals 2

    monitor-enter p0

    .line 1426
    :try_start_0
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogTerminatedEventDelivered:Z

    .line 1427
    .local v0, "retval":Z
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogTerminatedEventDelivered:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1428
    monitor-exit p0

    return v0

    .line 1425
    .end local v0    # "retval":Z
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
