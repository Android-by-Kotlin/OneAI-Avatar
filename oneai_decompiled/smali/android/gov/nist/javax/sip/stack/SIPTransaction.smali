.class public interface abstract Landroid/gov/nist/javax/sip/stack/SIPTransaction;
.super Ljava/lang/Object;
.source "SIPTransaction.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/TransactionExt;


# static fields
.field public static final CALLING_STATE:Landroid/javax/sip/TransactionState;

.field public static final COMPLETED_STATE:Landroid/javax/sip/TransactionState;

.field public static final CONFIRMED_STATE:Landroid/javax/sip/TransactionState;

.field public static final INITIAL_STATE:Landroid/javax/sip/TransactionState;

.field public static final PROCEEDING_STATE:Landroid/javax/sip/TransactionState;

.field public static final T1:I = 0x1

.field public static final TERMINATED_STATE:Landroid/javax/sip/TransactionState;

.field public static final TIMER_A:I = 0x1

.field public static final TIMER_B:I = 0x40

.field public static final TIMER_F:I = 0x40

.field public static final TIMER_H:I = 0x40

.field public static final TIMER_J:I = 0x40

.field public static final TRYING_STATE:Landroid/javax/sip/TransactionState;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 72
    const/4 v0, 0x0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->INITIAL_STATE:Landroid/javax/sip/TransactionState;

    .line 76
    sget-object v0, Landroid/javax/sip/TransactionState;->TRYING:Landroid/javax/sip/TransactionState;

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->TRYING_STATE:Landroid/javax/sip/TransactionState;

    .line 80
    sget-object v0, Landroid/javax/sip/TransactionState;->CALLING:Landroid/javax/sip/TransactionState;

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->CALLING_STATE:Landroid/javax/sip/TransactionState;

    .line 84
    sget-object v0, Landroid/javax/sip/TransactionState;->PROCEEDING:Landroid/javax/sip/TransactionState;

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->PROCEEDING_STATE:Landroid/javax/sip/TransactionState;

    .line 88
    sget-object v0, Landroid/javax/sip/TransactionState;->COMPLETED:Landroid/javax/sip/TransactionState;

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->COMPLETED_STATE:Landroid/javax/sip/TransactionState;

    .line 92
    sget-object v0, Landroid/javax/sip/TransactionState;->CONFIRMED:Landroid/javax/sip/TransactionState;

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->CONFIRMED_STATE:Landroid/javax/sip/TransactionState;

    .line 96
    sget-object v0, Landroid/javax/sip/TransactionState;->TERMINATED:Landroid/javax/sip/TransactionState;

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->TERMINATED_STATE:Landroid/javax/sip/TransactionState;

    return-void
.end method


# virtual methods
.method public abstract acquireSem()Z
.end method

.method public abstract addEventListener(Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;)V
.end method

.method public abstract cancelMaxTxLifeTimeTimer()V
.end method

.method public abstract cleanUp()V
.end method

.method public abstract close()V
.end method

.method public abstract disableRetransmissionTimer()V
.end method

.method public abstract disableTimeoutTimer()V
.end method

.method public abstract doesCancelMatchTransaction(Landroid/gov/nist/javax/sip/message/SIPRequest;)Z
.end method

.method public abstract extractCertIdentities()Ljava/util/List;
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
.end method

.method public abstract fireRetransmissionTimer()V
.end method

.method public abstract fireTimeoutTimer()V
.end method

.method public abstract fireTimer()V
.end method

.method public abstract getApplicationData()Ljava/lang/Object;
.end method

.method public abstract getAuditTag()J
.end method

.method public abstract getBaseTimerInterval()I
.end method

.method public abstract getBranch()Ljava/lang/String;
.end method

.method public abstract getBranchId()Ljava/lang/String;
.end method

.method public abstract getCSeq()J
.end method

.method public abstract getCipherSuite()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation
.end method

.method public abstract getDialog()Landroid/javax/sip/Dialog;
.end method

.method public abstract getForkId()Ljava/lang/String;
.end method

.method public abstract getHost()Ljava/lang/String;
.end method

.method public abstract getInternalState()I
.end method

