.class Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "SIPDialog.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DialogTimerTask"
.end annotation


# instance fields
.field nRetransmissions:I

.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

.field transaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;)V
    .locals 0
    .param p2, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 560
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 561
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->transaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 562
    const/4 p1, 0x0

    iput p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->nRetransmissions:I

    .line 563
    return-void
.end method


# virtual methods
.method public cleanUpBeforeCancel()V
    .locals 1

    .line 639
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->transaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 641
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->cleanUpOnAck()V

    .line 642
    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->cleanUpBeforeCancel()V

    .line 643
    return-void
.end method

.method public getThreadHash()Ljava/lang/Object;
    .locals 1

    .line 647
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public runTask()V
    .locals 9

    .line 568
    const-string/jumbo v0, "resend 200 response from "

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    .line 569
    .local v1, "dialog":Landroid/gov/nist/javax/sip/stack/SIPDialog;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 570
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    const-string/jumbo v4, "Running dialog timer"

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 571
    :cond_0
    iget v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->nRetransmissions:I

    const/4 v4, 0x1

    add-int/2addr v2, v4

    iput v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->nRetransmissions:I

    .line 572
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->transaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 582
    .local v2, "transaction":Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;
    iget v5, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->nRetransmissions:I

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-static {v6}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$000(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v6

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getAckTimeoutFactor()I

    move-result v6

    mul-int/2addr v6, v4

    if-le v5, v6, :cond_2

    .line 584
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v0

    instance-of v0, v0, Landroid/gov/nist/javax/sip/SipListenerExt;

    if-eqz v0, :cond_1

    .line 586
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-static {v0, v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$300(Landroid/gov/nist/javax/sip/stack/SIPDialog;I)V

    goto :goto_0

    .line 588
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->delete()V

    .line 590
    :goto_0
    if-eqz v2, :cond_6

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v0

    sget-object v3, Landroid/javax/sip/TransactionState;->TERMINATED:Landroid/javax/sip/TransactionState;

    if-eq v0, v3, :cond_6

    .line 592
    invoke-interface {v2, v4}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->raiseErrorEvent(I)V

    goto/16 :goto_3

    .line 595
    :cond_2
    if-eqz v2, :cond_6

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isAckSeen()Z

    move-result v4

    if-nez v4, :cond_6

    .line 597
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    iget-object v4, v4, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastResponseStatusCode:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    div-int/lit8 v4, v4, 0x64

    const/4 v5, 0x2

    if-ne v4, v5, :cond_6

    .line 601
    :try_start_0
    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getTimerT2()I

    move-result v4

    invoke-static {v1, v4}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$500(Landroid/gov/nist/javax/sip/stack/SIPDialog;I)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 602
    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->resendLastResponseAsBytes()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 617
    :cond_3
    invoke-static {v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$000(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v4

    .line 618
    .local v4, "stack":Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v5

    invoke-interface {v5, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 619
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    :goto_1
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 622
    :cond_4
    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->fireTimer()V

    .line 623
    .end local v4    # "stack":Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    goto :goto_3

    .line 617
    :catchall_0
    move-exception v4

    goto :goto_2

    .line 604
    :catch_0
    move-exception v4

    .line 606
    .local v4, "ex":Ljava/io/IOException;
    :try_start_1
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getPeerAddress()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getPeerPort()I

    move-result v7

    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->getPeerProtocol()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v6, v7, v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$600(Landroid/gov/nist/javax/sip/stack/SIPDialog;Ljava/lang/String;ILjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 617
    .end local v4    # "ex":Ljava/io/IOException;
    invoke-static {v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$000(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v4

    .line 618
    .local v4, "stack":Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v5

    invoke-interface {v5, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 619
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    goto :goto_1

    .line 617
    .end local v4    # "stack":Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    :goto_2
    invoke-static {v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$000(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v5

    .line 618
    .local v5, "stack":Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v6

    invoke-interface {v6, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 619
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 622
    :cond_5
    invoke-interface {v2}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->fireTimer()V

    .line 623
    .end local v5    # "stack":Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    throw v4

    .line 629
    :cond_6
    :goto_3
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isAckSeen()Z

    move-result v0

    if-nez v0, :cond_7

    invoke-static {v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$700(Landroid/gov/nist/javax/sip/stack/SIPDialog;)I

    move-result v0

    const/4 v3, 0x3

    if-ne v0, v3, :cond_8

    .line 630
    :cond_7
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->transaction:Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    .line 631
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 635
    :cond_8
    return-void
.end method
