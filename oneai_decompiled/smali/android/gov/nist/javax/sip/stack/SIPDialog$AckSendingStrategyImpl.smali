.class public Landroid/gov/nist/javax/sip/stack/SIPDialog$AckSendingStrategyImpl;
.super Ljava/lang/Object;
.source "SIPDialog.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/AckSendingStrategy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AckSendingStrategyImpl"
.end annotation


# instance fields
.field private hop:Landroid/javax/sip/address/Hop;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;)V
    .locals 0

    .line 340
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$AckSendingStrategyImpl;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 342
    const/4 p1, 0x0

    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$AckSendingStrategyImpl;->hop:Landroid/javax/sip/address/Hop;

    return-void
.end method


# virtual methods
.method public getLastHop()Landroid/javax/sip/address/Hop;
    .locals 1

    .line 366
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$AckSendingStrategyImpl;->hop:Landroid/javax/sip/address/Hop;

    return-object v0
.end method

.method public send(Landroid/gov/nist/javax/sip/message/SIPRequest;)V
    .locals 4
    .param p1, "ackRequest"    # Landroid/gov/nist/javax/sip/message/SIPRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 346
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$AckSendingStrategyImpl;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-static {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$000(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getNextHop(Landroid/gov/nist/javax/sip/message/SIPRequest;)Landroid/javax/sip/address/Hop;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$AckSendingStrategyImpl;->hop:Landroid/javax/sip/address/Hop;

    .line 347
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$AckSendingStrategyImpl;->hop:Landroid/javax/sip/address/Hop;

    if-eqz v0, :cond_2

    .line 349
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 350
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "hop = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$AckSendingStrategyImpl;->hop:Landroid/javax/sip/address/Hop;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 351
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$AckSendingStrategyImpl;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-static {v0}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$200(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/SipProviderImpl;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$AckSendingStrategyImpl;->hop:Landroid/javax/sip/address/Hop;

    invoke-interface {v1}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoint(Ljava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 353
    .local v0, "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    if-eqz v0, :cond_1

    .line 357
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$AckSendingStrategyImpl;->hop:Landroid/javax/sip/address/Hop;

    invoke-interface {v1}, Landroid/javax/sip/address/Hop;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    .line 358
    .local v1, "inetAddress":Ljava/net/InetAddress;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getMessageProcessor()Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$AckSendingStrategyImpl;->hop:Landroid/javax/sip/address/Hop;

    invoke-interface {v3}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v3

    invoke-virtual {v2, v1, v3}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->createMessageChannel(Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v2

    .line 360
    .local v2, "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    invoke-virtual {v2, p1}, Landroid/gov/nist/javax/sip/stack/MessageChannel;->sendMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 361
    return-void

    .line 354
    .end local v1    # "inetAddress":Ljava/net/InetAddress;
    .end local v2    # "messageChannel":Landroid/gov/nist/javax/sip/stack/MessageChannel;
    :cond_1
    new-instance v1, Landroid/javax/sip/SipException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No listening point for this provider registered at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$AckSendingStrategyImpl;->hop:Landroid/javax/sip/address/Hop;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 348
    .end local v0    # "lp":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    :cond_2
    new-instance v0, Landroid/javax/sip/SipException;

    const-string v1, "No route!"

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
