.class Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;
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
    name = "DialogDeleteIfNoAckSentTask"
.end annotation


# instance fields
.field private seqno:J

.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;J)V
    .locals 0
    .param p2, "seqno"    # J

    .line 679
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 680
    iput-wide p2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->seqno:J

    .line 681
    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 1

    .line 685
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public runTask()V
    .locals 4

    .line 689
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-static {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$800(Landroid/gov/nist/javax/sip/stack/SIPDialog;)J

    move-result-wide v0

    iget-wide v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->seqno:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_6

    .line 695
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$902(Landroid/gov/nist/javax/sip/stack/SIPDialog;Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;)Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;

    .line 696
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    iget-boolean v0, v0, Landroid/gov/nist/javax/sip/stack/SIPDialog;->isBackToBackUserAgent:Z

    const/4 v1, 0x2

    if-nez v0, :cond_2

    .line 697
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 698
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACK Was not sent. killing dialog "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    iget-object v3, v3, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 700
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-static {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$200(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v0

    instance-of v0, v0, Landroid/gov/nist/javax/sip/SipListenerExt;

    if-eqz v0, :cond_1

    .line 701
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-static {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$300(Landroid/gov/nist/javax/sip/stack/SIPDialog;I)V

    goto/16 :goto_0

    .line 703
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->delete()V

    goto/16 :goto_0

    .line 706
    :cond_2
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 707
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACK Was not sent. Sending BYE "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    iget-object v3, v3, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 709
    :cond_3
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-static {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$200(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v0

    instance-of v0, v0, Landroid/gov/nist/javax/sip/SipListenerExt;

    if-eqz v0, :cond_4

    .line 710
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-static {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$300(Landroid/gov/nist/javax/sip/stack/SIPDialog;I)V

    goto :goto_0

    .line 718
    :cond_4
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    const-string v1, "BYE"

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->createRequest(Ljava/lang/String;)Landroid/javax/sip/message/Request;

    move-result-object v0

    .line 720
    .local v0, "byeRequest":Landroid/javax/sip/message/Request;
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultUserAgentHeader()Landroid/javax/sip/header/UserAgentHeader;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 721
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultUserAgentHeader()Landroid/javax/sip/header/UserAgentHeader;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/javax/sip/message/Request;->addHeader(Landroid/javax/sip/header/Header;)V

    .line 724
    :cond_5
    new-instance v1, Landroid/gov/nist/javax/sip/header/Reason;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/Reason;-><init>()V

    .line 725
    .local v1, "reasonHeader":Landroid/javax/sip/header/ReasonHeader;
    const-string/jumbo v2, "SIP"

    invoke-interface {v1, v2}, Landroid/javax/sip/header/ReasonHeader;->setProtocol(Ljava/lang/String;)V

    .line 726
    const/16 v2, 0x401

    invoke-interface {v1, v2}, Landroid/javax/sip/header/ReasonHeader;->setCause(I)V

    .line 727
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Timed out waiting to send ACK "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    iget-object v3, v3, Landroid/gov/nist/javax/sip/stack/SIPDialog;->dialogId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/javax/sip/header/ReasonHeader;->setText(Ljava/lang/String;)V

    .line 729
    invoke-interface {v0, v1}, Landroid/javax/sip/message/Request;->addHeader(Landroid/javax/sip/header/Header;)V

    .line 730
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->getSipProvider()Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getNewClientTransaction(Landroid/javax/sip/message/Request;)Landroid/javax/sip/ClientTransaction;

    move-result-object v2

    .line 733
    .local v2, "byeCtx":Landroid/javax/sip/ClientTransaction;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v3, v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->sendRequest(Landroid/javax/sip/ClientTransaction;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 734
    return-void

    .line 735
    .end local v0    # "byeRequest":Landroid/javax/sip/message/Request;
    .end local v1    # "reasonHeader":Landroid/javax/sip/header/ReasonHeader;
    .end local v2    # "byeCtx":Landroid/javax/sip/ClientTransaction;
    :catch_0
    move-exception v0

    .line 736
    .local v0, "ex":Ljava/lang/Exception;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$DialogDeleteIfNoAckSentTask;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->delete()V

    .line 741
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_6
    :goto_0
    return-void
.end method
