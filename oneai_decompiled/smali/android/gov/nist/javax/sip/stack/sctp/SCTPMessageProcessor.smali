.class public final Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;
.super Landroid/gov/nist/javax/sip/stack/MessageProcessor;
.source "SCTPMessageProcessor.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final channels:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;",
            ">;"
        }
    .end annotation
.end field

.field private doClose:Z

.field private isRunning:Z

.field private key:Ljava/nio/channels/SelectionKey;

.field private sctpServerChannel:Lcom/sun/nio/sctp/SctpServerChannel;

.field private selector:Ljava/nio/channels/Selector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 40
    const-string/jumbo v0, "sctp"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;-><init>(Ljava/lang/String;)V

    .line 33
    new-instance v0, Ljava/util/concurrent/ConcurrentSkipListSet;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentSkipListSet;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->channels:Ljava/util/Set;

    .line 41
    return-void
.end method


# virtual methods
.method public createMessageChannel(Landroid/gov/nist/core/HostPort;)Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .locals 2
    .param p1, "targetHostPort"    # Landroid/gov/nist/core/HostPort;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 56
    invoke-virtual {p1}, Landroid/gov/nist/core/HostPort;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {p1}, Landroid/gov/nist/core/HostPort;->getPort()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->createMessageChannel(Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/MessageChannel;

    move-result-object v0

    return-object v0
.end method

.method public createMessageChannel(Ljava/net/InetAddress;I)Landroid/gov/nist/javax/sip/stack/MessageChannel;
    .locals 2
    .param p1, "targetHost"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    new-instance v0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;

    new-instance v1, Ljava/net/InetSocketAddress;

    invoke-direct {v1, p1, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-direct {v0, p0, v1}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;Ljava/net/InetSocketAddress;)V

    .line 65
    .local v0, "c":Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->channels:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 66
    return-object v0
.end method

.method public getDefaultTargetPort()I
    .locals 1

    .line 71
    const/16 v0, 0x13c4

    return v0
.end method

.method public getMaximumMessageSize()I
    .locals 1

    .line 76
    const v0, 0x7fffffff

    return v0
.end method

.method public getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .locals 1

    .line 81
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    return-object v0
.end method

.method getSelector()Ljava/nio/channels/Selector;
    .locals 1

    .line 43
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->selector:Ljava/nio/channels/Selector;

    return-object v0
.end method

.method public inUse()Z
    .locals 1

    .line 86
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->isRunning:Z

    return v0
.end method

.method public isSecure()Z
    .locals 1

    .line 91
    const/4 v0, 0x0

    return v0
.end method

.method registerChannel(Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;Lcom/sun/nio/sctp/SctpChannel;)Ljava/nio/channels/SelectionKey;
    .locals 2
    .param p1, "c"    # Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;
    .param p2, "channel"    # Lcom/sun/nio/sctp/SctpChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/channels/ClosedChannelException;
        }
    .end annotation

    .line 47
    monitor-enter p0

    .line 48
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    .line 49
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->selector:Ljava/nio/channels/Selector;

    const/4 v1, 0x1

    invoke-virtual {p2, v0, v1, p1}, Lcom/sun/nio/sctp/SctpChannel;->register(Ljava/nio/channels/Selector;ILjava/lang/Object;)Ljava/nio/channels/SelectionKey;

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 50
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method removeChannel(Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;)V
    .locals 1
    .param p1, "messageChannel"    # Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;

    .line 174
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->channels:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 175
    return-void
.end method

