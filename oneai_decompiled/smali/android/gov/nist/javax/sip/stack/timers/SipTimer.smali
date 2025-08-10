.class public interface abstract Landroid/gov/nist/javax/sip/stack/timers/SipTimer;
.super Ljava/lang/Object;
.source "SipTimer.java"


# virtual methods
.method public abstract cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z
.end method

.method public abstract isStarted()Z
.end method

.method public abstract schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z
.end method

.method public abstract scheduleWithFixedDelay(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;JJ)Z
.end method

.method public abstract start(Landroid/gov/nist/javax/sip/SipStackImpl;Ljava/util/Properties;)V
.end method

.method public abstract stop()V
.end method
