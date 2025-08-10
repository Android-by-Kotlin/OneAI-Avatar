.class Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SIPTransactionImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MaxTxLifeTimeListener"
.end annotation


# instance fields
.field sipTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;)V
    .locals 0

    .line 309
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 310
    iget-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;->sipTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 2

    .line 335
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    .line 336
    .local v0, "request":Landroid/javax/sip/message/Request;
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v1, :cond_0

    .line 337
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallIdHeader()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 339
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public runTask()V
    .locals 4

    .line 314
    :try_start_0
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 315
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fired MaxTxLifeTimeListener for tx "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;->sipTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " , tx id "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;->sipTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getTransactionId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " , state "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;->sipTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 318
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->raiseErrorEvent(I)V

    .line 320
    new-instance v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$LingerTimer;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$LingerTimer;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;)V

    .line 321
    .local v0, "myTimer":Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getConnectionLingerTimer()I

    move-result v1

    if-eqz v1, :cond_1

    .line 322
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getConnectionLingerTimer()I

    move-result v2

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    invoke-interface {v1, v0, v2, v3}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    goto :goto_0

    .line 324
    :cond_1
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->runTask()V

    .line 326
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->access$102(Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;)Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$MaxTxLifeTimeListener;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 330
    nop

    .end local v0    # "myTimer":Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
    goto :goto_1

    .line 328
    :catch_0
    move-exception v0

    .line 329
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v1

    const-string/jumbo v2, "unexpected exception"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 331
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_1
    return-void
.end method
