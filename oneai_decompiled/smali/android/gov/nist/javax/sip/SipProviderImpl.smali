.class public Landroid/gov/nist/javax/sip/SipProviderImpl;
.super Ljava/lang/Object;
.source "SipProviderImpl.java"

# interfaces
.implements Landroid/javax/sip/SipProvider;
.implements Landroid/gov/nist/javax/sip/SipProviderExt;
.implements Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;
.implements Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private automaticDialogSupportEnabled:Z

.field private dialogErrorsAutomaticallyHandled:Z

.field protected eventScanner:Landroid/gov/nist/javax/sip/EventScanner;

.field private listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Landroid/javax/sip/ListeningPoint;",
            ">;"
        }
    .end annotation
.end field

.field private sipListener:Landroid/javax/sip/SipListener;

.field protected sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 102
    const-class v0, Landroid/gov/nist/javax/sip/SipProviderImpl;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->dialogErrorsAutomaticallyHandled:Z

    .line 121
    return-void
.end method

.method protected constructor <init>(Landroid/gov/nist/javax/sip/SipStackImpl;)V
    .locals 1
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/SipStackImpl;

    .line 190
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->dialogErrorsAutomaticallyHandled:Z

    .line 191
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/SipStackImpl;->getEventScanner()Landroid/gov/nist/javax/sip/EventScanner;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->eventScanner:Landroid/gov/nist/javax/sip/EventScanner;

    .line 192
    iput-object p1, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    .line 193
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->eventScanner:Landroid/gov/nist/javax/sip/EventScanner;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/EventScanner;->incrementRefcount()V

    .line 194
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    .line 195
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->isAutomaticDialogSupportEnabled()Z

    move-result v0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->automaticDialogSupportEnabled:Z

    .line 197
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->isAutomaticDialogErrorHandlingEnabled()Z

    move-result v0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->dialogErrorsAutomaticallyHandled:Z

    .line 198
    return-void
.end method


# virtual methods
.method public declared-synchronized addListeningPoint(Landroid/javax/sip/ListeningPoint;)V
    .locals 4
    .param p1, "listeningPoint"    # Landroid/javax/sip/ListeningPoint;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/ObjectInUseException;
        }
    .end annotation

    monitor-enter p0

    .line 1075
    :try_start_0
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 1076
    .local v0, "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    iget-object v1, v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    if-eqz v1, :cond_1

    iget-object v1, v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    if-ne v1, p0, :cond_0

    goto :goto_0

    .line 1077
    :cond_0
    new-instance v1, Landroid/javax/sip/ObjectInUseException;

    const-string v2, "Listening point assigned to another provider"

    invoke-direct {v1, v2}, Landroid/javax/sip/ObjectInUseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1079
    .end local p0    # "this":Landroid/gov/nist/javax/sip/SipProviderImpl;
    :cond_1
    :goto_0
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getTransport()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    .line 1082
    .local v1, "transport":Ljava/lang/String;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_2

    goto :goto_1

    .line 1084
    :cond_2
    new-instance v2, Landroid/javax/sip/ObjectInUseException;

    const-string v3, "Listening point already assigned for transport!"

    invoke-direct {v2, v3}, Landroid/javax/sip/ObjectInUseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1088
    :cond_3
    :goto_1
    iput-object p0, v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    .line 1090
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1092
    monitor-exit p0

    return-void

    .line 1074
    .end local v0    # "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    .end local v1    # "transport":Ljava/lang/String;
    .end local p1    # "listeningPoint":Landroid/javax/sip/ListeningPoint;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public addSipListener(Landroid/javax/sip/SipListener;)V
    .locals 3
    .param p1, "sipListener"    # Landroid/javax/sip/SipListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/TooManyListenersException;
        }
    .end annotation

    .line 218
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/SipStackImpl;->sipListener:Landroid/javax/sip/SipListener;

    if-nez v0, :cond_0

    .line 219
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    iput-object p1, v0, Landroid/gov/nist/javax/sip/SipStackImpl;->sipListener:Landroid/javax/sip/SipListener;

    goto :goto_0

    .line 220
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/SipStackImpl;->sipListener:Landroid/javax/sip/SipListener;

    if-ne v0, p1, :cond_2

    .line 225
    :goto_0
    sget-object v0, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 226
    sget-object v0, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "add SipListener "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 227
    :cond_1
    iput-object p1, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipListener:Landroid/javax/sip/SipListener;

    .line 229
    return-void

    .line 221
    :cond_2
    new-instance v0, Ljava/util/TooManyListenersException;

    const-string/jumbo v1, "Stack already has a listener. Only one listener per stack allowed"

    invoke-direct {v0, v1}, Ljava/util/TooManyListenersException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 206
    new-instance v0, Ljava/lang/CloneNotSupportedException;

    invoke-direct {v0}, Ljava/lang/CloneNotSupportedException;-><init>()V

    throw v0
.end method

