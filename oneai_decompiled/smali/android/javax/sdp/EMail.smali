.class public interface abstract Landroid/javax/sdp/EMail;
.super Ljava/lang/Object;
.source "EMail.java"

# interfaces
.implements Landroid/javax/sdp/Field;


# virtual methods
.method public abstract getValue()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation
.end method

.method public abstract setValue(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method
