.class public abstract Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
.super Ljava/lang/Object;
.source "SIPTransactionStack.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;
.implements Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$RemoveForkedTransactionTimerTask;,
        Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;
    }
.end annotation


# static fields
.field public static final BASE_TIMER_INTERVAL:I = 0x1f4

.field private static connectionLingerTimer:I

.field protected static final dialogCreatingMethods:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static logger:Landroid/gov/nist/core/StackLogger;

.field protected static selfRoutingThreadpoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;


# instance fields
.field private activeClientTransactionCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field protected addressResolver:Landroid/gov/nist/core/net/AddressResolver;

.field protected cacheClientConnections:Z

.field protected cacheServerConnections:Z

.field protected cancelClientTransactionChecked:Z

.field protected checkBranchId:Z

.field protected clientAuth:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

.field protected clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;",
            ">;"
        }
    .end annotation
.end field

.field protected clientTransactionTableHiwaterMark:I

.field protected clientTransactionTableLowaterMark:I

.field protected connTimeout:I

.field protected defaultRouter:Landroid/gov/nist/javax/sip/stack/DefaultRouter;

.field protected deliverRetransmittedAckToListener:Z

.field private deliverTerminatedEventForAck:Z

.field private deliverUnsolicitedNotify:Z

.field protected dialogTable:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/javax/sip/stack/SIPDialog;",
            ">;"
        }
    .end annotation
.end field

.field protected dialogTimeoutFactor:I

.field protected earlyDialogTable:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/javax/sip/stack/SIPDialog;",
            ">;"
        }
    .end annotation
.end field

.field protected earlyDialogTimeout:I

.field private forkedClientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;",
            ">;"
        }
    .end annotation
.end field

.field protected forkedEvents:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected generateTimeStampHeader:Z

.field protected ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

.field protected isAutomaticDialogErrorHandlingEnabled:Z

.field protected isAutomaticDialogSupportEnabled:Z

.field protected isBackToBackUserAgent:Z

.field protected isDialogTerminatedEventDeliveredForNullDialog:Z

.field protected logRecordFactory:Landroid/gov/nist/javax/sip/LogRecordFactory;

.field protected logStackTraceOnMessageSend:Z

.field protected maxConnections:I

.field protected maxContentLength:I

.field protected maxForkTime:I

.field protected maxListenerResponseTime:I

.field protected maxMessageSize:I

.field protected maxTxLifetimeInvite:I

.field protected maxTxLifetimeNonInvite:I

.field private mergeTable:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;",
            ">;"
        }
    .end annotation
.end field

.field public messageParserFactory:Landroid/gov/nist/javax/sip/parser/MessageParserFactory;

.field public messageProcessorFactory:Landroid/gov/nist/javax/sip/stack/MessageProcessorFactory;

.field private messageProcessors:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Landroid/gov/nist/javax/sip/stack/MessageProcessor;",
            ">;"
        }
    .end annotation
.end field

.field protected minKeepAliveInterval:J

.field protected needsLogging:Z

.field protected networkLayer:Landroid/gov/nist/core/net/NetworkLayer;

.field public nioMode:Landroid/gov/nist/javax/sip/stack/NIOMode;

.field public nioSocketMaxIdleTime:J

.field private non2XXAckPassedToListener:Z

.field protected outboundProxy:Ljava/lang/String;

.field protected patchReceivedRport:Z

.field protected patchRport:Z

.field protected patchWebSocketHeaders:Z

.field private pendingTransactions:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;",
            ">;"
        }
    .end annotation
.end field

.field protected readTimeout:I

.field protected receiveUdpBufferSize:I

.field private reinviteExecutor:Ljava/util/concurrent/ExecutorService;

.field private releaseReferencesStrategy:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

.field protected reliableConnectionKeepAliveTimeout:I

.field protected remoteTagReassignmentAllowed:Z

.field protected retransmissionAlertTransactions:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;",
            ">;"
        }
    .end annotation
.end field

.field protected rfc2543Supported:Z

.field protected router:Landroid/javax/sip/address/Router;

.field protected routerPath:Ljava/lang/String;

.field protected securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

.field protected sendUdpBufferSize:I

.field protected serverDialogMergeTestTable:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/javax/sip/stack/SIPDialog;",
            ">;"
        }
    .end annotation
.end field

.field protected serverLogger:Landroid/gov/nist/core/ServerLogger;

.field protected serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;",
            ">;"
        }
    .end annotation
.end field

.field protected serverTransactionTableHighwaterMark:I

.field protected serverTransactionTableLowaterMark:I

.field public sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

.field protected sipMessageFactory:Landroid/gov/nist/javax/sip/stack/StackMessageFactory;

.field public sipMessageValves:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/gov/nist/javax/sip/stack/SIPMessageValve;",
            ">;"
        }
    .end annotation
.end field

.field private sslHandshakeTimeout:J

.field private sslRenegotiationEnabled:Z

.field protected stackAddress:Ljava/lang/String;

.field private stackCongestionControlTimeout:I

.field protected stackInetAddress:Ljava/net/InetAddress;

.field protected stackName:Ljava/lang/String;

.field private tcpPostParsingThreadPoolSize:I

.field private terminatedServerTransactionsPendingAck:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;",
            ">;"
        }
    .end annotation
.end field

.field protected threadAuditor:Landroid/gov/nist/core/ThreadAuditor;

.field protected threadPoolSize:I

.field private threadPriority:I

.field private timer:Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

.field protected toExit:Z

.field udpFlag:Z

.field protected unlimitedClientTransactionTableSize:Z

.field protected unlimitedServerTransactionTableSize:Z

.field protected useRouterForAll:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 80
    const-class v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    .line 91
    const/16 v0, 0x8

    sput v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->connectionLingerTimer:I

    .line 114
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogCreatingMethods:Ljava/util/Set;

    .line 520
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogCreatingMethods:Ljava/util/Set;

    const-string/jumbo v1, "REFER"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 521
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogCreatingMethods:Ljava/util/Set;

    const-string v1, "INVITE"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 522
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogCreatingMethods:Ljava/util/Set;

    const-string/jumbo v1, "SUBSCRIBE"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 523
    return-void
.end method

