.class Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$ExpiresTimerTask;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SIPClientTransactionImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ExpiresTimerTask"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;)V
    .locals 0

    .line 280
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$ExpiresTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 282
    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 2

    .line 301
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$ExpiresTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    .line 302
    .local v0, "request":Landroid/javax/sip/message/Request;
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v1, :cond_0

    .line 303
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallIdHeader()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 305
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public runTask()V
    .locals 5

    .line 286
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$ExpiresTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;

    .line 287
    .local v0, "ct":Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;
    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v1

    .line 289
    .local v1, "provider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v2

    sget-object v3, Landroid/javax/sip/TransactionState;->TERMINATED:Landroid/javax/sip/TransactionState;

    if-eq v2, v3, :cond_0

    .line 290
    new-instance v2, Landroid/javax/sip/TimeoutEvent;

    sget-object v3, Landroid/javax/sip/Timeout;->TRANSACTION:Landroid/javax/sip/Timeout;

    invoke-direct {v2, v1, v0, v3}, Landroid/javax/sip/TimeoutEvent;-><init>(Ljava/lang/Object;Landroid/javax/sip/ClientTransaction;Landroid/javax/sip/Timeout;)V

    .line 291
    .local v2, "tte":Landroid/javax/sip/TimeoutEvent;
    invoke-virtual {v1, v2, v0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->handleEvent(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V

    .line 292
    .end local v2    # "tte":Landroid/javax/sip/TimeoutEvent;
    goto :goto_0

    .line 293
    :cond_0
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 294
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "state = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 297
    :cond_1
    :goto_0
    return-void
.end method
