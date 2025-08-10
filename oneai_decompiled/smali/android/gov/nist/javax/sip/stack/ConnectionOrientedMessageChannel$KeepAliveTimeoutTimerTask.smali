.class Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "ConnectionOrientedMessageChannel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "KeepAliveTimeoutTimerTask"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;)V
    .locals 0

    .line 847
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 1

    .line 850
    const/4 v0, 0x0

    return-object v0
.end method

.method public runTask()V
    .locals 21

    .line 854
    move-object/from16 v8, p0

    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 855
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "~~~ Starting processing of KeepAliveTimeoutEvent( "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iget v2, v2, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")..."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 858
    :cond_0
    iget-object v0, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v1}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->close(ZZ)V

    .line 859
    iget-object v0, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    instance-of v0, v0, Landroid/gov/nist/javax/sip/SipStackImpl;

    if-eqz v0, :cond_4

    .line 860
    iget-object v0, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    check-cast v0, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getSipProviders()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/SipProviderImpl;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 861
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/SipProviderImpl;

    .line 862
    .local v1, "nextProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v2

    .line 863
    .local v2, "sipListener":Landroid/javax/sip/SipListener;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getListeningPoints()[Landroid/javax/sip/ListeningPoint;

    move-result-object v3

    .line 864
    .local v3, "listeningPoints":[Landroid/javax/sip/ListeningPoint;
    move-object v4, v3

    .local v4, "arr$":[Landroid/javax/sip/ListeningPoint;
    array-length v5, v4

    .local v5, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_1
    if-ge v6, v5, :cond_2

    aget-object v7, v4, v6

    .line 865
    .local v7, "listeningPoint":Landroid/javax/sip/ListeningPoint;
    if-eqz v2, :cond_1

    instance-of v9, v2, Landroid/gov/nist/javax/sip/SipListenerExt;

    if-eqz v9, :cond_1

    invoke-interface {v7}, Landroid/javax/sip/ListeningPoint;->getIPAddress()Ljava/lang/String;

    move-result-object v9

    iget-object v10, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iget-object v10, v10, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myAddress:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v7}, Landroid/javax/sip/ListeningPoint;->getPort()I

    move-result v9

    iget-object v10, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iget v10, v10, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myPort:I

    if-ne v9, v10, :cond_1

    invoke-interface {v7}, Landroid/javax/sip/ListeningPoint;->getTransport()Ljava/lang/String;

    move-result-object v9

    iget-object v10, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    invoke-virtual {v10}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 869
    move-object v15, v2

    check-cast v15, Landroid/gov/nist/javax/sip/SipListenerExt;

    new-instance v14, Landroid/gov/nist/javax/sip/IOExceptionEventExt;

    sget-object v11, Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;->KeepAliveTimeout:Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;

    iget-object v9, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iget-object v12, v9, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myAddress:Ljava/lang/String;

    iget-object v9, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iget v13, v9, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myPort:I

    iget-object v9, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iget-object v9, v9, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v9}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v16

    iget-object v9, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iget v10, v9, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    iget-object v9, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v17

    move-object v9, v14

    move/from16 v18, v10

    move-object v10, v1

    move-object/from16 v19, v0

    move-object v0, v14

    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/SipProviderImpl;>;"
    .local v19, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/SipProviderImpl;>;"
    move-object/from16 v14, v16

    move-object/from16 v20, v1

    move-object v1, v15

    .end local v1    # "nextProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    .local v20, "nextProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    move/from16 v15, v18

    move-object/from16 v16, v17

    invoke-direct/range {v9 .. v16}, Landroid/gov/nist/javax/sip/IOExceptionEventExt;-><init>(Ljava/lang/Object;Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;)V

    invoke-interface {v1, v0}, Landroid/gov/nist/javax/sip/SipListenerExt;->processIOException(Landroid/javax/sip/IOExceptionEvent;)V

    goto :goto_2

    .line 865
    .end local v19    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/SipProviderImpl;>;"
    .end local v20    # "nextProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    .restart local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/SipProviderImpl;>;"
    .restart local v1    # "nextProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    :cond_1
    move-object/from16 v19, v0

    move-object/from16 v20, v1

    .line 864
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/SipProviderImpl;>;"
    .end local v1    # "nextProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    .end local v7    # "listeningPoint":Landroid/javax/sip/ListeningPoint;
    .restart local v19    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/SipProviderImpl;>;"
    .restart local v20    # "nextProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    :goto_2
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    goto :goto_1

    .end local v19    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/SipProviderImpl;>;"
    .end local v20    # "nextProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    .restart local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/SipProviderImpl;>;"
    .restart local v1    # "nextProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    :cond_2
    move-object/from16 v19, v0

    move-object/from16 v20, v1

    .line 873
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/SipProviderImpl;>;"
    .end local v1    # "nextProvider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    .end local v2    # "sipListener":Landroid/javax/sip/SipListener;
    .end local v3    # "listeningPoints":[Landroid/javax/sip/ListeningPoint;
    .end local v4    # "arr$":[Landroid/javax/sip/ListeningPoint;
    .end local v5    # "len$":I
    .end local v6    # "i$":I
    .restart local v19    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/SipProviderImpl;>;"
    goto/16 :goto_0

    .line 860
    .end local v19    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/SipProviderImpl;>;"
    .restart local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/SipProviderImpl;>;"
    :cond_3
    move-object/from16 v19, v0

    .line 873
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/gov/nist/javax/sip/SipProviderImpl;>;"
    goto :goto_3

    .line 875
    :cond_4
    iget-object v0, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v9

    .line 876
    .local v9, "sipListener":Landroid/javax/sip/SipListener;
    instance-of v0, v9, Landroid/gov/nist/javax/sip/SipListenerExt;

    if-eqz v0, :cond_5

    .line 877
    move-object v10, v9

    check-cast v10, Landroid/gov/nist/javax/sip/SipListenerExt;

    new-instance v11, Landroid/gov/nist/javax/sip/IOExceptionEventExt;

    sget-object v2, Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;->KeepAliveTimeout:Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;

    iget-object v0, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iget-object v3, v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myAddress:Ljava/lang/String;

    iget-object v0, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iget v4, v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->myPort:I

    iget-object v0, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerAddress:Ljava/net/InetAddress;

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    iget-object v0, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    iget v6, v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->peerPort:I

    iget-object v0, v8, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel$KeepAliveTimeoutTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->getTransport()Ljava/lang/String;

    move-result-object v7

    move-object v0, v11

    move-object/from16 v1, p0

    invoke-direct/range {v0 .. v7}, Landroid/gov/nist/javax/sip/IOExceptionEventExt;-><init>(Ljava/lang/Object;Landroid/gov/nist/javax/sip/IOExceptionEventExt$Reason;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;)V

    invoke-interface {v10, v11}, Landroid/gov/nist/javax/sip/SipListenerExt;->processIOException(Landroid/javax/sip/IOExceptionEvent;)V

    .line 881
    .end local v9    # "sipListener":Landroid/javax/sip/SipListener;
    :cond_5
    :goto_3
    return-void
.end method