.method public abstract getKey()Ljava/lang/String;
.end method

.method public abstract getLastResponse()Landroid/gov/nist/javax/sip/message/SIPResponse;
.end method

.method public abstract getLocalCertificates()[Ljava/security/cert/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation
.end method

.method public abstract getMergeId()Ljava/lang/String;
.end method

.method public abstract getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;
.end method

.method public abstract getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;
.end method

.method public abstract getMethod()Ljava/lang/String;
.end method

.method public abstract getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;
.end method

.method public abstract getPeerAddress()Ljava/lang/String;
.end method

.method public abstract getPeerCertificates()[Ljava/security/cert/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLPeerUnverifiedException;
        }
    .end annotation
.end method

.method public abstract getPeerPacketSourceAddress()Ljava/net/InetAddress;
.end method

.method public abstract getPeerPacketSourcePort()I
.end method

.method public abstract getPeerPort()I
.end method

.method public abstract getPeerProtocol()Ljava/lang/String;
.end method

.method public abstract getPort()I
.end method

.method public abstract getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;
.end method

.method public abstract getRequest()Landroid/javax/sip/message/Request;
.end method

.method public abstract getResponse()Landroid/javax/sip/message/Response;
.end method

.method public abstract getRetransmitTimer()I
.end method

.method public abstract getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
.end method

.method public abstract getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;
.end method

.method public abstract getState()Landroid/javax/sip/TransactionState;
.end method

.method public abstract getT2()I
.end method

.method public abstract getT4()I
.end method

.method public abstract getTimerD()I
.end method

.method public abstract getTimerI()I
.end method

.method public abstract getTimerK()I
.end method

.method public abstract getTimerT2()I
.end method

.method public abstract getTimerT4()I
.end method

.method public abstract getTransactionId()Ljava/lang/String;
.end method

.method public abstract getTransport()Ljava/lang/String;
.end method

.method public abstract getViaHeader()Landroid/gov/nist/javax/sip/header/Via;
.end method

.method public abstract getViaHost()Ljava/lang/String;
.end method

.method public abstract getViaPort()I
.end method

.method public abstract hashCode()I
.end method

.method public abstract isByeTransaction()Z
.end method

.method public abstract isCancelTransaction()Z
.end method

.method public abstract isDialogCreatingTransaction()Z
.end method

.method public abstract isInviteTransaction()Z
.end method

.method public abstract isMessagePartOfTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;)Z
.end method

.method public abstract isReliable()Z
.end method

.method public abstract isSecure()Z
.end method

.method public abstract isServerTransaction()Z
.end method

.method public abstract isTerminated()Z
.end method

.method public abstract isTransactionMapped()Z
.end method

.method public abstract passToListener()Z
.end method

.method public abstract raiseErrorEvent(I)V
.end method

.method public abstract raiseIOExceptionEvent()V
.end method

.method public abstract releaseSem()V
.end method

.method public abstract removeEventListener(Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;)V
.end method

.method public abstract scheduleMaxTxLifeTimeTimer()V
.end method

.method public abstract semRelease()V
.end method

.method public abstract sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract setApplicationData(Ljava/lang/Object;)V
.end method

.method public abstract setAuditTag(J)V
.end method

.method public abstract setBranch(Ljava/lang/String;)V
.end method

.method public abstract setCollectionTime(I)V
.end method

.method public abstract setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V
.end method

.method public abstract setEncapsulatedChannel(Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
.end method

.method public abstract setForkId(Ljava/lang/String;)V
.end method

.method public abstract setOriginalRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V
.end method

.method public abstract setPassToListener()V
.end method

.method public abstract setReleaseReferencesStrategy(Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;)V
.end method

.method public abstract setRetransmitTimer(I)V
.end method

.method public abstract setState(I)V
.end method

.method public abstract setTimerD(I)V
.end method

.method public abstract setTimerT2(I)V
.end method

.method public abstract setTimerT4(I)V
.end method

.method public abstract setTransactionMapped(Z)V
.end method

.method public abstract startTransactionTimer()V
.end method

.method public abstract testAndSetTransactionTerminatedEvent()Z
.end method
