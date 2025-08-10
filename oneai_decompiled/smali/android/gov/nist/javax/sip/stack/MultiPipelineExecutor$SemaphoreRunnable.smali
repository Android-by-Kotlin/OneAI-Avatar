.class public Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable;
.super Ljava/lang/Object;
.source "MultiPipelineExecutor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SemaphoreRunnable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field protected parent:Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor<",
            "TK;>;"
        }
    .end annotation
.end field

.field protected semaphore:Ljava/util/concurrent/Semaphore;

.field protected wrappedTask:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;Ljava/util/concurrent/Semaphore;Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;)V
    .locals 0
    .param p1, "task"    # Ljava/lang/Runnable;
    .param p2, "semaphore"    # Ljava/util/concurrent/Semaphore;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "Ljava/util/concurrent/Semaphore;",
            "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor<",
            "TK;>;)V"
        }
    .end annotation

    .line 88
    .local p0, "this":Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable;, "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable<TK;>;"
    .local p3, "parent":Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;, "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor<TK;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable;->wrappedTask:Ljava/lang/Runnable;

    .line 90
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable;->semaphore:Ljava/util/concurrent/Semaphore;

    .line 91
    iput-object p3, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable;->parent:Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;

    .line 92
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 96
    .local p0, "this":Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable;, "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable<TK;>;"
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable;->wrappedTask:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 99
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable;->parent:Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 100
    nop

    .line 101
    return-void

    .line 98
    :catchall_0
    move-exception v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 99
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreRunnable;->parent:Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    throw v0
.end method
