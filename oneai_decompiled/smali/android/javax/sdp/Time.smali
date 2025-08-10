.class public interface abstract Landroid/javax/sdp/Time;
.super Ljava/lang/Object;
.source "Time.java"

# interfaces
.implements Landroid/javax/sdp/Field;


# virtual methods
.method public abstract getStart()Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation
.end method

.method public abstract getStop()Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation
.end method

.method public abstract getTypedTime()Z
.end method

.method public abstract isZero()Z
.end method

.method public abstract setStart(Ljava/util/Date;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract setStop(Ljava/util/Date;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract setTypedTime(Z)V
.end method

.method public abstract setZero()V
.end method
