.class public abstract Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.super Ljava/lang/Object;
.source "SIPStackTimerTask.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/ThreadAffinityIdentifier;


# instance fields
.field timerTask:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->timerTask:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public cleanUpBeforeCancel()V
    .locals 0

    .line 54
    return-void
.end method

.method public getSipTimerTask()Ljava/lang/Object;
    .locals 1

    .line 61
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->timerTask:Ljava/lang/Object;

    return-object v0
.end method

.method public abstract runTask()V
.end method

.method public setSipTimerTask(Ljava/lang/Object;)V
    .locals 0
    .param p1, "timer"    # Ljava/lang/Object;

    .line 57
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;->timerTask:Ljava/lang/Object;

    .line 58
    return-void
.end method
