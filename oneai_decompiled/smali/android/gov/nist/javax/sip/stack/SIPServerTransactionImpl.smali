.class public Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;
.super Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;
.source "SIPServerTransactionImpl.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$TransactionTimer;,
        Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$SendTrying;,
        Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;,
        Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;
    }
.end annotation


# static fields
.field private static interlockProvisionalResponses:Z

.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private dialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

.field protected dialogId:Ljava/lang/String;

.field private inviteTransaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

.field protected isAckSeen:Z

.field private lastResponseAsBytes:[B

.field private lastResponseHost:Ljava/lang/String;

.field private lastResponsePort:I

.field private lastResponseStatusCode:I

.field private lastResponseTransport:Ljava/lang/String;

.field private originalRequestFromTag:Ljava/lang/String;

.field private originalRequestSentBy:Landroid/gov/nist/core/HostPort;

.field private pendingReliableCSeqNumber:J

.field private pendingReliableRSeqNumber:J

.field private pendingReliableResponseAsBytes:[B

.field private pendingReliableResponseMethod:Ljava/lang/String;

.field private pendingSubscribeTransaction:Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

.field private provisionalResponseSem:Ljava/util/concurrent/Semaphore;

.field private provisionalResponseTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;

.field private transient requestOf:Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

.field private retransmissionAlertEnabled:Z

.field private retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

.field private rseqNumber:I

.field private terminationSemaphore:Ljava/util/concurrent/Semaphore;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 180
    const-class v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    .line 215
    const/4 v0, 0x1

    sput-boolean v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->interlockProvisionalResponses:Z

    return-void
.end method

.method protected constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
    .locals 3
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "newChannelToUse"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 557
    invoke-direct {p0, p1, p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V

    .line 181
    const/4 v0, -0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->rseqNumber:I

    .line 217
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->provisionalResponseSem:Ljava/util/concurrent/Semaphore;

    .line 219
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->terminationSemaphore:Ljava/util/concurrent/Semaphore;

    .line 561
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 562
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Creating Server Transaction"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getBranchId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 563
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 566
    :cond_0
    return-void
.end method

.method static synthetic access$000(Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;)V
    .locals 0
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    .line 179
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->fireReliableResponseRetransmissionTimer()V

    return-void
.end method

.method static synthetic access$100()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 179
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method

.method private checkStateTimers(I)Z
    .locals 12
    .param p1, "statusCode"    # I

    .line 986
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v0

    const-wide/16 v1, 0x40

    const-wide/16 v3, 0x0

    const/16 v5, 0xc8

    const/16 v6, 0x2bb

    const/4 v7, 0x5

    const/16 v8, 0x40

    const/4 v9, 0x2

    const/4 v10, 0x3

    const/4 v11, 0x1

    if-ne v0, v11, :cond_5

    .line 987
    div-int/lit8 v0, p1, 0x64

    if-ne v0, v11, :cond_0

    .line 988
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    goto/16 :goto_1

    .line 989
    :cond_0
    if-gt v5, p1, :cond_b

    if-gt p1, v6, :cond_b

    .line 996
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isInviteTransaction()Z

    move-result v0

    if-nez v0, :cond_2

    .line 997
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isReliable()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getInternalState()I

    move-result v0

    if-eq v0, v10, :cond_1

    .line 1001
    invoke-virtual {p0, v10}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 1017
    invoke-virtual {p0, v1, v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->startTransactionTimerJ(J)V

    .line 1018
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->cleanUpOnTimer()V

    goto/16 :goto_1

    .line 1020
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->cleanUpOnTimer()V

    .line 1021
    invoke-virtual {p0, v7}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 1022
    invoke-virtual {p0, v3, v4}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->startTransactionTimerJ(J)V

    goto/16 :goto_1

    .line 1031
    :cond_2
    div-int/lit8 v0, p1, 0x64

    if-ne v0, v9, :cond_3

    .line 1050
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->disableRetransmissionTimer()V

    .line 1051
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->disableTimeoutTimer()V

    .line 1052
    iput v8, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->collectionTime:I

    .line 1053
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->cleanUpOnTimer()V

    .line 1054
    invoke-virtual {p0, v7}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 1055
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    if-eqz v0, :cond_b

    .line 1056
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRetransmissionTicks()V

    goto/16 :goto_1

    .line 1059
    :cond_3
    invoke-virtual {p0, v10}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 1060
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isReliable()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1072
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->enableRetransmissionTimer()V

    .line 1075
    :cond_4
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->cleanUpOnTimer()V

    .line 1076
    invoke-virtual {p0, v8}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->enableTimeoutTimer(I)V

    goto/16 :goto_1

    .line 1083
    :cond_5
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v0

    if-ne v0, v9, :cond_a

    .line 1085
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isInviteTransaction()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1088
    div-int/lit8 v0, p1, 0x64

    if-ne v0, v9, :cond_6

    .line 1093
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->disableRetransmissionTimer()V

    .line 1094
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->disableTimeoutTimer()V

    .line 1095
    iput v8, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->collectionTime:I

    .line 1096
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->cleanUpOnTimer()V

    .line 1097
    invoke-virtual {p0, v7}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 1098
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    if-eqz v0, :cond_b

    .line 1099
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setRetransmissionTicks()V

    goto :goto_1

    .line 1101
    :cond_6
    const/16 v0, 0x12c

    if-gt v0, p1, :cond_b

    if-gt p1, v6, :cond_b

    .line 1104
    invoke-virtual {p0, v10}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 1105
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isReliable()Z

    move-result v0

    if-nez v0, :cond_7

    .line 1114
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->enableRetransmissionTimer()V

    .line 1116
    :cond_7
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->cleanUpOnTimer()V

    .line 1117
    invoke-virtual {p0, v8}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->enableTimeoutTimer(I)V

    goto :goto_1

    .line 1121
    :cond_8
    if-gt v5, p1, :cond_b

    if-gt p1, v6, :cond_b

    .line 1125
    invoke-virtual {p0, v10}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 1126
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isReliable()Z

    move-result v0

    if-nez v0, :cond_9

    .line 1128
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->disableRetransmissionTimer()V

    .line 1130
    invoke-virtual {p0, v1, v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->startTransactionTimerJ(J)V

    goto :goto_0

    .line 1132
    :cond_9
    invoke-virtual {p0, v7}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 1133
    invoke-virtual {p0, v3, v4}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->startTransactionTimerJ(J)V

    .line 1135
    :goto_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->cleanUpOnTimer()V

    goto :goto_1

    .line 1138
    :cond_a
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v0

    if-ne v10, v0, :cond_b

    .line 1139
    const/4 v0, 0x0

    return v0

    .line 1141
    :cond_b
    :goto_1
    return v11
.end method

.method private fireReliableResponseRetransmissionTimer()V
    .locals 2

    .line 1279
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->resendLastResponseAsBytes()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1286
    goto :goto_0

    .line 1280
    :catch_0
    move-exception v0

    .line 1281
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1282
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    .line 1283
    :cond_0
    const/4 v1, 0x5

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 1284
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->raiseErrorEvent(I)V

    .line 1287
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method


# virtual methods
.method public ackSeen()Z
    .locals 1

    .line 1912
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isAckSeen:Z

    return v0
.end method

.method public cleanUp()V
    .locals 7

    .line 1996
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1997
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "removing"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1999
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v0

    sget-object v2, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->None:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    const/4 v3, 0x1

    if-eq v0, v2, :cond_8

    .line 2002
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2003
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "cleanup : "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getTransactionId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2008
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    const/4 v2, 0x0

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestBytes:[B

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v0

    sget-object v4, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->Normal:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    if-ne v0, v4, :cond_3

    .line 2010
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageParserFactory()Landroid/gov/nist/javax/sip/parser/MessageParserFactory;

    move-result-object v0

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-interface {v0, v4}, Landroid/gov/nist/javax/sip/parser/MessageParserFactory;->createMessageParser(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)Landroid/gov/nist/javax/sip/parser/MessageParser;

    move-result-object v0

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestBytes:[B

    const/4 v5, 0x0

    invoke-interface {v0, v4, v3, v5, v2}, Landroid/gov/nist/javax/sip/parser/MessageParser;->parseSIPMessage([BZZLandroid/gov/nist/javax/sip/parser/ParseExceptionListener;)Landroid/gov/nist/javax/sip/message/SIPMessage;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2012
    :catch_0
    move-exception v0

    .line 2013
    .local v0, "e":Ljava/text/ParseException;
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 2014
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "message "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestBytes:[B

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "could not be reparsed !"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 2016
    .end local v0    # "e":Ljava/text/ParseException;
    :cond_2
    :goto_0
    goto :goto_1

    .line 2017
    :cond_3
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v0, :cond_4

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestBytes:[B

    if-nez v0, :cond_4

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v0

    sget-object v4, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->Normal:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    if-ne v0, v4, :cond_4

    .line 2018
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getTransport()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/message/SIPRequest;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestBytes:[B

    .line 2022
    :cond_4
    :goto_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v0, :cond_5

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestBytes:[B

    if-nez v0, :cond_5

    .line 2023
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMergeId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->mergeId:Ljava/lang/String;

    .line 2025
    :cond_5
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 2026
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->cleanUpOnTimer()V

    .line 2032
    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestFromTag:Ljava/lang/String;

    .line 2033
    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestSentBy:Landroid/gov/nist/core/HostPort;

    .line 2035
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v0, :cond_6

    .line 2038
    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 2040
    :cond_6
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isReliable()Z

    move-result v0

    if-nez v0, :cond_7

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->inviteTransaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v0, :cond_7

    .line 2041
    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->inviteTransaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 2045
    :cond_7
    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    goto :goto_2

    .line 2056
    :cond_8
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 2060
    :goto_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->cacheServerConnections:Z

    if-nez v0, :cond_9

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isReliable()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    iget v2, v0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->useCount:I

    sub-int/2addr v2, v3

    iput v2, v0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->useCount:I

    if-gtz v2, :cond_9

    .line 2063
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->close()V

    goto :goto_3

    .line 2065
    :cond_9
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-boolean v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->cacheServerConnections:Z

    if-nez v0, :cond_a

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isReliable()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 2068
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    iget v0, v0, Landroid/gov/nist/javax/sip/stack/MessageChannel;->useCount:I

    .line 2069
    .local v0, "useCount":I
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Use Count = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2073
    .end local v0    # "useCount":I
    :cond_a
    :goto_3
    return-void
.end method

.method protected cleanUpOnTimer()V
    .locals 5

    .line 2077
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v0

    sget-object v1, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->None:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    if-eq v0, v1, :cond_9

    .line 2078
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2079
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "cleanup on timer : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getTransactionId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2082
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->dialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    const-string v1, "CANCEL"

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2084
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->dialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->dialogId:Ljava/lang/String;

    .line 2086
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->dialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 2088
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->inviteTransaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v2, :cond_2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 2090
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->inviteTransaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V

    .line 2091
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->inviteTransaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 2093
    :cond_2
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v2, :cond_6

    .line 2096
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMergeId()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->mergeId:Ljava/lang/String;

    .line 2097
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setTransaction(Ljava/lang/Object;)V

    .line 2098
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setInviteTransaction(Ljava/lang/Object;)V

    .line 2099
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v2

    const-string v3, "INVITE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 2100
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestSentBy:Landroid/gov/nist/core/HostPort;

    if-nez v2, :cond_3

    .line 2101
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/Via;->getSentBy()Landroid/gov/nist/core/HostPort;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestSentBy:Landroid/gov/nist/core/HostPort;

    .line 2103
    :cond_3
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestFromTag:Ljava/lang/String;

    if-nez v2, :cond_4

    .line 2104
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFromTag()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestFromTag:Ljava/lang/String;

    .line 2109
    :cond_4
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestBytes:[B

    if-nez v2, :cond_5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v2

    sget-object v4, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->Normal:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    if-ne v2, v4, :cond_5

    .line 2110
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getTransport()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/gov/nist/javax/sip/message/SIPRequest;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestBytes:[B

    .line 2112
    :cond_5
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_6

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 2113
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 2116
    :cond_6
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    if-eqz v1, :cond_8

    .line 2117
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v1

    sget-object v2, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->Normal:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    if-ne v1, v2, :cond_7

    .line 2118
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getTransport()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseAsBytes:[B

    .line 2120
    :cond_7
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 2122
    :cond_8
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingReliableResponseAsBytes:[B

    .line 2123
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingReliableResponseMethod:Ljava/lang/String;

    .line 2124
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingSubscribeTransaction:Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 2125
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->provisionalResponseSem:Ljava/util/concurrent/Semaphore;

    .line 2126
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    .line 2127
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->requestOf:Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

    .line 2129
    :cond_9
    return-void
.end method

.method public disableRetransmissionAlerts()V
    .locals 2

    .line 1887
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertEnabled:Z

    if-eqz v0, :cond_1

    .line 1888
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 1889
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertEnabled:Z

    .line 1891
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->dialogId:Ljava/lang/String;

    .line 1892
    .local v0, "dialogId":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 1893
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->retransmissionAlertTransactions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1895
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    .line 1897
    .end local v0    # "dialogId":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public enableRetransmissionAlerts()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 1864
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1867
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isInviteTransaction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1870
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertEnabled:Z

    .line 1872
    return-void

    .line 1868
    :cond_0
    new-instance v0, Landroid/javax/sip/SipException;

    const-string/jumbo v1, "Request Method must be INVITE"

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1865
    :cond_1
    new-instance v0, Landroid/javax/sip/SipException;

    const-string v1, "Dialog associated with tx"

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "other"    # Ljava/lang/Object;

    .line 1687
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 1688
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1689
    return v0

    .line 1691
    :cond_1
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 1692
    .local v0, "sst":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getBranch()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public fireRetransmissionTimer()V
    .locals 4

    .line 1168
    const/4 v0, 0x2

    :try_start_0
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1169
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "fireRetransmissionTimer() -- "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " state "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1172
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isInviteTransaction()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    if-nez v1, :cond_1

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseAsBytes:[B

    if-eqz v1, :cond_4

    .line 1174
    :cond_1
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertEnabled:Z

    if-eqz v1, :cond_3

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isTransactionPendingAck(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    .line 1181
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v1

    .line 1182
    .local v1, "sipProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    new-instance v2, Landroid/javax/sip/TimeoutEvent;

    sget-object v3, Landroid/javax/sip/Timeout;->RETRANSMIT:Landroid/javax/sip/Timeout;

    invoke-direct {v2, v1, p0, v3}, Landroid/javax/sip/TimeoutEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/ServerTransaction;Landroid/javax/sip/Timeout;)V

    .line 1184
    .local v2, "txTimeout":Landroid/javax/sip/TimeoutEvent;
    invoke-virtual {v1, v2, p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    goto :goto_1

    .line 1176
    .end local v1    # "sipProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    .end local v2    # "txTimeout":Landroid/javax/sip/TimeoutEvent;
    :cond_3
    :goto_0
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseStatusCode:I

    div-int/lit8 v1, v1, 0x64

    if-lt v1, v0, :cond_4

    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isAckSeen:Z

    if-nez v1, :cond_4

    .line 1177
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->resendLastResponseAsBytes()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1193
    :cond_4
    :goto_1
    goto :goto_2

    .line 1188
    :catch_0
    move-exception v1

    .line 1189
    .local v1, "e":Ljava/io/IOException;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1190
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    .line 1191
    :cond_5
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->raiseErrorEvent(I)V

    .line 1195
    .end local v1    # "e":Ljava/io/IOException;
    :goto_2
    return-void
.end method

.method public fireTimeoutTimer()V
    .locals 6

    .line 1295
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1296
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "SIPServerTransaction.fireTimeoutTimer this = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " current state = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " method = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1300
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isInviteTransaction()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransactionPendingAck(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1301
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1302
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v1, "Found tx pending ACK - timer H has kicked"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1306
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 1309
    .local v0, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogCreated(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x3

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v1

    if-ne v2, v1, :cond_3

    .line 1312
    :cond_2
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    goto :goto_0

    .line 1313
    :cond_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v4, "BYE"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1314
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isTerminatedOnBye()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1315
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    .line 1318
    :cond_4
    :goto_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v1

    const/4 v4, 0x5

    if-ne v3, v1, :cond_5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isInviteTransaction()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1319
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->raiseErrorEvent(I)V

    .line 1320
    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 1321
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    goto :goto_1

    .line 1323
    :cond_5
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v1

    if-ne v3, v1, :cond_7

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isInviteTransaction()Z

    move-result v1

    if-nez v1, :cond_7

    .line 1324
    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 1325
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v2, "CANCEL"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 1326
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->cleanUp()V

    goto :goto_1

    .line 1328
    :cond_6
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    goto :goto_1

    .line 1331
    :cond_7
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v1

    const/4 v5, 0x4

    if-ne v5, v1, :cond_8

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isInviteTransaction()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 1336
    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 1337
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    goto :goto_1

    .line 1338
    :cond_8
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isInviteTransaction()Z

    move-result v1

    if-nez v1, :cond_a

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v1

    if-eq v3, v1, :cond_9

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v1

    if-ne v5, v1, :cond_a

    .line 1341
    :cond_9
    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    goto :goto_1

    .line 1342
    :cond_a
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isInviteTransaction()Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v1

    if-ne v4, v1, :cond_b

    .line 1345
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->raiseErrorEvent(I)V

    .line 1347
    if-eqz v0, :cond_b

    .line 1348
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    .line 1351
    :cond_b
    :goto_1
    return-void
.end method

.method public getCanceledInviteTransaction()Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .locals 1

    .line 1973
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->inviteTransaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    return-object v0
.end method

.method public bridge synthetic getCanceledInviteTransaction()Landroid/javax/sip/ServerTransaction;
    .locals 1

    .line 179
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getCanceledInviteTransaction()Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-result-object v0

    return-object v0
.end method

.method public getDialog()Landroid/javax/sip/Dialog;
    .locals 2

    .line 1705
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->dialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->dialogId:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1706
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->dialogId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v0

    return-object v0

    .line 1708
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->dialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    return-object v0
.end method

.method public getLastResponseStatusCode()I
    .locals 1

    .line 1358
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseStatusCode:I

    return v0
.end method

.method public getPendingReliableCSeqNumber()J
    .locals 2

    .line 2144
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingReliableCSeqNumber:J

    return-wide v0
.end method

.method public getPendingReliableRSeqNumber()J
    .locals 2

    .line 2152
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingReliableRSeqNumber:J

    return-wide v0
.end method

.method public getPendingReliableResponseMethod()Ljava/lang/String;
    .locals 1

    .line 2136
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingReliableResponseMethod:Ljava/lang/String;

    return-object v0
.end method

.method protected getRealState()I
    .locals 1

    .line 1584
    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getInternalState()I

    move-result v0

    return v0
.end method

.method public getReliableProvisionalResponse()[B
    .locals 1

    .line 1830
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingReliableResponseAsBytes:[B

    return-object v0
.end method

.method public getResponseChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .locals 1

    .line 584
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    return-object v0
.end method

.method public getState()Landroid/javax/sip/TransactionState;
    .locals 2

    .line 1593
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isInviteTransaction()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getInternalState()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 1594
    sget-object v0, Landroid/javax/sip/TransactionState;->PROCEEDING:Landroid/javax/sip/TransactionState;

    return-object v0

    .line 1596
    :cond_0
    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v0

    return-object v0
.end method

.method public getViaHost()Ljava/lang/String;
    .locals 1

    .line 1149
    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getViaHost()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getViaPort()I
    .locals 1

    .line 1157
    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getViaPort()I

    move-result v0

    return v0
.end method

.method public isMessagePartOfTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;)Z
    .locals 19
    .param p1, "messageToTest"    # Landroid/gov/nist/javax/sip/message/SIPMessage;

    .line 600
    move-object/from16 v0, p1

    const/4 v1, 0x0

    .line 601
    .local v1, "transactionMatches":Z
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v2

    invoke-interface {v2}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v2

    .line 602
    .local v2, "method":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v3

    .line 607
    .local v3, "origRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isInviteTransaction()Z

    move-result v4

    if-nez v4, :cond_1

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isTerminated()Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_0

    :cond_0
    move-object/from16 v9, p0

    goto/16 :goto_4

    .line 610
    :cond_1
    :goto_0
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v4

    .line 611
    .local v4, "topViaHeader":Landroid/gov/nist/javax/sip/header/Via;
    if-eqz v4, :cond_13

    .line 615
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v5

    .line 616
    .local v5, "messageBranch":Ljava/lang/String;
    if-eqz v5, :cond_2

    .line 620
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "z9hg4bk"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 626
    const/4 v5, 0x0

    .line 633
    :cond_2
    const/4 v6, 0x0

    const-string v7, "CANCEL"

    const/4 v8, 0x1

    if-eqz v5, :cond_9

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_9

    .line 634
    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 638
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/Via;->getSentBy()Landroid/gov/nist/core/HostPort;

    move-result-object v7

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v9

    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/header/Via;->getSentBy()Landroid/gov/nist/core/HostPort;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/gov/nist/core/HostPort;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    move v6, v8

    :cond_3
    move v1, v6

    move-object/from16 v9, p0

    goto/16 :goto_4

    .line 647
    :cond_4
    if-eqz v3, :cond_6

    .line 648
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/Via;->getSentBy()Landroid/gov/nist/core/HostPort;

    move-result-object v7

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v9

    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/header/Via;->getSentBy()Landroid/gov/nist/core/HostPort;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/gov/nist/core/HostPort;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    move v6, v8

    :cond_5
    move v1, v6

    move-object/from16 v9, p0

    goto/16 :goto_4

    .line 653
    :cond_6
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/Via;->getSentBy()Landroid/gov/nist/core/HostPort;

    move-result-object v7

    move-object/from16 v9, p0

    iget-object v10, v9, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestSentBy:Landroid/gov/nist/core/HostPort;

    invoke-virtual {v7, v10}, Landroid/gov/nist/core/HostPort;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    move v6, v8

    goto :goto_1

    :cond_7
    move-object/from16 v9, p0

    :cond_8
    :goto_1
    move v1, v6

    goto/16 :goto_4

    .line 633
    :cond_9
    move-object/from16 v9, p0

    .line 661
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v10

    move-object v3, v10

    check-cast v3, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 671
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFromTag()Ljava/lang/String;

    move-result-object v10

    .line 673
    .local v10, "originalFromTag":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v11

    invoke-interface {v11}, Landroid/javax/sip/header/FromHeader;->getTag()Ljava/lang/String;

    move-result-object v11

    .line 675
    .local v11, "thisFromTag":Ljava/lang/String;
    if-eqz v10, :cond_b

    if-nez v11, :cond_a

    goto :goto_2

    :cond_a
    move v12, v6

    goto :goto_3

    :cond_b
    :goto_2
    move v12, v8

    .line 677
    .local v12, "skipFrom":Z
    :goto_3
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getToTag()Ljava/lang/String;

    move-result-object v13

    .line 679
    .local v13, "originalToTag":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v14

    invoke-interface {v14}, Landroid/javax/sip/header/ToHeader;->getTag()Ljava/lang/String;

    move-result-object v14

    .line 681
    .local v14, "thisToTag":Ljava/lang/String;
    if-eqz v13, :cond_c

    if-nez v14, :cond_d

    :cond_c
    move v6, v8

    .line 682
    .local v6, "skipTo":Z
    :cond_d
    instance-of v8, v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 686
    .local v8, "isResponse":Z
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v15

    invoke-interface {v15}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_e

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v15

    invoke-interface {v15}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_e

    .line 689
    const/4 v1, 0x0

    goto/16 :goto_4

    .line 690
    :cond_e
    if-nez v8, :cond_f

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v15

    move-object/from16 v16, v0

    check-cast v16, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual/range {v16 .. v16}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v0

    invoke-virtual {v15, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_f
    if-nez v12, :cond_10

    if-eqz v10, :cond_14

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_10
    if-nez v6, :cond_11

    if-eqz v13, :cond_14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_11
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v15

    invoke-interface {v15}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v0, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v15

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v17

    cmp-long v0, v15, v17

    if-nez v0, :cond_14

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v7

    invoke-interface {v7}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/gov/nist/javax/sip/header/Via;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 702
    const/4 v1, 0x1

    goto :goto_4

    .line 611
    .end local v5    # "messageBranch":Ljava/lang/String;
    .end local v6    # "skipTo":Z
    .end local v8    # "isResponse":Z
    .end local v10    # "originalFromTag":Ljava/lang/String;
    .end local v11    # "thisFromTag":Ljava/lang/String;
    .end local v12    # "skipFrom":Z
    .end local v13    # "originalToTag":Ljava/lang/String;
    .end local v14    # "thisToTag":Ljava/lang/String;
    :cond_13
    move-object/from16 v9, p0

    .line 710
    .end local v4    # "topViaHeader":Landroid/gov/nist/javax/sip/header/Via;
    :cond_14
    :goto_4
    return v1
.end method

.method public isRetransmissionAlertEnabled()Z
    .locals 1

    .line 1879
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertEnabled:Z

    return v0
.end method

.method public map()V
    .locals 5

    .line 722
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v0

    .line 724
    .local v0, "realState":I
    const/4 v1, 0x1

    if-ltz v0, :cond_0

    if-ne v0, v1, :cond_2

    .line 727
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isInviteTransaction()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isMapped:Z

    if-nez v2, :cond_1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 728
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isMapped:Z

    .line 731
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    new-instance v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$SendTrying;

    invoke-direct {v2, p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$SendTrying;-><init>(Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;)V

    const-wide/16 v3, 0xc8

    invoke-interface {v1, v2, v3, v4}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    goto :goto_0

    .line 734
    :cond_1
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isMapped:Z

    .line 739
    :cond_2
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removePendingTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 740
    return-void
.end method

.method public prackRecieved()Z
    .locals 3

    .line 1839
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingReliableResponseAsBytes:[B

    if-nez v0, :cond_0

    .line 1840
    const/4 v0, 0x0

    return v0

    .line 1841
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->provisionalResponseTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 1842
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->provisionalResponseTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;

    invoke-interface {v0, v2}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 1843
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->provisionalResponseTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;

    .line 1846
    :cond_1
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingReliableResponseAsBytes:[B

    .line 1847
    sget-boolean v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->interlockProvisionalResponses:Z

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 1848
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->provisionalResponseSem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 1850
    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method public processRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V
    .locals 8
    .param p1, "transactionRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .param p2, "sourceChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 747
    const/4 v0, 0x0

    .line 753
    .local v0, "toTu":Z
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 754
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "processRequest: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 755
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "tx state = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 761
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v3, 0x1

    const/4 v4, 0x5

    const-string v5, "ACK"

    const/4 v6, 0x3

    if-gez v1, :cond_1

    .line 764
    :try_start_1
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setOriginalRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 765
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 766
    const/4 v0, 0x1

    .line 767
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setPassToListener()V

    .line 770
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isInviteTransaction()Z

    move-result v1

    if-eqz v1, :cond_b

    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isMapped:Z

    if-eqz v1, :cond_b

    .line 777
    const-string/jumbo v1, "Trying"

    const/16 v7, 0x64

    invoke-virtual {p1, v7, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(ILjava/lang/String;)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    goto/16 :goto_4

    .line 782
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isInviteTransaction()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v1

    if-ne v6, v1, :cond_5

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 786
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 787
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->disableRetransmissionTimer()V

    .line 788
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isReliable()Z

    move-result v1

    if-nez v1, :cond_2

    .line 789
    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->timerI:I

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->enableTimeoutTimer(I)V

    goto :goto_0

    .line 793
    :cond_2
    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 800
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isNon2XXAckPassedToListener()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 803
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->requestOf:Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v1, p1, v2}, Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;->processRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V

    goto :goto_1

    .line 807
    :cond_3
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 808
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACK received for server Tx "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getTransactionId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not delivering to application!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 813
    :cond_4
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->semRelease()V

    .line 815
    :goto_1
    return-void

    .line 819
    :cond_5
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 821
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v1

    const/4 v3, 0x2

    if-eq v3, v1, :cond_9

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v1

    if-ne v6, v1, :cond_6

    goto :goto_2

    .line 828
    :cond_6
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 831
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->requestOf:Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

    if-eqz v1, :cond_7

    .line 832
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->requestOf:Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v1, p1, v3}, Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;->processRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V

    goto :goto_3

    .line 834
    :cond_7
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->semRelease()V

    goto :goto_3

    .line 837
    :cond_8
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->semRelease()V

    goto :goto_3

    .line 823
    :cond_9
    :goto_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->semRelease()V

    .line 827
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->resendLastResponseAsBytes()V

    .line 839
    :goto_3
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 840
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "completed processing retransmitted request : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " txState = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " lastResponse = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseAsBytes:[B

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 843
    :cond_a
    return-void

    .line 848
    :cond_b
    :goto_4
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v1

    if-eq v6, v1, :cond_f

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v1

    if-eq v4, v1, :cond_f

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->requestOf:Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

    if-eqz v1, :cond_f

    .line 850
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 852
    if-eqz v0, :cond_c

    .line 853
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->requestOf:Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v1, p1, v2}, Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;->processRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V

    goto/16 :goto_9

    .line 855
    :cond_c
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->semRelease()V

    goto/16 :goto_9

    .line 857
    :cond_d
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->requestOf:Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

    if-eqz v1, :cond_e

    .line 858
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->requestOf:Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v1, p1, v2}, Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;->processRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V

    goto/16 :goto_9

    .line 860
    :cond_e
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->semRelease()V

    goto/16 :goto_9

    .line 864
    :cond_f
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogCreated(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v1

    if-ne v1, v4, :cond_13

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->requestOf:Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

    if-eqz v1, :cond_13

    .line 868
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 870
    .local v1, "thisDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    if-eqz v1, :cond_11

    iget-boolean v4, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackProcessed:Z

    if-nez v4, :cond_10

    goto :goto_5

    .line 878
    :cond_10
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->semRelease()V

    goto :goto_6

    .line 872
    :cond_11
    :goto_5
    if-eqz v1, :cond_12

    .line 873
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v4

    invoke-interface {v4}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackReceived(J)V

    .line 874
    iput-boolean v3, v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;->ackProcessed:Z

    .line 876
    :cond_12
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->requestOf:Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->encapsulatedChannel:Landroid/gov/nist/javax/sip/stack/MessageChannel;

    invoke-interface {v3, p1, v4}, Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;->processRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V

    .line 881
    .end local v1    # "thisDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :goto_6
    goto :goto_8

    :cond_13
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v3, "CANCEL"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 882
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 883
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v3, "Too late to cancel Transaction"

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 884
    :cond_14
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->semRelease()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 887
    const/16 v1, 0xc8

    :try_start_2
    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_7

    .line 888
    :catch_0
    move-exception v1

    .line 891
    :goto_7
    goto :goto_8

    .line 894
    :cond_15
    :try_start_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->semRelease()V

    .line 896
    :goto_8
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 897
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dropping request "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRealState()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 905
    :cond_16
    :goto_9
    goto :goto_a

    .line 900
    :catch_1
    move-exception v1

    .line 901
    .local v1, "e":Ljava/io/IOException;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v2

    if-eqz v2, :cond_17

    .line 902
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "IOException "

    invoke-interface {v2, v3, v1}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 903
    :cond_17
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->semRelease()V

    .line 904
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->raiseIOExceptionEvent()V

    .line 907
    .end local v1    # "e":Ljava/io/IOException;
    :goto_a
    return-void
.end method

.method public releaseSem()V
    .locals 2

    .line 1937
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingSubscribeTransaction:Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    if-eqz v0, :cond_0

    .line 1942
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDeliverUnsolicitedNotify()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1943
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingSubscribeTransaction:Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->releaseSem()V

    goto :goto_0

    .line 1945
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->inviteTransaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CANCEL"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1950
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->inviteTransaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->releaseSem()V

    .line 1952
    :cond_1
    :goto_0
    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->releaseSem()V

    .line 1953
    return-void
.end method

.method public resendLastResponseAsBytes()V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1205
    move-object/from16 v1, p0

    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    const-string/jumbo v2, "resend last response "

    const/16 v3, 0x20

    if-eqz v0, :cond_1

    .line 1206
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1207
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1209
    :cond_0
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    goto/16 :goto_2

    .line 1210
    :cond_1
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseAsBytes:[B

    if-eqz v0, :cond_7

    .line 1215
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1216
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    new-instance v4, Ljava/lang/String;

    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseAsBytes:[B

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1219
    :cond_2
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isReliable()Z

    move-result v0

    const/4 v2, 0x0

    const/4 v4, 0x1

    const-string/jumbo v5, "couldn\'t reparse last response "

    const/16 v6, 0x10

    const/4 v7, 0x0

    if-eqz v0, :cond_4

    .line 1220
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1223
    :try_start_0
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageParserFactory()Landroid/gov/nist/javax/sip/parser/MessageParserFactory;

    move-result-object v0

    iget-object v6, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-interface {v0, v6}, Landroid/gov/nist/javax/sip/parser/MessageParserFactory;->createMessageParser(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)Landroid/gov/nist/javax/sip/parser/MessageParser;

    move-result-object v0

    iget-object v6, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseAsBytes:[B

    invoke-interface {v0, v6, v4, v7, v2}, Landroid/gov/nist/javax/sip/parser/MessageParser;->parseSIPMessage([BZZLandroid/gov/nist/javax/sip/parser/ParseExceptionListener;)Landroid/gov/nist/javax/sip/message/SIPMessage;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 1225
    .local v0, "lastReparsedResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getPeerInetAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setRemoteAddress(Ljava/net/InetAddress;)V

    .line 1227
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getPeerPort()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setRemotePort(I)V

    .line 1228
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPort()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setLocalPort(I)V

    .line 1230
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setLocalAddress(Ljava/net/InetAddress;)V

    .line 1234
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v8

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getPeerInetAddress()Ljava/net/InetAddress;

    move-result-object v10

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getPeerPort()I

    move-result v11

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    move-object v9, v0

    invoke-virtual/range {v8 .. v13}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;IJ)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1239
    .end local v0    # "lastReparsedResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    goto :goto_0

    .line 1235
    :catch_0
    move-exception v0

    .line 1236
    .local v0, "e":Ljava/text/ParseException;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1237
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    new-instance v4, Ljava/lang/String;

    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseAsBytes:[B

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1241
    .end local v0    # "e":Ljava/text/ParseException;
    :cond_3
    :goto_0
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    iget-object v2, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseAsBytes:[B

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getPeerInetAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getPeerPort()I

    move-result v4

    invoke-virtual {v0, v2, v3, v4, v7}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->sendMessage([BLjava/net/InetAddress;IZ)V

    goto/16 :goto_2

    .line 1243
    :cond_4
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addressResolver:Landroid/gov/nist/core/net/AddressResolver;

    new-instance v8, Landroid/gov/nist/javax/sip/stack/HopImpl;

    iget-object v9, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseHost:Ljava/lang/String;

    iget v10, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponsePort:I

    iget-object v11, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseTransport:Ljava/lang/String;

    invoke-direct {v8, v9, v10, v11}, Landroid/gov/nist/javax/sip/stack/HopImpl;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-interface {v0, v8}, Landroid/gov/nist/core/net/AddressResolver;->resolveAddress(Landroid/javax/sip/address/Hop;)Landroid/javax/sip/address/Hop;

    move-result-object v8

    .line 1246
    .local v8, "hop":Landroid/javax/sip/address/Hop;
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v9

    invoke-interface {v8}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v9

    invoke-interface {v9}, Landroid/javax/sip/ListeningPoint;->getIPAddress()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getPort()I

    move-result v10

    invoke-virtual {v0, v9, v10, v8}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->createRawMessageChannel(Ljava/lang/String;ILandroid/javax/sip/address/Hop;)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v9

    .line 1249
    .local v9, "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    if-eqz v9, :cond_6

    .line 1250
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1253
    :try_start_1
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageParserFactory()Landroid/gov/nist/javax/sip/parser/MessageParserFactory;

    move-result-object v0

    iget-object v6, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-interface {v0, v6}, Landroid/gov/nist/javax/sip/parser/MessageParserFactory;->createMessageParser(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)Landroid/gov/nist/javax/sip/parser/MessageParser;

    move-result-object v0

    iget-object v6, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseAsBytes:[B

    invoke-interface {v0, v6, v4, v7, v2}, Landroid/gov/nist/javax/sip/parser/MessageParser;->parseSIPMessage([BZZLandroid/gov/nist/javax/sip/parser/ParseExceptionListener;)Landroid/gov/nist/javax/sip/message/SIPMessage;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 1255
    .local v0, "lastReparsedResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerInetAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setRemoteAddress(Ljava/net/InetAddress;)V

    .line 1256
    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerPort()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setRemotePort(I)V

    .line 1257
    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPort()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setLocalPort(I)V

    .line 1258
    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setLocalAddress(Ljava/net/InetAddress;)V

    .line 1260
    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerInetAddress()Ljava/net/InetAddress;

    move-result-object v13

    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->getPeerPort()I

    move-result v14

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    move-object v11, v9

    move-object v12, v0

    invoke-virtual/range {v11 .. v16}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/net/InetAddress;IJ)V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1265
    .end local v0    # "lastReparsedResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    goto :goto_1

    .line 1261
    :catch_1
    move-exception v0

    .line 1262
    .local v0, "e":Ljava/text/ParseException;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1263
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    new-instance v4, Ljava/lang/String;

    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseAsBytes:[B

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1267
    .end local v0    # "e":Ljava/text/ParseException;
    :cond_5
    :goto_1
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseAsBytes:[B

    invoke-interface {v8}, Landroid/javax/sip/address/Hop;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v2

    invoke-interface {v8}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v3

    invoke-virtual {v9, v0, v2, v3, v7}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->sendMessage([BLjava/net/InetAddress;IZ)V

    goto :goto_2

    .line 1269
    :cond_6
    new-instance v0, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not create a message channel for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " with source IP:Port "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v3

    invoke-interface {v8}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/ListeningPoint;->getIPAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1275
    .end local v8    # "hop":Landroid/javax/sip/address/Hop;
    .end local v9    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    :cond_7
    :goto_2
    return-void
.end method

.method public scheduleAckRemoval()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1981
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ACK"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1986
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->startTransactionTimer()V

    .line 1987
    return-void

    .line 1982
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Method is null["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    const/4 v2, 0x1

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "] or method is not ACK["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .locals 5
    .param p1, "messageToSend"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 914
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 915
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "sipServerTransaction::sendMessage "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getFirstLine()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 918
    :cond_0
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 920
    .local v0, "transactionResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v2

    .line 927
    .local v2, "statusCode":I
    :try_start_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestBranch:Ljava/lang/String;

    if-eqz v3, :cond_1

    .line 928
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getBranch()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/header/Via;->setBranch(Ljava/lang/String;)V

    goto :goto_0

    .line 930
    :cond_1
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v3

    const-string/jumbo v4, "branch"

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/header/Via;->removeParameter(Ljava/lang/String;)V

    .line 934
    :goto_0
    iget-boolean v3, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestHasPort:Z

    if-nez v3, :cond_2

    .line 935
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/Via;->removePort()V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 939
    :cond_2
    nop

    .line 943
    :try_start_1
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 945
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sendResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 976
    :cond_3
    :goto_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->startTransactionTimer()V

    return-void

    .line 949
    :cond_4
    :try_start_2
    invoke-direct {p0, v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->checkStateTimers(I)Z

    move-result v3

    if-nez v3, :cond_5

    .line 950
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 951
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v3, "checkStateTimers returned false -- not sending message"

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 959
    :cond_5
    :try_start_3
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 960
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "sendMessage : tx = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " getState = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 963
    :cond_6
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 964
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v1

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseStatusCode:I

    .line 966
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sendResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 974
    nop

    .line 976
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->startTransactionTimer()V

    .line 977
    nop

    .line 979
    return-void

    .line 968
    :catch_0
    move-exception v1

    .line 970
    .local v1, "e":Ljava/io/IOException;
    const/4 v3, 0x5

    :try_start_4
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 971
    const/4 v3, 0x0

    iput v3, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->collectionTime:I

    .line 972
    nop

    .end local v0    # "transactionResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v2    # "statusCode":I
    .end local p1    # "messageToSend":Landroid/gov/nist/javax/sip/message/SIPMessage;
    throw v1

    .line 976
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "transactionResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .restart local v2    # "statusCode":I
    .restart local p1    # "messageToSend":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :catchall_0
    move-exception v1

    goto :goto_2

    .line 936
    :catch_1
    move-exception v1

    .line 937
    .local v1, "ex":Ljava/text/ParseException;
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v4, "UnexpectedException"

    invoke-interface {v3, v4, v1}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 938
    new-instance v3, Ljava/io/IOException;

    const-string/jumbo v4, "Unexpected exception"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "transactionResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v2    # "statusCode":I
    .end local p1    # "messageToSend":Landroid/gov/nist/javax/sip/message/SIPMessage;
    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 976
    .end local v1    # "ex":Ljava/text/ParseException;
    .restart local v0    # "transactionResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .restart local v2    # "statusCode":I
    .restart local p1    # "messageToSend":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :goto_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->startTransactionTimer()V

    throw v1
.end method

.method public sendReliableProvisionalResponse(Landroid/javax/sip/message/Response;)V
    .locals 8
    .param p1, "relResponse"    # Landroid/javax/sip/message/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 1776
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingReliableResponseAsBytes:[B

    if-nez v0, :cond_4

    .line 1780
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 1781
    .local v0, "reliableResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getTransport()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingReliableResponseAsBytes:[B

    .line 1782
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingReliableResponseMethod:Ljava/lang/String;

    .line 1783
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v1

    iput-wide v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingReliableCSeqNumber:J

    .line 1789
    .end local v0    # "reliableResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    const-string/jumbo v0, "RSeq"

    invoke-interface {p1, v0}, Landroid/javax/sip/message/Response;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/RSeq;

    .line 1790
    .local v1, "rseq":Landroid/gov/nist/javax/sip/header/RSeq;
    invoke-interface {p1, v0}, Landroid/javax/sip/message/Response;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1791
    new-instance v0, Landroid/gov/nist/javax/sip/header/RSeq;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/RSeq;-><init>()V

    move-object v1, v0

    .line 1792
    invoke-interface {p1, v1}, Landroid/javax/sip/message/Response;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 1796
    :cond_0
    :try_start_0
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->rseqNumber:I

    if-gez v0, :cond_1

    .line 1797
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v2

    const-wide v4, 0x408f400000000000L    # 1000.0

    mul-double/2addr v2, v4

    double-to-int v0, v2

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->rseqNumber:I

    .line 1799
    :cond_1
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->rseqNumber:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->rseqNumber:I

    .line 1800
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->rseqNumber:I

    int-to-long v2, v0

    invoke-virtual {v1, v2, v3}, Landroid/gov/nist/javax/sip/header/RSeq;->setSeqNumber(J)V

    .line 1801
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/RSeq;->getSeqNumber()J

    move-result-wide v2

    iput-wide v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingReliableRSeqNumber:J

    .line 1805
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 1806
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    if-eqz v0, :cond_3

    sget-boolean v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->interlockProvisionalResponses:Z

    if-eqz v0, :cond_3

    .line 1807
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->provisionalResponseSem:Ljava/util/concurrent/Semaphore;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0x1

    invoke-virtual {v0, v3, v4, v2}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    .line 1808
    .local v0, "acquired":Z
    if-eqz v0, :cond_2

    goto :goto_0

    .line 1809
    :cond_2
    new-instance v2, Landroid/javax/sip/SipException;

    const-string/jumbo v3, "Unacknowledged reliable response"

    invoke-direct {v2, v3}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v1    # "rseq":Landroid/gov/nist/javax/sip/header/RSeq;
    .end local p1    # "relResponse":Landroid/javax/sip/message/Response;
    throw v2

    .line 1814
    .end local v0    # "acquired":Z
    .restart local v1    # "rseq":Landroid/gov/nist/javax/sip/header/RSeq;
    .restart local p1    # "relResponse":Landroid/javax/sip/message/Response;
    :cond_3
    :goto_0
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;

    invoke-direct {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;-><init>(Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->provisionalResponseTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;

    .line 1815
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->provisionalResponseTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x1f4

    invoke-interface/range {v2 .. v7}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->scheduleWithFixedDelay(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;JJ)Z

    .line 1817
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPMessage;

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1820
    goto :goto_1

    .line 1818
    :catch_0
    move-exception v0

    .line 1819
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 1822
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 1777
    .end local v1    # "rseq":Landroid/gov/nist/javax/sip/header/RSeq;
    :cond_4
    new-instance v0, Landroid/javax/sip/SipException;

    const-string/jumbo v1, "Unacknowledged response"

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected sendResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;)V
    .locals 10
    .param p1, "transactionResponse"    # Landroid/gov/nist/javax/sip/message/SIPResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 452
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 453
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "sipServerTransaction::sendResponse "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFirstLine()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 468
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isReliable()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isPatchReceivedRport()Z

    move-result v0

    if-nez v0, :cond_1

    .line 474
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    goto/16 :goto_2

    .line 476
    :cond_1
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v0

    .line 477
    .local v0, "via":Landroid/gov/nist/javax/sip/header/Via;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getTransport()Ljava/lang/String;

    move-result-object v1

    .line 478
    .local v1, "transport":Ljava/lang/String;
    if-eqz v1, :cond_8

    .line 481
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getRPort()I

    move-result v2

    .line 482
    .local v2, "port":I
    const/4 v3, -0x1

    if-ne v2, v3, :cond_2

    .line 483
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getPort()I

    move-result v4

    move v2, v4

    .line 484
    :cond_2
    if-ne v2, v3, :cond_4

    .line 485
    const-string/jumbo v3, "TLS"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 486
    const/16 v2, 0x13c5

    goto :goto_0

    .line 488
    :cond_3
    const/16 v2, 0x13c4

    .line 500
    :cond_4
    :goto_0
    const/4 v3, 0x0

    .line 501
    .local v3, "host":Ljava/lang/String;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getMAddr()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 502
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getMAddr()Ljava/lang/String;

    move-result-object v4

    move-object v3, v4

    goto :goto_1

    .line 513
    :cond_5
    const-string/jumbo v4, "received"

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/header/Via;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object v3, v4

    .line 514
    if-nez v3, :cond_6

    .line 520
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getHost()Ljava/lang/String;

    move-result-object v4

    move-object v3, v4

    .line 524
    :cond_6
    :goto_1
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v4, v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addressResolver:Landroid/gov/nist/core/net/AddressResolver;

    new-instance v5, Landroid/gov/nist/javax/sip/stack/HopImpl;

    invoke-direct {v5, v3, v2, v1}, Landroid/gov/nist/javax/sip/stack/HopImpl;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-interface {v4, v5}, Landroid/gov/nist/core/net/AddressResolver;->resolveAddress(Landroid/javax/sip/address/Hop;)Landroid/javax/sip/address/Hop;

    move-result-object v4

    .line 527
    .local v4, "hop":Landroid/javax/sip/address/Hop;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v6

    invoke-interface {v4}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v6

    invoke-interface {v6}, Landroid/javax/sip/ListeningPoint;->getIPAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getPort()I

    move-result v7

    invoke-virtual {v5, v6, v7, v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->createRawMessageChannel(Ljava/lang/String;ILandroid/javax/sip/address/Hop;)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v5

    .line 530
    .local v5, "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    if-eqz v5, :cond_7

    .line 531
    invoke-virtual {v5, p1}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 532
    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseHost:Ljava/lang/String;

    .line 533
    iput v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponsePort:I

    .line 534
    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseTransport:Ljava/lang/String;

    .line 542
    .end local v0    # "via":Landroid/gov/nist/javax/sip/header/Via;
    .end local v1    # "transport":Ljava/lang/String;
    .end local v2    # "port":I
    .end local v3    # "host":Ljava/lang/String;
    .end local v4    # "hop":Landroid/javax/sip/address/Hop;
    .end local v5    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    :goto_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getTransport()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponseAsBytes:[B

    .line 543
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->lastResponse:Landroid/gov/nist/javax/sip/message/SIPResponse;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 545
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->startTransactionTimer()V

    .line 546
    nop

    .line 547
    return-void

    .line 536
    .restart local v0    # "via":Landroid/gov/nist/javax/sip/header/Via;
    .restart local v1    # "transport":Ljava/lang/String;
    .restart local v2    # "port":I
    .restart local v3    # "host":Ljava/lang/String;
    .restart local v4    # "hop":Landroid/javax/sip/address/Hop;
    .restart local v5    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    :cond_7
    :try_start_1
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Could not create a message channel for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " with source IP:Port "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v8

    invoke-interface {v4}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v8

    invoke-interface {v8}, Landroid/javax/sip/ListeningPoint;->getIPAddress()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getPort()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local p1    # "transactionResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    throw v6

    .line 479
    .end local v2    # "port":I
    .end local v3    # "host":Ljava/lang/String;
    .end local v4    # "hop":Landroid/javax/sip/address/Hop;
    .end local v5    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .restart local p1    # "transactionResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :cond_8
    new-instance v2, Ljava/io/IOException;

    const-string/jumbo v3, "missing transport!"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local p1    # "transactionResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 545
    .end local v0    # "via":Landroid/gov/nist/javax/sip/header/Via;
    .end local v1    # "transport":Ljava/lang/String;
    .restart local p1    # "transactionResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->startTransactionTimer()V

    throw v0
.end method

.method public sendResponse(Landroid/javax/sip/message/Response;)V
    .locals 18
    .param p1, "response"    # Landroid/javax/sip/message/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 1380
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object v3, v2

    check-cast v3, Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 1382
    .local v3, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 1383
    .local v4, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    if-eqz v2, :cond_1c

    .line 1387
    :try_start_0
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->checkHeaders()V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_3

    .line 1390
    nop

    .line 1393
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v5

    .line 1394
    .local v5, "responseMethod":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 1404
    invoke-interface/range {p1 .. p1}, Landroid/javax/sip/message/Response;->getStatusCode()I

    move-result v6

    .line 1405
    .local v6, "statusCode":I
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v7, "SUBSCRIBE"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v7, 0x2

    if-eqz v0, :cond_2

    div-int/lit8 v0, v6, 0x64

    if-ne v0, v7, :cond_2

    .line 1407
    const-string v0, "Expires"

    invoke-interface {v2, v0}, Landroid/javax/sip/message/Response;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1410
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getExpires()Landroid/javax/sip/header/ExpiresHeader;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/Expires;

    .line 1411
    .local v0, "requestExpires":Landroid/gov/nist/javax/sip/header/Expires;
    invoke-interface/range {p1 .. p1}, Landroid/javax/sip/message/Response;->getExpires()Landroid/javax/sip/header/ExpiresHeader;

    move-result-object v8

    check-cast v8, Landroid/gov/nist/javax/sip/header/Expires;

    .line 1416
    .local v8, "responseExpires":Landroid/gov/nist/javax/sip/header/Expires;
    if-eqz v0, :cond_2

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/header/Expires;->getExpires()I

    move-result v9

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Expires;->getExpires()I

    move-result v10

    if-gt v9, v10, :cond_0

    goto :goto_0

    .line 1418
    :cond_0
    new-instance v7, Landroid/javax/sip/SipException;

    const-string/jumbo v9, "Response Expires time exceeds request Expires time : See RFC 3265 3.1.1"

    invoke-direct {v7, v9}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1408
    .end local v0    # "requestExpires":Landroid/gov/nist/javax/sip/header/Expires;
    .end local v8    # "responseExpires":Landroid/gov/nist/javax/sip/header/Expires;
    :cond_1
    new-instance v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;

    const-string v7, "Expires header is mandatory in 2xx response of SUBSCRIBE"

    sget-object v8, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->ExpiresHeaderMandatory:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    invoke-direct {v0, v7, v8}, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;-><init>(Ljava/lang/String;Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;)V

    throw v0

    .line 1426
    :cond_2
    :goto_0
    const/16 v0, 0xc8

    if-ne v6, v0, :cond_4

    const-string v0, "INVITE"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "Contact"

    invoke-virtual {v3, v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    if-eqz v0, :cond_3

    goto :goto_1

    .line 1429
    :cond_3
    new-instance v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;

    const-string v7, "Contact Header is mandatory for the OK to the INVITE"

    sget-object v8, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->ContactHeaderMandatory:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    invoke-direct {v0, v7, v8}, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;-><init>(Ljava/lang/String;Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;)V

    throw v0

    .line 1431
    :cond_4
    :goto_1
    move-object v0, v2

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPMessage;

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isMessagePartOfTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 1444
    const/4 v8, 0x5

    :try_start_1
    move-object v0, v2

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getContentTypeHeader()Landroid/gov/nist/javax/sip/header/ContentType;

    move-result-object v0

    move-object v9, v0

    .line 1445
    .local v9, "contentTypeHeader":Landroid/javax/sip/header/ContentTypeHeader;
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingReliableResponseAsBytes:[B

    if-eqz v0, :cond_7

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getInternalState()I

    move-result v0

    if-eq v0, v8, :cond_7

    div-int/lit8 v0, v6, 0x64

    if-ne v0, v7, :cond_7

    if-eqz v9, :cond_7

    invoke-interface {v9}, Landroid/javax/sip/header/ContentTypeHeader;->getContentType()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v10, "application"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v9}, Landroid/javax/sip/header/ContentTypeHeader;->getContentSubType()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v10, "sdp"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1454
    sget-boolean v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->interlockProvisionalResponses:Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1

    const-string/jumbo v10, "cannot send response -- unacked provisional"

    if-eqz v0, :cond_6

    .line 1458
    :try_start_2
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->provisionalResponseSem:Ljava/util/concurrent/Semaphore;

    sget-object v11, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v12, 0x1

    invoke-virtual {v0, v12, v13, v11}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    .line 1459
    .local v0, "acquired":Z
    if-eqz v0, :cond_5

    .line 1465
    .end local v0    # "acquired":Z
    goto :goto_2

    .line 1460
    .restart local v0    # "acquired":Z
    :cond_5
    new-instance v11, Landroid/javax/sip/SipException;

    invoke-direct {v11, v10}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v3    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .end local v5    # "responseMethod":Ljava/lang/String;
    .end local v6    # "statusCode":I
    .end local v9    # "contentTypeHeader":Landroid/javax/sip/header/ContentTypeHeader;
    .end local p1    # "response":Landroid/javax/sip/message/Response;
    throw v11
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_1

    .line 1462
    .end local v0    # "acquired":Z
    .restart local v3    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .restart local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .restart local v5    # "responseMethod":Ljava/lang/String;
    .restart local v6    # "statusCode":I
    .restart local v9    # "contentTypeHeader":Landroid/javax/sip/header/ContentTypeHeader;
    .restart local p1    # "response":Landroid/javax/sip/message/Response;
    :catch_0
    move-exception v0

    .line 1463
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_3
    sget-object v10, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v11, "Interrupted acuqiring PRACK sem"

    invoke-interface {v10, v11}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1464
    new-instance v10, Landroid/javax/sip/SipException;

    const-string v11, "Cannot aquire PRACK sem"

    invoke-direct {v10, v11}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v3    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .end local v5    # "responseMethod":Ljava/lang/String;
    .end local v6    # "statusCode":I
    .end local p1    # "response":Landroid/javax/sip/message/Response;
    throw v10

    .line 1455
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    .restart local v3    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .restart local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .restart local v5    # "responseMethod":Ljava/lang/String;
    .restart local v6    # "statusCode":I
    .restart local p1    # "response":Landroid/javax/sip/message/Response;
    :cond_6
    new-instance v0, Landroid/javax/sip/SipException;

    invoke-direct {v0, v10}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v3    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .end local v5    # "responseMethod":Ljava/lang/String;
    .end local v6    # "statusCode":I
    .end local p1    # "response":Landroid/javax/sip/message/Response;
    throw v0

    .line 1471
    .restart local v3    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .restart local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .restart local v5    # "responseMethod":Ljava/lang/String;
    .restart local v6    # "statusCode":I
    .restart local p1    # "response":Landroid/javax/sip/message/Response;
    :cond_7
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingReliableResponseAsBytes:[B

    if-eqz v0, :cond_8

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->isFinalResponse()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1472
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v10, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->provisionalResponseTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;

    invoke-interface {v0, v10}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 1473
    const/4 v0, 0x0

    iput-object v0, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->provisionalResponseTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$ProvisionalResponseTask;

    .line 1479
    :cond_8
    :goto_2
    const/16 v0, 0x20

    if-eqz v4, :cond_f

    .line 1480
    div-int/lit8 v10, v6, 0x64

    if-ne v10, v7, :cond_d

    invoke-static {v5}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogCreated(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_d

    .line 1482
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v10

    if-nez v10, :cond_9

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v10

    if-nez v10, :cond_9

    .line 1487
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v10

    invoke-static {}, Landroid/gov/nist/javax/sip/Utils;->getInstance()Landroid/gov/nist/javax/sip/Utils;

    move-result-object v11

    invoke-virtual {v11}, Landroid/gov/nist/javax/sip/Utils;->generateTag()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Landroid/javax/sip/header/ToHeader;->setTag(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 1488
    :cond_9
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_b

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v10

    if-nez v10, :cond_b

    .line 1489
    sget-object v10, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v10, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v10

    if-eqz v10, :cond_a

    .line 1490
    sget-object v10, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "assigning toTag : serverTransaction = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " dialog "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " tag = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1493
    :cond_a
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v10}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setToTag(Ljava/lang/String;)V

    goto :goto_3

    .line 1494
    :cond_b
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_d

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_d

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_c

    goto :goto_3

    .line 1496
    :cond_c
    new-instance v0, Landroid/javax/sip/SipException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Tag mismatch dialogTag is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " responseTag is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getToTag()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v0, v10}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v3    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .end local v5    # "responseMethod":Ljava/lang/String;
    .end local v6    # "statusCode":I
    .end local p1    # "response":Landroid/javax/sip/message/Response;
    throw v0

    .line 1502
    .restart local v3    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .restart local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .restart local v5    # "responseMethod":Ljava/lang/String;
    .restart local v6    # "statusCode":I
    .restart local p1    # "response":Landroid/javax/sip/message/Response;
    :cond_d
    :goto_3
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v10

    invoke-interface {v10}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v11

    invoke-interface {v11}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_e

    goto :goto_4

    .line 1503
    :cond_e
    new-instance v0, Landroid/javax/sip/SipException;

    const-string v10, "Dialog mismatch!"

    invoke-direct {v0, v10}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v3    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .end local v5    # "responseMethod":Ljava/lang/String;
    .end local v6    # "statusCode":I
    .end local p1    # "response":Landroid/javax/sip/message/Response;
    throw v0

    .line 1512
    .restart local v3    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .restart local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .restart local v5    # "responseMethod":Ljava/lang/String;
    .restart local v6    # "statusCode":I
    .restart local p1    # "response":Landroid/javax/sip/message/Response;
    :cond_f
    :goto_4
    iget-object v10, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequestFromTag:Ljava/lang/String;

    .line 1513
    .local v10, "fromTag":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v11

    if-eqz v11, :cond_10

    .line 1514
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v11

    check-cast v11, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v11}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFromTag()Ljava/lang/String;

    move-result-object v11

    move-object v10, v11

    .line 1516
    :cond_10
    if-eqz v10, :cond_12

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFromTag()Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :cond_12

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFromTag()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_11

    goto :goto_5

    .line 1518
    :cond_11
    new-instance v0, Landroid/javax/sip/SipException;

    const-string v11, "From tag of request does not match response from tag"

    invoke-direct {v0, v11}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v3    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .end local v5    # "responseMethod":Ljava/lang/String;
    .end local v6    # "statusCode":I
    .end local p1    # "response":Landroid/javax/sip/message/Response;
    throw v0

    .line 1519
    .restart local v3    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .restart local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .restart local v5    # "responseMethod":Ljava/lang/String;
    .restart local v6    # "statusCode":I
    .restart local p1    # "response":Landroid/javax/sip/message/Response;
    :cond_12
    :goto_5
    if-eqz v10, :cond_13

    .line 1520
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v0

    invoke-interface {v0, v10}, Landroid/javax/sip/header/FromHeader;->setTag(Ljava/lang/String;)V

    goto :goto_6

    .line 1522
    :cond_13
    sget-object v11, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v11, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 1523
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v11, "WARNING -- Null From tag in request!!"

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1527
    :cond_14
    :goto_6
    const/16 v0, 0x64

    if-eqz v4, :cond_15

    if-eq v6, v0, :cond_15

    .line 1528
    invoke-virtual {v4, v3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setResponseTags(Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    .line 1529
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v0

    .line 1530
    .local v0, "oldState":Landroid/javax/sip/DialogState;
    move-object v11, v2

    check-cast v11, Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v4, v1, v11}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setLastResponse(Landroid/gov/nist/javax/sip/stack/SIPTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    .line 1531
    if-nez v0, :cond_16

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v11

    sget-object v12, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    if-ne v11, v12, :cond_16

    .line 1532
    new-instance v11, Landroid/javax/sip/DialogTerminatedEvent;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v12

    invoke-direct {v11, v12, v4}, Landroid/javax/sip/DialogTerminatedEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/Dialog;)V

    .line 1537
    .local v11, "event":Landroid/javax/sip/DialogTerminatedEvent;
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v12

    invoke-virtual {v12, v11, v1}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    goto :goto_7

    .line 1541
    .end local v0    # "oldState":Landroid/javax/sip/DialogState;
    .end local v11    # "event":Landroid/javax/sip/DialogTerminatedEvent;
    :cond_15
    if-nez v4, :cond_16

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isInviteTransaction()Z

    move-result v11

    if-eqz v11, :cond_16

    iget-boolean v11, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertEnabled:Z

    if-eqz v11, :cond_16

    iget-object v11, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    if-nez v11, :cond_16

    invoke-interface/range {p1 .. p1}, Landroid/javax/sip/message/Response;->getStatusCode()I

    move-result v11

    div-int/2addr v11, v0

    if-ne v11, v7, :cond_16

    .line 1545
    move-object v0, v2

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    const/4 v11, 0x1

    invoke-virtual {v0, v11}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getDialogId(Z)Ljava/lang/String;

    move-result-object v0

    .line 1547
    .local v0, "dialogId":Ljava/lang/String;
    new-instance v11, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    invoke-direct {v11, v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;-><init>(Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;Ljava/lang/String;)V

    iput-object v11, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    .line 1548
    iget-object v11, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v11, v11, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->retransmissionAlertTransactions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v11, v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1549
    iget-object v11, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v11}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v12

    iget-object v13, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    const-wide/16 v14, 0x0

    const-wide/16 v16, 0x1f4

    invoke-interface/range {v12 .. v17}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->scheduleWithFixedDelay(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;JJ)Z

    goto :goto_8

    .line 1541
    .end local v0    # "dialogId":Ljava/lang/String;
    :cond_16
    :goto_7
    nop

    .line 1558
    :goto_8
    move-object v0, v2

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 1562
    if-eqz v4, :cond_17

    .line 1563
    move-object v0, v2

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v4, v1, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->startRetransmitTimer(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;Landroid/javax/sip/message/Response;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/text/ParseException; {:try_start_3 .. :try_end_3} :catch_1

    .line 1577
    .end local v9    # "contentTypeHeader":Landroid/javax/sip/header/ContentTypeHeader;
    .end local v10    # "fromTag":Ljava/lang/String;
    :cond_17
    nop

    .line 1578
    return-void

    .line 1572
    :catch_1
    move-exception v0

    .line 1573
    .local v0, "ex1":Ljava/text/ParseException;
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v7

    if-eqz v7, :cond_18

    .line 1574
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7, v0}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    .line 1575
    :cond_18
    invoke-virtual {v1, v8}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 1576
    new-instance v7, Landroid/javax/sip/SipException;

    invoke-virtual {v0}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v0}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 1566
    .end local v0    # "ex1":Ljava/text/ParseException;
    :catch_2
    move-exception v0

    .line 1567
    .local v0, "ex":Ljava/io/IOException;
    sget-object v9, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v9}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v9

    if-eqz v9, :cond_19

    .line 1568
    sget-object v9, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v9, v0}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    .line 1569
    :cond_19
    invoke-virtual {v1, v8}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 1570
    invoke-virtual {v1, v7}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->raiseErrorEvent(I)V

    .line 1571
    new-instance v7, Landroid/javax/sip/SipException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v0}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 1432
    .end local v0    # "ex":Ljava/io/IOException;
    :cond_1a
    new-instance v0, Landroid/javax/sip/SipException;

    const-string/jumbo v7, "Response does not belong to this transaction."

    invoke-direct {v0, v7}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1395
    .end local v6    # "statusCode":I
    :cond_1b
    new-instance v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;

    const-string v6, "CSeq method does not match Request method of request that created the tx."

    sget-object v7, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->UnmatchingCSeq:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    invoke-direct {v0, v6, v7}, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;-><init>(Ljava/lang/String;Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;)V

    throw v0

    .line 1388
    .end local v5    # "responseMethod":Ljava/lang/String;
    :catch_3
    move-exception v0

    move-object v5, v0

    move-object v0, v5

    .line 1389
    .local v0, "ex":Ljava/text/ParseException;
    new-instance v5, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;

    invoke-virtual {v0}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->MissingRequiredHeader:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    invoke-direct {v5, v6, v7}, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;-><init>(Ljava/lang/String;Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;)V

    throw v5

    .line 1384
    .end local v0    # "ex":Ljava/text/ParseException;
    :cond_1c
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v5, "null response"

    invoke-direct {v0, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setAckSeen()V
    .locals 1

    .line 1904
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isAckSeen:Z

    .line 1905
    return-void
.end method

.method public setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V
    .locals 3
    .param p1, "sipDialog"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .param p2, "dialogId"    # Ljava/lang/String;

    .line 1722
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1723
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setDialog "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " dialog = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1724
    :cond_0
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->dialog:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 1725
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->dialogId:Ljava/lang/String;

    .line 1726
    if-eqz p2, :cond_1

    .line 1727
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setAssigned()V

    .line 1728
    :cond_1
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertEnabled:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    if-eqz v0, :cond_3

    .line 1729
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 1730
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->dialogId:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 1731
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->retransmissionAlertTransactions:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->dialogId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1734
    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    .line 1737
    :cond_3
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertEnabled:Z

    .line 1739
    return-void
.end method

.method public setInviteTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    .locals 0
    .param p1, "st"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 1962
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->inviteTransaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 1964
    return-void
.end method

.method public setMapped(Z)V
    .locals 1
    .param p1, "b"    # Z

    .line 1920
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isMapped:Z

    .line 1921
    return-void
.end method

.method public setOriginalRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V
    .locals 0
    .param p1, "originalRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 1366
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->setOriginalRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 1368
    return-void
.end method

.method public setPendingSubscribe(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V
    .locals 0
    .param p1, "pendingSubscribeClientTx"    # Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 1928
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->pendingSubscribeTransaction:Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 1930
    return-void
.end method

.method public setRequestInterface(Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;)V
    .locals 0
    .param p1, "newRequestOf"    # Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

    .line 574
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->requestOf:Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

    .line 576
    return-void
.end method

.method public setState(I)V
    .locals 1
    .param p1, "newState"    # I

    .line 1606
    const/4 v0, 0x5

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isReliable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    iget-boolean v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->cacheServerConnections:Z

    if-nez v0, :cond_0

    .line 1610
    const/16 v0, 0x40

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->collectionTime:I

    .line 1611
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->terminationSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 1614
    :cond_0
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->setState(I)V

    .line 1616
    return-void
.end method

.method public startTransactionTimer()V
    .locals 7

    .line 1623
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string v1, "INVITE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CANCEL"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ACK"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1624
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->transactionTimerStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1625
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1628
    new-instance v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$TransactionTimer;

    invoke-direct {v2, p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$TransactionTimer;-><init>(Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;)V

    .line 1630
    .local v2, "myTimer":Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    if-eqz v0, :cond_1

    .end local v2    # "myTimer":Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1631
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->baseTimerInterval:I

    int-to-long v3, v0

    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->baseTimerInterval:I

    int-to-long v5, v0

    invoke-interface/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->scheduleWithFixedDelay(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;JJ)Z

    .line 1633
    :cond_1
    nop

    .line 1637
    :cond_2
    return-void
.end method

.method protected startTransactionTimerJ(J)V
    .locals 6
    .param p1, "time"    # J

    .line 1643
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->transactionTimerStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1644
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1645
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1646
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "starting TransactionTimerJ() : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getTransactionId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " time "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1650
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$1;

    invoke-direct {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$1;-><init>(Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;)V

    .line 1673
    .local v0, "task":Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-lez v1, :cond_1

    .line 1674
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    const-wide/16 v2, 0x1

    mul-long/2addr v2, p1

    iget v4, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->baseTimerInterval:I

    int-to-long v4, v4

    mul-long/2addr v2, v4

    invoke-interface {v1, v0, v2, v3}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    goto :goto_0

    .line 1676
    :cond_1
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->runTask()V

    .line 1680
    .end local v0    # "task":Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    :cond_2
    :goto_0
    return-void
.end method

.method public terminate()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/ObjectInUseException;
        }
    .end annotation

    .line 1751
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->setState(I)V

    .line 1752
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    if-eqz v0, :cond_1

    .line 1753
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 1754
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->dialogId:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1755
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->retransmissionAlertTransactions:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;->dialogId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1758
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->retransmissionAlertTimerTask:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$RetransmissionAlertTimerTask;

    .line 1761
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->transactionTimerStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1763
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->testAndSetTransactionTerminatedEvent()Z

    .line 1764
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1766
    :cond_2
    return-void
.end method

.method public waitForTermination()V
    .locals 1

    .line 2162
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->terminationSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2165
    goto :goto_0

    .line 2163
    :catch_0
    move-exception v0

    .line 2166
    :goto_0
    return-void
.end method
