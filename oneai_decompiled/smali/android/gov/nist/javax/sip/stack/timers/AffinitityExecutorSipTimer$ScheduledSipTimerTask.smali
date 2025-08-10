.class Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer$ScheduledSipTimerTask;
.super Ljava/lang/Object;
.source "AffinitityExecutorSipTimer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScheduledSipTimerTask"
.end annotation


# instance fields
.field private task:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)V
    .locals 0
    .param p2, "task"    # Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    .line 120
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer$ScheduledSipTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer$ScheduledSipTimerTask;->task:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    .line 122
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 127
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer$ScheduledSipTimerTask;->task:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/AffinitityExecutorSipTimer$ScheduledSipTimerTask;->task:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->runTask()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 133
    :cond_0
    goto :goto_0

    .line 130
    :catchall_0
    move-exception v0

    .line 131
    .local v0, "e":Ljava/lang/Throwable;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v2, "SIP stack timer task failed due to exception:"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 132
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 134
    .end local v0    # "e":Ljava/lang/Throwable;
    :goto_0
    return-void
.end method