.method protected createClientTransaction(Landroid/javax/sip/message/Request;Landroid/javax/sip/address/Hop;)Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .locals 12
    .param p1, "request"    # Landroid/javax/sip/message/Request;
    .param p2, "hop"    # Landroid/javax/sip/address/Hop;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/TransactionUnavailableException;
        }
    .end annotation

    .line 271
    const-string/jumbo v0, "Unexpected Exception FIXME! "

    if-eqz p1, :cond_17

    .line 273
    if-eqz p2, :cond_16

    .line 275
    iget-object v1, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/SipStackImpl;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_15

    .line 278
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 279
    .local v1, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTransaction()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_14

    .line 282
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ACK"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_13

    .line 287
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_2

    .line 288
    const/4 v2, 0x0

    .line 289
    .local v2, "transport":Ljava/lang/String;
    invoke-interface {p2}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v2

    .line 290
    if-nez v2, :cond_0

    const-string/jumbo v2, "udp"

    .line 291
    :cond_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 293
    .local v4, "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    if-nez v4, :cond_1

    .line 295
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoints()[Landroid/javax/sip/ListeningPoint;

    move-result-object v5

    aget-object v5, v5, v3

    move-object v4, v5

    check-cast v4, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 297
    :cond_1
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getViaHeader()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v5

    .line 298
    .local v5, "via":Landroid/gov/nist/javax/sip/header/Via;
    invoke-virtual {v1, v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 302
    .end local v2    # "transport":Ljava/lang/String;
    .end local v4    # "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    .end local v5    # "via":Landroid/gov/nist/javax/sip/header/Via;
    :cond_2
    :try_start_0
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->checkHeaders()V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_3

    .line 305
    nop

    .line 311
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v4, "z9hG4bK"

    if-eqz v2, :cond_4

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v2, v1, v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->findTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v2

    if-nez v2, :cond_3

    goto :goto_0

    .line 315
    :cond_3
    new-instance v0, Landroid/javax/sip/TransactionUnavailableException;

    const-string/jumbo v2, "Transaction already exists!"

    invoke-direct {v0, v2}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 322
    :cond_4
    :goto_0
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    const-string v5, "CANCEL"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 323
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v2, v1, v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->findCancelTransaction(Landroid/gov/nist/javax/sip/message/SIPRequest;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 325
    .local v2, "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    if-eqz v2, :cond_6

    .line 326
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getMessageChannel()Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v4

    invoke-virtual {v0, v1, v4}, Landroid/gov/nist/javax/sip/SipStackImpl;->createClientTransaction(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    move-result-object v0

    .line 328
    .local v0, "retval":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    invoke-interface {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->addEventListener(Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;)V

    .line 329
    iget-object v4, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v4, v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V

    .line 330
    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 331
    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v4, v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    .line 334
    :cond_5
    return-object v0

    .line 338
    .end local v0    # "retval":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .end local v2    # "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    :cond_6
    sget-object v2, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v5, 0x20

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 339
    sget-object v2, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "could not find existing transaction for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " creating a new one "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 347
    :cond_7
    invoke-interface {p2}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v2

    .line 348
    .local v2, "transport":Ljava/lang/String;
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 350
    .local v6, "listeningPoint":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    sget-object v7, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v7

    const-string v8, " for transport "

    if-eqz v7, :cond_8

    .line 351
    sget-object v7, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Got following Listenin point "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 357
    :cond_8
    if-nez v6, :cond_9

    .line 358
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v7

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/header/Via;->getTransport()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v7

    move-object v6, v7

    check-cast v6, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 360
    sget-object v7, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v7, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 361
    sget-object v5, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Listenig point was null using new one from Via header "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v8

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/header/Via;->getTransport()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 369
    :cond_9
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v5

    .line 370
    .local v5, "dialogId":Ljava/lang/String;
    iget-object v7, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v7, v5}, Landroid/gov/nist/javax/sip/SipStackImpl;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v7

    .line 371
    .local v7, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    if-eqz v7, :cond_a

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v8

    sget-object v9, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    if-ne v8, v9, :cond_a

    .line 376
    iget-object v8, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v8, v7}, Landroid/gov/nist/javax/sip/SipStackImpl;->removeDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V

    .line 389
    :cond_a
    const/4 v8, 0x0

    .line 390
    .local v8, "branchId":Ljava/lang/String;
    :try_start_1
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v9

    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_b

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v9

    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_b

    iget-object v4, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/SipStackImpl;->checkBranchId()Z

    move-result v4

    if-eqz v4, :cond_c

    .line 394
    :cond_b
    invoke-static {}, Landroid/gov/nist/javax/sip/Utils;->getInstance()Landroid/gov/nist/javax/sip/Utils;

    move-result-object v4

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/Utils;->generateBranchId()Ljava/lang/String;

    move-result-object v4

    move-object v8, v4

    .line 396
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v4

    invoke-virtual {v4, v8}, Landroid/gov/nist/javax/sip/header/Via;->setBranch(Ljava/lang/String;)V

    .line 398
    :cond_c
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v4

    .line 401
    .local v4, "topmostVia":Landroid/gov/nist/javax/sip/header/Via;
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/Via;->getTransport()Ljava/lang/String;

    move-result-object v9

    if-nez v9, :cond_d

    .line 402
    invoke-virtual {v4, v2}, Landroid/gov/nist/javax/sip/header/Via;->setTransport(Ljava/lang/String;)V

    .line 404
    :cond_d
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/header/Via;->getPort()I

    move-result v9

    const/4 v10, -0x1

    if-ne v9, v10, :cond_e

    .line 405
    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getPort()I

    move-result v9

    invoke-virtual {v4, v9}, Landroid/gov/nist/javax/sip/header/Via;->setPort(I)V

    .line 406
    :cond_e
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v9

    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v9

    move-object v8, v9

    .line 408
    iget-object v9, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v10

    invoke-virtual {v9, v1, v10, p2}, Landroid/gov/nist/javax/sip/SipStackImpl;->createMessageChannel(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageProcessor;Landroid/javax/sip/address/Hop;)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v9

    .line 411
    .local v9, "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    iget-object v10, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v10, v1, v9}, Landroid/gov/nist/javax/sip/SipStackImpl;->createClientTransaction(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    move-result-object v10

    .line 412
    .local v10, "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    if-eqz v10, :cond_12

    .line 414
    invoke-interface {v10, p2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setNextHop(Landroid/javax/sip/address/Hop;)V

    .line 415
    invoke-interface {v10, v1}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setOriginalRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 416
    invoke-interface {v10, v8}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setBranch(Ljava/lang/String;)V

    .line 418
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogCreated(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_10

    .line 424
    if-eqz v7, :cond_f

    .line 425
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v10, v7, v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    goto :goto_1

    .line 426
    :cond_f
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isAutomaticDialogSupportEnabled()Z

    move-result v11

    if-eqz v11, :cond_11

    .line 427
    iget-object v11, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v11, v10}, Landroid/gov/nist/javax/sip/SipStackImpl;->createDialog(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v11

    .line 428
    .local v11, "sipDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v10, v11, v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    .line 429
    .end local v11    # "sipDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    goto :goto_1

    .line 431
    :cond_10
    if-eqz v7, :cond_11

    .line 432
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v10, v7, v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    .line 438
    :cond_11
    :goto_1
    invoke-interface {v10, p0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->addEventListener(Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;)V

    .line 439
    return-object v10

    .line 413
    :cond_12
    new-instance v3, Landroid/javax/sip/TransactionUnavailableException;

    const-string v11, "Cound not create tx"

    invoke-direct {v3, v11}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;)V

    .end local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v2    # "transport":Ljava/lang/String;
    .end local v5    # "dialogId":Ljava/lang/String;
    .end local v6    # "listeningPoint":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    .end local v7    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .end local p1    # "request":Landroid/javax/sip/message/Request;
    .end local p2    # "hop":Landroid/javax/sip/address/Hop;
    throw v3
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 450
    .end local v4    # "topmostVia":Landroid/gov/nist/javax/sip/header/Via;
    .end local v8    # "branchId":Ljava/lang/String;
    .end local v9    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .end local v10    # "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .restart local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v2    # "transport":Ljava/lang/String;
    .restart local v5    # "dialogId":Ljava/lang/String;
    .restart local v6    # "listeningPoint":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    .restart local v7    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .restart local p1    # "request":Landroid/javax/sip/message/Request;
    .restart local p2    # "hop":Landroid/javax/sip/address/Hop;
    :catch_0
    move-exception v3

    .line 451
    .local v3, "ex":Landroid/javax/sip/InvalidArgumentException;
    invoke-static {v3}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 452
    new-instance v4, Landroid/javax/sip/TransactionUnavailableException;

    invoke-direct {v4, v0, v3}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 446
    .end local v3    # "ex":Landroid/javax/sip/InvalidArgumentException;
    :catch_1
    move-exception v3

    .line 447
    .local v3, "ex":Ljava/text/ParseException;
    invoke-static {v3}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 448
    new-instance v4, Landroid/javax/sip/TransactionUnavailableException;

    invoke-direct {v4, v0, v3}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 440
    .end local v3    # "ex":Ljava/text/ParseException;
    :catch_2
    move-exception v0

    .line 442
    .local v0, "ex":Ljava/io/IOException;
    new-instance v3, Landroid/javax/sip/TransactionUnavailableException;

    const-string v4, "Could not resolve next hop or listening point unavailable! "

    invoke-direct {v3, v4, v0}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 303
    .end local v0    # "ex":Ljava/io/IOException;
    .end local v2    # "transport":Ljava/lang/String;
    .end local v5    # "dialogId":Ljava/lang/String;
    .end local v6    # "listeningPoint":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    .end local v7    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :catch_3
    move-exception v0

    .line 304
    .local v0, "ex":Ljava/text/ParseException;
    new-instance v2, Landroid/javax/sip/TransactionUnavailableException;

    invoke-virtual {v0}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 283
    .end local v0    # "ex":Ljava/text/ParseException;
    :cond_13
    new-instance v0, Landroid/javax/sip/TransactionUnavailableException;

    const-string v2, "Cannot create client transaction for  ACK"

    invoke-direct {v0, v2}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 280
    :cond_14
    new-instance v0, Landroid/javax/sip/TransactionUnavailableException;

    const-string/jumbo v2, "Transaction already assigned to request"

    invoke-direct {v0, v2}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 276
    .end local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_15
    new-instance v0, Landroid/javax/sip/TransactionUnavailableException;

    const-string/jumbo v1, "Stack is stopped"

    invoke-direct {v0, v1}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 274
    :cond_16
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null hop"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 272
    :cond_17
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null request"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public dialogErrorEvent(Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;)V
    .locals 5
    .param p1, "dialogErrorEvent"    # Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;

    .line 1035
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->getSource()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 1036
    .local v0, "sipDialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    sget-object v1, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->AckNotReceived:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    .line 1037
    .local v1, "reason":Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->getErrorID()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 1038
    sget-object v1, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->AckNotSent:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    goto :goto_0

    .line 1039
    :cond_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->getErrorID()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_1

    .line 1040
    sget-object v1, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->ReInviteTimeout:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    goto :goto_0

    .line 1041
    :cond_1
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->getErrorID()I

    move-result v2

    const/4 v3, 0x4

    if-ne v2, v3, :cond_2

    .line 1042
    sget-object v1, Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;->EarlyStateTimeout:Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;

    .line 1044
    :cond_2
    :goto_0
    sget-object v2, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1045
    sget-object v2, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Dialog TimeoutError occured on "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1048
    :cond_3
    new-instance v2, Landroid/gov/nist/javax/sip/DialogTimeoutEvent;

    invoke-direct {v2, p0, v0, v1}, Landroid/gov/nist/javax/sip/DialogTimeoutEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/Dialog;Landroid/gov/nist/javax/sip/DialogTimeoutEvent$Reason;)V

    .line 1049
    .local v2, "ev":Landroid/gov/nist/javax/sip/DialogTimeoutEvent;
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPDialogErrorEvent;->getClientTransaction()Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/DialogTimeoutEvent;->setClientTransaction(Landroid/javax/sip/ClientTransaction;)V

    .line 1052
    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 1053
    return-void
.end method

.method public getListeningPoint()Landroid/javax/sip/ListeningPoint;
    .locals 1

    .line 238
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 239
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/ListeningPoint;

    return-object v0

    .line 242
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;
    .locals 2
    .param p1, "transport"    # Ljava/lang/String;

    .line 145
    if-eqz p1, :cond_0

    .line 147
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/ListeningPoint;

    return-object v0

    .line 146
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null transport param"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public declared-synchronized getListeningPoints()[Landroid/javax/sip/ListeningPoint;
    .locals 2

    monitor-enter p0

    .line 1062
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v0

    new-array v0, v0, [Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 1064
    .local v0, "retval":[Landroid/javax/sip/ListeningPoint;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1065
    monitor-exit p0

    return-object v0

    .line 1061
    .end local v0    # "retval":[Landroid/javax/sip/ListeningPoint;
    .end local p0    # "this":Landroid/gov/nist/javax/sip/SipProviderImpl;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public getNewCallId()Landroid/javax/sip/header/CallIdHeader;
    .locals 3

    .line 251
    invoke-static {}, Landroid/gov/nist/javax/sip/Utils;->getInstance()Landroid/gov/nist/javax/sip/Utils;

    move-result-object v0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint()Landroid/javax/sip/ListeningPoint;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/ListeningPoint;->getIPAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/Utils;->generateCallIdentifier(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 253
    .local v0, "callId":Ljava/lang/String;
    new-instance v1, Landroid/gov/nist/javax/sip/header/CallID;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/CallID;-><init>()V

    .line 255
    .local v1, "callid":Landroid/gov/nist/javax/sip/header/CallID;
    :try_start_0
    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/header/CallID;->setCallId(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 257
    goto :goto_0

    .line 256
    :catch_0
    move-exception v2

    .line 258
    :goto_0
    return-object v1
.end method

.method public getNewClientTransaction(Landroid/javax/sip/message/Request;)Landroid/javax/sip/ClientTransaction;
    .locals 4
    .param p1, "request"    # Landroid/javax/sip/message/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/TransactionUnavailableException;
        }
    .end annotation

    .line 464
    const-string v0, "Cannot resolve next hop -- transaction unavailable"

    const/4 v1, 0x0

    .line 466
    .local v1, "hop":Landroid/javax/sip/address/Hop;
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    move-object v3, p1

    check-cast v3, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->getNextHop(Landroid/gov/nist/javax/sip/message/SIPRequest;)Landroid/javax/sip/address/Hop;

    move-result-object v2
    :try_end_0
    .catch Landroid/javax/sip/SipException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v2

    .line 467
    if-eqz v1, :cond_0

    .line 473
    nop

    .line 474
    invoke-virtual {p0, p1, v1}, Landroid/gov/nist/javax/sip/SipProviderImpl;->createClientTransaction(Landroid/javax/sip/message/Request;Landroid/javax/sip/address/Hop;)Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    move-result-object v0

    .line 475
    .local v0, "newClientTransaction":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V

    .line 476
    return-object v0

    .line 468
    .end local v0    # "newClientTransaction":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    :cond_0
    :try_start_1
    new-instance v2, Landroid/javax/sip/TransactionUnavailableException;

    invoke-direct {v2, v0}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;)V

    .end local v1    # "hop":Landroid/javax/sip/address/Hop;
    .end local p1    # "request":Landroid/javax/sip/message/Request;
    throw v2
    :try_end_1
    .catch Landroid/javax/sip/SipException; {:try_start_1 .. :try_end_1} :catch_0

    .line 470
    .restart local v1    # "hop":Landroid/javax/sip/address/Hop;
    .restart local p1    # "request":Landroid/javax/sip/message/Request;
    :catch_0
    move-exception v2

    .line 471
    .local v2, "ex":Landroid/javax/sip/SipException;
    new-instance v3, Landroid/javax/sip/TransactionUnavailableException;

    invoke-direct {v3, v0, v2}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public getNewDialog(Landroid/javax/sip/Transaction;)Landroid/javax/sip/Dialog;
    .locals 9
    .param p1, "transaction"    # Landroid/javax/sip/Transaction;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 876
    if-eqz p1, :cond_a

    .line 879
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 882
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isAutomaticDialogSupportEnabled()Z

    move-result v0

    if-nez v0, :cond_8

    .line 885
    invoke-interface {p1}, Landroid/javax/sip/Transaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/message/Request;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogCreated(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 889
    const/4 v0, 0x0

    .line 890
    .local v0, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 892
    .local v1, "sipTransaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    instance-of v2, p1, Landroid/javax/sip/ServerTransaction;

    const/4 v3, 0x0

    if-eqz v2, :cond_4

    .line 893
    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 894
    .local v2, "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getLastResponse()Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v4

    .line 895
    .local v4, "response":Landroid/javax/sip/message/Response;
    if-eqz v4, :cond_1

    .line 896
    invoke-interface {v4}, Landroid/javax/sip/message/Response;->getStatusCode()I

    move-result v5

    const/16 v6, 0x64

    if-ne v5, v6, :cond_0

    goto :goto_0

    .line 897
    :cond_0
    new-instance v3, Landroid/javax/sip/SipException;

    const-string v5, "Cannot set dialog after response has been sent"

    invoke-direct {v3, v5}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 900
    :cond_1
    :goto_0
    invoke-interface {p1}, Landroid/javax/sip/Transaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 901
    .local v5, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v7

    .line 902
    .local v7, "dialogId":Ljava/lang/String;
    iget-object v8, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v8, v7}, Landroid/gov/nist/javax/sip/SipStackImpl;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v0

    .line 903
    if-nez v0, :cond_2

    .line 904
    iget-object v6, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    move-object v8, p1

    check-cast v8, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-virtual {v6, v8}, Landroid/gov/nist/javax/sip/SipStackImpl;->createDialog(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v0

    .line 906
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Z

    .line 907
    invoke-virtual {v0, v5}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addRoute(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 908
    invoke-interface {v1, v0, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    goto :goto_1

    .line 911
    :cond_2
    invoke-virtual {v5, v6}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v0, v3}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    .line 913
    :goto_1
    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v3

    const-string v6, "INVITE"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isDialogErrorsAutomaticallyHandled()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 914
    iget-object v3, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v3, v2, v5}, Landroid/gov/nist/javax/sip/SipStackImpl;->putInMergeTable(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 916
    .end local v2    # "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v4    # "response":Landroid/javax/sip/message/Response;
    .end local v5    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v7    # "dialogId":Ljava/lang/String;
    :cond_3
    goto :goto_2

    .line 918
    :cond_4
    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 920
    .local v2, "sipClientTx":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getLastResponse()Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v4

    .line 922
    .local v4, "response":Landroid/gov/nist/javax/sip/message/SIPResponse;
    if-nez v4, :cond_6

    .line 925
    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 927
    .local v5, "request":Landroid/gov/nist/javax/sip/message/SIPRequest;
    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v6

    .line 928
    .local v6, "dialogId":Ljava/lang/String;
    iget-object v7, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v7, v6}, Landroid/gov/nist/javax/sip/SipStackImpl;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v0

    .line 929
    if-nez v0, :cond_5

    .line 932
    iget-object v7, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v7, v1}, Landroid/gov/nist/javax/sip/SipStackImpl;->createDialog(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v0

    .line 934
    invoke-interface {v2, v0, v3}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    .line 936
    .end local v5    # "request":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v6    # "dialogId":Ljava/lang/String;
    nop

    .line 941
    .end local v2    # "sipClientTx":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .end local v4    # "response":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :goto_2
    invoke-virtual {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addEventListener(Landroid/gov/nist/javax/sip/stack/SIPDialogEventListener;)V

    .line 942
    return-object v0

    .line 930
    .restart local v2    # "sipClientTx":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .restart local v4    # "response":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .restart local v5    # "request":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v6    # "dialogId":Ljava/lang/String;
    :cond_5
    new-instance v3, Landroid/javax/sip/SipException;

    const-string v7, "Dialog already exists!"

    invoke-direct {v3, v7}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 937
    .end local v5    # "request":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v6    # "dialogId":Ljava/lang/String;
    :cond_6
    new-instance v3, Landroid/javax/sip/SipException;

    const-string v5, "Cannot call this method after response is received!"

    invoke-direct {v3, v5}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 886
    .end local v0    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    .end local v1    # "sipTransaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    .end local v2    # "sipClientTx":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .end local v4    # "response":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :cond_7
    new-instance v0, Landroid/javax/sip/SipException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Dialog cannot be created for this method "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Landroid/javax/sip/Transaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v2

    invoke-interface {v2}, Landroid/javax/sip/message/Request;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 883
    :cond_8
    new-instance v0, Landroid/javax/sip/SipException;

    const-string v1, " Error - AUTOMATIC_DIALOG_SUPPORT is on"

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 880
    :cond_9
    new-instance v0, Landroid/javax/sip/SipException;

    const-string/jumbo v1, "Stack is stopped."

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 877
    :cond_a
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null transaction!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getNewServerTransaction(Landroid/javax/sip/message/Request;)Landroid/javax/sip/ServerTransaction;
    .locals 6
    .param p1, "request"    # Landroid/javax/sip/message/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/TransactionAlreadyExistsException;,
            Landroid/javax/sip/TransactionUnavailableException;
        }
    .end annotation

    .line 488
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 490
    const/4 v0, 0x0

    .line 491
    .local v0, "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 493
    .local v1, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :try_start_0
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->checkHeaders()V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_2

    .line 496
    nop

    .line 498
    invoke-interface {p1}, Landroid/javax/sip/message/Request;->getMethod()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ACK"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 499
    sget-object v2, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 500
    sget-object v2, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "Creating server transaction for ACK -- makes no sense!"

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 501
    :cond_0
    new-instance v2, Landroid/javax/sip/TransactionUnavailableException;

    const-string v3, "Cannot create Server transaction for ACK "

    invoke-direct {v2, v3}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 506
    :cond_1
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    const-string v3, "NOTIFY"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFromTag()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getToTag()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    .line 510
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint()Landroid/javax/sip/ListeningPoint;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-virtual {v2, v1, v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->findSubscribeTransaction(Landroid/gov/nist/javax/sip/message/SIPRequest;Landroid/gov/nist/javax/sip/ListeningPointImpl;)Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    move-result-object v2

    .line 513
    .local v2, "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    if-nez v2, :cond_3

    iget-object v3, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->isDeliverUnsolicitedNotify()Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    .line 514
    :cond_2
    new-instance v3, Landroid/javax/sip/TransactionUnavailableException;

    const-string v4, "Cannot find matching Subscription (and android.gov.nist.javax.sip.DELIVER_UNSOLICITED_NOTIFY not set)"

    invoke-direct {v3, v4}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 518
    .end local v2    # "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    :cond_3
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/SipStackImpl;->acquireSem()Z

    move-result v2

    if-eqz v2, :cond_17

    .line 523
    :try_start_1
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogCreated(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_a

    .line 524
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    move-object v4, p1

    check-cast v4, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v2, v4, v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->findTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v2

    if-nez v2, :cond_9

    .line 528
    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTransaction()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-object v0, v2

    .line 530
    if-eqz v0, :cond_8

    .line 533
    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v2

    if-nez v2, :cond_4

    .line 534
    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setOriginalRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 536
    :cond_4
    :try_start_2
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 540
    nop

    .line 542
    :try_start_3
    invoke-interface {v0, p0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->addEventListener(Landroid/gov/nist/javax/sip/stack/SIPTransactionEventListener;)V

    .line 543
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isAutomaticDialogSupportEnabled()Z

    move-result v2

    if-eqz v2, :cond_d

    .line 546
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v2

    .line 547
    .local v2, "dialogId":Ljava/lang/String;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v4, v2}, Landroid/gov/nist/javax/sip/SipStackImpl;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v4

    .line 548
    .local v4, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    if-nez v4, :cond_5

    .line 549
    iget-object v5, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v5, v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->createDialog(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v5

    move-object v4, v5

    .line 552
    :cond_5
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v4, v3}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V

    .line 553
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v3

    const-string v5, "INVITE"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isDialogErrorsAutomaticallyHandled()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 554
    iget-object v3, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v3, v0, v1}, Landroid/gov/nist/javax/sip/SipStackImpl;->putInMergeTable(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 556
    :cond_6
    invoke-virtual {v4, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addRoute(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 557
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getRemoteTag()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_7

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getLocalTag()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_7

    .line 559
    iget-object v3, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/SipStackImpl;->putDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 561
    .end local v2    # "dialogId":Ljava/lang/String;
    .end local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :cond_7
    goto :goto_1

    .line 537
    :catch_0
    move-exception v2

    .line 538
    .local v2, "ex":Ljava/io/IOException;
    new-instance v3, Landroid/javax/sip/TransactionUnavailableException;

    const-string v4, "Error sending provisional response"

    invoke-direct {v3, v4}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;)V

    .end local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local p1    # "request":Landroid/javax/sip/message/Request;
    throw v3

    .line 531
    .end local v2    # "ex":Ljava/io/IOException;
    .restart local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .restart local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local p1    # "request":Landroid/javax/sip/message/Request;
    :cond_8
    new-instance v2, Landroid/javax/sip/TransactionUnavailableException;

    const-string/jumbo v3, "Transaction not available"

    invoke-direct {v2, v3}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;)V

    .end local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local p1    # "request":Landroid/javax/sip/message/Request;
    throw v2

    .line 525
    .restart local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .restart local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local p1    # "request":Landroid/javax/sip/message/Request;
    :cond_9
    new-instance v2, Landroid/javax/sip/TransactionAlreadyExistsException;

    const-string/jumbo v3, "server transaction already exists!"

    invoke-direct {v2, v3}, Landroid/javax/sip/TransactionAlreadyExistsException;-><init>(Ljava/lang/String;)V

    .end local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local p1    # "request":Landroid/javax/sip/message/Request;
    throw v2

    .line 564
    .restart local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .restart local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local p1    # "request":Landroid/javax/sip/message/Request;
    :cond_a
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isAutomaticDialogSupportEnabled()Z

    move-result v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const-string/jumbo v4, "Transaction exists! "

    if-eqz v2, :cond_10

    .line 570
    :try_start_4
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    move-object v5, p1

    check-cast v5, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v2, v5, v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->findTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-object v0, v2

    .line 572
    if-nez v0, :cond_f

    .line 575
    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTransaction()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-object v0, v2

    .line 577
    if-eqz v0, :cond_e

    .line 580
    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v2

    if-nez v2, :cond_b

    .line 581
    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setOriginalRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 584
    :cond_b
    :try_start_5
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 588
    nop

    .line 592
    :try_start_6
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v2

    .line 593
    .local v2, "dialogId":Ljava/lang/String;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v4, v2}, Landroid/gov/nist/javax/sip/SipStackImpl;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v4

    .line 594
    .restart local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    if-eqz v4, :cond_c

    .line 595
    invoke-virtual {v4, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Z

    .line 596
    invoke-virtual {v4, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addRoute(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 597
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v4, v3}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 600
    .end local v2    # "dialogId":Ljava/lang/String;
    .end local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :cond_c
    nop

    .line 655
    :cond_d
    :goto_1
    nop

    .line 657
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/SipStackImpl;->releaseSem()V

    return-object v0

    .line 585
    :catch_1
    move-exception v2

    .line 586
    .local v2, "ex":Ljava/io/IOException;
    :try_start_7
    new-instance v3, Landroid/javax/sip/TransactionUnavailableException;

    const-string v4, "Could not send back provisional response!"

    invoke-direct {v3, v4}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;)V

    .end local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local p1    # "request":Landroid/javax/sip/message/Request;
    throw v3

    .line 578
    .end local v2    # "ex":Ljava/io/IOException;
    .restart local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .restart local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local p1    # "request":Landroid/javax/sip/message/Request;
    :cond_e
    new-instance v2, Landroid/javax/sip/TransactionUnavailableException;

    const-string/jumbo v3, "Transaction not available!"

    invoke-direct {v2, v3}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;)V

    .end local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local p1    # "request":Landroid/javax/sip/message/Request;
    throw v2

    .line 573
    .restart local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .restart local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local p1    # "request":Landroid/javax/sip/message/Request;
    :cond_f
    new-instance v2, Landroid/javax/sip/TransactionAlreadyExistsException;

    invoke-direct {v2, v4}, Landroid/javax/sip/TransactionAlreadyExistsException;-><init>(Ljava/lang/String;)V

    .end local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local p1    # "request":Landroid/javax/sip/message/Request;
    throw v2

    .line 601
    .restart local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .restart local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local p1    # "request":Landroid/javax/sip/message/Request;
    :cond_10
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    move-object v5, p1

    check-cast v5, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v2, v5, v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->findTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-object v0, v2

    .line 603
    if-nez v0, :cond_16

    .line 606
    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTransaction()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-object v0, v2

    .line 608
    if-eqz v0, :cond_13

    .line 609
    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getOriginalRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-result-object v2

    if-nez v2, :cond_11

    .line 610
    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setOriginalRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 612
    :cond_11
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->mapTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 616
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v2

    .line 617
    .local v2, "dialogId":Ljava/lang/String;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v4, v2}, Landroid/gov/nist/javax/sip/SipStackImpl;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v4

    .line 618
    .restart local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    if-eqz v4, :cond_12

    .line 619
    invoke-virtual {v4, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Z

    .line 620
    invoke-virtual {v4, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addRoute(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 621
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v4, v3}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 625
    :cond_12
    nop

    .line 657
    iget-object v3, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->releaseSem()V

    return-object v0

    .line 629
    .end local v2    # "dialogId":Ljava/lang/String;
    .end local v4    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :cond_13
    :try_start_8
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMessageChannel()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/MessageChannel;

    .line 631
    .local v2, "mc":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v4, v2}, Landroid/gov/nist/javax/sip/SipStackImpl;->createServerTransaction(Landroid/gov/nist/javax/sip/stack/MessageChannel;)Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    move-result-object v4

    move-object v0, v4

    .line 632
    if-eqz v0, :cond_15

    .line 636
    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setOriginalRequest(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 637
    iget-object v4, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v4, v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->mapTransaction(Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V

    .line 641
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v4

    .line 642
    .local v4, "dialogId":Ljava/lang/String;
    iget-object v5, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v5, v4}, Landroid/gov/nist/javax/sip/SipStackImpl;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v5

    .line 643
    .local v5, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    if-eqz v5, :cond_14

    .line 644
    invoke-virtual {v5, v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addTransaction(Landroid/gov/nist/javax/sip/stack/SIPTransaction;)Z

    .line 645
    invoke-virtual {v5, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->addRoute(Landroid/gov/nist/javax/sip/message/SIPRequest;)V

    .line 646
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v5, v3}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->setDialog(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 650
    :cond_14
    nop

    .line 657
    iget-object v3, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->releaseSem()V

    return-object v0

    .line 633
    .end local v4    # "dialogId":Ljava/lang/String;
    .end local v5    # "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    :cond_15
    :try_start_9
    new-instance v3, Landroid/javax/sip/TransactionUnavailableException;

    const-string/jumbo v4, "Transaction unavailable -- too many servrer transactions"

    invoke-direct {v3, v4}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;)V

    .end local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local p1    # "request":Landroid/javax/sip/message/Request;
    throw v3

    .line 604
    .end local v2    # "mc":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .restart local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .restart local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local p1    # "request":Landroid/javax/sip/message/Request;
    :cond_16
    new-instance v2, Landroid/javax/sip/TransactionAlreadyExistsException;

    invoke-direct {v2, v4}, Landroid/javax/sip/TransactionAlreadyExistsException;-><init>(Ljava/lang/String;)V

    .end local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local p1    # "request":Landroid/javax/sip/message/Request;
    throw v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 657
    .restart local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .restart local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local p1    # "request":Landroid/javax/sip/message/Request;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/SipStackImpl;->releaseSem()V

    throw v2

    .line 519
    :cond_17
    new-instance v2, Landroid/javax/sip/TransactionUnavailableException;

    const-string/jumbo v3, "Transaction not available -- could not acquire stack lock"

    invoke-direct {v2, v3}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 494
    :catch_2
    move-exception v2

    .line 495
    .local v2, "ex":Ljava/text/ParseException;
    new-instance v3, Landroid/javax/sip/TransactionUnavailableException;

    invoke-virtual {v2}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 489
    .end local v0    # "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v1    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v2    # "ex":Ljava/text/ParseException;
    :cond_18
    new-instance v0, Landroid/javax/sip/TransactionUnavailableException;

    const-string/jumbo v1, "Stack is stopped"

    invoke-direct {v0, v1}, Landroid/javax/sip/TransactionUnavailableException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSipListener()Landroid/javax/sip/SipListener;
    .locals 1

    .line 1159
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipListener:Landroid/javax/sip/SipListener;

    return-object v0
.end method

.method public getSipStack()Landroid/javax/sip/SipStack;
    .locals 1

    .line 668
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    return-object v0
.end method

.method public handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V
    .locals 4
    .param p1, "sipEvent"    # Ljava/util/EventObject;
    .param p2, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 162
    sget-object v0, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 163
    sget-object v0, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "handleEvent "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "currentTransaction = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "this.sipListener = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "sipEvent.source = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/util/EventObject;->getSource()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 168
    instance-of v0, p1, Landroid/javax/sip/RequestEvent;

    const-string v2, "Dialog = "

    if-eqz v0, :cond_0

    .line 169
    move-object v0, p1

    check-cast v0, Landroid/javax/sip/RequestEvent;

    invoke-virtual {v0}, Landroid/javax/sip/RequestEvent;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    .line 170
    .local v0, "dialog":Landroid/javax/sip/Dialog;
    sget-object v3, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_0

    .line 171
    .end local v0    # "dialog":Landroid/javax/sip/Dialog;
    :cond_0
    instance-of v0, p1, Landroid/javax/sip/ResponseEvent;

    if-eqz v0, :cond_1

    .line 172
    move-object v0, p1

    check-cast v0, Landroid/javax/sip/ResponseEvent;

    invoke-virtual {v0}, Landroid/javax/sip/ResponseEvent;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v0

    .line 173
    .restart local v0    # "dialog":Landroid/javax/sip/Dialog;
    sget-object v3, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_2

    sget-object v1, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_1

    .line 171
    .end local v0    # "dialog":Landroid/javax/sip/Dialog;
    :cond_1
    :goto_0
    nop

    .line 175
    :cond_2
    :goto_1
    sget-object v0, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 178
    :cond_3
    new-instance v0, Landroid/gov/nist/javax/sip/EventWrapper;

    invoke-direct {v0, p1, p2}, Landroid/gov/nist/javax/sip/EventWrapper;-><init>(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 180
    .local v0, "eventWrapper":Landroid/gov/nist/javax/sip/EventWrapper;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/SipStackImpl;->isReEntrantListener()Z

    move-result v1

    if-nez v1, :cond_4

    .line 182
    iget-object v1, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->eventScanner:Landroid/gov/nist/javax/sip/EventScanner;

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/EventScanner;->addEvent(Landroid/gov/nist/javax/sip/EventWrapper;)V

    goto :goto_2

    .line 185
    :cond_4
    iget-object v1, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->eventScanner:Landroid/gov/nist/javax/sip/EventScanner;

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/EventScanner;->deliverEvent(Landroid/gov/nist/javax/sip/EventWrapper;)V

    .line 187
    :goto_2
    return-void
.end method

.method public isAutomaticDialogSupportEnabled()Z
    .locals 1

    .line 1139
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->automaticDialogSupportEnabled:Z

    return v0
.end method

.method public isDialogErrorsAutomaticallyHandled()Z
    .locals 1

    .line 1151
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->dialogErrorsAutomaticallyHandled:Z

    return v0
.end method

.method public declared-synchronized removeListeningPoint(Landroid/javax/sip/ListeningPoint;)V
    .locals 3
    .param p1, "listeningPoint"    # Landroid/javax/sip/ListeningPoint;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/ObjectInUseException;
        }
    .end annotation

    monitor-enter p0

    .line 1101
    :try_start_0
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 1102
    .local v0, "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    iget-object v1, v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->inUse()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1104
    iget-object v1, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getTransport()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1106
    monitor-exit p0

    return-void

    .line 1103
    .end local p0    # "this":Landroid/gov/nist/javax/sip/SipProviderImpl;
    :cond_0
    :try_start_1
    new-instance v1, Landroid/javax/sip/ObjectInUseException;

    const-string v2, "Object is in use"

    invoke-direct {v1, v2}, Landroid/javax/sip/ObjectInUseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1100
    .end local v0    # "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    .end local p1    # "listeningPoint":Landroid/javax/sip/ListeningPoint;
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized removeListeningPoints()V
    .locals 3

    monitor-enter p0

    .line 1113
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1114
    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1115
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 1116
    .local v1, "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    iget-object v2, v1, Landroid/gov/nist/javax/sip/ListeningPointImpl;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->stop()V

    .line 1117
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1118
    .end local v1    # "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    goto :goto_0

    .line 1120
    .end local v0    # "it":Ljava/util/Iterator;
    .end local p0    # "this":Landroid/gov/nist/javax/sip/SipProviderImpl;
    :cond_0
    monitor-exit p0

    return-void

    .line 1112
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public removeSipListener(Landroid/javax/sip/SipListener;)V
    .locals 5
    .param p1, "sipListener"    # Landroid/javax/sip/SipListener;

    .line 677
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v0

    const/4 v1, 0x0

    if-ne p1, v0, :cond_0

    .line 678
    iput-object v1, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipListener:Landroid/javax/sip/SipListener;

    .line 681
    :cond_0
    const/4 v0, 0x0

    .line 683
    .local v0, "found":Z
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/SipStackImpl;->getSipProviders()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/SipProviderImpl;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 684
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/SipProviderImpl;

    .line 685
    .local v3, "nextProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 686
    const/4 v0, 0x1

    .line 687
    .end local v3    # "nextProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    :cond_1
    goto :goto_0

    .line 688
    .end local v2    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/SipProviderImpl;>;"
    :cond_2
    if-nez v0, :cond_3

    .line 689
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    iput-object v1, v2, Landroid/gov/nist/javax/sip/SipStackImpl;->sipListener:Landroid/javax/sip/SipListener;

    .line 691
    :cond_3
    return-void
.end method

.method public sendRequest(Landroid/javax/sip/message/Request;)V
    .locals 11
    .param p1, "request"    # Landroid/javax/sip/message/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 699
    const-string v0, " listeningPoints = "

    const-string v1, "Could not create a message channel for "

    const-string v2, " to hop "

    const-string/jumbo v3, "done sending "

    iget-object v4, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/SipStackImpl;->isAlive()Z

    move-result v4

    if-eqz v4, :cond_c

    .line 704
    move-object v4, p1

    check-cast v4, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestLine()Landroid/gov/nist/javax/sip/header/RequestLine;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-interface {p1}, Landroid/javax/sip/message/Request;->getMethod()Ljava/lang/String;

    move-result-object v4

    const-string v5, "ACK"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 706
    iget-object v4, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    move-object v5, p1

    check-cast v5, Landroid/gov/nist/javax/sip/message/SIPRequest;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/gov/nist/javax/sip/SipStackImpl;->getDialog(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/SIPDialog;

    move-result-object v4

    .line 708
    .local v4, "dialog":Landroid/javax/sip/Dialog;
    if-eqz v4, :cond_0

    invoke-interface {v4}, Landroid/javax/sip/Dialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 709
    sget-object v5, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 710
    sget-object v5, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Dialog exists -- you may want to use Dialog.sendAck() "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v4}, Landroid/javax/sip/Dialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 715
    .end local v4    # "dialog":Landroid/javax/sip/Dialog;
    :cond_0
    iget-object v4, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    move-object v5, p1

    check-cast v5, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v4, v5}, Landroid/gov/nist/javax/sip/SipStackImpl;->getRouter(Landroid/gov/nist/javax/sip/message/SIPRequest;)Landroid/javax/sip/address/Router;

    move-result-object v4

    invoke-interface {v4, p1}, Landroid/javax/sip/address/Router;->getNextHop(Landroid/javax/sip/message/Request;)Landroid/javax/sip/address/Hop;

    move-result-object v4

    .line 716
    .local v4, "hop":Landroid/javax/sip/address/Hop;
    if-eqz v4, :cond_b

    .line 718
    move-object v5, p1

    check-cast v5, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 721
    .local v5, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->isNullRequest()Z

    move-result v6

    if-nez v6, :cond_2

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v6

    if-eqz v6, :cond_1

    goto :goto_0

    .line 722
    :cond_1
    new-instance v0, Landroid/javax/sip/SipException;

    const-string v1, "Invalid SipRequest -- no via header!"

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 730
    :cond_2
    :goto_0
    const/16 v6, 0x20

    :try_start_0
    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->isNullRequest()Z

    move-result v7

    if-nez v7, :cond_4

    .line 731
    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v7

    .line 732
    .local v7, "via":Landroid/gov/nist/javax/sip/header/Via;
    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v8

    .line 733
    .local v8, "branch":Ljava/lang/String;
    if-eqz v8, :cond_3

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_4

    .line 734
    :cond_3
    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTransactionId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/gov/nist/javax/sip/header/Via;->setBranch(Ljava/lang/String;)V

    .line 737
    .end local v7    # "via":Landroid/gov/nist/javax/sip/header/Via;
    .end local v8    # "branch":Ljava/lang/String;
    :cond_4
    const/4 v7, 0x0

    .line 738
    .local v7, "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    iget-object v8, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-interface {v4}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 740
    iget-object v8, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-interface {v4}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v9

    invoke-interface {v9}, Landroid/javax/sip/ListeningPoint;->getIPAddress()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v4}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v10

    invoke-interface {v10}, Landroid/javax/sip/ListeningPoint;->getPort()I

    move-result v10

    invoke-virtual {v8, v9, v10, v4}, Landroid/gov/nist/javax/sip/SipStackImpl;->createRawMessageChannel(Ljava/lang/String;ILandroid/javax/sip/address/Hop;)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v8

    move-object v7, v8

    .line 745
    :cond_5
    if-eqz v7, :cond_6

    .line 746
    invoke-virtual {v7, v5, v4}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Landroid/javax/sip/address/Hop;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 771
    .end local v7    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    sget-object v0, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 772
    sget-object v0, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    goto :goto_1

    .line 748
    .restart local v7    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    :cond_6
    :try_start_1
    sget-object v8, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v8, v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 749
    sget-object v8, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v4}, Landroid/javax/sip/address/Hop;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 751
    :cond_7
    new-instance v8, Landroid/javax/sip/SipException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v4}, Landroid/javax/sip/address/Hop;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v4    # "hop":Landroid/javax/sip/address/Hop;
    .end local v5    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local p1    # "request":Landroid/javax/sip/message/Request;
    throw v8
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 771
    .end local v7    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .restart local v4    # "hop":Landroid/javax/sip/address/Hop;
    .restart local v5    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local p1    # "request":Landroid/javax/sip/message/Request;
    :catchall_0
    move-exception v0

    goto :goto_2

    .line 768
    :catch_0
    move-exception v0

    .line 769
    .local v0, "ex1":Ljava/text/ParseException;
    :try_start_2
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 771
    .end local v0    # "ex1":Ljava/text/ParseException;
    sget-object v0, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 772
    sget-object v0, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    :goto_1
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Landroid/javax/sip/message/Request;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 776
    :cond_8
    return-void

    .line 755
    :catch_1
    move-exception v7

    .line 761
    .local v7, "ex":Ljava/io/IOException;
    :try_start_3
    sget-object v8, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v8, v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 762
    sget-object v8, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v4}, Landroid/javax/sip/address/Hop;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " because of an IO issue "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v7}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v8, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 765
    :cond_9
    new-instance v0, Landroid/javax/sip/SipException;

    const-string v1, "IO Exception occured while Sending Request"

    invoke-direct {v0, v1, v7}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .end local v4    # "hop":Landroid/javax/sip/address/Hop;
    .end local v5    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local p1    # "request":Landroid/javax/sip/message/Request;
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 771
    .end local v7    # "ex":Ljava/io/IOException;
    .restart local v4    # "hop":Landroid/javax/sip/address/Hop;
    .restart local v5    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local p1    # "request":Landroid/javax/sip/message/Request;
    :goto_2
    sget-object v1, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 772
    sget-object v1, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1}, Landroid/javax/sip/message/Request;->getMethod()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    :cond_a
    throw v0

    .line 717
    .end local v5    # "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_b
    new-instance v0, Landroid/javax/sip/SipException;

    const-string/jumbo v1, "could not determine next hop!"

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 700
    .end local v4    # "hop":Landroid/javax/sip/address/Hop;
    :cond_c
    new-instance v0, Landroid/javax/sip/SipException;

    const-string/jumbo v1, "Stack is stopped."

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public sendResponse(Landroid/javax/sip/message/Response;)V
    .locals 13
    .param p1, "response"    # Landroid/javax/sip/message/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 784
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 786
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 787
    .local v0, "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v1

    .line 788
    .local v1, "via":Landroid/gov/nist/javax/sip/header/Via;
    if-eqz v1, :cond_a

    .line 790
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    move-object v3, p1

    check-cast v3, Landroid/gov/nist/javax/sip/message/SIPMessage;

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/gov/nist/javax/sip/SipStackImpl;->findTransaction(Landroid/gov/nist/javax/sip/message/SIPMessage;Z)Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 791
    .local v2, "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    if-eqz v2, :cond_1

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getInternalState()I

    move-result v3

    const/4 v4, 0x5

    if-eq v3, v4, :cond_1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->isAutomaticDialogSupportEnabled()Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_0

    .line 792
    :cond_0
    new-instance v3, Landroid/javax/sip/SipException;

    const-string/jumbo v4, "Transaction exists -- cannot send response statelessly"

    invoke-direct {v3, v4}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 794
    :cond_1
    :goto_0
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->getTransport()Ljava/lang/String;

    move-result-object v3

    .line 799
    .local v3, "transport":Ljava/lang/String;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->getReceived()Ljava/lang/String;

    move-result-object v4

    .line 801
    .local v4, "host":Ljava/lang/String;
    if-nez v4, :cond_2

    .line 802
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->getHost()Ljava/lang/String;

    move-result-object v4

    .line 805
    :cond_2
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->getRPort()I

    move-result v5

    .line 806
    .local v5, "port":I
    const/4 v6, -0x1

    if-ne v5, v6, :cond_5

    .line 807
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->getPort()I

    move-result v5

    .line 808
    if-ne v5, v6, :cond_5

    .line 809
    const-string/jumbo v6, "TLS"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_4

    const-string/jumbo v6, "SCTP-TLS"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    goto :goto_1

    .line 812
    :cond_3
    const/16 v5, 0x13c4

    goto :goto_2

    .line 810
    :cond_4
    :goto_1
    const/16 v5, 0x13c5

    .line 817
    :cond_5
    :goto_2
    const-string v6, ":"

    invoke-virtual {v4, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-lez v6, :cond_6

    .line 818
    const-string/jumbo v6, "["

    invoke-virtual {v4, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    if-gez v7, :cond_6

    .line 819
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 821
    :cond_6
    iget-object v6, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/SipStackImpl;->getAddressResolver()Landroid/gov/nist/core/net/AddressResolver;

    move-result-object v6

    new-instance v7, Landroid/gov/nist/javax/sip/stack/HopImpl;

    invoke-direct {v7, v4, v5, v3}, Landroid/gov/nist/javax/sip/stack/HopImpl;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-interface {v6, v7}, Landroid/gov/nist/core/net/AddressResolver;->resolveAddress(Landroid/javax/sip/address/Hop;)Landroid/javax/sip/address/Hop;

    move-result-object v6

    .line 825
    .local v6, "hop":Landroid/javax/sip/address/Hop;
    :try_start_0
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v7

    check-cast v7, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 827
    .local v7, "listeningPoint":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    if-eqz v7, :cond_9

    .line 831
    iget-object v8, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-interface {v6}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v9

    invoke-interface {v9}, Landroid/javax/sip/ListeningPoint;->getIPAddress()Ljava/lang/String;

    move-result-object v9

    iget v10, v7, Landroid/gov/nist/javax/sip/ListeningPointImpl;->port:I

    invoke-virtual {v8, v9, v10, v6}, Landroid/gov/nist/javax/sip/SipStackImpl;->createRawMessageChannel(Ljava/lang/String;ILandroid/javax/sip/address/Hop;)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v8

    .line 835
    .local v8, "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    if-eqz v8, :cond_7

    .line 836
    invoke-virtual {v8, v0}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 847
    .end local v7    # "listeningPoint":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    .end local v8    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    nop

    .line 848
    return-void

    .line 838
    .restart local v7    # "listeningPoint":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    .restart local v8    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    :cond_7
    sget-object v9, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v10, 0x20

    invoke-interface {v9, v10}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v9
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v10, "Could not create a message channel for "

    if-eqz v9, :cond_8

    .line 839
    :try_start_1
    sget-object v9, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-interface {v6}, Landroid/javax/sip/address/Hop;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " listeningPoints = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v9, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 841
    :cond_8
    new-instance v9, Landroid/javax/sip/SipException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v6}, Landroid/javax/sip/address/Hop;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v1    # "via":Landroid/gov/nist/javax/sip/header/Via;
    .end local v2    # "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v3    # "transport":Ljava/lang/String;
    .end local v4    # "host":Ljava/lang/String;
    .end local v5    # "port":I
    .end local v6    # "hop":Landroid/javax/sip/address/Hop;
    .end local p1    # "response":Landroid/javax/sip/message/Response;
    throw v9

    .line 828
    .end local v8    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .restart local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .restart local v1    # "via":Landroid/gov/nist/javax/sip/header/Via;
    .restart local v2    # "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .restart local v3    # "transport":Ljava/lang/String;
    .restart local v4    # "host":Ljava/lang/String;
    .restart local v5    # "port":I
    .restart local v6    # "hop":Landroid/javax/sip/address/Hop;
    .restart local p1    # "response":Landroid/javax/sip/message/Response;
    :cond_9
    new-instance v8, Landroid/javax/sip/SipException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "whoopsa daisy! no listening point found for transport "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v1    # "via":Landroid/gov/nist/javax/sip/header/Via;
    .end local v2    # "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v3    # "transport":Ljava/lang/String;
    .end local v4    # "host":Ljava/lang/String;
    .end local v5    # "port":I
    .end local v6    # "hop":Landroid/javax/sip/address/Hop;
    .end local p1    # "response":Landroid/javax/sip/message/Response;
    throw v8
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 845
    .end local v7    # "listeningPoint":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    .restart local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .restart local v1    # "via":Landroid/gov/nist/javax/sip/header/Via;
    .restart local v2    # "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .restart local v3    # "transport":Ljava/lang/String;
    .restart local v4    # "host":Ljava/lang/String;
    .restart local v5    # "port":I
    .restart local v6    # "hop":Landroid/javax/sip/address/Hop;
    .restart local p1    # "response":Landroid/javax/sip/message/Response;
    :catch_0
    move-exception v7

    .line 846
    .local v7, "ex":Ljava/io/IOException;
    new-instance v8, Landroid/javax/sip/SipException;

    invoke-virtual {v7}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 789
    .end local v2    # "st":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    .end local v3    # "transport":Ljava/lang/String;
    .end local v4    # "host":Ljava/lang/String;
    .end local v5    # "port":I
    .end local v6    # "hop":Landroid/javax/sip/address/Hop;
    .end local v7    # "ex":Ljava/io/IOException;
    :cond_a
    new-instance v2, Landroid/javax/sip/SipException;

    const-string v3, "No via header in response!"

    invoke-direct {v2, v3}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 785
    .end local v0    # "sipResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    .end local v1    # "via":Landroid/gov/nist/javax/sip/header/Via;
    :cond_b
    new-instance v0, Landroid/javax/sip/SipException;

    const-string/jumbo v1, "Stack is stopped"

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setAutomaticDialogSupportEnabled(Z)V
    .locals 1
    .param p1, "automaticDialogSupportEnabled"    # Z

    .line 1129
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->automaticDialogSupportEnabled:Z

    .line 1130
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->automaticDialogSupportEnabled:Z

    if-eqz v0, :cond_0

    .line 1131
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->dialogErrorsAutomaticallyHandled:Z

    .line 1133
    :cond_0
    return-void
.end method

.method public setDialogErrorsAutomaticallyHandled()V
    .locals 1

    .line 1147
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->dialogErrorsAutomaticallyHandled:Z

    .line 1148
    return-void
.end method

.method public declared-synchronized setListeningPoint(Landroid/javax/sip/ListeningPoint;)V
    .locals 3
    .param p1, "listeningPoint"    # Landroid/javax/sip/ListeningPoint;

    monitor-enter p0

    .line 856
    if-eqz p1, :cond_0

    .line 858
    :try_start_0
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 859
    .local v0, "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    iput-object p0, v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    .line 860
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getTransport()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    .line 864
    .local v1, "transport":Ljava/lang/String;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 865
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 867
    monitor-exit p0

    return-void

    .line 855
    .end local v0    # "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    .end local v1    # "transport":Ljava/lang/String;
    .end local p0    # "this":Landroid/gov/nist/javax/sip/SipProviderImpl;
    .end local p1    # "listeningPoint":Landroid/javax/sip/ListeningPoint;
    :catchall_0
    move-exception p1

    goto :goto_0

    .line 857
    .restart local p1    # "listeningPoint":Landroid/javax/sip/ListeningPoint;
    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null listening point"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 855
    .end local p1    # "listeningPoint":Landroid/javax/sip/ListeningPoint;
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method protected stop()V
    .locals 2

    .line 129
    sget-object v0, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    sget-object v0, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v1, "Exiting provider"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 131
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->listeningPoints:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 132
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 133
    .local v1, "listeningPoint":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->removeSipProvider()V

    .line 134
    .end local v1    # "listeningPoint":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    goto :goto_0

    .line 135
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->eventScanner:Landroid/gov/nist/javax/sip/EventScanner;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/EventScanner;->stop()V

    .line 137
    return-void
.end method

.method public transactionErrorEvent(Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;)V
    .locals 8
    .param p1, "transactionErrorEvent"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;

    .line 955
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;->getSource()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 958
    .local v0, "transaction":Landroid/gov/nist/javax/sip/stack/SIPTransaction;
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;->getErrorID()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_3

    .line 960
    sget-object v1, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 961
    sget-object v1, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "TransportError occured on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 965
    :cond_0
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;->getSource()Ljava/lang/Object;

    move-result-object v1

    .line 966
    .local v1, "errorObject":Ljava/lang/Object;
    sget-object v2, Landroid/javax/sip/Timeout;->TRANSACTION:Landroid/javax/sip/Timeout;

    .line 967
    .local v2, "timeout":Landroid/javax/sip/Timeout;
    const/4 v3, 0x0

    .line 969
    .local v3, "ev":Landroid/javax/sip/TimeoutEvent;
    instance-of v4, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v4, :cond_1

    .line 970
    new-instance v4, Landroid/javax/sip/TimeoutEvent;

    move-object v5, v1

    check-cast v5, Landroid/javax/sip/ServerTransaction;

    invoke-direct {v4, p0, v5, v2}, Landroid/javax/sip/TimeoutEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/ServerTransaction;Landroid/javax/sip/Timeout;)V

    move-object v3, v4

    goto :goto_0

    .line 973
    :cond_1
    move-object v4, v1

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 974
    .local v4, "clientTx":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getNextHop()Landroid/javax/sip/address/Hop;

    move-result-object v5

    .line 975
    .local v5, "hop":Landroid/javax/sip/address/Hop;
    iget-object v6, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/SipStackImpl;->getRouter()Landroid/javax/sip/address/Router;

    move-result-object v6

    instance-of v6, v6, Landroid/gov/nist/javax/sip/address/RouterExt;

    if-eqz v6, :cond_2

    .line 976
    iget-object v6, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/SipStackImpl;->getRouter()Landroid/javax/sip/address/Router;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/address/RouterExt;

    invoke-interface {v6, v5}, Landroid/gov/nist/javax/sip/address/RouterExt;->transactionTimeout(Landroid/javax/sip/address/Hop;)V

    .line 978
    :cond_2
    new-instance v6, Landroid/javax/sip/TimeoutEvent;

    move-object v7, v1

    check-cast v7, Landroid/javax/sip/ClientTransaction;

    invoke-direct {v6, p0, v7, v2}, Landroid/javax/sip/TimeoutEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/ClientTransaction;Landroid/javax/sip/Timeout;)V

    move-object v3, v6

    .line 982
    .end local v4    # "clientTx":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .end local v5    # "hop":Landroid/javax/sip/address/Hop;
    :goto_0
    move-object v4, v1

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-virtual {p0, v3, v4}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 983
    .end local v1    # "errorObject":Ljava/lang/Object;
    .end local v2    # "timeout":Landroid/javax/sip/Timeout;
    .end local v3    # "ev":Landroid/javax/sip/TimeoutEvent;
    goto/16 :goto_4

    :cond_3
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;->getErrorID()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_6

    .line 985
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;->getSource()Ljava/lang/Object;

    move-result-object v1

    .line 986
    .restart local v1    # "errorObject":Ljava/lang/Object;
    sget-object v2, Landroid/javax/sip/Timeout;->TRANSACTION:Landroid/javax/sip/Timeout;

    .line 987
    .restart local v2    # "timeout":Landroid/javax/sip/Timeout;
    const/4 v3, 0x0

    .line 989
    .restart local v3    # "ev":Landroid/javax/sip/TimeoutEvent;
    instance-of v4, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v4, :cond_4

    .line 990
    new-instance v4, Landroid/javax/sip/TimeoutEvent;

    move-object v5, v1

    check-cast v5, Landroid/javax/sip/ServerTransaction;

    invoke-direct {v4, p0, v5, v2}, Landroid/javax/sip/TimeoutEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/ServerTransaction;Landroid/javax/sip/Timeout;)V

    move-object v3, v4

    goto :goto_1

    .line 993
    :cond_4
    move-object v4, v1

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    .line 994
    .restart local v4    # "clientTx":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    invoke-interface {v4}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getNextHop()Landroid/javax/sip/address/Hop;

    move-result-object v5

    .line 995
    .restart local v5    # "hop":Landroid/javax/sip/address/Hop;
    iget-object v6, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/SipStackImpl;->getRouter()Landroid/javax/sip/address/Router;

    move-result-object v6

    instance-of v6, v6, Landroid/gov/nist/javax/sip/address/RouterExt;

    if-eqz v6, :cond_5

    .line 996
    iget-object v6, p0, Landroid/gov/nist/javax/sip/SipProviderImpl;->sipStack:Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/SipStackImpl;->getRouter()Landroid/javax/sip/address/Router;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sip/address/RouterExt;

    invoke-interface {v6, v5}, Landroid/gov/nist/javax/sip/address/RouterExt;->transactionTimeout(Landroid/javax/sip/address/Hop;)V

    .line 999
    :cond_5
    new-instance v6, Landroid/javax/sip/TimeoutEvent;

    move-object v7, v1

    check-cast v7, Landroid/javax/sip/ClientTransaction;

    invoke-direct {v6, p0, v7, v2}, Landroid/javax/sip/TimeoutEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/ClientTransaction;Landroid/javax/sip/Timeout;)V

    move-object v3, v6

    .line 1002
    .end local v4    # "clientTx":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    .end local v5    # "hop":Landroid/javax/sip/address/Hop;
    :goto_1
    move-object v4, v1

    check-cast v4, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-virtual {p0, v3, v4}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .end local v1    # "errorObject":Ljava/lang/Object;
    .end local v2    # "timeout":Landroid/javax/sip/Timeout;
    .end local v3    # "ev":Landroid/javax/sip/TimeoutEvent;
    goto :goto_3

    .line 1004
    :cond_6
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;->getErrorID()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_9

    .line 1009
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionErrorEvent;->getSource()Ljava/lang/Object;

    move-result-object v1

    .line 1010
    .restart local v1    # "errorObject":Ljava/lang/Object;
    move-object v2, v1

    check-cast v2, Landroid/javax/sip/Transaction;

    .line 1012
    .local v2, "tx":Landroid/javax/sip/Transaction;
    invoke-interface {v2}, Landroid/javax/sip/Transaction;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v3

    if-eqz v3, :cond_7

    .line 1013
    const-string/jumbo v3, "Unexpected event !"

    sget-object v4, Landroid/gov/nist/javax/sip/SipProviderImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-static {v3, v4}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/String;Landroid/gov/nist/core/StackLogger;)V

    .line 1016
    :cond_7
    sget-object v3, Landroid/javax/sip/Timeout;->RETRANSMIT:Landroid/javax/sip/Timeout;

    .line 1017
    .local v3, "timeout":Landroid/javax/sip/Timeout;
    const/4 v4, 0x0

    .line 1019
    .local v4, "ev":Landroid/javax/sip/TimeoutEvent;
    instance-of v5, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v5, :cond_8

    .line 1020
    new-instance v5, Landroid/javax/sip/TimeoutEvent;

    move-object v6, v1

    check-cast v6, Landroid/javax/sip/ServerTransaction;

    invoke-direct {v5, p0, v6, v3}, Landroid/javax/sip/TimeoutEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/ServerTransaction;Landroid/javax/sip/Timeout;)V

    move-object v4, v5

    goto :goto_2

    .line 1023
    :cond_8
    new-instance v5, Landroid/javax/sip/TimeoutEvent;

    move-object v6, v1

    check-cast v6, Landroid/javax/sip/ClientTransaction;

    invoke-direct {v5, p0, v6, v3}, Landroid/javax/sip/TimeoutEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/ClientTransaction;Landroid/javax/sip/Timeout;)V

    move-object v4, v5

    .line 1026
    :goto_2
    move-object v5, v1

    check-cast v5, Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-virtual {p0, v4, v5}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    goto :goto_4

    .line 1004
    .end local v1    # "errorObject":Ljava/lang/Object;
    .end local v2    # "tx":Landroid/javax/sip/Transaction;
    .end local v3    # "timeout":Landroid/javax/sip/Timeout;
    .end local v4    # "ev":Landroid/javax/sip/TimeoutEvent;
    :cond_9
    :goto_3
    nop

    .line 1028
    :goto_4
    return-void
.end method
