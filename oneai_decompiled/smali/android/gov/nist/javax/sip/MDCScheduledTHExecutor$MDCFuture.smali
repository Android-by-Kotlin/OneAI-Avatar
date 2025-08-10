.class Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;
.super Ljava/lang/Object;
.source "MDCScheduledTHExecutor.java"

# interfaces
.implements Ljava/util/concurrent/RunnableScheduledFuture;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MDCFuture"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/RunnableScheduledFuture<",
        "TV;>;"
    }
.end annotation


# instance fields
.field done:Z

.field runnable:Ljava/lang/Runnable;

.field task:Ljava/util/concurrent/RunnableScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/RunnableScheduledFuture<",
            "TV;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;Ljava/lang/Runnable;Ljava/util/concurrent/RunnableScheduledFuture;)V
    .locals 0
    .param p2, "r"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "Ljava/util/concurrent/RunnableScheduledFuture<",
            "TV;>;)V"
        }
    .end annotation

    .line 45
    .local p0, "this":Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;, "Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture<TV;>;"
    .local p3, "task":Ljava/util/concurrent/RunnableScheduledFuture;, "Ljava/util/concurrent/RunnableScheduledFuture<TV;>;"
    iput-object p1, p0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->this$0:Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/4 p1, 0x0

    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->done:Z

    .line 46
    iput-object p3, p0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->task:Ljava/util/concurrent/RunnableScheduledFuture;

    .line 47
    iput-object p2, p0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->runnable:Ljava/lang/Runnable;

    .line 48
    return-void
.end method


# virtual methods
.method public cancel(Z)Z
    .locals 1
    .param p1, "mayInterruptIfRunning"    # Z

    .line 62
    .local p0, "this":Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;, "Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->task:Ljava/util/concurrent/RunnableScheduledFuture;

    invoke-interface {v0, p1}, Ljava/util/concurrent/RunnableScheduledFuture;->cancel(Z)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 38
    .local p0, "this":Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;, "Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture<TV;>;"
    check-cast p1, Ljava/util/concurrent/Delayed;

    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->compareTo(Ljava/util/concurrent/Delayed;)I

    move-result p1

    return p1
.end method

.method public compareTo(Ljava/util/concurrent/Delayed;)I
    .locals 1
    .param p1, "o"    # Ljava/util/concurrent/Delayed;

    .line 92
    .local p0, "this":Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;, "Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->task:Ljava/util/concurrent/RunnableScheduledFuture;

    invoke-interface {v0, p1}, Ljava/util/concurrent/RunnableScheduledFuture;->compareTo(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .line 77
    .local p0, "this":Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;, "Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->task:Ljava/util/concurrent/RunnableScheduledFuture;

    invoke-interface {v0}, Ljava/util/concurrent/RunnableScheduledFuture;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .line 82
    .local p0, "this":Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;, "Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->task:Ljava/util/concurrent/RunnableScheduledFuture;

    invoke-interface {v0, p1, p2, p3}, Ljava/util/concurrent/RunnableScheduledFuture;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getDelay(Ljava/util/concurrent/TimeUnit;)J
    .locals 2
    .param p1, "unit"    # Ljava/util/concurrent/TimeUnit;

    .line 87
    .local p0, "this":Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;, "Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->task:Ljava/util/concurrent/RunnableScheduledFuture;

    invoke-interface {v0, p1}, Ljava/util/concurrent/RunnableScheduledFuture;->getDelay(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getRunnable()Ljava/lang/Runnable;
    .locals 1

    .line 96
    .local p0, "this":Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;, "Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->runnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method public isCancelled()Z
    .locals 1

    .line 67
    .local p0, "this":Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;, "Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->task:Ljava/util/concurrent/RunnableScheduledFuture;

    invoke-interface {v0}, Ljava/util/concurrent/RunnableScheduledFuture;->isCancelled()Z

    move-result v0

    return v0
.end method

.method public isDone()Z
    .locals 1

    .line 72
    .local p0, "this":Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;, "Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->task:Ljava/util/concurrent/RunnableScheduledFuture;

    invoke-interface {v0}, Ljava/util/concurrent/RunnableScheduledFuture;->isDone()Z

    move-result v0

    return v0
.end method

.method public isPeriodic()Z
    .locals 1

    .line 52
    .local p0, "this":Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;, "Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->task:Ljava/util/concurrent/RunnableScheduledFuture;

    invoke-interface {v0}, Ljava/util/concurrent/RunnableScheduledFuture;->isPeriodic()Z

    move-result v0

    return v0
.end method

.method public run()V
    .locals 1

    .line 57
    .local p0, "this":Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;, "Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture<TV;>;"
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MDCScheduledTHExecutor$MDCFuture;->task:Ljava/util/concurrent/RunnableScheduledFuture;

    invoke-interface {v0}, Ljava/util/concurrent/RunnableScheduledFuture;->run()V

    .line 58
    return-void
.end method
