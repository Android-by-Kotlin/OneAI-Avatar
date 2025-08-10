.class Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer$ScheduledSipTimerTask;
.super Ljava/lang/Object;
.source "ScheduledExecutorSipTimer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScheduledSipTimerTask"
.end annotation


# instance fields
.field private task:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)V
    .locals 0
    .param p2, "task"    # Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    .line 147
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer$ScheduledSipTimerTask;->this$0:Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer$ScheduledSipTimerTask;->task:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    .line 149
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 154
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer$ScheduledSipTimerTask;->task:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    if-eqz v0, :cond_0

    .line 155
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/timers/ScheduledExecutorSipTimer$ScheduledSipTimerTask;->task:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->runTask()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 160
    :cond_0
    goto :goto_0

    .line 157
    :catchall_0
    move-exception v0

    .line 158
    .local v0, "e":Ljava/lang/Throwable;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v2, "SIP stack timer task failed due to exception:"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 159
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 161
    .end local v0    # "e":Ljava/lang/Throwable;
    :goto_0
    return-void
.end method
