.class Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;
.super Ljava/lang/Object;
.source "NioTcpMessageProcessor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ProcessorTask"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)V
    .locals 0

    .line 189
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 190
    return-void
.end method


# virtual methods
.method public accept(Ljava/nio/channels/SelectionKey;)V
    .locals 6
    .param p1, "selectionKey"    # Ljava/nio/channels/SelectionKey;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 340
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;

    move-result-object v0

    check-cast v0, Ljava/nio/channels/ServerSocketChannel;

    .line 342
    .local v0, "serverSocketChannel":Ljava/nio/channels/ServerSocketChannel;
    invoke-virtual {v0}, Ljava/nio/channels/ServerSocketChannel;->accept()Ljava/nio/channels/SocketChannel;

    move-result-object v1

    .line 343
    .local v1, "client":Ljava/nio/channels/SocketChannel;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/nio/channels/SocketChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 344
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 345
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "got a new connection! "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 349
    :cond_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    invoke-virtual {v2, v4, v1}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->createMessageChannel(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;Ljava/nio/channels/SocketChannel;)Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    .line 351
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 352
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Adding to selector "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 353
    :cond_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selector:Ljava/nio/channels/Selector;

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Ljava/nio/channels/SocketChannel;->register(Ljava/nio/channels/Selector;I)Ljava/nio/channels/SelectionKey;

    .line 355
    return-void
.end method

