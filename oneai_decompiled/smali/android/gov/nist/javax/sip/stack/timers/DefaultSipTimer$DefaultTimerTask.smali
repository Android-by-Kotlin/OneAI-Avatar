.class Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer$DefaultTimerTask;
.super Ljava/util/TimerTask;
.source "DefaultSipTimer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DefaultTimerTask"
.end annotation


# instance fields
.field private task:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)V
    .locals 0
    .param p2, "task"    # Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    .line 58
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer$DefaultTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 59
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer$DefaultTimerTask;->task:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    .line 60
    invoke-virtual {p2, p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->setSipTimerTask(Ljava/lang/Object;)V

    .line 61
    return-void
.end method


# virtual methods
.method public cancel()Z
    .locals 1

    .line 76
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer$DefaultTimerTask;->task:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    if-eqz v0, :cond_0

    .line 77
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer$DefaultTimerTask;->task:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->cleanUpBeforeCancel()V

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer$DefaultTimerTask;->task:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    .line 80
    :cond_0
    invoke-super {p0}, Ljava/util/TimerTask;->cancel()Z

    move-result v0

    return v0
.end method

.method public run()V
    .locals 3

    .line 66
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer$DefaultTimerTask;->task:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer$DefaultTimerTask;->task:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->runTask()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    :cond_0
    goto :goto_0

    .line 69
    :catchall_0
    move-exception v0

    .line 70
    .local v0, "e":Ljava/lang/Throwable;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v2, "SIP stack timer task failed due to exception:"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 71
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 73
    .end local v0    # "e":Ljava/lang/Throwable;
    :goto_0
    return-void
.end method
