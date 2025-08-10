.class Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;
.super Ljava/lang/Object;
.source "SIPTransactionImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TransactionSemaphore"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x16ad7df07e3eb884L


# instance fields
.field lock:Ljava/util/concurrent/locks/ReentrantLock;

.field sem:Ljava/util/concurrent/Semaphore;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;)V
    .locals 1

    .line 216
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 213
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->sem:Ljava/util/concurrent/Semaphore;

    .line 214
    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 217
    iget-object p1, p1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    check-cast p1, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/SipStackImpl;->isReEntrantListener()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 218
    new-instance p1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {p1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    goto :goto_0

    .line 220
    :cond_0
    new-instance p1, Ljava/util/concurrent/Semaphore;

    const/4 v0, 0x1

    invoke-direct {p1, v0, v0}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->sem:Ljava/util/concurrent/Semaphore;

    .line 222
    :goto_0
    return-void
.end method


# virtual methods
.method public acquire()Z
    .locals 3

    .line 226
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    check-cast v0, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->isReEntrantListener()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 227
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    goto :goto_0

    .line 229
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->sem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 231
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 232
    :catch_0
    move-exception v0

    .line 233
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v1

    const-string/jumbo v2, "Unexpected exception acquiring sem"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 235
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 236
    const/4 v1, 0x0

    return v1
.end method

.method public release()V
    .locals 3

    .line 257
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    check-cast v0, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->isReEntrantListener()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 258
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 259
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_0

    .line 262
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->sem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 267
    :cond_1
    :goto_0
    goto :goto_1

    .line 264
    :catch_0
    move-exception v0

    .line 265
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v1

    const-string/jumbo v2, "Unexpected exception releasing sem"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 268
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method public tryAcquire()Z
    .locals 4

    .line 242
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    check-cast v0, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->isReEntrantListener()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 243
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxListenerResponseTime:I

    int-to-long v1, v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    return v0

    .line 245
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->sem:Ljava/util/concurrent/Semaphore;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl$TransactionSemaphore;->this$0:Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;

    iget-object v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget v1, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxListenerResponseTime:I

    int-to-long v1, v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 247
    :catch_0
    move-exception v0

    .line 248
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPTransactionImpl;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v1

    const-string/jumbo v2, "Unexpected exception trying acquiring sem"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 250
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 251
    const/4 v1, 0x0

    return v1
.end method
