.class public Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;
.super Ljava/lang/Object;
.source "PipelinedMsgParser.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/gov/nist/javax/sip/stack/QueuedMessageDispatchBase;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Dispatch"
.end annotation


# instance fields
.field callIDOrderingStructure:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;

.field callId:Ljava/lang/String;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

.field time:J


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;Ljava/lang/String;)V
    .locals 2
    .param p2, "callIDOrderingStructure"    # Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
    .param p3, "callId"    # Ljava/lang/String;

    .line 261
    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 262
    iput-object p2, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->callIDOrderingStructure:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;

    .line 263
    iput-object p3, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->callId:Ljava/lang/String;

    .line 264
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->time:J

    .line 265
    return-void
.end method


# virtual methods
.method public getReceptionTime()J
    .locals 2

    .line 318
    iget-wide v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->time:J

    return-wide v0
.end method

.method public run()V
    .locals 8

    .line 270
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->callIDOrderingStructure:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;->getSemaphore()Ljava/util/concurrent/Semaphore;

    move-result-object v0

    .line 271
    .local v0, "semaphore":Ljava/util/concurrent/Semaphore;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->callIDOrderingStructure:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;->getMessagesForCallID()Ljava/util/Queue;

    move-result-object v1

    .line 272
    .local v1, "messagesForCallID":Ljava/util/Queue;, "Ljava/util/Queue<Landroid/gov/nist/javax/sip/message/SIPMessage;>;"
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v2}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$000(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v2

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    if-eqz v2, :cond_0

    .line 273
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v2}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$000(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v2

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    invoke-interface {v1}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/javax/sip/message/Message;

    invoke-interface {v2, v3}, Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;->beforeMessage(Landroid/javax/sip/message/Message;)V

    .line 276
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 279
    goto :goto_0

    .line 277
    :catch_0
    move-exception v2

    .line 278
    .local v2, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Semaphore acquisition for callId "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->callId:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " interrupted"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 281
    .end local v2    # "e":Ljava/lang/InterruptedException;
    :goto_0
    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/message/SIPMessage;

    .line 282
    .local v2, "message":Landroid/gov/nist/javax/sip/message/SIPMessage;
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    const/16 v4, 0x20

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 283
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "semaphore acquired for message "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 287
    :cond_1
    :try_start_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    iget-object v3, v3, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    invoke-interface {v3, v2}, Landroid/gov/nist/javax/sip/parser/SIPMessageListener;->processMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 292
    invoke-interface {v1}, Ljava/util/Queue;->size()I

    move-result v3

    if-gtz v3, :cond_2

    .line 293
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v3}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$200(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v3

    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->callId:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 295
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "CallIDOrderingStructure removed for message "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->callId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 298
    :cond_2
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 299
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "releasing semaphore for message "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 303
    :cond_3
    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 304
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v3}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$200(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 305
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v3}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$200(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v3

    monitor-enter v3

    .line 306
    :try_start_2
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v5}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$200(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->notify()V

    .line 307
    monitor-exit v3

    goto :goto_1

    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 309
    :cond_4
    :goto_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v3}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$000(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v3

    iget-object v3, v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    if-eqz v3, :cond_8

    .line 310
    :goto_2
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v3}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$000(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v3

    iget-object v3, v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    invoke-interface {v3, v2}, Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;->afterMessage(Landroid/javax/sip/message/Message;)V

    goto/16 :goto_4

    .line 292
    :catchall_1
    move-exception v3

    goto/16 :goto_5

    .line 288
    :catch_1
    move-exception v3

    .line 289
    .local v3, "e":Ljava/lang/Exception;
    :try_start_3
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v5

    const-string v6, "Error occured processing message"

    invoke-interface {v5, v6, v3}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 292
    .end local v3    # "e":Ljava/lang/Exception;
    invoke-interface {v1}, Ljava/util/Queue;->size()I

    move-result v3

    if-gtz v3, :cond_5

    .line 293
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v3}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$200(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v3

    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->callId:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 295
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "CallIDOrderingStructure removed for message "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->callId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 298
    :cond_5
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 299
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "releasing semaphore for message "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 303
    :cond_6
    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 304
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v3}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$200(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 305
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v3}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$200(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v3

    monitor-enter v3

    .line 306
    :try_start_4
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v5}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$200(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->notify()V

    .line 307
    monitor-exit v3

    goto :goto_3

    :catchall_2
    move-exception v4

    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw v4

    .line 309
    :cond_7
    :goto_3
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v3}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$000(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v3

    iget-object v3, v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    if-eqz v3, :cond_8

    .line 310
    goto/16 :goto_2

    .line 313
    :cond_8
    :goto_4
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 314
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "dispatch task done on "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " threadname "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v5}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$300(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 316
    :cond_9
    return-void

    .line 292
    :goto_5
    invoke-interface {v1}, Ljava/util/Queue;->size()I

    move-result v5

    if-gtz v5, :cond_a

    .line 293
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v5}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$200(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v5

    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->callId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v5

    invoke-interface {v5, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 295
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "CallIDOrderingStructure removed for message "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->callId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 298
    :cond_a
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v5

    invoke-interface {v5, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 299
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "releasing semaphore for message "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 303
    :cond_b
    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 304
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v4}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$200(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_c

    .line 305
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v4}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$200(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v4

    monitor-enter v4

    .line 306
    :try_start_5
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v5}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$200(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->notify()V

    .line 307
    monitor-exit v4

    goto :goto_6

    :catchall_3
    move-exception v3

    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    throw v3

    .line 309
    :cond_c
    :goto_6
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v4}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$000(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v4

    iget-object v4, v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    if-eqz v4, :cond_d

    .line 310
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;->this$0:Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v4}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->access$000(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v4

    iget-object v4, v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    invoke-interface {v4, v2}, Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;->afterMessage(Landroid/javax/sip/message/Message;)V

    :cond_d
    throw v3
.end method
