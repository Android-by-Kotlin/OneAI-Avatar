.class public interface abstract Landroid/javax/sdp/TimeZoneAdjustment;
.super Ljava/lang/Object;
.source "TimeZoneAdjustment.java"

# interfaces
.implements Landroid/javax/sdp/Field;


# virtual methods
.method public abstract getTypedTime()Z
.end method

.method public abstract getZoneAdjustments(Z)Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation
.end method

.method public abstract setTypedTime(Z)V
.end method

.method public abstract setZoneAdjustments(Ljava/util/Hashtable;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method
