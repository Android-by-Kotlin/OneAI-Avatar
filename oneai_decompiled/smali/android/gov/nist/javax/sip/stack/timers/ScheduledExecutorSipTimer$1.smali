.class Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer$1;
.super Ljava/lang/Object;
.source "ScheduledExecutorSipTimer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->schedulePurgeTaskIfNeeded()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;)V
    .locals 0

    .line 58
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer$1;->this$0:Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 61
    :try_start_0
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    const-string/jumbo v2, "Purging canceled timer tasks..."

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 64
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer$1;->this$0:Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->threadPoolExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->purge()V

    .line 65
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 66
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    const-string/jumbo v1, "Purging canceled timer tasks completed."

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    :cond_1
    goto :goto_0

    .line 69
    :catch_0
    move-exception v0

    .line 70
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;->access$000()Landroid/gov/nist/core/StackLogger;

    move-result-object v1

    const-string/jumbo v2, "failed to execute purge"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 72
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method