.method public run()V
    .locals 6

    .line 97
    nop

    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->select()I

    move-result v0

    .line 98
    .local v0, "n":I
    if-lez v0, :cond_3

    .line 99
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v1}, Ljava/nio/channels/Selector;->selectedKeys()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 100
    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/nio/channels/SelectionKey;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 101
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/nio/channels/SelectionKey;

    .line 102
    .local v2, "key":Ljava/nio/channels/SelectionKey;
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 103
    invoke-virtual {v2}, Ljava/nio/channels/SelectionKey;->isReadable()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 104
    invoke-virtual {v2}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;

    .line 105
    .local v3, "channel":Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->readMessages()V

    .end local v3    # "channel":Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;
    goto :goto_1

    .line 106
    :cond_1
    invoke-virtual {v2}, Ljava/nio/channels/SelectionKey;->isAcceptable()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 107
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->sctpServerChannel:Lcom/sun/nio/sctp/SctpServerChannel;

    invoke-virtual {v3}, Lcom/sun/nio/sctp/SctpServerChannel;->accept()Lcom/sun/nio/sctp/SctpChannel;

    move-result-object v3

    .line 108
    .local v3, "ch":Lcom/sun/nio/sctp/SctpChannel;
    new-instance v4, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;

    invoke-direct {v4, p0, v3}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;-><init>(Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;Lcom/sun/nio/sctp/SctpChannel;)V

    .line 109
    .local v4, "c":Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->channels:Ljava/util/Set;

    invoke-interface {v5, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 106
    .end local v3    # "ch":Lcom/sun/nio/sctp/SctpChannel;
    .end local v4    # "c":Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;
    :cond_2
    :goto_1
    nop

    .line 111
    .end local v2    # "key":Ljava/nio/channels/SelectionKey;
    :goto_2
    goto :goto_0

    .line 114
    .end local v1    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/nio/channels/SelectionKey;>;"
    :cond_3
    monitor-enter p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    :try_start_1
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->doClose:Z

    if-eqz v1, :cond_4

    .line 116
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v1}, Ljava/nio/channels/Selector;->close()V

    .line 117
    monitor-exit p0

    return-void

    .line 119
    :cond_4
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 120
    .end local v0    # "n":I
    :try_start_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->isOpen()Z

    move-result v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    if-nez v0, :cond_0

    .line 130
    goto :goto_4

    .line 119
    .restart local v0    # "n":I
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 121
    .end local v0    # "n":I
    :catch_0
    move-exception v0

    .line 122
    .local v0, "ioe":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 124
    :try_start_5
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v1}, Ljava/nio/channels/Selector;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 128
    :goto_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->stop()V

    .line 129
    goto :goto_4

    .line 128
    :catchall_1
    move-exception v1

    goto :goto_5

    .line 125
    :catch_1
    move-exception v1

    .line 126
    .local v1, "e":Ljava/io/IOException;
    :try_start_6
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .end local v1    # "e":Ljava/io/IOException;
    goto :goto_3

    .line 131
    .end local v0    # "ioe":Ljava/io/IOException;
    :goto_4
    return-void

    .line 128
    .restart local v0    # "ioe":Ljava/io/IOException;
    :goto_5
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->stop()V

    throw v1
.end method

.method public start()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 136
    invoke-static {}, Lcom/sun/nio/sctp/SctpServerChannel;->open()Lcom/sun/nio/sctp/SctpServerChannel;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->sctpServerChannel:Lcom/sun/nio/sctp/SctpServerChannel;

    .line 137
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->sctpServerChannel:Lcom/sun/nio/sctp/SctpServerChannel;

    new-instance v1, Ljava/net/InetSocketAddress;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->getIpAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->getPort()I

    move-result v3

    invoke-direct {v1, v2, v3}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v0, v1}, Lcom/sun/nio/sctp/SctpServerChannel;->bind(Ljava/net/SocketAddress;)Lcom/sun/nio/sctp/SctpServerChannel;

    .line 138
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->sctpServerChannel:Lcom/sun/nio/sctp/SctpServerChannel;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sun/nio/sctp/SctpServerChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 140
    invoke-static {}, Ljava/nio/channels/Selector;->open()Ljava/nio/channels/Selector;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->selector:Ljava/nio/channels/Selector;

    .line 141
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->sctpServerChannel:Lcom/sun/nio/sctp/SctpServerChannel;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->selector:Ljava/nio/channels/Selector;

    const/16 v2, 0x10

    invoke-virtual {v0, v1, v2}, Lcom/sun/nio/sctp/SctpServerChannel;->register(Ljava/nio/channels/Selector;I)Ljava/nio/channels/SelectionKey;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->key:Ljava/nio/channels/SelectionKey;

    .line 144
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->isRunning:Z

    .line 145
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 146
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1, v0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 147
    const-string/jumbo v0, "SCTPMessageProcessorThread"

    invoke-virtual {v1, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 148
    const/16 v0, 0xa

    invoke-virtual {v1, v0}, Ljava/lang/Thread;->setPriority(I)V

    .line 149
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 150
    return-void
.end method

.method public stop()V
    .locals 2

    .line 154
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->isRunning:Z

    .line 155
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->doClose:Z

    .line 157
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->channels:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;

    .line 158
    .local v1, "c":Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;->closeNoRemove()V

    .line 159
    .end local v1    # "c":Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageChannel;
    goto :goto_0

    .line 160
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->channels:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 162
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->key:Ljava/nio/channels/SelectionKey;

    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 163
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->sctpServerChannel:Lcom/sun/nio/sctp/SctpServerChannel;

    invoke-virtual {v0}, Lcom/sun/nio/sctp/SctpServerChannel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 167
    monitor-enter p0

    .line 168
    :try_start_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    .line 169
    monitor-exit p0

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 167
    :catchall_1
    move-exception v0

    goto :goto_2

    .line 164
    :catch_0
    move-exception v0

    .line 165
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 167
    .end local v0    # "e":Ljava/io/IOException;
    monitor-enter p0

    .line 168
    :try_start_3
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    .line 169
    monitor-exit p0

    .line 170
    :goto_1
    nop

    .line 171
    return-void

    .line 169
    :catchall_2
    move-exception v0

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0

    .line 167
    :goto_2
    monitor-enter p0

    .line 168
    :try_start_4
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/sctp/SCTPMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v1}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    .line 169
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    throw v0

    :catchall_3
    move-exception v0

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    throw v0
.end method
