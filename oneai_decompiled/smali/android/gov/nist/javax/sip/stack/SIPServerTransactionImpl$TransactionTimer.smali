.class Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$TransactionTimer;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SIPServerTransactionImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TransactionTimer"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;)V
    .locals 3

    .line 387
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 388
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 389
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "TransactionTimer() : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getTransactionId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 392
    :cond_0
    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 2

    .line 434
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    .line 435
    .local v0, "request":Landroid/javax/sip/message/Request;
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v1, :cond_0

    .line 436
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallIdHeader()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 438
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public runTask()V
    .locals 4

    .line 396
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->isTerminated()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 402
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 406
    goto :goto_0

    .line 403
    :catch_0
    move-exception v0

    .line 404
    .local v0, "ex":Ljava/lang/IllegalStateException;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isAlive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 405
    return-void

    .line 414
    .end local v0    # "ex":Ljava/lang/IllegalStateException;
    :cond_0
    :goto_0
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$LingerTimer;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$LingerTimer;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;)V

    .line 416
    .local v0, "myTimer":Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getConnectionLingerTimer()I

    move-result v1

    if-eqz v1, :cond_1

    .line 417
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getConnectionLingerTimer()I

    move-result v2

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    invoke-interface {v1, v0, v2, v3}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    goto :goto_1

    .line 419
    :cond_1
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->runTask()V

    .line 421
    .end local v0    # "myTimer":Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    :goto_1
    goto :goto_2

    .line 425
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->fireTimer()V

    .line 427
    :goto_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v0, :cond_3

    .line 428
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPServerTransactionImpl;->originalRequest:Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->cleanUp()V

    .line 430
    :cond_3
    return-void
.end method
