.class public Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;
.super Ljava/lang/Object;
.source "SIPDialog.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ReInviteSender"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0xe2571ebeadfbf2bL


# instance fields
.field ctx:Landroid/javax/sip/ClientTransaction;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;Landroid/javax/sip/ClientTransaction;)V
    .locals 2
    .param p2, "ctx"    # Landroid/javax/sip/ClientTransaction;

    .line 429
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 430
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->ctx:Landroid/javax/sip/ClientTransaction;

    .line 431
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object p1

    const/16 v0, 0x20

    invoke-interface {p1, v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 432
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ReInviteSender::ReInviteSender: ctx = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 433
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object p1

    invoke-interface {p1}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 435
    :cond_0
    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .line 439
    const-wide/16 v0, 0x0

    .line 440
    .local v0, "timeToWait":J
    const/4 v2, 0x0

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 441
    .local v3, "startTime":J
    const/4 v5, 0x0

    .line 442
    .local v5, "dialogTimedOut":Z
    const/4 v6, 0x0

    .line 446
    .local v6, "busyWait":Z
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v7

    const/16 v8, 0x20

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 447
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v7

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "SIPDialog::reInviteSender: dialog = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->ctx:Landroid/javax/sip/ClientTransaction;

    invoke-interface {v10}, Landroid/javax/sip/ClientTransaction;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " lastTransaction = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    iget-object v10, v10, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " lastTransactionState "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    iget-object v10, v10, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v10}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 449
    :cond_0
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    iget-object v7, v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    if-eqz v7, :cond_1

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    iget-object v7, v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    instance-of v7, v7, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    if-eqz v7, :cond_1

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    iget-object v7, v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->isInviteTransaction()Z

    move-result v7

    if-eqz v7, :cond_1

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    iget-object v7, v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/SIPTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v7

    sget-object v9, Landroid/javax/sip/TransactionState;->TERMINATED:Landroid/javax/sip/TransactionState;

    if-eq v7, v9, :cond_1

    .line 454
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    iget-object v7, v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->lastTransaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    check-cast v7, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;

    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/SIPServerTransaction;->waitForTermination()V

    .line 455
    const-wide/16 v9, 0x32

    invoke-static {v9, v10}, Ljava/lang/Thread;->sleep(J)V

    .line 460
    :cond_1
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->takeAckSem()Z

    move-result v7

    if-nez v7, :cond_5

    .line 464
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v7

    invoke-interface {v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 465
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v7

    const-string v9, "Could not send re-INVITE time out ClientTransaction"

    invoke-interface {v7, v9}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 468
    :cond_2
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->ctx:Landroid/javax/sip/ClientTransaction;

    check-cast v7, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-interface {v7}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->fireTimeoutTimer()V

    .line 472
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-static {v7}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$200(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v7

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v7

    if-eqz v7, :cond_3

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-static {v7}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$200(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v7

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v7

    instance-of v7, v7, Landroid/gov/nist/javax/sip/SipListenerExt;

    if-eqz v7, :cond_3

    .line 474
    const/4 v5, 0x1

    .line 475
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    iget-object v9, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->ctx:Landroid/javax/sip/ClientTransaction;

    check-cast v9, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    const/4 v10, 0x3

    invoke-static {v7, v10, v9}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$400(Landroid/gov/nist/javax/sip/stack/SIPDialog;ILandroid/gov/nist/javax/sip/stack/SIPClientTransaction;)V

    goto :goto_0

    .line 477
    :cond_3
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    const-string v8, "BYE"

    invoke-virtual {v7, v8}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->createRequest(Ljava/lang/String;)Landroid/javax/sip/message/Request;

    move-result-object v7

    .line 479
    .local v7, "byeRequest":Landroid/javax/sip/message/Request;
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultUserAgentHeader()Landroid/javax/sip/header/UserAgentHeader;

    move-result-object v8

    if-eqz v8, :cond_4

    .line 480
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultUserAgentHeader()Landroid/javax/sip/header/UserAgentHeader;

    move-result-object v8

    invoke-interface {v7, v8}, Landroid/javax/sip/message/Request;->addHeader(Landroid/javax/sip/header/Header;)V

    .line 483
    :cond_4
    new-instance v8, Landroid/gov/nist/javax/sip/header/Reason;

    invoke-direct {v8}, Landroid/gov/nist/javax/sip/header/Reason;-><init>()V

    .line 484
    .local v8, "reasonHeader":Landroid/javax/sip/header/ReasonHeader;
    const/16 v9, 0x400

    invoke-interface {v8, v9}, Landroid/javax/sip/header/ReasonHeader;->setCause(I)V

    .line 485
    const-string/jumbo v9, "Timed out waiting to re-INVITE"

    invoke-interface {v8, v9}, Landroid/javax/sip/header/ReasonHeader;->setText(Ljava/lang/String;)V

    .line 486
    invoke-interface {v7, v8}, Landroid/javax/sip/message/Request;->addHeader(Landroid/javax/sip/header/Header;)V

    .line 487
    iget-object v9, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v9

    invoke-virtual {v9, v7}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getNewClientTransaction(Landroid/javax/sip/message/Request;)Landroid/javax/sip/ClientTransaction;

    move-result-object v9

    .line 490
    .local v9, "byeCtx":Landroid/javax/sip/ClientTransaction;
    iget-object v10, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v10, v9}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sendRequest(Landroid/javax/sip/ClientTransaction;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 526
    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->ctx:Landroid/javax/sip/ClientTransaction;

    return-void

    .line 494
    .end local v7    # "byeRequest":Landroid/javax/sip/message/Request;
    .end local v8    # "reasonHeader":Landroid/javax/sip/header/ReasonHeader;
    .end local v9    # "byeCtx":Landroid/javax/sip/ClientTransaction;
    :cond_5
    :goto_0
    :try_start_1
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v7

    sget-object v9, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    if-eq v7, v9, :cond_6

    .line 496
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    sub-long v0, v9, v3

    .line 507
    :cond_6
    const-wide/16 v9, 0x0

    cmp-long v7, v0, v9

    if-eqz v7, :cond_8

    .line 508
    :try_start_2
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    iget v7, v7, Landroid/gov/nist/javax/sip/stack/SIPDialog;->reInviteWaitTime:I

    int-to-long v9, v7

    invoke-static {v9, v10}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 510
    :catch_0
    move-exception v7

    .line 511
    .local v7, "ex":Ljava/lang/InterruptedException;
    :try_start_3
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v9

    invoke-interface {v9, v8}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 512
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v8

    const-string v9, "Interrupted sleep"

    invoke-interface {v8, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 526
    :cond_7
    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->ctx:Landroid/javax/sip/ClientTransaction;

    return-void

    .line 514
    .end local v7    # "ex":Ljava/lang/InterruptedException;
    :cond_8
    :goto_1
    nop

    .line 515
    :try_start_4
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v7}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v7

    sget-object v9, Landroid/javax/sip/DialogState;->TERMINATED:Landroid/javax/sip/DialogState;

    if-eq v7, v9, :cond_9

    if-nez v5, :cond_9

    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->ctx:Landroid/javax/sip/ClientTransaction;

    invoke-interface {v7}, Landroid/javax/sip/ClientTransaction;->getState()Landroid/javax/sip/TransactionState;

    move-result-object v7

    sget-object v9, Landroid/javax/sip/TransactionState;->TERMINATED:Landroid/javax/sip/TransactionState;

    if-eq v7, v9, :cond_9

    .line 516
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    iget-object v9, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->ctx:Landroid/javax/sip/ClientTransaction;

    const/4 v10, 0x1

    invoke-virtual {v7, v9, v10}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sendRequest(Landroid/javax/sip/ClientTransaction;Z)V

    .line 517
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v7

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 518
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v7

    const-string/jumbo v8, "re-INVITE successfully sent"

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2

    .line 526
    .end local v0    # "timeToWait":J
    .end local v3    # "startTime":J
    .end local v5    # "dialogTimedOut":Z
    .end local v6    # "busyWait":Z
    :catchall_0
    move-exception v0

    goto :goto_3

    .line 522
    :catch_1
    move-exception v0

    .line 523
    .local v0, "ex":Ljava/lang/Exception;
    :try_start_5
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v1

    const-string v3, "Error sending re-INVITE"

    invoke-interface {v1, v3, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 526
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_9
    :goto_2
    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->ctx:Landroid/javax/sip/ClientTransaction;

    .line 527
    nop

    .line 528
    return-void

    .line 526
    :goto_3
    iput-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->ctx:Landroid/javax/sip/ClientTransaction;

    throw v0
.end method

.method public terminate()V
    .locals 3

    .line 418
    :try_start_0
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 419
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ReInviteSender::terminate: ctx = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->ctx:Landroid/javax/sip/ClientTransaction;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 422
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ReInviteSender;->ctx:Landroid/javax/sip/ClientTransaction;

    invoke-interface {v0}, Landroid/javax/sip/ClientTransaction;->terminate()V

    .line 423
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_0
    .catch Landroid/javax/sip/ObjectInUseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 426
    goto :goto_0

    .line 424
    :catch_0
    move-exception v0

    .line 425
    .local v0, "e":Landroid/javax/sip/ObjectInUseException;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v1

    const-string/jumbo v2, "unexpected error"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 427
    .end local v0    # "e":Landroid/javax/sip/ObjectInUseException;
    :goto_0
    return-void
.end method
