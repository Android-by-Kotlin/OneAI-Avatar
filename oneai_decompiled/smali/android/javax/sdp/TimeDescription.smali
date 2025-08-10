.class public interface abstract Landroid/javax/sdp/TimeDescription;
.super Ljava/lang/Object;
.source "TimeDescription.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;


# static fields
.field public static final NTP_CONST:J = 0x83aa7e80L


# virtual methods
.method public abstract getRepeatTimes(Z)Ljava/util/Vector;
.end method

.method public abstract getTime()Landroid/javax/sdp/Time;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation
.end method

.method public abstract setRepeatTimes(Ljava/util/Vector;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract setTime(Landroid/javax/sdp/Time;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method
