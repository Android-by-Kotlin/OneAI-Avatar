.class public Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$TransactionTimer;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SIPClientTransactionImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TransactionTimer"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;)V
    .locals 0

    .line 237
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 239
    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 2

    .line 268
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    .line 269
    .local v0, "request":Landroid/javax/sip/message/Request;
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    if-eqz v1, :cond_0

    .line 270
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallIdHeader()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 272
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public runTask()V
    .locals 2

    .line 244
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->isTerminated()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 247
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 252
    goto :goto_0

    .line 249
    :catch_0
    move-exception v0

    .line 250
    .local v0, "ex":Ljava/lang/IllegalStateException;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isAlive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 251
    return-void

    .line 254
    .end local v0    # "ex":Ljava/lang/IllegalStateException;
    :cond_0
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->cleanUpOnTerminated()V

    goto :goto_1

    .line 260
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl$TransactionTimer;->this$0:Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransactionImpl;->fireTimer()V

    .line 264
    :goto_1
    return-void
.end method
