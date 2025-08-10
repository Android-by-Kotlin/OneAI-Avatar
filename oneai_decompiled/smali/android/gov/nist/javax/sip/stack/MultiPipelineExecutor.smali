.class public Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;
.super Ljava/lang/Object;
.source "MultiPipelineExecutor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable;,
        Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private executor:Ljava/util/concurrent/ExecutorService;

.field private map:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "TK;",
            "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList<",
            "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable<",
            "TK;>;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "threads"    # I

    .line 41
    .local p0, "this":Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;, "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor<TK;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;->map:Ljava/util/concurrent/ConcurrentHashMap;

    .line 42
    new-instance v0, Landroid/gov/nist/core/NamingThreadFactory;

    const-string/jumbo v1, "jain_sip_multi_pipeline_executor"

    invoke-direct {v0, v1}, Landroid/gov/nist/core/NamingThreadFactory;-><init>(Ljava/lang/String;)V

    invoke-static {p1, v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;->executor:Ljava/util/concurrent/ExecutorService;

    .line 43
    return-void
.end method


# virtual methods
.method public declared-synchronized addTask(Ljava/lang/Object;Ljava/lang/Runnable;)V
    .locals 3
    .param p2, "task"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .local p0, "this":Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;, "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor<TK;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    monitor-enter p0

    .line 45
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;

    .line 46
    .local v0, "list":Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;, "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList<Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable<TK;>;>;"
    if-nez v0, :cond_0

    .line 47
    new-instance v1, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;-><init>()V

    move-object v0, v1

    .line 48
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;, "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor<TK;>;"
    :cond_0
    new-instance v1, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable;

    iget-object v2, v0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-direct {v1, p2, v2, p0}, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable;-><init>(Ljava/lang/Runnable;Ljava/util/concurrent/Semaphore;Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;)V

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;->addFirst(Ljava/lang/Object;)V

    .line 51
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    monitor-exit p0

    return-void

    .line 44
    .end local v0    # "list":Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;, "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList<Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable<TK;>;>;"
    .end local p1    # "key":Ljava/lang/Object;, "TK;"
    .end local p2    # "task":Ljava/lang/Runnable;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized processTasks()V
    .locals 5

    .local p0, "this":Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;, "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor<TK;>;"
    monitor-enter p0

    .line 56
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    goto :goto_0

    .line 55
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;, "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor<TK;>;"
    :catchall_0
    move-exception v0

    goto :goto_2

    .line 57
    :catch_0
    move-exception v0

    .line 59
    .local v0, "e1":Ljava/lang/InterruptedException;
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 61
    .end local v0    # "e1":Ljava/lang/InterruptedException;
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 63
    .local v0, "keys":Ljava/util/Enumeration;, "Ljava/util/Enumeration<TK;>;"
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 64
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    .line 65
    .local v1, "key":Ljava/lang/Object;, "TK;"
    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;

    .line 66
    .local v2, "e":Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;, "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList<Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable<TK;>;>;"
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, v2, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->tryAcquire()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 67
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;->pollLast()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Runnable;

    .line 68
    .local v3, "task":Ljava/lang/Runnable;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v4, v3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 71
    .end local v2    # "e":Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;, "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList<Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable<TK;>;>;"
    .end local v3    # "task":Ljava/lang/Runnable;
    :cond_0
    goto :goto_1

    .line 72
    .end local v1    # "key":Ljava/lang/Object;, "TK;"
    :cond_1
    monitor-exit p0

    return-void

    .line 55
    .end local v0    # "keys":Ljava/util/Enumeration;, "Ljava/util/Enumeration<TK;>;"
    :goto_2
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method public remove(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    .line 75
    .local p0, "this":Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;, "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor<TK;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    return-void
.end method