.method public connect(Ljava/nio/channels/SelectionKey;)V
    .locals 7
    .param p1, "selectionKey"    # Ljava/nio/channels/SelectionKey;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 289
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;

    move-result-object v0

    check-cast v0, Ljava/nio/channels/SocketChannel;

    .line 290
    .local v0, "socketChannel":Ljava/nio/channels/SocketChannel;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->getMessageChannel(Ljava/nio/channels/SocketChannel;)Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    move-result-object v1

    .line 291
    .local v1, "nioTcpMessageChannel":Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    const-string v4, " socket "

    if-eqz v2, :cond_0

    .line 292
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Attempting Connect on  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 293
    :cond_0
    if-nez v1, :cond_2

    .line 294
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 295
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Dead socketChannel"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/Socket;->getPort()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 296
    :cond_1
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 297
    return-void

    .line 300
    :cond_2
    :try_start_0
    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->finishConnect()Z

    .line 301
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 302
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    const-string v4, "Connected Succesfully"

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 304
    :cond_3
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSelfRoutingThreadpoolExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 305
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSelfRoutingThreadpoolExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    new-instance v4, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask$1;

    invoke-direct {v4, p0, v1}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask$1;-><init>(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;)V

    invoke-interface {v2, v4}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 311
    :cond_4
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->triggerConnectSuccess()V

    .line 313
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    invoke-static {v2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$100(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_6

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    invoke-static {v2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$100(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->size()I

    move-result v2

    if-lez v2, :cond_6

    .line 315
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 316
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    const-string/jumbo v4, "Pending Data Available, setting WRITE opts."

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 318
    :cond_5
    const/4 v2, 0x4

    invoke-virtual {p1, v2}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 335
    :cond_6
    nop

    .line 337
    return-void

    .line 320
    :catch_0
    move-exception v2

    .line 321
    .local v2, "e":Ljava/lang/Exception;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v4

    invoke-interface {v4, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 322
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    const-string v4, "Cant connect "

    invoke-interface {v3, v4, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 324
    :cond_7
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 325
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v3, v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSelfRoutingThreadpoolExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v3

    if-eqz v3, :cond_8

    .line 326
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v3, v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSelfRoutingThreadpoolExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v3

    new-instance v4, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask$2;

    invoke-direct {v4, p0, v1, v0}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask$2;-><init>(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;Ljava/nio/channels/SocketChannel;)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 332
    :cond_8
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    invoke-static {v3}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$100(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Queue;

    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->triggerConnectFailure(Ljava/util/Queue;)V

    .line 334
    :goto_1
    return-void
.end method

.method public read(Ljava/nio/channels/SelectionKey;)V
    .locals 7
    .param p1, "selectionKey"    # Ljava/nio/channels/SelectionKey;

    .line 194
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;

    move-result-object v0

    check-cast v0, Ljava/nio/channels/SocketChannel;

    .line 195
    .local v0, "socketChannel":Ljava/nio/channels/SocketChannel;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->getMessageChannel(Ljava/nio/channels/SocketChannel;)Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    move-result-object v1

    .line 196
    .local v1, "nioTcpMessageChannel":Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    const-string v4, " socket "

    if-eqz v2, :cond_0

    .line 197
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Got something on nioTcpMessageChannel "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 198
    :cond_0
    if-nez v1, :cond_2

    .line 199
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 200
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Dead socketChannel"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/Socket;->getPort()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 201
    :cond_1
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 203
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    invoke-static {v2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$100(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    return-void

    .line 207
    :cond_2
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->readChannel()V

    .line 209
    return-void
.end method

.method public run()V
    .locals 10

    .line 358
    const/4 v0, 0x0

    .line 360
    .local v0, "selResult":I
    :goto_0
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v1

    const/16 v2, 0x40

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 361
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v1

    const-string/jumbo v3, "Selector thread cycle begin..."

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logTrace(Ljava/lang/String;)V

    .line 365
    :cond_0
    const/4 v1, 0x0

    .line 366
    .local v1, "polledRequests":I
    :cond_1
    :goto_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v3, v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->changeRequests:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v3

    const/16 v4, 0x20

    if-eqz v3, :cond_6

    const/16 v3, 0x2710

    if-ge v1, v3, :cond_6

    .line 367
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v3, v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->changeRequests:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;

    .line 368
    .local v3, "change":Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;
    add-int/lit8 v1, v1, 0x1

    .line 369
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v5

    invoke-interface {v5, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    const-string v6, " selector = "

    if-eqz v5, :cond_2

    .line 370
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v5

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "ChangeRequest "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v8, v8, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 372
    :cond_2
    :try_start_0
    iget v5, v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;->type:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const-string v7, " blocking="

    packed-switch v5, :pswitch_data_0

    goto/16 :goto_2

    .line 374
    :pswitch_0
    :try_start_1
    iget-object v5, v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;->socket:Ljava/nio/channels/SocketChannel;

    iget-object v8, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v8, v8, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v5, v8}, Ljava/nio/channels/SocketChannel;->keyFor(Ljava/nio/channels/Selector;)Ljava/nio/channels/SelectionKey;

    move-result-object v5

    .line 375
    .local v5, "key":Ljava/nio/channels/SelectionKey;
    if-eqz v5, :cond_1

    invoke-virtual {v5}, Ljava/nio/channels/SelectionKey;->isValid()Z

    move-result v8

    if-nez v8, :cond_3

    goto :goto_1

    .line 376
    :cond_3
    iget v8, v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;->ops:I

    invoke-virtual {v5, v8}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;

    .line 377
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v8

    invoke-interface {v8, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 378
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v4

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Change opts "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v8, v8, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, " key = "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;->socket:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v7}, Ljava/nio/channels/SocketChannel;->isBlocking()Z

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 384
    .end local v5    # "key":Ljava/nio/channels/SelectionKey;
    :pswitch_1
    :try_start_2
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v5

    invoke-interface {v5, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 385
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "NIO register "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v6, v6, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;->socket:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v6}, Ljava/nio/channels/SocketChannel;->isBlocking()Z

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 388
    :cond_4
    iget-object v4, v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;->socket:Ljava/nio/channels/SocketChannel;

    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v5, v5, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selector:Ljava/nio/channels/Selector;

    iget v6, v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;->ops:I

    invoke-virtual {v4, v5, v6}, Ljava/nio/channels/SocketChannel;->register(Ljava/nio/channels/Selector;I)Ljava/nio/channels/SelectionKey;
    :try_end_2
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 391
    goto :goto_2

    .line 389
    :catch_0
    move-exception v4

    .line 390
    .local v4, "e":Ljava/nio/channels/ClosedChannelException;
    :try_start_3
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Socket closed before register ops "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v3, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;->socket:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 396
    .end local v4    # "e":Ljava/nio/channels/ClosedChannelException;
    :cond_5
    :goto_2
    goto :goto_3

    .line 394
    :catch_1
    move-exception v4

    .line 395
    .local v4, "e":Ljava/lang/Exception;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v5

    const-string/jumbo v6, "Problem setting changes"

    invoke-interface {v5, v6, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 397
    .end local v3    # "change":Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ChangeRequest;
    .end local v4    # "e":Ljava/lang/Exception;
    :goto_3
    goto/16 :goto_1

    .line 400
    :cond_6
    const/16 v3, 0x10

    :try_start_4
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v5

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 401
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v5

    const-string v6, "Before select"

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logTrace(Ljava/lang/String;)V

    .line 403
    :cond_7
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v5, v5, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v5}, Ljava/nio/channels/Selector;->isOpen()Z

    move-result v5

    if-nez v5, :cond_9

    .line 404
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 405
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    const-string/jumbo v5, "Selector is closed "

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 407
    :cond_8
    return-void

    .line 409
    :cond_9
    iget-object v5, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v5, v5, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v5}, Ljava/nio/channels/Selector;->select()I

    move-result v5

    move v0, v5

    .line 410
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v5

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 411
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "After select:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".CRs:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v6, v6, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->changeRequests:Ljava/util/Queue;

    invoke-interface {v6}, Ljava/util/Queue;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->logTrace(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_6
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_4 .. :try_end_4} :catch_2

    .line 421
    :cond_a
    goto :goto_4

    .line 417
    :catch_2
    move-exception v2

    .line 418
    .local v2, "cke":Ljava/nio/channels/CancelledKeyException;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v5

    invoke-interface {v5, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 419
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v5

    const-string v6, "Looks like remote side closed a connection"

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 423
    .end local v2    # "cke":Ljava/nio/channels/CancelledKeyException;
    :cond_b
    :goto_4
    if-gtz v0, :cond_d

    .line 424
    :try_start_5
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 425
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    const-string/jumbo v4, "null selectedKeys "

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 427
    :cond_c
    goto/16 :goto_0

    .line 430
    :cond_d
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v2}, Ljava/nio/channels/Selector;->selectedKeys()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 431
    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/nio/channels/SelectionKey;>;"
    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_18

    .line 432
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/nio/channels/SelectionKey;
    :try_end_5
    .catch Ljava/nio/channels/ClosedSelectorException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    .line 434
    .local v5, "selectionKey":Ljava/nio/channels/SelectionKey;
    :try_start_6
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 435
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v6

    invoke-interface {v6, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_e

    .line 436
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "We got selkey "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 438
    :cond_e
    invoke-virtual {v5}, Ljava/nio/channels/SelectionKey;->isValid()Z

    move-result v6

    if-nez v6, :cond_f

    .line 439
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v6

    invoke-interface {v6, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_17

    .line 440
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Invalid key found "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 442
    :cond_f
    invoke-virtual {v5}, Ljava/nio/channels/SelectionKey;->isAcceptable()Z

    move-result v6

    if-eqz v6, :cond_11

    .line 443
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v6

    invoke-interface {v6, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_10

    .line 444
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Accept "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 446
    :cond_10
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->accept(Ljava/nio/channels/SelectionKey;)V

    goto/16 :goto_6

    .line 447
    :cond_11
    invoke-virtual {v5}, Ljava/nio/channels/SelectionKey;->isReadable()Z

    move-result v6

    if-eqz v6, :cond_13

    .line 448
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v6

    invoke-interface {v6, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_12

    .line 449
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Read "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 451
    :cond_12
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->read(Ljava/nio/channels/SelectionKey;)V

    goto :goto_6

    .line 453
    :cond_13
    invoke-virtual {v5}, Ljava/nio/channels/SelectionKey;->isWritable()Z

    move-result v6

    if-eqz v6, :cond_15

    .line 454
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v6

    invoke-interface {v6, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_14

    .line 455
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Write "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 457
    :cond_14
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->write(Ljava/nio/channels/SelectionKey;)V

    goto :goto_6

    .line 458
    :cond_15
    invoke-virtual {v5}, Ljava/nio/channels/SelectionKey;->isConnectable()Z

    move-result v6

    if-eqz v6, :cond_17

    .line 459
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v6

    invoke-interface {v6, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_16

    .line 460
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Connect "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 462
    :cond_16
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->connect(Ljava/nio/channels/SelectionKey;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/nio/channels/ClosedSelectorException; {:try_start_6 .. :try_end_6} :catch_5

    .line 467
    :cond_17
    :goto_6
    goto :goto_7

    .line 464
    :catch_3
    move-exception v6

    .line 465
    .local v6, "e":Ljava/lang/Exception;
    :try_start_7
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v7

    const-string/jumbo v8, "Problem processing selection key event"

    invoke-interface {v7, v8, v6}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_7
    .catch Ljava/nio/channels/ClosedSelectorException; {:try_start_7 .. :try_end_7} :catch_5
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    .line 468
    .end local v5    # "selectionKey":Ljava/nio/channels/SelectionKey;
    .end local v6    # "e":Ljava/lang/Exception;
    :goto_7
    goto/16 :goto_5

    .line 477
    .end local v2    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/nio/channels/SelectionKey;>;"
    :cond_18
    goto :goto_8

    .line 475
    :catch_4
    move-exception v2

    .line 476
    .local v2, "ex":Ljava/lang/Exception;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    const-string/jumbo v4, "Problem in the selector loop"

    invoke-interface {v3, v4, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 478
    .end local v1    # "polledRequests":I
    .end local v2    # "ex":Ljava/lang/Exception;
    :goto_8
    goto/16 :goto_0

    .line 470
    .restart local v1    # "polledRequests":I
    :catch_5
    move-exception v2

    .line 471
    .local v2, "ex":Ljava/nio/channels/ClosedSelectorException;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v4

    invoke-interface {v4, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_19

    .line 472
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    const-string/jumbo v4, "Selector is closed"

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 474
    :cond_19
    return-void

    .line 414
    .end local v2    # "ex":Ljava/nio/channels/ClosedSelectorException;
    :catch_6
    move-exception v2

    .line 415
    .local v2, "e":Ljava/io/IOException;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    const-string/jumbo v4, "problem in select"

    invoke-interface {v3, v4, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 416
    nop

    .line 479
    .end local v1    # "polledRequests":I
    .end local v2    # "e":Ljava/io/IOException;
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public write(Ljava/nio/channels/SelectionKey;)V
    .locals 13
    .param p1, "selectionKey"    # Ljava/nio/channels/SelectionKey;

    .line 212
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;

    move-result-object v0

    check-cast v0, Ljava/nio/channels/SocketChannel;

    .line 214
    .local v0, "socketChannel":Ljava/nio/channels/SocketChannel;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->nioHandler:Landroid/gov/nist/javax/sip/stack/NIOHandler;

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/stack/NIOHandler;->getMessageChannel(Ljava/nio/channels/SocketChannel;)Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;

    move-result-object v1

    .line 215
    .local v1, "nioTcpMessageChannel":Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    const-string v4, " socket "

    if-eqz v2, :cond_0

    .line 216
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Need to write something on nioTcpMessageChannel "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 217
    :cond_0
    const-string v2, ":"

    const-string v5, "Dead socketChannel"

    if-nez v1, :cond_2

    .line 218
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v6

    invoke-interface {v6, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 219
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/Socket;->getPort()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 221
    :cond_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    invoke-static {v2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$100(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 223
    return-void

    .line 226
    :cond_2
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    invoke-static {v6}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$100(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Queue;

    .line 227
    .local v6, "queue":Ljava/util/Queue;, "Ljava/util/Queue<Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;>;"
    const-string/jumbo v7, "We wrote away all data. Setting READ interest. Queue is emtpy now size ="

    const/4 v8, 0x1

    if-eqz v6, :cond_b

    invoke-interface {v6}, Ljava/util/Queue;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_3

    goto/16 :goto_2

    .line 239
    :cond_3
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v9

    invoke-interface {v9, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 241
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Queued items for writing "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v6}, Ljava/util/Queue;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 243
    :cond_4
    const/4 v9, 0x0

    .line 244
    .local v9, "i":I
    :goto_0
    invoke-interface {v6}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_7

    const/16 v10, 0x2710

    if-ge v9, v10, :cond_7

    .line 247
    invoke-interface {v6}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;

    .line 248
    .local v10, "pData":Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;
    iget-object v11, v10, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;->buffer:Ljava/nio/ByteBuffer;

    .line 251
    .local v11, "buf":Ljava/nio/ByteBuffer;
    :try_start_0
    invoke-virtual {v0, v11}, Ljava/nio/channels/SocketChannel;->write(Ljava/nio/ByteBuffer;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 261
    nop

    .line 263
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v12

    .line 265
    .local v12, "remain":I
    if-lez v12, :cond_5

    .line 267
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 268
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Socket buffer filled and more is remaining"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v6}, Ljava/util/Queue;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " remain = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_1

    .line 273
    :cond_5
    invoke-interface {v6}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 275
    nop

    .end local v10    # "pData":Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;
    .end local v11    # "buf":Ljava/nio/ByteBuffer;
    .end local v12    # "remain":I
    add-int/lit8 v9, v9, 0x1

    .line 276
    goto :goto_0

    .line 252
    .restart local v10    # "pData":Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;
    .restart local v11    # "buf":Ljava/nio/ByteBuffer;
    :catch_0
    move-exception v7

    .line 253
    .local v7, "e":Ljava/io/IOException;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v8

    invoke-interface {v8, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 254
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/Socket;->getPort()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " : error message "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v7}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 255
    :cond_6
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageChannel;->close()V

    .line 258
    invoke-interface {v6}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 259
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$ProcessorTask;->this$0:Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    invoke-static {v2}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$100(Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    return-void

    .line 278
    .end local v7    # "e":Ljava/io/IOException;
    .end local v10    # "pData":Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor$PendingData;
    .end local v11    # "buf":Ljava/nio/ByteBuffer;
    :cond_7
    :goto_1
    invoke-interface {v6}, Ljava/util/Queue;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 279
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 280
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v6}, Ljava/util/Queue;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 281
    :cond_8
    invoke-virtual {p1, v8}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;

    .line 284
    :cond_9
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 285
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    const-string v3, "Done writing"

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 286
    :cond_a
    return-void

    .line 229
    .end local v9    # "i":I
    :cond_b
    :goto_2
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 231
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    const-string/jumbo v4, "The queue was empty on write."

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 233
    :cond_c
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 234
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v6}, Ljava/util/Queue;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 236
    :cond_d
    invoke-virtual {p1, v8}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;

    .line 237
    return-void
.end method
