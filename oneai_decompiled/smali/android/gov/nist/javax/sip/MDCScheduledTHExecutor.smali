.class public Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;
.super Ljava/util/concurrent/ScheduledThreadPoolExecutor;
.source "MDCScheduledTHExecutor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;
    }
.end annotation


# static fields
.field private static final AFFINITY_THREAD_VAR:Ljava/lang/String; = "AffTh"

.field private static logger:Landroid/gov/nist/core/StackLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 18
    const-class v0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "corePoolSize"    # I

    .line 23
    invoke-direct {p0, p1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(I)V

    .line 24
    return-void
.end method

.method public constructor <init>(ILjava/util/concurrent/RejectedExecutionHandler;)V
    .locals 0
    .param p1, "corePoolSize"    # I
    .param p2, "handler"    # Ljava/util/concurrent/RejectedExecutionHandler;

    .line 31
    invoke-direct {p0, p1, p2}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/RejectedExecutionHandler;)V

    .line 32
    return-void
.end method

.method public constructor <init>(ILjava/util/concurrent/ThreadFactory;)V
    .locals 0
    .param p1, "corePoolSize"    # I
    .param p2, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;

    .line 27
    invoke-direct {p0, p1, p2}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    .line 28
    return-void
.end method

.method public constructor <init>(ILjava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V
    .locals 0
    .param p1, "corePoolSize"    # I
    .param p2, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;
    .param p3, "handler"    # Ljava/util/concurrent/RejectedExecutionHandler;

    .line 35
    invoke-direct {p0, p1, p2, p3}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 36
    return-void
.end method


# virtual methods
.method protected afterExecute(Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 5
    .param p1, "r"    # Ljava/lang/Runnable;
    .param p2, "t"    # Ljava/lang/Throwable;

    .line 109
    invoke-super {p0, p1, p2}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->afterExecute(Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    .line 110
    sget-object v0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x10

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 111
    instance-of v0, p1, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;

    if-eqz v0, :cond_2

    .line 112
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;

    .line 113
    .local v0, "future":Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;
    iget-object v1, v0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->runnable:Ljava/lang/Runnable;

    instance-of v1, v1, Landroid/gov/nist/javax/sip/MDCTask;

    if-eqz v1, :cond_2

    .line 114
    iget-object v1, v0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->runnable:Ljava/lang/Runnable;

    check-cast v1, Landroid/gov/nist/javax/sip/MDCTask;

    .line 115
    .local v1, "mTask":Landroid/gov/nist/javax/sip/MDCTask;
    invoke-interface {v1}, Landroid/gov/nist/javax/sip/MDCTask;->getMDCVars()Ljava/util/Map;

    move-result-object v2

    .line 116
    .local v2, "mdcVars":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v2, :cond_1

    .line 117
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 118
    .local v4, "varKey":Ljava/lang/String;
    invoke-static {v4}, Lorg/apache/log4j/MDC;->remove(Ljava/lang/String;)V

    .line 119
    .end local v4    # "varKey":Ljava/lang/String;
    goto :goto_0

    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_0
    goto :goto_1

    .line 121
    :cond_1
    const-string v3, "AffTh"

    invoke-static {v3}, Lorg/apache/log4j/MDC;->remove(Ljava/lang/String;)V

    .line 126
    .end local v0    # "future":Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;
    .end local v1    # "mTask":Landroid/gov/nist/javax/sip/MDCTask;
    .end local v2    # "mdcVars":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    :goto_1
    return-void
.end method

.method protected beforeExecute(Ljava/lang/Thread;Ljava/lang/Runnable;)V
    .locals 6
    .param p1, "t"    # Ljava/lang/Thread;
    .param p2, "r"    # Ljava/lang/Runnable;

    .line 130
    sget-object v0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x10

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 131
    instance-of v0, p2, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;

    if-eqz v0, :cond_2

    .line 132
    move-object v0, p2

    check-cast v0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;

    .line 133
    .local v0, "future":Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;
    iget-object v1, v0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->runnable:Ljava/lang/Runnable;

    instance-of v1, v1, Landroid/gov/nist/javax/sip/MDCTask;

    if-eqz v1, :cond_2

    .line 134
    iget-object v1, v0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->runnable:Ljava/lang/Runnable;

    check-cast v1, Landroid/gov/nist/javax/sip/MDCTask;

    .line 135
    .local v1, "mTask":Landroid/gov/nist/javax/sip/MDCTask;
    invoke-interface {v1}, Landroid/gov/nist/javax/sip/MDCTask;->getMDCVars()Ljava/util/Map;

    move-result-object v2

    .line 136
    .local v2, "mdcVars":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v2, :cond_1

    .line 137
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 138
    .local v4, "varKey":Ljava/lang/String;
    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/apache/log4j/MDC;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 139
    .end local v4    # "varKey":Ljava/lang/String;
    goto :goto_0

    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_0
    goto :goto_1

    .line 141
    :cond_1
    invoke-interface {v1}, Landroid/gov/nist/javax/sip/MDCTask;->getThreadHash()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 142
    const-string v3, "AffTh"

    invoke-interface {v1}, Landroid/gov/nist/javax/sip/MDCTask;->getThreadHash()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/apache/log4j/MDC;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 148
    .end local v0    # "future":Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;
    .end local v1    # "mTask":Landroid/gov/nist/javax/sip/MDCTask;
    .end local v2    # "mdcVars":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    :goto_1
    invoke-super {p0, p1, p2}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->beforeExecute(Ljava/lang/Thread;Ljava/lang/Runnable;)V

    .line 149
    return-void
.end method

.method public decorateTask(Ljava/lang/Runnable;Ljava/util/concurrent/RunnableScheduledFuture;)Ljava/util/concurrent/RunnableScheduledFuture;
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Runnable;",
            "Ljava/util/concurrent/RunnableScheduledFuture<",
            "TV;>;)",
            "Ljava/util/concurrent/RunnableScheduledFuture<",
            "TV;>;"
        }
    .end annotation

    .line 104
    .local p2, "task":Ljava/util/concurrent/RunnableScheduledFuture;, "Ljava/util/concurrent/RunnableScheduledFuture<TV;>;"
    new-instance v0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;

    invoke-direct {v0, p0, p1, p2}, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;-><init>(Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;Ljava/lang/Runnable;Ljava/util/concurrent/RunnableScheduledFuture;)V

    return-object v0
.end method