.method protected constructor <init>()V
    .locals 5

    .line 528
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    const/16 v0, 0xb4

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->earlyDialogTimeout:I

    .line 127
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->unlimitedServerTransactionTableSize:Z

    .line 130
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->unlimitedClientTransactionTableSize:Z

    .line 134
    const/16 v1, 0x1388

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTableHighwaterMark:I

    .line 138
    const/16 v1, 0xfa0

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTableLowaterMark:I

    .line 143
    const/16 v1, 0x3e8

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTableHiwaterMark:I

    .line 146
    const/16 v1, 0x320

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTableLowaterMark:I

    .line 148
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->activeClientTransactionCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 161
    iput-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->deliverRetransmittedAckToListener:Z

    .line 278
    const/16 v1, 0x2710

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->connTimeout:I

    .line 325
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->rfc2543Supported:Z

    .line 329
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->threadAuditor:Landroid/gov/nist/core/ThreadAuditor;

    .line 336
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->cancelClientTransactionChecked:Z

    .line 339
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->remoteTagReassignmentAllowed:Z

    .line 341
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logStackTraceOnMessageSend:Z

    .line 349
    iput v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->stackCongestionControlTimeout:I

    .line 351
    iput-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isBackToBackUserAgent:Z

    .line 355
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isAutomaticDialogErrorHandlingEnabled:Z

    .line 357
    iput-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogTerminatedEventDeliveredForNullDialog:Z

    .line 364
    iput v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxForkTime:I

    .line 368
    iput-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->deliverUnsolicitedNotify:Z

    .line 370
    iput-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->deliverTerminatedEventForAck:Z

    .line 372
    iput-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->patchWebSocketHeaders:Z

    .line 374
    iput-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->patchRport:Z

    .line 376
    iput-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->patchReceivedRport:Z

    .line 378
    sget-object v1, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Default:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientAuth:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    .line 381
    iput v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->tcpPostParsingThreadPoolSize:I

    .line 386
    const-wide/16 v3, -0x1

    iput-wide v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->minKeepAliveInterval:J

    .line 389
    const/16 v1, 0x40

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTimeoutFactor:I

    .line 398
    sget-object v1, Landroid/gov/nist/javax/sip/stack/NIOMode;->BLOCKING:Landroid/gov/nist/javax/sip/stack/NIOMode;

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->nioMode:Landroid/gov/nist/javax/sip/stack/NIOMode;

    .line 400
    sget-object v1, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->None:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    iput-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->releaseReferencesStrategy:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    .line 408
    const/16 v1, 0xa

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->threadPriority:I

    .line 423
    const/4 v1, -0x1

    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->reliableConnectionKeepAliveTimeout:I

    .line 425
    iput-wide v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sslHandshakeTimeout:J

    .line 427
    iput-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sslRenegotiationEnabled:Z

    .line 445
    new-instance v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$1;

    invoke-direct {v3, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$1;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    invoke-static {v3}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v3

    iput-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->reinviteExecutor:Ljava/util/concurrent/ExecutorService;

    .line 529
    iput-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->toExit:Z

    .line 530
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->forkedEvents:Ljava/util/HashSet;

    .line 533
    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->threadPoolSize:I

    .line 536
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->cacheServerConnections:Z

    .line 539
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->cacheClientConnections:Z

    .line 541
    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxConnections:I

    .line 544
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->messageProcessors:Ljava/util/Collection;

    .line 546
    new-instance v0, Landroid/gov/nist/javax/sip/stack/IOHandler;

    invoke-direct {v0, p0}, Landroid/gov/nist/javax/sip/stack/IOHandler;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    .line 549
    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->readTimeout:I

    .line 551
    iput v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxListenerResponseTime:I

    .line 555
    new-instance v0, Landroid/gov/nist/javax/sip/DefaultAddressResolver;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/DefaultAddressResolver;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addressResolver:Landroid/gov/nist/core/net/AddressResolver;

    .line 558
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipMessageValves:Ljava/util/List;

    .line 565
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 566
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->earlyDialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 567
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverDialogMergeTestTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 569
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 570
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 571
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->terminatedServerTransactionsPendingAck:Ljava/util/concurrent/ConcurrentHashMap;

    .line 572
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->mergeTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 573
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->retransmissionAlertTransactions:Ljava/util/concurrent/ConcurrentHashMap;

    .line 578
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->pendingTransactions:Ljava/util/concurrent/ConcurrentHashMap;

    .line 581
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->forkedClientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 582
    return-void
.end method

.method protected constructor <init>(Landroid/gov/nist/javax/sip/stack/StackMessageFactory;)V
    .locals 0
    .param p1, "messageFactory"    # Landroid/gov/nist/javax/sip/stack/StackMessageFactory;

    .line 1366
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;-><init>()V

    .line 1367
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipMessageFactory:Landroid/gov/nist/javax/sip/stack/StackMessageFactory;

    .line 1368
    return-void
.end method

.method static synthetic access$000()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 78
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method

.method static synthetic access$100(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 78
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->forkedClientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method private addTransactionHash(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V
    .locals 6
    .param p1, "sipTransaction"    # Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 2000
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v0

    .line 2001
    .local v0, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    const/4 v1, 0x0

    .line 2002
    .local v1, "existingTx":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    instance-of v2, p1, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    const/16 v3, 0x20

    if-eqz v2, :cond_4

    .line 2003
    iget-boolean v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->unlimitedClientTransactionTableSize:Z

    if-nez v2, :cond_1

    .line 2004
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->activeClientTransactionCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    iget v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTableHiwaterMark:I

    if-le v2, v4, :cond_2

    .line 2006
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    monitor-enter v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2007
    :try_start_1
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/lang/Object;->wait()V

    .line 2008
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->activeClientTransactionCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 2009
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v4

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v1    # "existingTx":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    .end local p1    # "sipTransaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    :try_start_2
    throw v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 2011
    .restart local v0    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v1    # "existingTx":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    .restart local p1    # "sipTransaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    :catch_0
    move-exception v2

    .line 2012
    .local v2, "ex":Ljava/lang/Exception;
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2013
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v5, "Exception occured while waiting for room"

    invoke-interface {v4, v5, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 2018
    .end local v2    # "ex":Ljava/lang/Exception;
    :cond_0
    :goto_0
    goto :goto_1

    .line 2021
    :cond_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->activeClientTransactionCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 2023
    :cond_2
    :goto_1
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTransactionId()Ljava/lang/String;

    move-result-object v2

    .line 2024
    .local v2, "key":Ljava/lang/String;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    move-object v5, p1

    check-cast v5, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-virtual {v4, v2, v5}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v1, v4

    check-cast v1, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 2027
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 2028
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " putTransactionHash :  key = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2031
    .end local v2    # "key":Ljava/lang/String;
    :cond_3
    goto :goto_2

    .line 2032
    :cond_4
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTransactionId()Ljava/lang/String;

    move-result-object v2

    .line 2034
    .restart local v2    # "key":Ljava/lang/String;
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 2035
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " putTransactionHash :  key = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2038
    :cond_5
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    move-object v4, p1

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-virtual {v3, v2, v4}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v1, v3

    check-cast v1, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 2043
    .end local v2    # "key":Ljava/lang/String;
    :goto_2
    if-nez v1, :cond_6

    .line 2044
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->scheduleMaxTxLifeTimeTimer()V

    .line 2047
    :cond_6
    return-void
.end method

.method private auditDialogs(Ljava/util/Set;J)Ljava/lang/String;
    .locals 16
    .param p1, "activeCallIDs"    # Ljava/util/Set;
    .param p2, "leakedDialogTimer"    # J

    .line 2700
    move-object/from16 v1, p0

    const-string v2, "  Leaked dialogs:\n"

    .line 2701
    .local v2, "auditReport":Ljava/lang/String;
    const/4 v3, 0x0

    .line 2702
    .local v3, "leakedDialogs":I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 2708
    .local v4, "currentTime":J
    iget-object v6, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    monitor-enter v6

    .line 2709
    :try_start_0
    new-instance v0, Ljava/util/LinkedList;

    iget-object v7, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v7}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v7

    invoke-direct {v0, v7}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 2710
    .local v0, "dialogs":Ljava/util/LinkedList;
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2717
    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 2718
    .local v6, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 2720
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 2723
    .local v7, "itDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    const/4 v8, 0x0

    if-eqz v7, :cond_0

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v9

    goto :goto_1

    :cond_0
    move-object v9, v8

    .line 2725
    .local v9, "callIdHeader":Landroid/javax/sip/header/CallIdHeader;
    :goto_1
    if-eqz v9, :cond_1

    invoke-interface {v9}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v8

    .line 2729
    .local v8, "callID":Ljava/lang/String;
    :cond_1
    if-eqz v7, :cond_4

    if-eqz v8, :cond_4

    move-object/from16 v10, p1

    invoke-interface {v10, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_5

    .line 2732
    iget-wide v11, v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->auditTag:J

    const-wide/16 v13, 0x0

    cmp-long v11, v11, v13

    if-nez v11, :cond_2

    .line 2734
    iput-wide v4, v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->auditTag:J

    goto/16 :goto_3

    .line 2738
    :cond_2
    iget-wide v11, v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->auditTag:J

    sub-long v11, v4, v11

    cmp-long v11, v11, p2

    if-ltz v11, :cond_5

    .line 2740
    add-int/lit8 v3, v3, 0x1

    .line 2743
    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v11

    .line 2744
    .local v11, "dialogState":Landroid/javax/sip/DialogState;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "dialog id: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", dialog state: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    if-eqz v11, :cond_3

    invoke-virtual {v11}, Landroid/javax/sip/DialogState;->toString()Ljava/lang/String;

    move-result-object v13

    goto :goto_2

    :cond_3
    const-string/jumbo v13, "null"

    :goto_2
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 2749
    .local v12, "dialogReport":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "    "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "\n"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2752
    const/4 v13, 0x3

    invoke-virtual {v7, v13}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setState(I)V

    .line 2753
    sget-object v13, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v14, 0x20

    invoke-interface {v13, v14}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 2754
    sget-object v13, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "auditDialogs: leaked "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_3

    .line 2729
    .end local v11    # "dialogState":Landroid/javax/sip/DialogState;
    .end local v12    # "dialogReport":Ljava/lang/String;
    :cond_4
    move-object/from16 v10, p1

    .line 2759
    .end local v7    # "itDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .end local v8    # "callID":Ljava/lang/String;
    .end local v9    # "callIdHeader":Landroid/javax/sip/header/CallIdHeader;
    :cond_5
    :goto_3
    goto/16 :goto_0

    .line 2762
    :cond_6
    move-object/from16 v10, p1

    if-lez v3, :cond_7

    .line 2763
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "    Total: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " leaked dialogs detected and removed.\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_4

    .line 2766
    :cond_7
    const/4 v2, 0x0

    .line 2768
    :goto_4
    return-object v2

    .line 2710
    .end local v0    # "dialogs":Ljava/util/LinkedList;
    .end local v6    # "it":Ljava/util/Iterator;
    :catchall_0
    move-exception v0

    move-object/from16 v10, p1

    :goto_5
    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v0

    :catchall_1
    move-exception v0

    goto :goto_5
.end method

.method private auditTransactions(Ljava/util/concurrent/ConcurrentHashMap;J)Ljava/lang/String;
    .locals 15
    .param p1, "transactionsMap"    # Ljava/util/concurrent/ConcurrentHashMap;
    .param p2, "a_nLeakedTransactionTimer"    # J

    .line 2778
    const-string v0, "  Leaked transactions:\n"

    .line 2779
    .local v0, "auditReport":Ljava/lang/String;
    const/4 v1, 0x0

    .line 2780
    .local v1, "leakedTransactions":I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 2785
    .local v2, "currentTime":J
    new-instance v4, Ljava/util/LinkedList;

    invoke-virtual/range {p1 .. p1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 2788
    .local v4, "transactionsList":Ljava/util/LinkedList;
    invoke-virtual {v4}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 2789
    .local v5, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 2790
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 2791
    .local v6, "sipTransaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    if-eqz v6, :cond_5

    .line 2792
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getAuditTag()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-nez v7, :cond_0

    .line 2794
    invoke-interface {v6, v2, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->setAuditTag(J)V

    move-object v11, p0

    goto/16 :goto_3

    .line 2798
    :cond_0
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getAuditTag()J

    move-result-wide v7

    sub-long v7, v2, v7

    cmp-long v7, v7, p2

    if-ltz v7, :cond_4

    .line 2800
    add-int/lit8 v1, v1, 0x1

    .line 2803
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v7

    .line 2805
    .local v7, "transactionState":Landroid/javax/sip/TransactionState;
    invoke-interface {v6}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v8

    .line 2807
    .local v8, "origRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    if-eqz v8, :cond_1

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v9

    goto :goto_1

    :cond_1
    const/4 v9, 0x0

    .line 2810
    .local v9, "origRequestMethod":Ljava/lang/String;
    :goto_1
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", state: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "null"

    if-eqz v7, :cond_2

    invoke-virtual {v7}, Landroid/javax/sip/TransactionState;->toString()Ljava/lang/String;

    move-result-object v12

    goto :goto_2

    :cond_2
    move-object v12, v11

    :goto_2
    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v12, ", OR: "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    if-eqz v9, :cond_3

    move-object v11, v9

    :cond_3
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 2818
    .local v10, "transactionReport":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "    "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2821
    move-object v11, p0

    invoke-virtual {p0, v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 2822
    sget-object v12, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v13, 0x20

    invoke-interface {v12, v13}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v12

    if-eqz v12, :cond_6

    .line 2823
    sget-object v12, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "auditTransactions: leaked "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v12, v13}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_3

    .line 2798
    .end local v7    # "transactionState":Landroid/javax/sip/TransactionState;
    .end local v8    # "origRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v9    # "origRequestMethod":Ljava/lang/String;
    .end local v10    # "transactionReport":Ljava/lang/String;
    :cond_4
    move-object v11, p0

    goto :goto_3

    .line 2791
    :cond_5
    move-object v11, p0

    .line 2828
    .end local v6    # "sipTransaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    :cond_6
    :goto_3
    goto/16 :goto_0

    .line 2831
    :cond_7
    move-object v11, p0

    if-lez v1, :cond_8

    .line 2832
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "    Total: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " leaked transactions detected and removed.\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 2835
    :cond_8
    const/4 v0, 0x0

    .line 2837
    :goto_4
    return-object v0
.end method

.method private findMessageProcessor(Ljava/lang/String;ILjava/lang/String;)Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .locals 5
    .param p1, "myAddress"    # Ljava/lang/String;
    .param p2, "myPort"    # I
    .param p3, "transport"    # Ljava/lang/String;

    .line 3315
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageProcessors()[Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    .local v0, "arr$":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    array-length v1, v0

    .local v1, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 3316
    .local v3, "processor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getSavedIpAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getPort()I

    move-result v4

    if-ne v4, p2, :cond_0

    .line 3319
    return-object v3

    .line 3315
    .end local v3    # "processor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 3322
    .end local v0    # "arr$":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .end local v1    # "len$":I
    .end local v2    # "i$":I
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static isDialogCreated(Ljava/lang/String;)Z
    .locals 1
    .param p0, "method"    # Ljava/lang/String;

    .line 740
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogCreatingMethods:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public addExtensionMethod(Ljava/lang/String;)V
    .locals 2
    .param p1, "extensionMethod"    # Ljava/lang/String;

    .line 750
    const-string v0, "NOTIFY"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 751
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 752
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v1, "NOTIFY Supported Natively"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_0

    .line 754
    :cond_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogCreatingMethods:Ljava/util/Set;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/gov/nist/javax/sip/Utils;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 756
    :cond_1
    :goto_0
    return-void
.end method

.method public addForkedClientTransaction(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V
    .locals 4
    .param p1, "clientTransaction"    # Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 3076
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getForkId()Ljava/lang/String;

    move-result-object v0

    .line 3077
    .local v0, "forkId":Ljava/lang/String;
    invoke-interface {p1, v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setForkId(Ljava/lang/String;)V

    .line 3078
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3079
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 3080
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Adding forked client transaction : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " branch="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getBranch()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " forkId = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  sipDialog = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " sipDialogId= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3086
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->forkedClientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3087
    return-void
.end method

.method protected addMessageProcessor(Landroid/gov/nist/javax/sip/stack/MessageProcessor;)V
    .locals 1
    .param p1, "newMessageProcessor"    # Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2466
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->messageProcessors:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 2469
    return-void
.end method

.method public addTransaction(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V
    .locals 3
    .param p1, "clientTransaction"    # Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 1872
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1873
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "added transaction "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1874
    :cond_0
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addTransactionHash(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1876
    return-void
.end method

.method public addTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    .locals 3
    .param p1, "serverTransaction"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1987
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1988
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "added transaction "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1989
    :cond_0
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->map()V

    .line 1991
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addTransactionHash(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1993
    return-void
.end method

.method public addTransactionPendingAck(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    .locals 2
    .param p1, "serverTransaction"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 1163
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v0

    .line 1165
    .local v0, "branchId":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 1166
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->terminatedServerTransactionsPendingAck:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1170
    :cond_0
    return-void
.end method

.method public auditStack(Ljava/util/Set;JJ)Ljava/lang/String;
    .locals 7
    .param p1, "activeCallIDs"    # Ljava/util/Set;
    .param p2, "leakedDialogTimer"    # J
    .param p4, "leakedTransactionTimer"    # J

    .line 2673
    const/4 v0, 0x0

    .line 2674
    .local v0, "auditReport":Ljava/lang/String;
    invoke-direct {p0, p1, p2, p3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->auditDialogs(Ljava/util/Set;J)Ljava/lang/String;

    move-result-object v1

    .line 2675
    .local v1, "leakedDialogs":Ljava/lang/String;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p0, v2, p4, p5}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->auditTransactions(Ljava/util/concurrent/ConcurrentHashMap;J)Ljava/lang/String;

    move-result-object v2

    .line 2677
    .local v2, "leakedServerTransactions":Ljava/lang/String;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p0, v3, p4, p5}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->auditTransactions(Ljava/util/concurrent/ConcurrentHashMap;J)Ljava/lang/String;

    move-result-object v3

    .line 2679
    .local v3, "leakedClientTransactions":Ljava/lang/String;
    if-nez v1, :cond_0

    if-nez v2, :cond_0

    if-eqz v3, :cond_4

    .line 2681
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "SIP Stack Audit:\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ""

    if-eqz v1, :cond_1

    move-object v6, v1

    goto :goto_0

    :cond_1
    move-object v6, v5

    :goto_0
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz v2, :cond_2

    move-object v6, v2

    goto :goto_1

    :cond_2
    move-object v6, v5

    :goto_1
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz v3, :cond_3

    move-object v5, v3

    :cond_3
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2688
    :cond_4
    return-object v0
.end method

.method public checkBranchId()Z
    .locals 1

    .line 3052
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->checkBranchId:Z

    return v0
.end method

.method public closeAllSockets()V
    .locals 4

    .line 2186
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/IOHandler;->closeAll()V

    .line 2187
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->messageProcessors:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 2188
    .local v1, "p":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    instance-of v2, v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    if-eqz v2, :cond_0

    .line 2189
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    .line 2190
    .local v2, "niop":Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    iget-object v3, v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->closeAll()V

    .line 2192
    .end local v1    # "p":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .end local v2    # "niop":Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    :cond_0
    goto :goto_0

    .line 2193
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public closeReliableConnection(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)Z
    .locals 4
    .param p1, "myAddress"    # Ljava/lang/String;
    .param p2, "myPort"    # I
    .param p3, "transport"    # Ljava/lang/String;
    .param p4, "peerAddress"    # Ljava/lang/String;
    .param p5, "peerPort"    # I

    .line 3366
    invoke-direct {p0, p1, p2, p3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->findMessageProcessor(Ljava/lang/String;ILjava/lang/String;)Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    .line 3368
    .local v0, "processor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    if-eqz v1, :cond_1

    .line 3369
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3370
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "~~~ closeReliableConnection( myAddress="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", myPort="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", transport="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", peerAddress="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", peerPort="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "), MessageProcessor="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3374
    :cond_0
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    invoke-virtual {v1, p4, p5}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->closeReliableConnection(Ljava/lang/String;I)Z

    move-result v1

    return v1

    .line 3376
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method public createClientTransaction(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .locals 1
    .param p1, "sipRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .param p2, "encapsulatedMessageChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 1810
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;

    invoke-direct {v0, p0, p2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V

    .line 1812
    .local v0, "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    invoke-interface {v0, p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setOriginalRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 1813
    return-object v0
.end method

.method public createDialog(Landroid/gov/nist/javax/sip/SipProviderImpl;Landroid/gov/nist/javax/sip/message/SIPResponse;)Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .locals 1
    .param p1, "sipProvider"    # Landroid/gov/nist/javax/sip/SipProviderImpl;
    .param p2, "sipResponse"    # Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 892
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-direct {v0, p1, p2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;-><init>(Landroid/gov/nist/javax/sip/SipProviderImpl;Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    return-object v0
.end method

.method public createDialog(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .locals 7
    .param p1, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .param p2, "sipResponse"    # Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 851
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v0

    .line 852
    .local v0, "originalDialogId":Ljava/lang/String;
    invoke-virtual {p2, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getDialogId(Z)Ljava/lang/String;

    move-result-object v1

    .line 853
    .local v1, "earlyDialogId":Ljava/lang/String;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 854
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "createDialog originalDialogId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 855
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "createDialog earlyDialogId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 856
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "createDialog default Dialog="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 857
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 858
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "createDialog default Dialog Id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v5

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 861
    :cond_0
    const/4 v2, 0x0

    .line 862
    .local v2, "retval":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->earlyDialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 863
    .local v4, "earlyDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    if-eqz v4, :cond_3

    if-eqz p1, :cond_3

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v5

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 864
    :cond_1
    move-object v2, v4

    .line 865
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 866
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "createDialog early Dialog found : earlyDialogId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " earlyDialog= "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 869
    :cond_2
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->isFinalResponse()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 870
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->earlyDialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 874
    :cond_3
    new-instance v5, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-direct {v5, p1, p2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;-><init>(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;Landroid/gov/nist/javax/sip/message/SIPResponse;)V

    move-object v2, v5

    .line 875
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 876
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "createDialog early Dialog not found : earlyDialogId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " created one "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 880
    :cond_4
    :goto_0
    return-object v2
.end method

.method public createDialog(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .locals 1
    .param p1, "subscribeTx"    # Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .param p2, "notifyST"    # Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 912
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-direct {v0, p1, p2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;-><init>(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    return-object v0
.end method

.method public createDialog(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .locals 6
    .param p1, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 804
    const/4 v0, 0x0

    .line 806
    .local v0, "retval":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    instance-of v1, p1, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    if-eqz v1, :cond_6

    .line 807
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v1

    .line 809
    .local v1, "dialogId":Ljava/lang/String;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 810
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "createDialog dialogId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 812
    :cond_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->earlyDialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 813
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->earlyDialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 814
    .local v2, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v4

    sget-object v5, Landroid/javax/sip/DialogState;->EARLY:Landroid/javax/sip/DialogState;

    if-ne v4, v5, :cond_1

    goto :goto_0

    .line 822
    :cond_1
    new-instance v3, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-direct {v3, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    move-object v0, v3

    .line 823
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->earlyDialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 816
    :cond_2
    :goto_0
    move-object v0, v2

    .line 817
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 818
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "createDialog early Dialog found : earlyDialogId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " earlyDialog= "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 825
    .end local v2    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :cond_3
    :goto_1
    goto :goto_2

    .line 826
    :cond_4
    new-instance v2, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-direct {v2, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    move-object v0, v2

    .line 827
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->earlyDialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 828
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 829
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "createDialog early Dialog not found : earlyDialogId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " created one "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 833
    .end local v1    # "dialogId":Ljava/lang/String;
    :cond_5
    :goto_2
    goto :goto_3

    .line 834
    :cond_6
    new-instance v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-direct {v1, p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    move-object v0, v1

    .line 837
    :goto_3
    return-object v0
.end method

.method public createMessageChannel(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageProcessor;Landroid/javax/sip/address/Hop;)Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .locals 3
    .param p1, "request"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .param p2, "mp"    # Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .param p3, "nextHop"    # Landroid/javax/sip/address/Hop;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1791
    new-instance v0, Landroid/gov/nist/core/Host;

    invoke-direct {v0}, Landroid/gov/nist/core/Host;-><init>()V

    .line 1792
    .local v0, "targetHost":Landroid/gov/nist/core/Host;
    invoke-interface {p3}, Landroid/javax/sip/address/Hop;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/Host;->setHostname(Ljava/lang/String;)V

    .line 1793
    new-instance v1, Landroid/gov/nist/core/HostPort;

    invoke-direct {v1}, Landroid/gov/nist/core/HostPort;-><init>()V

    .line 1794
    .local v1, "targetHostPort":Landroid/gov/nist/core/HostPort;
    invoke-virtual {v1, v0}, Landroid/gov/nist/core/HostPort;->setHost(Landroid/gov/nist/core/Host;)V

    .line 1795
    invoke-interface {p3}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/HostPort;->setPort(I)V

    .line 1796
    invoke-virtual {p2, v1}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->createMessageChannel(Landroid/gov/nist/core/HostPort;)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v2

    .line 1797
    .local v2, "returnChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    return-object v2
.end method

.method protected createMessageProcessor(Ljava/net/InetAddress;ILjava/lang/String;)Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .locals 1
    .param p1, "ipAddress"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "transport"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2509
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->messageProcessorFactory:Landroid/gov/nist/javax/sip/stack/MessageProcessorFactory;

    invoke-interface {v0, p0, p1, p2, p3}, Landroid/gov/nist/javax/sip/stack/MessageProcessorFactory;->createMessageProcessor(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Ljava/net/InetAddress;ILjava/lang/String;)Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    .line 2510
    .local v0, "newMessageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addMessageProcessor(Landroid/gov/nist/javax/sip/stack/MessageProcessor;)V

    .line 2511
    return-object v0
.end method

.method public createRawMessageChannel(Ljava/lang/String;ILandroid/javax/sip/address/Hop;)Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .locals 10
    .param p1, "sourceIpAddress"    # Ljava/lang/String;
    .param p2, "sourcePort"    # I
    .param p3, "nextHop"    # Landroid/javax/sip/address/Hop;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .line 2551
    const-string v0, " "

    new-instance v1, Landroid/gov/nist/core/Host;

    invoke-direct {v1}, Landroid/gov/nist/core/Host;-><init>()V

    .line 2552
    .local v1, "targetHost":Landroid/gov/nist/core/Host;
    invoke-interface {p3}, Landroid/javax/sip/address/Hop;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/Host;->setHostname(Ljava/lang/String;)V

    .line 2553
    new-instance v2, Landroid/gov/nist/core/HostPort;

    invoke-direct {v2}, Landroid/gov/nist/core/HostPort;-><init>()V

    .line 2554
    .local v2, "targetHostPort":Landroid/gov/nist/core/HostPort;
    invoke-virtual {v2, v1}, Landroid/gov/nist/core/HostPort;->setHost(Landroid/gov/nist/core/Host;)V

    .line 2555
    invoke-interface {p3}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/HostPort;->setPort(I)V

    .line 2558
    const/4 v3, 0x0

    .line 2559
    .local v3, "newChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->messageProcessors:Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 2560
    .local v4, "processorIterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/16 v6, 0x20

    if-eqz v5, :cond_3

    if-nez v3, :cond_3

    .line 2561
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 2564
    .local v5, "nextProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    invoke-interface {p3}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v7

    invoke-virtual {v7}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getPort()I

    move-result v7

    if-ne p2, v7, :cond_0

    .line 2572
    :try_start_0
    invoke-virtual {v5, v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->createMessageChannel(Landroid/gov/nist/core/HostPort;)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v6
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, v6

    .line 2583
    :cond_1
    :goto_1
    goto :goto_0

    .line 2578
    :catch_0
    move-exception v7

    .line 2579
    .local v7, "e":Ljava/io/IOException;
    sget-object v8, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v8, v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2580
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "host is reachable "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v7}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_1

    .line 2574
    .end local v7    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v7

    .line 2575
    .local v7, "ex":Ljava/net/UnknownHostException;
    sget-object v8, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v8, v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 2576
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "host is not known "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v7}, Ljava/net/UnknownHostException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v6, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2577
    :cond_2
    throw v7

    .line 2587
    .end local v5    # "nextProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .end local v7    # "ex":Ljava/net/UnknownHostException;
    :cond_3
    if-nez v3, :cond_5

    .line 2588
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 2589
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "newChanne is null, messageProcessors.size = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->messageProcessors:Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2590
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->messageProcessors:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 2591
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    if-nez v3, :cond_4

    .line 2592
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 2593
    .local v0, "nextProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "nextProcessor:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "| transport = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ipAddress="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " port="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getPort()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_2

    .line 2598
    .end local v0    # "nextProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    :cond_4
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v5, "More info on newChannel=null"

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2599
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "nextHop="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " sourceIp="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " sourcePort="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " targetHostPort="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2604
    :cond_5
    return-object v3
.end method

.method public createServerTransaction(Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .locals 7
    .param p1, "encapsulatedMessageChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 1828
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->unlimitedServerTransactionTableSize:Z

    if-eqz v0, :cond_0

    .line 1829
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-direct {v0, p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V

    return-object v0

    .line 1831
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v0

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTableLowaterMark:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTableHighwaterMark:I

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTableLowaterMark:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    div-float/2addr v0, v1

    .line 1833
    .local v0, "threshold":F
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v1

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    float-to-double v5, v0

    sub-double/2addr v3, v5

    cmpl-double v1, v1, v3

    if-lez v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 1834
    .local v1, "decision":Z
    :goto_0
    if-eqz v1, :cond_2

    .line 1835
    const/4 v2, 0x0

    return-object v2

    .line 1837
    :cond_2
    new-instance v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-direct {v2, p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/stack/MessageChannel;)V

    return-object v2
.end method

.method protected decrementActiveClientTransactionCount()V
    .locals 2

    .line 2056
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->activeClientTransactionCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTableLowaterMark:I

    if-gt v0, v1, :cond_0

    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->unlimitedClientTransactionTableSize:Z

    if-nez v0, :cond_0

    .line 2058
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    monitor-enter v0

    .line 2060
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 2062
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 2064
    :cond_0
    :goto_0
    return-void
.end method

.method public declared-synchronized dialogErrorEvent(Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;)V
    .locals 3
    .param p1, "dialogErrorEvent"    # Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;

    monitor-enter p0

    .line 2128
    :try_start_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->getSource()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 2129
    .local v0, "sipDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    move-object v1, p0

    check-cast v1, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/SipStackImpl;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v1

    .line 2132
    .local v1, "sipListener":Landroid/javax/sip/SipListener;
    if-eqz v0, :cond_0

    instance-of v2, v1, Landroid/gov/nist/javax/sip/SipListenerExt;

    if-nez v2, :cond_0

    .line 2133
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->delete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2135
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    :cond_0
    monitor-exit p0

    return-void

    .line 2127
    .end local v0    # "sipDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .end local v1    # "sipListener":Landroid/javax/sip/SipListener;
    .end local p1    # "dialogErrorEvent":Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public disableLogging()V
    .locals 1

    .line 698
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->disableLogging()V

    .line 699
    return-void
.end method

.method public enableLogging()V
    .locals 1

    .line 706
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->enableLogging()V

    .line 707
    return-void
.end method

.method public findCancelTransaction(Landroid/gov/nist/javax/sip/message/SIPRequest;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    .locals 5
    .param p1, "cancelRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .param p2, "isServer"    # Z

    .line 1320
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1321
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "findCancelTransaction request= \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\nfindCancelRequest isServer="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1326
    :cond_0
    if-eqz p2, :cond_3

    .line 1327
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1329
    .local v0, "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1330
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 1332
    .local v2, "transaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    move-object v3, v2

    check-cast v3, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 1333
    .local v3, "sipServerTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    invoke-interface {v3, p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->doesCancelMatchTransaction(Landroid/gov/nist/javax/sip/message/SIPRequest;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1335
    return-object v3

    .line 1336
    .end local v2    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    .end local v3    # "sipServerTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_1
    goto :goto_0

    .line 1338
    .end local v0    # "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;>;"
    :cond_2
    goto :goto_2

    .line 1339
    :cond_3
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1341
    .local v0, "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;>;"
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1342
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 1344
    .restart local v2    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    move-object v3, v2

    check-cast v3, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 1345
    .local v3, "sipClientTransaction":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    invoke-interface {v3, p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->doesCancelMatchTransaction(Landroid/gov/nist/javax/sip/message/SIPRequest;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1347
    return-object v3

    .line 1349
    .end local v2    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    .end local v3    # "sipClientTransaction":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    :cond_4
    goto :goto_1

    .line 1352
    .end local v0    # "li":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;>;"
    :cond_5
    :goto_2
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1353
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v1, "Could not find transaction for cancel request"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1355
    :cond_6
    const/4 v0, 0x0

    return-object v0
.end method

.method public findMergedTransaction(Landroid/gov/nist/javax/sip/message/SIPRequest;)Z
    .locals 9
    .param p1, "sipRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 1401
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string v1, "INVITE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1406
    return v1

    .line 1408
    :cond_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMergeId()Ljava/lang/String;

    move-result-object v0

    .line 1409
    .local v0, "mergeId":Ljava/lang/String;
    if-eqz v0, :cond_4

    .line 1410
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->mergeTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 1412
    .local v2, "mergedTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    const-string v3, " with "

    const/4 v4, 0x1

    const/16 v5, 0x20

    if-eqz v2, :cond_2

    invoke-interface {v2, p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isMessagePartOfTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 1415
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1416
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Mathcing merged transaction for merge id "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1418
    :cond_1
    return v4

    .line 1424
    :cond_2
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverDialogMergeTestTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v6, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 1426
    .local v6, "serverDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    if-eqz v6, :cond_4

    iget-boolean v7, v6, Landroid/gov/nist/javax/sip/stack/SIPDialog;->firstTransactionIsServerTransaction:Z

    if-eqz v7, :cond_4

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v7

    sget-object v8, Landroid/javax/sip/DialogState;->CONFIRMED:Landroid/javax/sip/DialogState;

    if-ne v7, v8, :cond_4

    .line 1428
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1429
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Mathcing merged dialog for merge id "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1431
    :cond_3
    return v4

    .line 1436
    .end local v2    # "mergedTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v6    # "serverDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :cond_4
    return v1
.end method

.method public findPendingTransaction(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .locals 3
    .param p1, "transactionId"    # Ljava/lang/String;

    .line 1381
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1382
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "looking for pending tx for :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1385
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->pendingTransactions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    return-object v0
.end method

.method public findSubscribeTransaction(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/ListeningPointImpl;)Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .locals 13
    .param p1, "notifyMessage"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .param p2, "listeningPoint"    # Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 1072
    const-string/jumbo v0, "findSubscribeTransaction : returning "

    const/4 v1, 0x0

    .line 1076
    .local v1, "retval":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    const/4 v2, 0x1

    const/16 v3, 0x20

    :try_start_0
    invoke-virtual {p1, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v2

    .line 1077
    .local v2, "dialogId":Ljava/lang/String;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 1078
    .local v4, "it":Ljava/util/Iterator;
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1079
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "ct table size = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v7}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1083
    :cond_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v5

    invoke-interface {v5}, Landroid/javax/sip/header/ToHeader;->getTag()Ljava/lang/String;

    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1084
    .local v5, "thisToTag":Ljava/lang/String;
    if-nez v5, :cond_2

    .line 1085
    nop

    .line 1149
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1150
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_1
    return-object v1

    .line 1087
    :cond_2
    :try_start_1
    const-string v6, "Event"

    invoke-virtual {p1, v6}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/header/Event;

    .line 1088
    .local v6, "eventHdr":Landroid/gov/nist/javax/sip/header/Event;
    if-nez v6, :cond_5

    .line 1089
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 1090
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v8, "event Header is null -- returning null"

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1094
    :cond_3
    nop

    .line 1149
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1150
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_4
    return-object v1

    .line 1096
    :cond_5
    :goto_0
    :try_start_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_f

    .line 1097
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 1098
    .local v7, "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getMethod()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "SUBSCRIBE"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_6

    .line 1099
    goto :goto_0

    .line 1102
    :cond_6
    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getOriginalRequestFromTag()Ljava/lang/String;

    move-result-object v8

    .line 1103
    .local v8, "fromTag":Ljava/lang/String;
    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getOriginalRequestEvent()Landroid/gov/nist/javax/sip/header/Event;

    move-result-object v9

    .line 1106
    .local v9, "hisEvent":Landroid/gov/nist/javax/sip/header/Event;
    if-nez v9, :cond_7

    .line 1107
    goto :goto_0

    .line 1108
    :cond_7
    sget-object v10, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v10, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 1109
    sget-object v10, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "ct.fromTag = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1110
    sget-object v10, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "thisToTag = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1111
    sget-object v10, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "hisEvent = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1112
    sget-object v10, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "eventHdr "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1113
    sget-object v10, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "ct.req.contact = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getOriginalRequestContact()Landroid/gov/nist/javax/sip/header/Contact;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1114
    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v10

    if-eqz v10, :cond_8

    .line 1115
    sget-object v10, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "ct.req.reqURI = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v12

    invoke-virtual {v12}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1116
    :cond_8
    sget-object v10, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "msg.Contact= "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getContactHeader()Landroid/gov/nist/javax/sip/header/Contact;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1117
    sget-object v10, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "msg.reqURI "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1121
    :cond_9
    invoke-virtual {v8, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_e

    if-eqz v9, :cond_e

    invoke-virtual {v6, v9}, Landroid/gov/nist/javax/sip/header/Event;->match(Landroid/gov/nist/javax/sip/header/Event;)Z

    move-result v10

    if-eqz v10, :cond_e

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v10

    invoke-interface {v10}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getOriginalRequestCallId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_e

    .line 1126
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDeliverUnsolicitedNotify()Z

    move-result v10

    if-nez v10, :cond_a

    .line 1127
    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->acquireSem()Z

    .line 1129
    :cond_a
    if-nez v1, :cond_b

    .line 1131
    move-object v1, v7

    .line 1135
    :cond_b
    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v10

    if-eqz v10, :cond_e

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v10

    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v11

    invoke-virtual {v11}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getContactHeader()Landroid/gov/nist/javax/sip/header/Contact;

    move-result-object v11

    invoke-virtual {v11}, Landroid/gov/nist/javax/sip/header/Contact;->getAddress()Landroid/javax/sip/address/Address;

    move-result-object v11

    invoke-interface {v11}, Landroid/javax/sip/address/Address;->getURI()Landroid/javax/sip/address/URI;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_e

    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDefaultDialog()Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v10

    if-nez v10, :cond_c

    invoke-interface {v7, v2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v10

    if-eqz v10, :cond_e

    .line 1137
    :cond_c
    sget-object v10, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v10, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v10

    if-eqz v10, :cond_d

    .line 1138
    sget-object v10, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Tx compl conditions met."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1140
    :cond_d
    move-object v1, v7

    .line 1141
    goto :goto_1

    .line 1145
    .end local v7    # "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .end local v8    # "fromTag":Ljava/lang/String;
    .end local v9    # "hisEvent":Landroid/gov/nist/javax/sip/header/Event;
    :cond_e
    goto/16 :goto_0

    .line 1147
    :cond_f
    :goto_1
    nop

    .line 1149
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 1150
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_10
    return-object v1

    .line 1149
    .end local v2    # "dialogId":Ljava/lang/String;
    .end local v4    # "it":Ljava/util/Iterator;
    .end local v5    # "thisToTag":Ljava/lang/String;
    .end local v6    # "eventHdr":Landroid/gov/nist/javax/sip/header/Event;
    :catchall_0
    move-exception v2

    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 1150
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_11
    throw v2
.end method

.method public findTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    .locals 9
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .param p2, "isServer"    # Z

    .line 1231
    const/4 v0, 0x0

    .line 1233
    .local v0, "retval":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    const-string/jumbo v1, "z9hg4bk"

    const-string/jumbo v2, "findTransaction: returning  : "

    const/16 v3, 0x20

    if-eqz p2, :cond_6

    .line 1234
    :try_start_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v4

    .line 1235
    .local v4, "via":Landroid/gov/nist/javax/sip/header/Via;
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 1236
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTransactionId()Ljava/lang/String;

    move-result-object v5

    .line 1238
    .local v5, "key":Ljava/lang/String;
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v6, v5}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-object v0, v6

    .line 1239
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1240
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "serverTx: looking for key "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " existing="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1245
    :cond_0
    invoke-virtual {v5, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_2

    .line 1247
    nop

    .line 1296
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1297
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 1253
    .end local v5    # "key":Ljava/lang/String;
    :cond_2
    :try_start_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 1255
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 1256
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 1258
    .local v5, "sipServerTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    invoke-interface {v5, p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isMessagePartOfTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;)Z

    move-result v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v6, :cond_4

    .line 1260
    move-object v0, v5

    .line 1261
    nop

    .line 1296
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1297
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_3
    return-object v0

    .line 1263
    .end local v5    # "sipServerTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_4
    goto :goto_0

    .line 1265
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;>;"
    .end local v4    # "via":Landroid/gov/nist/javax/sip/header/Via;
    :cond_5
    goto/16 :goto_2

    .line 1266
    :cond_6
    :try_start_2
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v4

    .line 1267
    .restart local v4    # "via":Landroid/gov/nist/javax/sip/header/Via;
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_9

    .line 1268
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTransactionId()Ljava/lang/String;

    move-result-object v5

    .line 1269
    .local v5, "key":Ljava/lang/String;
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1270
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "clientTx: looking for key "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1272
    :cond_7
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v6, v5}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-object v0, v6

    .line 1273
    invoke-virtual {v5, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v1, :cond_9

    .line 1275
    nop

    .line 1296
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 1297
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_8
    return-object v0

    .line 1282
    .end local v5    # "key":Ljava/lang/String;
    :cond_9
    :try_start_3
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 1284
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;>;"
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_c

    .line 1285
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 1287
    .local v5, "clientTransaction":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    invoke-interface {v5, p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->isMessagePartOfTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;)Z

    move-result v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v6, :cond_b

    .line 1289
    move-object v0, v5

    .line 1290
    nop

    .line 1296
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 1297
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_a
    return-object v0

    .line 1292
    .end local v5    # "clientTransaction":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    :cond_b
    goto :goto_1

    .line 1296
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;>;"
    .end local v4    # "via":Landroid/gov/nist/javax/sip/header/Via;
    :cond_c
    :goto_2
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 1297
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1301
    :cond_d
    return-object v0

    .line 1296
    :catchall_0
    move-exception v1

    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 1297
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_e
    throw v1
.end method

.method public findTransaction(Ljava/lang/String;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    .locals 1
    .param p1, "transactionId"    # Ljava/lang/String;
    .param p2, "isServer"    # Z

    .line 1306
    if-eqz p2, :cond_0

    .line 1307
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    return-object v0

    .line 1309
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    return-object v0
.end method

.method public findTransactionPendingAck(Landroid/gov/nist/javax/sip/message/SIPRequest;)Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .locals 2
    .param p1, "ackMessage"    # Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 1180
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->terminatedServerTransactionsPendingAck:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    return-object v0
.end method

.method public getAckTimeoutFactor()I
    .locals 1

    .line 3185
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v0

    instance-of v0, v0, Landroid/gov/nist/javax/sip/SipListenerExt;

    if-eqz v0, :cond_0

    .line 3187
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTimeoutFactor:I

    return v0

    .line 3189
    :cond_0
    const/16 v0, 0x40

    return v0
.end method

.method public getActiveClientTransactionCount()I
    .locals 1

    .line 2858
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->activeClientTransactionCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public getAddressResolver()Landroid/gov/nist/core/net/AddressResolver;
    .locals 1

    .line 2630
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addressResolver:Landroid/gov/nist/core/net/AddressResolver;

    return-object v0
.end method

.method public getClientAuth()Landroid/gov/nist/javax/sip/stack/ClientAuthType;
    .locals 1

    .line 3268
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientAuth:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    return-object v0
.end method

.method public getClientTransactionTableSize()I
    .locals 1

    .line 1851
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v0

    return v0
.end method

.method public getConnectionLingerTimer()I
    .locals 1

    .line 3440
    sget v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->connectionLingerTimer:I

    return v0
.end method

.method public getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .locals 4
    .param p1, "dialogId"    # Ljava/lang/String;

    .line 1020
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 1021
    .local v0, "sipDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1022
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "getDialog("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") : returning "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1025
    :cond_0
    return-object v0
.end method

.method public getDialogs()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Landroid/javax/sip/Dialog;",
            ">;"
        }
    .end annotation

    .line 2881
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 2882
    .local v0, "dialogs":Ljava/util/HashSet;, "Ljava/util/HashSet<Landroid/javax/sip/Dialog;>;"
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 2883
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->earlyDialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 2884
    return-object v0
.end method

.method public getDialogs(Landroid/javax/sip/DialogState;)Ljava/util/Collection;
    .locals 5
    .param p1, "state"    # Landroid/javax/sip/DialogState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/javax/sip/DialogState;",
            ")",
            "Ljava/util/Collection<",
            "Landroid/javax/sip/Dialog;",
            ">;"
        }
    .end annotation

    .line 2893
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 2894
    .local v0, "matchingDialogs":Ljava/util/HashSet;, "Ljava/util/HashSet<Landroid/javax/sip/Dialog;>;"
    sget-object v1, Landroid/javax/sip/DialogState;->EARLY:Landroid/javax/sip/DialogState;

    invoke-virtual {v1, p1}, Landroid/javax/sip/DialogState;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2895
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->earlyDialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 2897
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    .line 2898
    .local v1, "dialogs":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/gov/nist/javax/sip/stack/SIPDialog;>;"
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 2899
    .local v3, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/javax/sip/DialogState;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 2901
    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 2903
    .end local v3    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :cond_1
    goto :goto_0

    .line 2905
    .end local v1    # "dialogs":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/gov/nist/javax/sip/stack/SIPDialog;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    return-object v0
.end method

.method public getEarlyDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .locals 4
    .param p1, "dialogId"    # Ljava/lang/String;

    .line 977
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->earlyDialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 978
    .local v0, "sipDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 979
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "getEarlyDialog("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") : returning "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 981
    :cond_0
    return-object v0
.end method

.method public getEarlyDialogTimeout()I
    .locals 1

    .line 3254
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->earlyDialogTimeout:I

    return v0
.end method

.method public getForkedTransaction(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .locals 1
    .param p1, "transactionId"    # Ljava/lang/String;

    .line 3090
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->forkedClientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    return-object v0
.end method

.method public getHostAddress()Ljava/lang/String;
    .locals 1

    .line 2396
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->stackAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getJoinDialog(Landroid/gov/nist/javax/sip/header/extensions/JoinHeader;)Landroid/javax/sip/Dialog;
    .locals 6
    .param p1, "joinHeader"    # Landroid/gov/nist/javax/sip/header/extensions/JoinHeader;

    .line 2969
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/header/extensions/JoinHeader;->getCallId()Ljava/lang/String;

    move-result-object v0

    .line 2970
    .local v0, "cid":Ljava/lang/String;
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/header/extensions/JoinHeader;->getFromTag()Ljava/lang/String;

    move-result-object v1

    .line 2971
    .local v1, "fromTag":Ljava/lang/String;
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/header/extensions/JoinHeader;->getToTag()Ljava/lang/String;

    move-result-object v2

    .line 2973
    .local v2, "toTag":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2976
    .local v3, "retval":Ljava/lang/StringBuilder;
    const-string v4, ":"

    if-eqz v2, :cond_0

    .line 2977
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2978
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2981
    :cond_0
    if-eqz v1, :cond_1

    .line 2982
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2983
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2985
    :cond_1
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/javax/sip/Dialog;

    return-object v4
.end method

.method public getLocalAddressForTcpDst(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/SocketAddress;
    .locals 7
    .param p1, "dst"    # Ljava/net/InetAddress;
    .param p2, "dstPort"    # I
    .param p3, "localAddress"    # Ljava/net/InetAddress;
    .param p4, "localPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 633
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageProcessorFactory()Landroid/gov/nist/javax/sip/stack/MessageProcessorFactory;

    move-result-object v0

    instance-of v0, v0, Landroid/gov/nist/javax/sip/stack/NioMessageProcessorFactory;

    if-eqz v0, :cond_2

    .line 635
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageProcessors()[Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    .line 636
    .local v0, "processors":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    move-object v1, v0

    .local v1, "arr$":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    array-length v2, v1

    .local v2, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 637
    .local v4, "processor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    const-string/jumbo v5, "TCP"

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getTransport()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 638
    invoke-virtual {v4, p1, p2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->createMessageChannel(Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    .line 640
    .local v5, "msgChannel":Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    iget-object v6, v5, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v6}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v6

    return-object v6

    .line 636
    .end local v4    # "processor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .end local v5    # "msgChannel":Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 643
    .end local v1    # "arr$":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .end local v2    # "len$":I
    .end local v3    # "i$":I
    :cond_1
    const/4 v1, 0x0

    return-object v1

    .line 645
    .end local v0    # "processors":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/IOHandler;->getLocalAddressForTcpDst(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/SocketAddress;

    move-result-object v0

    return-object v0
.end method

.method public getLocalAddressForTlsDst(Ljava/net/InetAddress;ILjava/net/InetAddress;)Ljava/net/SocketAddress;
    .locals 7
    .param p1, "dst"    # Ljava/net/InetAddress;
    .param p2, "dstPort"    # I
    .param p3, "localAddress"    # Ljava/net/InetAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 670
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageProcessors()[Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    .line 671
    .local v0, "processors":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    move-object v1, v0

    .local v1, "arr$":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    array-length v2, v1

    .local v2, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    .line 672
    .local v4, "processor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    instance-of v5, v4, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;

    if-eqz v5, :cond_0

    .line 675
    invoke-virtual {v4, p1, p2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->createMessageChannel(Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;

    .line 678
    .local v5, "msgChannel":Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    invoke-virtual {v6, p1, p2, p3, v5}, Landroid/gov/nist/javax/sip/stack/IOHandler;->getLocalAddressForTlsDst(Ljava/net/InetAddress;ILjava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;)Ljava/net/SocketAddress;

    move-result-object v6

    return-object v6

    .line 680
    .end local v5    # "msgChannel":Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    :cond_0
    instance-of v5, v4, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;

    if-eqz v5, :cond_1

    .line 681
    invoke-virtual {v4, p1, p2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->createMessageChannel(Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;

    .line 683
    .local v5, "msgChannel":Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;
    iget-object v6, v5, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->socketChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v6}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v6

    return-object v6

    .line 671
    .end local v4    # "processor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .end local v5    # "msgChannel":Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 687
    .end local v1    # "arr$":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .end local v2    # "len$":I
    .end local v3    # "i$":I
    :cond_2
    const/4 v1, 0x0

    return-object v1
.end method

.method public getMaxForkTime()I
    .locals 1

    .line 3164
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxForkTime:I

    return v0
.end method

.method public getMaxMessageSize()I
    .locals 1

    .line 2275
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxMessageSize:I

    return v0
.end method

.method public getMaxTxLifetimeInvite()I
    .locals 1

    .line 3404
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxTxLifetimeInvite:I

    return v0
.end method

.method public getMaxTxLifetimeNonInvite()I
    .locals 1

    .line 3418
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxTxLifetimeNonInvite:I

    return v0
.end method

.method public getMessageParserFactory()Landroid/gov/nist/javax/sip/parser/MessageParserFactory;
    .locals 1

    .line 3214
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->messageParserFactory:Landroid/gov/nist/javax/sip/parser/MessageParserFactory;

    return-object v0
.end method

.method public getMessageProcessorFactory()Landroid/gov/nist/javax/sip/stack/MessageProcessorFactory;
    .locals 1

    .line 3228
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->messageProcessorFactory:Landroid/gov/nist/javax/sip/stack/MessageProcessorFactory;

    return-object v0
.end method

.method protected getMessageProcessors()[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .locals 2

    .line 2491
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->messageProcessors:Ljava/util/Collection;

    const/4 v1, 0x0

    new-array v1, v1, [Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    check-cast v0, [Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    return-object v0
.end method

.method public getMinKeepAliveInterval()J
    .locals 2

    .line 3125
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->minKeepAliveInterval:J

    return-wide v0
.end method

.method public getNetworkLayer()Landroid/gov/nist/core/net/NetworkLayer;
    .locals 1

    .line 2215
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->networkLayer:Landroid/gov/nist/core/net/NetworkLayer;

    if-nez v0, :cond_0

    .line 2216
    sget-object v0, Landroid/gov/nist/core/net/DefaultNetworkLayer;->SINGLETON:Landroid/gov/nist/core/net/DefaultNetworkLayer;

    return-object v0

    .line 2218
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->networkLayer:Landroid/gov/nist/core/net/NetworkLayer;

    return-object v0
.end method

.method public getNextHop(Landroid/gov/nist/javax/sip/message/SIPRequest;)Landroid/javax/sip/address/Hop;
    .locals 2
    .param p1, "sipRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 2339
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->useRouterForAll:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 2341
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->router:Landroid/javax/sip/address/Router;

    if-eqz v0, :cond_0

    .line 2342
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->router:Landroid/javax/sip/address/Router;

    invoke-interface {v0, p1}, Landroid/javax/sip/address/Router;->getNextHop(Landroid/javax/sip/message/Request;)Landroid/javax/sip/address/Hop;

    move-result-object v0

    return-object v0

    .line 2344
    :cond_0
    return-object v1

    .line 2348
    :cond_1
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/address/URI;->isSipURI()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRouteHeaders()Landroid/gov/nist/javax/sip/header/RouteList;

    move-result-object v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 2351
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->router:Landroid/javax/sip/address/Router;

    if-eqz v0, :cond_3

    .line 2352
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->router:Landroid/javax/sip/address/Router;

    invoke-interface {v0, p1}, Landroid/javax/sip/address/Router;->getNextHop(Landroid/javax/sip/message/Request;)Landroid/javax/sip/address/Hop;

    move-result-object v0

    return-object v0

    .line 2354
    :cond_3
    return-object v1

    .line 2350
    :cond_4
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->defaultRouter:Landroid/gov/nist/javax/sip/stack/DefaultRouter;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/stack/DefaultRouter;->getNextHop(Landroid/javax/sip/message/Request;)Landroid/javax/sip/address/Hop;

    move-result-object v0

    return-object v0
.end method

.method public getReceiveUdpBufferSize()I
    .locals 1

    .line 3013
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->receiveUdpBufferSize:I

    return v0
.end method

.method public getReinviteExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .line 3200
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->reinviteExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;
    .locals 1

    .line 3469
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->releaseReferencesStrategy:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    return-object v0
.end method

.method public getReliableConnectionKeepAliveTimeout()I
    .locals 1

    .line 3293
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->reliableConnectionKeepAliveTimeout:I

    return v0
.end method

.method public getReplacesDialog(Landroid/gov/nist/javax/sip/header/extensions/ReplacesHeader;)Landroid/javax/sip/Dialog;
    .locals 9
    .param p1, "replacesHeader"    # Landroid/gov/nist/javax/sip/header/extensions/ReplacesHeader;

    .line 2915
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/header/extensions/ReplacesHeader;->getCallId()Ljava/lang/String;

    move-result-object v0

    .line 2916
    .local v0, "cid":Ljava/lang/String;
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/header/extensions/ReplacesHeader;->getFromTag()Ljava/lang/String;

    move-result-object v1

    .line 2917
    .local v1, "fromTag":Ljava/lang/String;
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/header/extensions/ReplacesHeader;->getToTag()Ljava/lang/String;

    move-result-object v2

    .line 2919
    .local v2, "toTag":Ljava/lang/String;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 2920
    .local v4, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v5

    invoke-interface {v5}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v5, v4, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseFromTag:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v5, v4, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseToTag:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 2923
    return-object v4

    .line 2925
    .end local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :cond_0
    goto :goto_0

    .line 2927
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2930
    .local v3, "dialogId":Ljava/lang/StringBuilder;
    const-string v4, ":"

    if-eqz v2, :cond_2

    .line 2931
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2932
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2935
    :cond_2
    if-eqz v1, :cond_3

    .line 2936
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2937
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2939
    :cond_3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    .line 2940
    .local v4, "did":Ljava/lang/String;
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v6, 0x20

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 2941
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Looking for dialog "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2945
    :cond_4
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v5, v4}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/javax/sip/Dialog;

    .line 2949
    .local v5, "replacesDialog":Landroid/javax/sip/Dialog;
    if-nez v5, :cond_6

    .line 2950
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v6}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 2952
    .local v7, "ctx":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    invoke-interface {v7, v4}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v8

    if-eqz v8, :cond_5

    .line 2953
    invoke-interface {v7, v4}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v5

    .line 2954
    goto :goto_2

    .line 2956
    .end local v7    # "ctx":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    :cond_5
    goto :goto_1

    .line 2959
    .end local v6    # "i$":Ljava/util/Iterator;
    :cond_6
    :goto_2
    return-object v5
.end method

.method public getRetransmissionAlertTransaction(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .locals 1
    .param p1, "dialogId"    # Ljava/lang/String;

    .line 730
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->retransmissionAlertTransactions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    return-object v0
.end method

.method public getRouter()Landroid/javax/sip/address/Router;
    .locals 1

    .line 2439
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->router:Landroid/javax/sip/address/Router;

    return-object v0
.end method

.method public getRouter(Landroid/gov/nist/javax/sip/message/SIPRequest;)Landroid/javax/sip/address/Router;
    .locals 2
    .param p1, "request"    # Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 2416
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestLine()Landroid/gov/nist/javax/sip/header/RequestLine;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2417
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->defaultRouter:Landroid/gov/nist/javax/sip/stack/DefaultRouter;

    return-object v0

    .line 2418
    :cond_0
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->useRouterForAll:Z

    if-eqz v0, :cond_1

    .line 2419
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->router:Landroid/javax/sip/address/Router;

    return-object v0

    .line 2421
    :cond_1
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/address/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "sip"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/address/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "sips"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 2425
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->router:Landroid/javax/sip/address/Router;

    if-eqz v0, :cond_3

    .line 2426
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->router:Landroid/javax/sip/address/Router;

    return-object v0

    .line 2428
    :cond_3
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->defaultRouter:Landroid/gov/nist/javax/sip/stack/DefaultRouter;

    return-object v0

    .line 2423
    :cond_4
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->defaultRouter:Landroid/gov/nist/javax/sip/stack/DefaultRouter;

    return-object v0
.end method

.method public getSelfRoutingThreadpoolExecutor()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 2

    .line 431
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->selfRoutingThreadpoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v0, :cond_1

    .line 432
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->threadPoolSize:I

    if-gtz v0, :cond_0

    .line 434
    new-instance v0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;-><init>(I)V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->selfRoutingThreadpoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    goto :goto_0

    .line 436
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;

    iget v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->threadPoolSize:I

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/ThreadAffinityExecutor;-><init>(I)V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->selfRoutingThreadpoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    .line 439
    :cond_1
    :goto_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->selfRoutingThreadpoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0
.end method

.method public getSendUdpBufferSize()I
    .locals 1

    .line 3033
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sendUdpBufferSize:I

    return v0
.end method

.method public getServerLogger()Landroid/gov/nist/core/ServerLogger;
    .locals 1

    .line 2265
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverLogger:Landroid/gov/nist/core/ServerLogger;

    return-object v0
.end method

.method public getServerTransactionTableSize()I
    .locals 1

    .line 1860
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v0

    return v0
.end method

.method public abstract getSipListener()Landroid/javax/sip/SipListener;
.end method

.method public getSslHandshakeTimeout()J
    .locals 2

    .line 3383
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sslHandshakeTimeout:J

    return-wide v0
.end method

.method public getStackCongestionControlTimeout()I
    .locals 1

    .line 3454
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->stackCongestionControlTimeout:I

    return v0
.end method

.method public getStackLogger()Landroid/gov/nist/core/StackLogger;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2254
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method

.method public getTcpPostParsingThreadPoolSize()I
    .locals 1

    .line 2295
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->tcpPostParsingThreadPoolSize:I

    return v0
.end method

.method public getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;
    .locals 1

    .line 2659
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->threadAuditor:Landroid/gov/nist/core/ThreadAuditor;

    return-object v0
.end method

.method public getThreadPriority()I
    .locals 1

    .line 3289
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->threadPriority:I

    return v0
.end method

.method public getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 3002
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->timer:Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    return-object v0
.end method

.method public isAggressiveCleanup()Z
    .locals 2

    .line 3245
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->releaseReferencesStrategy:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    sget-object v1, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->None:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    if-ne v0, v1, :cond_0

    .line 3246
    const/4 v0, 0x0

    return v0

    .line 3248
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public isAlive()Z
    .locals 1

    .line 2448
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->toExit:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isCancelClientTransactionChecked()Z
    .locals 1

    .line 2867
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->cancelClientTransactionChecked:Z

    return v0
.end method

.method public isDeliverRetransmittedAckToListener()Z
    .locals 1

    .line 3174
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->deliverRetransmittedAckToListener:Z

    return v0
.end method

.method public isDeliverTerminatedEventForAck()Z
    .locals 1

    .line 3121
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->deliverTerminatedEventForAck:Z

    return v0
.end method

.method public isDeliverUnsolicitedNotify()Z
    .locals 1

    .line 3105
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->deliverUnsolicitedNotify:Z

    return v0
.end method

.method public isEventForked(Ljava/lang/String;)Z
    .locals 3
    .param p1, "ename"    # Ljava/lang/String;

    .line 2617
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2618
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "isEventForked: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " returning "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->forkedEvents:Ljava/util/HashSet;

    invoke-virtual {v2, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2621
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->forkedEvents:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isLogStackTraceOnMessageSend()Z
    .locals 1

    .line 3067
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logStackTraceOnMessageSend:Z

    return v0
.end method

.method public isLoggingEnabled()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2230
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    :goto_0
    return v0
.end method

.method public isLoggingEnabled(I)Z
    .locals 1
    .param p1, "level"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2241
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, p1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    :goto_0
    return v0
.end method

.method public isNon2XXAckPassedToListener()Z
    .locals 1

    .line 2848
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->non2XXAckPassedToListener:Z

    return v0
.end method

.method public isPatchReceivedRport()Z
    .locals 1

    .line 3149
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->patchReceivedRport:Z

    return v0
.end method

.method public isPatchRport()Z
    .locals 1

    .line 3141
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->patchRport:Z

    return v0
.end method

.method public isPatchWebSocketHeaders()Z
    .locals 1

    .line 3133
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->patchWebSocketHeaders:Z

    return v0
.end method

.method public isRemoteTagReassignmentAllowed()Z
    .locals 1

    .line 2871
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->remoteTagReassignmentAllowed:Z

    return v0
.end method

.method public isRfc2543Supported()Z
    .locals 1

    .line 2863
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->rfc2543Supported:Z

    return v0
.end method

.method public isSslRenegotiationEnabled()Z
    .locals 1

    .line 3429
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sslRenegotiationEnabled:Z

    return v0
.end method

.method public isTransactionPendingAck(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)Z
    .locals 2
    .param p1, "serverTransaction"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 1212
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v0

    .line 1214
    .local v0, "branchId":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->terminatedServerTransactionsPendingAck:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->contains(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public mapTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    .locals 1
    .param p1, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 1498
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isTransactionMapped()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1499
    return-void

    .line 1500
    :cond_0
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addTransactionHash(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1502
    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setTransactionMapped(Z)V

    .line 1503
    return-void
.end method

.method public newSIPServerRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;
    .locals 8
    .param p1, "requestReceived"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .param p2, "requestMessageChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 1521
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTransactionId()Ljava/lang/String;

    move-result-object v0

    .line 1523
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {p1, p2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setMessageChannel(Ljava/lang/Object;)V

    .line 1525
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipMessageValves:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/16 v2, 0x20

    const/4 v3, 0x0

    if-eqz v1, :cond_5

    .line 1529
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipMessageValves:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPMessageValve;

    .line 1530
    .local v4, "sipMessageValve":Landroid/gov/nist/javax/sip/stack/SIPMessageValve;
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1531
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Checking SIP message valve "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " for Request = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFirstLine()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1534
    :cond_0
    invoke-interface {v4, p1, p2}, Landroid/gov/nist/javax/sip/stack/SIPMessageValve;->processRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 1536
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1537
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Request dropped by the SIP message valve. Request = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1540
    :cond_1
    return-object v3

    .line 1542
    .end local v4    # "sipMessageValve":Landroid/gov/nist/javax/sip/stack/SIPMessageValve;
    :cond_2
    goto :goto_0

    .line 1551
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_3
    goto :goto_1

    .line 1543
    :catch_0
    move-exception v1

    .line 1544
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/4 v4, 0x4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1545
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "An issue happening the valve on request "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " thus the message will not be processed further"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4, v1}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1550
    :cond_4
    return-object v3

    .line 1555
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_5
    :goto_1
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->findTransaction(Ljava/lang/String;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 1558
    .local v1, "currentTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    if-eqz v1, :cond_6

    invoke-interface {v1, p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isMessagePartOfTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;)Z

    move-result v4

    if-nez v4, :cond_b

    .line 1563
    :cond_6
    const/4 v1, 0x0

    .line 1564
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "z9hg4bk"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_8

    .line 1566
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 1568
    .local v4, "transactionIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;>;"
    :cond_7
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8

    if-nez v1, :cond_8

    .line 1570
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 1574
    .local v5, "nextTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    invoke-interface {v5, p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isMessagePartOfTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1578
    move-object v1, v5

    goto :goto_2

    .line 1584
    .end local v4    # "transactionIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;>;"
    .end local v5    # "nextTransaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    :cond_8
    if-nez v1, :cond_b

    .line 1585
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->findPendingTransaction(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-result-object v1

    .line 1586
    if-eqz v1, :cond_a

    .line 1588
    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setTransaction(Ljava/lang/Object;)V

    .line 1589
    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->acquireSem()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 1590
    return-object v1

    .line 1592
    :cond_9
    return-object v3

    .line 1596
    :cond_a
    invoke-virtual {p0, p2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->createServerTransaction(Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-result-object v1

    .line 1597
    if-eqz v1, :cond_b

    .line 1599
    invoke-interface {v1, p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setOriginalRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 1601
    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setTransaction(Ljava/lang/Object;)V

    .line 1610
    :cond_b
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 1611
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "newSIPServerRequest( "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v5

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "):"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1617
    :cond_c
    if-eqz v1, :cond_d

    .line 1618
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipMessageFactory:Landroid/gov/nist/javax/sip/stack/StackMessageFactory;

    invoke-interface {v2, p1, v1}, Landroid/gov/nist/javax/sip/stack/StackMessageFactory;->newSIPServerRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setRequestInterface(Landroid/gov/nist/javax/sip/stack/ServerRequestInterface;)V

    .line 1621
    :cond_d
    if-eqz v1, :cond_e

    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->acquireSem()Z

    move-result v2

    if-eqz v2, :cond_e

    .line 1622
    return-object v1

    .line 1623
    :cond_e
    if-eqz v1, :cond_11

    .line 1629
    :try_start_1
    invoke-interface {v1, p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->isMessagePartOfTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;)Z

    move-result v2

    if-eqz v2, :cond_f

    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 1633
    const/16 v2, 0x64

    invoke-virtual {p1, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v2

    .line 1635
    .local v2, "trying":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->removeContent()V

    .line 1636
    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 1641
    .end local v2    # "trying":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :cond_f
    goto :goto_3

    .line 1638
    :catch_1
    move-exception v2

    .line 1639
    .local v2, "ex":Ljava/lang/Exception;
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v4

    if-eqz v4, :cond_10

    .line 1640
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v5, "Exception occured sending TRYING"

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1642
    .end local v2    # "ex":Ljava/lang/Exception;
    :cond_10
    :goto_3
    return-object v3

    .line 1644
    :cond_11
    return-object v3
.end method

.method public newSIPServerResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;
    .locals 9
    .param p1, "responseReceived"    # Landroid/gov/nist/javax/sip/message/SIPResponse;
    .param p2, "responseMessageChannel"    # Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 1669
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipMessageValves:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x20

    const/4 v2, 0x0

    if-eqz v0, :cond_4

    .line 1673
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipMessageValves:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/stack/SIPMessageValve;

    .line 1674
    .local v3, "sipMessageValve":Landroid/gov/nist/javax/sip/stack/SIPMessageValve;
    invoke-interface {v3, p1, p2}, Landroid/gov/nist/javax/sip/stack/SIPMessageValve;->processResponse(Landroid/javax/sip/message/Response;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1676
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1677
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Response dropped by the SIP message valve. Response = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1680
    :cond_0
    return-object v2

    .line 1682
    .end local v3    # "sipMessageValve":Landroid/gov/nist/javax/sip/stack/SIPMessageValve;
    :cond_1
    goto :goto_0

    .line 1691
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_2
    goto :goto_1

    .line 1683
    :catch_0
    move-exception v0

    .line 1684
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/4 v3, 0x4

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1685
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "An issue happening the valve on response "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " thus the message will not be processed further"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1690
    :cond_3
    return-object v2

    .line 1694
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_4
    :goto_1
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTransactionId()Ljava/lang/String;

    move-result-object v0

    .line 1699
    .local v0, "key":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {p0, v0, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->findTransaction(Ljava/lang/String;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 1701
    .local v3, "currentTransaction":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    const-string/jumbo v4, "before processing"

    const/16 v5, 0x10

    if-eqz v3, :cond_5

    invoke-interface {v3, p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->isMessagePartOfTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;)Z

    move-result v6

    if-nez v6, :cond_9

    const-string/jumbo v6, "z9hg4bk"

    invoke-virtual {v0, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_9

    .line 1707
    :cond_5
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v6}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 1708
    .local v6, "transactionIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;>;"
    const/4 v3, 0x0

    .line 1709
    :cond_6
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_7

    if-nez v3, :cond_7

    .line 1711
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 1715
    .local v7, "nextTransaction":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    invoke-interface {v7, p1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->isMessagePartOfTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 1720
    move-object v3, v7

    goto :goto_2

    .line 1727
    .end local v7    # "nextTransaction":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    :cond_7
    if-nez v3, :cond_9

    .line 1731
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 1732
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p2, p1, v1, v2, v4}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;JLjava/lang/String;)V

    .line 1737
    :cond_8
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipMessageFactory:Landroid/gov/nist/javax/sip/stack/StackMessageFactory;

    invoke-interface {v1, p1, p2}, Landroid/gov/nist/javax/sip/stack/StackMessageFactory;->newSIPServerResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    move-result-object v1

    return-object v1

    .line 1744
    .end local v6    # "transactionIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;>;"
    :cond_9
    invoke-interface {v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->acquireSem()Z

    move-result v6

    .line 1747
    .local v6, "acquired":Z
    sget-object v7, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 1748
    invoke-interface {v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-virtual {v5, p1, v7, v8, v4}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->logResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;JLjava/lang/String;)V

    .line 1752
    :cond_a
    if-eqz v6, :cond_d

    .line 1753
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipMessageFactory:Landroid/gov/nist/javax/sip/stack/StackMessageFactory;

    invoke-interface {v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v5

    invoke-interface {v4, p1, v5}, Landroid/gov/nist/javax/sip/stack/StackMessageFactory;->newSIPServerResponse(Landroid/gov/nist/javax/sip/message/SIPResponse;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;

    move-result-object v4

    .line 1755
    .local v4, "sri":Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;
    if-eqz v4, :cond_b

    .line 1756
    invoke-interface {v3, v4}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setResponseInterface(Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;)V

    .line 1765
    .end local v4    # "sri":Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;
    goto :goto_3

    .line 1758
    .restart local v4    # "sri":Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;
    :cond_b
    sget-object v5, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 1759
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v5, "returning null - serverResponseInterface is null!"

    invoke-interface {v1, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1762
    :cond_c
    invoke-interface {v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->releaseSem()V

    .line 1763
    return-object v2

    .line 1766
    .end local v4    # "sri":Landroid/gov/nist/javax/sip/stack/ServerResponseInterface;
    :cond_d
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Application is blocked -- could not acquire semaphore -- dropping response"

    invoke-interface {v1, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 1770
    :goto_3
    if-eqz v6, :cond_e

    .line 1771
    return-object v3

    .line 1773
    :cond_e
    return-object v2
.end method

.method public printDialogTable()V
    .locals 3

    .line 714
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 715
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "dialog table  = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 718
    :cond_0
    return-void
.end method

.method public putDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .locals 5
    .param p1, "dialog"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 766
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v0

    .line 767
    .local v0, "dialogId":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    const/16 v2, 0x20

    if-eqz v1, :cond_1

    .line 768
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 769
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "putDialog: dialog already exists"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " in table = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 773
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    return-object v1

    .line 775
    :cond_1
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 776
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "putDialog dialogId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " dialog = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 779
    :cond_2
    invoke-virtual {p1, p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->setStack(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 780
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 781
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 782
    :cond_3
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 783
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->putMergeDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    .line 785
    return-object p1
.end method

.method public putInMergeTable(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;Landroid/gov/nist/javax/sip/message/SIPRequest;)V
    .locals 2
    .param p1, "sipTransaction"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .param p2, "sipRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 1483
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMergeId()Ljava/lang/String;

    move-result-object v0

    .line 1484
    .local v0, "mergeKey":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 1485
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->mergeTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1487
    :cond_0
    return-void
.end method

.method protected putMergeDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V
    .locals 4
    .param p1, "sipDialog"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 998
    if-eqz p1, :cond_0

    .line 999
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getMergeId()Ljava/lang/String;

    move-result-object v0

    .line 1000
    .local v0, "mergeId":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 1001
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverDialogMergeTestTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1002
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1003
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "put Dialog "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " in serverDialogMerge table with Merge Dialog Id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1007
    .end local v0    # "mergeId":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public putPendingTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    .locals 3
    .param p1, "tr"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 2201
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2202
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "putPendingTransaction: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2204
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->pendingTransactions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getTransactionId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2206
    return-void
.end method

.method protected reInit()V
    .locals 2

    .line 588
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 589
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "Re-initializing !"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 592
    :cond_0
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->messageProcessors:Ljava/util/Collection;

    .line 594
    new-instance v0, Landroid/gov/nist/javax/sip/stack/IOHandler;

    invoke-direct {v0, p0}, Landroid/gov/nist/javax/sip/stack/IOHandler;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->ioHandler:Landroid/gov/nist/javax/sip/stack/IOHandler;

    .line 595
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->pendingTransactions:Ljava/util/concurrent/ConcurrentHashMap;

    .line 596
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 597
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 598
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->retransmissionAlertTransactions:Ljava/util/concurrent/ConcurrentHashMap;

    .line 599
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->mergeTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 601
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 602
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->earlyDialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 603
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverDialogMergeTestTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 604
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->terminatedServerTransactionsPendingAck:Ljava/util/concurrent/ConcurrentHashMap;

    .line 605
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->forkedClientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 609
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->activeClientTransactionCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 611
    return-void
.end method

.method public removeDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V
    .locals 6
    .param p1, "dialog"    # Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 923
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getDialogId()Ljava/lang/String;

    move-result-object v0

    .line 925
    .local v0, "id":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getEarlyDialogId()Ljava/lang/String;

    move-result-object v1

    .line 927
    .local v1, "earlyId":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 928
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->earlyDialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 929
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 932
    :cond_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getMergeId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeMergeDialog(Ljava/lang/String;)V

    .line 934
    const/4 v2, 0x0

    if-eqz v0, :cond_2

    .line 940
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 942
    .local v3, "old":Ljava/lang/Object;
    if-ne v3, p1, :cond_1

    .line 943
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, v0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 951
    :cond_1
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->testAndSetIsDialogTerminatedEventDelivered()Z

    move-result v4

    if-nez v4, :cond_3

    .line 952
    new-instance v4, Landroid/javax/sip/DialogTerminatedEvent;

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v5

    invoke-direct {v4, v5, p1}, Landroid/javax/sip/DialogTerminatedEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/Dialog;)V

    .line 957
    .local v4, "event":Landroid/javax/sip/DialogTerminatedEvent;
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v5

    invoke-virtual {v5, v4, v2}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    goto :goto_0

    .line 961
    .end local v3    # "old":Ljava/lang/Object;
    .end local v4    # "event":Landroid/javax/sip/DialogTerminatedEvent;
    :cond_2
    iget-boolean v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogTerminatedEventDeliveredForNullDialog:Z

    if-eqz v3, :cond_3

    .line 962
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->testAndSetIsDialogTerminatedEventDelivered()Z

    move-result v3

    if-nez v3, :cond_4

    .line 963
    new-instance v3, Landroid/javax/sip/DialogTerminatedEvent;

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v4

    invoke-direct {v3, v4, p1}, Landroid/javax/sip/DialogTerminatedEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/Dialog;)V

    .line 968
    .local v3, "event":Landroid/javax/sip/DialogTerminatedEvent;
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v4

    invoke-virtual {v4, v3, v2}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    goto :goto_1

    .line 961
    .end local v3    # "event":Landroid/javax/sip/DialogTerminatedEvent;
    :cond_3
    :goto_0
    nop

    .line 973
    :cond_4
    :goto_1
    return-void
.end method

.method public removeDialog(Ljava/lang/String;)V
    .locals 2
    .param p1, "dialogId"    # Ljava/lang/String;

    .line 1037
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1038
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "Silently removing dialog from table"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 1040
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1041
    return-void
.end method

.method public removeFromMergeTable(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    .locals 2
    .param p1, "tr"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 1463
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1464
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "Removing tx from merge table "

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1468
    :cond_0
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getMergeId()Ljava/lang/String;

    move-result-object v0

    .line 1469
    .local v0, "key":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 1470
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->mergeTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1472
    :cond_1
    return-void
.end method

.method protected removeMergeDialog(Ljava/lang/String;)V
    .locals 4
    .param p1, "mergeId"    # Ljava/lang/String;

    .line 986
    if-eqz p1, :cond_1

    .line 987
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 988
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Tyring to remove Dialog from serverDialogMerge table with Merge Dialog Id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 990
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverDialogMergeTestTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 991
    .local v0, "sipDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    .line 992
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "removed Dialog "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " from serverDialogMerge table with Merge Dialog Id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 995
    .end local v0    # "sipDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :cond_1
    return-void
.end method

.method protected removeMessageProcessor(Landroid/gov/nist/javax/sip/stack/MessageProcessor;)V
    .locals 1
    .param p1, "oldMessageProcessor"    # Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 2477
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->messageProcessors:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2478
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->stop()V

    .line 2481
    :cond_0
    return-void
.end method

.method public removePendingTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    .locals 3
    .param p1, "tr"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 1447
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1448
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "removePendingTx: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getTransactionId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1451
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->pendingTransactions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getTransactionId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1453
    return-void
.end method

.method public removeTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V
    .locals 11
    .param p1, "sipTransaction"    # Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 1883
    const-string/jumbo v0, "removeTransaction: Table size :  clientTransactionTable %d  serverTransactionTable %d  mergetTable %d  terminatedServerTransactionsPendingAck %d   forkedClientTransactionTable %d  pendingTransactions %d "

    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1884
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "removeTransaction: Removing Transaction = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getTransactionId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " transaction = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1888
    :cond_0
    const/4 v1, 0x0

    .line 1890
    .local v1, "removed":Ljava/lang/Object;
    :try_start_0
    instance-of v3, p1, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v3, :cond_4

    .line 1891
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1892
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 1894
    :cond_1
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getTransactionId()Ljava/lang/String;

    move-result-object v3

    .line 1895
    .local v3, "key":Ljava/lang/String;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, v3}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v1, v4

    .line 1896
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getMethod()Ljava/lang/String;

    move-result-object v4

    .line 1897
    .local v4, "method":Ljava/lang/String;
    move-object v5, p1

    check-cast v5, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removePendingTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 1899
    move-object v5, p1

    check-cast v5, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeTransactionPendingAck(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)Z

    .line 1901
    const-string v5, "INVITE"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1902
    move-object v5, p1

    check-cast v5, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeFromMergeTable(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 1906
    :cond_2
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v5

    .line 1908
    .local v5, "sipProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    if-eqz v1, :cond_3

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->testAndSetTransactionTerminatedEvent()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 1910
    new-instance v6, Landroid/javax/sip/TransactionTerminatedEvent;

    move-object v7, p1

    check-cast v7, Landroid/javax/sip/ServerTransaction;

    invoke-direct {v6, v5, v7}, Landroid/javax/sip/TransactionTerminatedEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/ServerTransaction;)V

    .line 1913
    .local v6, "event":Landroid/javax/sip/TransactionTerminatedEvent;
    invoke-virtual {v5, v6, p1}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1916
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "method":Ljava/lang/String;
    .end local v5    # "sipProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    .end local v6    # "event":Landroid/javax/sip/TransactionTerminatedEvent;
    :cond_3
    goto/16 :goto_0

    .line 1918
    :cond_4
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getTransactionId()Ljava/lang/String;

    move-result-object v3

    .line 1919
    .restart local v3    # "key":Ljava/lang/String;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, v3}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v1, v4

    .line 1921
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 1922
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "REMOVED client tx "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " KEY = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1927
    :cond_5
    if-eqz v1, :cond_7

    .line 1928
    move-object v4, v1

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 1929
    .local v4, "clientTx":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getForkId()Ljava/lang/String;

    move-result-object v5

    .line 1930
    .local v5, "forkId":Ljava/lang/String;
    if-eqz v5, :cond_7

    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->isInviteTransaction()Z

    move-result v6

    if-eqz v6, :cond_7

    iget v6, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxForkTime:I

    if-eqz v6, :cond_7

    .line 1932
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 1933
    sget-object v6, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Scheduling to remove forked client transaction : forkId = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " in "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxForkTime:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " seconds"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1936
    :cond_6
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->timer:Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    new-instance v7, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$RemoveForkedTransactionTimerTask;

    invoke-direct {v7, p0, v5}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$RemoveForkedTransactionTimerTask;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Ljava/lang/String;)V

    iget v8, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxForkTime:I

    mul-int/lit16 v8, v8, 0x3e8

    int-to-long v8, v8

    invoke-interface {v6, v7, v8, v9}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    .line 1938
    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->stopExpiresTimer()V

    .line 1943
    .end local v4    # "clientTx":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .end local v5    # "forkId":Ljava/lang/String;
    :cond_7
    if-eqz v1, :cond_8

    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->testAndSetTransactionTerminatedEvent()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 1945
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v4

    .line 1947
    .local v4, "sipProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    new-instance v5, Landroid/javax/sip/TransactionTerminatedEvent;

    move-object v6, p1

    check-cast v6, Landroid/javax/sip/ClientTransaction;

    invoke-direct {v5, v4, v6}, Landroid/javax/sip/TransactionTerminatedEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/ClientTransaction;)V

    .line 1950
    .local v5, "event":Landroid/javax/sip/TransactionTerminatedEvent;
    invoke-virtual {v4, v5, p1}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1956
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "sipProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    .end local v5    # "event":Landroid/javax/sip/TransactionTerminatedEvent;
    :cond_8
    :goto_0
    if-eqz v1, :cond_9

    .line 1957
    move-object v3, v1

    check-cast v3, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->cancelMaxTxLifeTimeTimer()V

    .line 1959
    :cond_9
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 1960
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->mergeTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->terminatedServerTransactionsPendingAck:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->forkedClientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->pendingTransactions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    filled-new-array/range {v4 .. v9}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1975
    :cond_a
    return-void

    .line 1956
    :catchall_0
    move-exception v3

    if-eqz v1, :cond_b

    .line 1957
    move-object v4, v1

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->cancelMaxTxLifeTimeTimer()V

    .line 1959
    :cond_b
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 1960
    sget-object v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->mergeTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->terminatedServerTransactionsPendingAck:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->forkedClientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->pendingTransactions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    filled-new-array/range {v5 .. v10}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v0, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_c
    throw v3
.end method

.method protected removeTransactionHash(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V
    .locals 6
    .param p1, "sipTransaction"    # Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 2070
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v0

    .line 2071
    .local v0, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    if-nez v0, :cond_0

    .line 2072
    return-void

    .line 2073
    :cond_0
    const/4 v1, 0x0

    .line 2074
    .local v1, "removed":Ljava/lang/Object;
    instance-of v2, p1, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    const/16 v3, 0x20

    if-eqz v2, :cond_2

    .line 2075
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getTransactionId()Ljava/lang/String;

    move-result-object v2

    .line 2076
    .local v2, "key":Ljava/lang/String;
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2077
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 2078
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "removing client Tx : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 2080
    :cond_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v2    # "key":Ljava/lang/String;
    goto :goto_0

    .line 2082
    :cond_2
    instance-of v2, p1, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v2, :cond_3

    .line 2083
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getTransactionId()Ljava/lang/String;

    move-result-object v2

    .line 2084
    .restart local v2    # "key":Ljava/lang/String;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, v2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 2085
    sget-object v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 2086
    sget-object v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "removing server Tx : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_1

    .line 2082
    .end local v2    # "key":Ljava/lang/String;
    :cond_3
    :goto_0
    nop

    .line 2090
    :cond_4
    :goto_1
    if-eqz v1, :cond_5

    .line 2091
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->cancelMaxTxLifeTimeTimer()V

    .line 2093
    :cond_5
    return-void
.end method

.method public removeTransactionPendingAck(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)Z
    .locals 2
    .param p1, "serverTransaction"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 1193
    invoke-interface {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getBranchId()Ljava/lang/String;

    move-result-object v0

    .line 1194
    .local v0, "branchId":Ljava/lang/String;
    if-eqz v0, :cond_0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->terminatedServerTransactionsPendingAck:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1197
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->terminatedServerTransactionsPendingAck:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1198
    const/4 v1, 0x1

    return v1

    .line 1200
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method public setAddressResolver(Landroid/gov/nist/core/net/AddressResolver;)V
    .locals 0
    .param p1, "addressResolver"    # Landroid/gov/nist/core/net/AddressResolver;

    .line 2640
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->addressResolver:Landroid/gov/nist/core/net/AddressResolver;

    .line 2641
    return-void
.end method

.method public setAggressiveCleanup(Z)V
    .locals 1
    .param p1, "aggressiveCleanup"    # Z

    .line 3235
    if-eqz p1, :cond_0

    .line 3236
    sget-object v0, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->Normal:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->releaseReferencesStrategy:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    goto :goto_0

    .line 3238
    :cond_0
    sget-object v0, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->None:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->releaseReferencesStrategy:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    .line 3239
    :goto_0
    return-void
.end method

.method public setClientAuth(Landroid/gov/nist/javax/sip/stack/ClientAuthType;)V
    .locals 0
    .param p1, "clientAuth"    # Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    .line 3261
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientAuth:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    .line 3262
    return-void
.end method

.method public setConnectionLingerTimer(I)V
    .locals 0
    .param p1, "connectionLingerTimer"    # I

    .line 3447
    sput p1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->connectionLingerTimer:I

    .line 3448
    return-void
.end method

.method public setDeliverDialogTerminatedEventForNullDialog()V
    .locals 1

    .line 3071
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogTerminatedEventDeliveredForNullDialog:Z

    .line 3072
    return-void
.end method

.method public setDeliverTerminatedEventForAck(Z)V
    .locals 0
    .param p1, "deliverTerminatedEventForAck"    # Z

    .line 3114
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->deliverTerminatedEventForAck:Z

    .line 3115
    return-void
.end method

.method public setDeliverUnsolicitedNotify(Z)V
    .locals 0
    .param p1, "deliverUnsolicitedNotify"    # Z

    .line 3098
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->deliverUnsolicitedNotify:Z

    .line 3099
    return-void
.end method

.method public setEarlyDialogTimeout(I)V
    .locals 0
    .param p1, "earlyDialogTimeout"    # I

    .line 3397
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->earlyDialogTimeout:I

    .line 3398
    return-void
.end method

.method protected setHostAddress(Ljava/lang/String;)V
    .locals 2
    .param p1, "stackAddress"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .line 2378
    const/16 v0, 0x3a

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    if-eq v1, v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x5b

    if-eq v0, v1, :cond_0

    .line 2380
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->stackAddress:Ljava/lang/String;

    goto :goto_0

    .line 2382
    :cond_0
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->stackAddress:Ljava/lang/String;

    .line 2383
    :goto_0
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->stackInetAddress:Ljava/net/InetAddress;

    .line 2384
    return-void
.end method

.method public setKeepAliveTimeout(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;IJ)Z
    .locals 4
    .param p1, "myAddress"    # Ljava/lang/String;
    .param p2, "myPort"    # I
    .param p3, "transport"    # Ljava/lang/String;
    .param p4, "peerAddress"    # Ljava/lang/String;
    .param p5, "peerPort"    # I
    .param p6, "keepAliveTimeout"    # J

    .line 3339
    invoke-direct {p0, p1, p2, p3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->findMessageProcessor(Ljava/lang/String;ILjava/lang/String;)Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    .line 3341
    .local v0, "processor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    if-eqz v0, :cond_2

    instance-of v1, v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    if-nez v1, :cond_0

    goto :goto_0

    .line 3345
    :cond_0
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3346
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "~~~ Trying to find MessageChannel and set new KeepAliveTimeout( myAddress="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", myPort="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", transport="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", peerAddress="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", peerPort="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", keepAliveTimeout="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p6, p7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "), MessageProcessor="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 3350
    :cond_1
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;

    invoke-virtual {v1, p4, p5, p6, p7}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageProcessor;->setKeepAliveTimeout(Ljava/lang/String;IJ)Z

    move-result v1

    return v1

    .line 3342
    :cond_2
    :goto_0
    const/4 v1, 0x0

    return v1
.end method

.method public setLogRecordFactory(Landroid/gov/nist/javax/sip/LogRecordFactory;)V
    .locals 0
    .param p1, "logRecordFactory"    # Landroid/gov/nist/javax/sip/LogRecordFactory;

    .line 2650
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logRecordFactory:Landroid/gov/nist/javax/sip/LogRecordFactory;

    .line 2651
    return-void
.end method

.method public setLogStackTraceOnMessageSend(Z)V
    .locals 0
    .param p1, "logStackTraceOnMessageSend"    # Z

    .line 3060
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logStackTraceOnMessageSend:Z

    .line 3061
    return-void
.end method

.method public setMaxConnections(I)V
    .locals 0
    .param p1, "nconnections"    # I

    .line 2328
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxConnections:I

    .line 2329
    return-void
.end method

.method public setMaxForkTime(I)V
    .locals 0
    .param p1, "maxForkTime"    # I

    .line 3157
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxForkTime:I

    .line 3158
    return-void
.end method

.method public setMaxTxLifetimeInvite(I)V
    .locals 0
    .param p1, "maxTxLifetimeInvite"    # I

    .line 3411
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxTxLifetimeInvite:I

    .line 3412
    return-void
.end method

.method public setMaxTxLifetimeNonInvite(I)V
    .locals 0
    .param p1, "maxTxLifetimeNonInvite"    # I

    .line 3425
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxTxLifetimeNonInvite:I

    .line 3426
    return-void
.end method

.method protected setMessageFactory(Landroid/gov/nist/javax/sip/stack/StackMessageFactory;)V
    .locals 0
    .param p1, "messageFactory"    # Landroid/gov/nist/javax/sip/stack/StackMessageFactory;

    .line 2521
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipMessageFactory:Landroid/gov/nist/javax/sip/stack/StackMessageFactory;

    .line 2522
    return-void
.end method

.method public setMessageParserFactory(Landroid/gov/nist/javax/sip/parser/MessageParserFactory;)V
    .locals 0
    .param p1, "messageParserFactory"    # Landroid/gov/nist/javax/sip/parser/MessageParserFactory;

    .line 3207
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->messageParserFactory:Landroid/gov/nist/javax/sip/parser/MessageParserFactory;

    .line 3208
    return-void
.end method

.method public setMessageProcessorFactory(Landroid/gov/nist/javax/sip/stack/MessageProcessorFactory;)V
    .locals 0
    .param p1, "messageProcessorFactory"    # Landroid/gov/nist/javax/sip/stack/MessageProcessorFactory;

    .line 3221
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->messageProcessorFactory:Landroid/gov/nist/javax/sip/stack/MessageProcessorFactory;

    .line 3222
    return-void
.end method

.method public setNon2XXAckPassedToListener(Z)V
    .locals 0
    .param p1, "passToListener"    # Z

    .line 2841
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->non2XXAckPassedToListener:Z

    .line 2842
    return-void
.end method

.method public setPatchReceivedRport(Z)V
    .locals 0
    .param p1, "patchReceivedRport"    # Z

    .line 3145
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->patchReceivedRport:Z

    .line 3146
    return-void
.end method

.method public setPatchRport(Ljava/lang/Boolean;)V
    .locals 1
    .param p1, "patchRport"    # Ljava/lang/Boolean;

    .line 3137
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->patchRport:Z

    .line 3138
    return-void
.end method

.method public setPatchWebSocketHeaders(Ljava/lang/Boolean;)V
    .locals 1
    .param p1, "patchWebSocketHeaders"    # Ljava/lang/Boolean;

    .line 3129
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->patchWebSocketHeaders:Z

    .line 3130
    return-void
.end method

.method public setReceiveUdpBufferSize(I)V
    .locals 0
    .param p1, "receiveUdpBufferSize"    # I

    .line 3023
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->receiveUdpBufferSize:I

    .line 3024
    return-void
.end method

.method public setReleaseReferencesStrategy(Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;)V
    .locals 0
    .param p1, "releaseReferencesStrategy"    # Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    .line 3476
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->releaseReferencesStrategy:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    .line 3477
    return-void
.end method

.method public setReliableConnectionKeepAliveTimeout(I)V
    .locals 3
    .param p1, "reliableConnectionKeepAliveTimeout"    # I

    .line 3301
    const/16 v0, 0x10

    if-nez p1, :cond_1

    .line 3303
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3304
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "Default value (840000 ms) will be used for reliableConnectionKeepAliveTimeout stack property"

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 3306
    :cond_0
    const p1, 0xcd140

    .line 3308
    :cond_1
    sget-object v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3309
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "value "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " will be used for reliableConnectionKeepAliveTimeout stack property"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 3311
    :cond_2
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->reliableConnectionKeepAliveTimeout:I

    .line 3312
    return-void
.end method

.method protected setRouter(Landroid/javax/sip/address/Router;)V
    .locals 0
    .param p1, "router"    # Landroid/javax/sip/address/Router;

    .line 2407
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->router:Landroid/javax/sip/address/Router;

    .line 2408
    return-void
.end method

.method public setSendUdpBufferSize(I)V
    .locals 0
    .param p1, "sendUdpBufferSize"    # I

    .line 3043
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sendUdpBufferSize:I

    .line 3044
    return-void
.end method

.method public setSingleThreaded()V
    .locals 1

    .line 2284
    const/4 v0, 0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->threadPoolSize:I

    .line 2285
    return-void
.end method

.method public setSslHandshakeTimeout(J)V
    .locals 0
    .param p1, "sslHandshakeTimeout"    # J

    .line 3390
    iput-wide p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sslHandshakeTimeout:J

    .line 3391
    return-void
.end method

.method public setSslRenegotiationEnabled(Z)V
    .locals 0
    .param p1, "sslRenegotiationEnabled"    # Z

    .line 3433
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sslRenegotiationEnabled:Z

    .line 3434
    return-void
.end method

.method public setStackCongestionControlTimeout(I)V
    .locals 0
    .param p1, "stackCongestionControlTimeout"    # I

    .line 3462
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->stackCongestionControlTimeout:I

    .line 3463
    return-void
.end method

.method public setStackName(Ljava/lang/String;)V
    .locals 0
    .param p1, "stackName"    # Ljava/lang/String;

    .line 2365
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->stackName:Ljava/lang/String;

    .line 2366
    return-void
.end method

.method public setTcpPostParsingThreadPoolSize(I)V
    .locals 0
    .param p1, "tcpPostParsingThreadPoolSize"    # I

    .line 2306
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->tcpPostParsingThreadPoolSize:I

    .line 2307
    return-void
.end method

.method public setThreadPoolSize(I)V
    .locals 0
    .param p1, "size"    # I

    .line 2318
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->threadPoolSize:I

    .line 2319
    return-void
.end method

.method public setThreadPriority(I)V
    .locals 3
    .param p1, "threadPriority"    # I

    .line 3275
    const/4 v0, 0x1

    if-lt p1, v0, :cond_2

    .line 3277
    const/16 v0, 0xa

    if-gt p1, v0, :cond_1

    .line 3279
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x10

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3280
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Setting Stack Thread priority to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 3282
    :cond_0
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->threadPriority:I

    .line 3283
    return-void

    .line 3278
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The Stack Thread Priority shouldn\'t be higher than Thread.MAX_PRIORITY"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3276
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The Stack Thread Priority shouldn\'t be lower than Thread.MIN_PRIORITY"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setTimer(Landroid/gov/nist/javax/sip/stack/timers/SipTimer;)V
    .locals 0
    .param p1, "timer"    # Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    .line 2993
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->timer:Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    .line 2994
    return-void
.end method

.method public stopStack()V
    .locals 3

    .line 2146
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->toExit:Z

    .line 2149
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->pendingTransactions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 2150
    monitor-enter p0

    .line 2151
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 2152
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 2153
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    monitor-enter v0

    .line 2154
    :try_start_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 2155
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2157
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->selfRoutingThreadpoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_0

    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->selfRoutingThreadpoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    instance-of v0, v0, Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_0

    .line 2158
    sget-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->selfRoutingThreadpoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 2160
    :cond_0
    const/4 v0, 0x0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->selfRoutingThreadpoolExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    .line 2164
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageProcessors()[Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v0

    .line 2165
    .local v0, "processorList":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    const/4 v1, 0x0

    .local v1, "processorIndex":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 2166
    aget-object v2, v0, v1

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeMessageProcessor(Landroid/gov/nist/javax/sip/stack/MessageProcessor;)V

    .line 2165
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2168
    .end local v1    # "processorIndex":I
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->closeAllSockets()V

    .line 2171
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->timer:Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    if-eqz v1, :cond_2

    .line 2172
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->timer:Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->stop()V

    .line 2174
    :cond_2
    const-wide/16 v1, 0x3e8

    :try_start_2
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 2176
    goto :goto_1

    .line 2175
    :catch_0
    move-exception v1

    .line 2177
    :goto_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 2178
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverTransactionTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 2180
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 2181
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->serverLogger:Landroid/gov/nist/core/ServerLogger;

    invoke-interface {v1}, Landroid/gov/nist/core/ServerLogger;->closeLogFile()V

    .line 2183
    return-void

    .line 2155
    .end local v0    # "processorList":[Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1

    .line 2152
    :catchall_1
    move-exception v0

    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v0
.end method

.method public declared-synchronized transactionErrorEvent(Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;)V
    .locals 3
    .param p1, "transactionErrorEvent"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;

    monitor-enter p0

    .line 2103
    :try_start_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;->getSource()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 2106
    .local v0, "transaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;->getErrorID()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 2108
    const/4 v1, 0x5

    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->setState(I)V

    .line 2109
    instance-of v1, v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v1, :cond_0

    .line 2111
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setCollectionTime(I)V

    .line 2113
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    :cond_0
    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->disableTimeoutTimer()V

    .line 2114
    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->disableRetransmissionTimer()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2117
    :cond_1
    monitor-exit p0

    return-void

    .line 2102
    .end local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    .end local p1    # "transactionErrorEvent":Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
