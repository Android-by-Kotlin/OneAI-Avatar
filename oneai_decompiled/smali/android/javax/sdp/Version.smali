.class public interface abstract Landroid/javax/sdp/Version;
.super Ljava/lang/Object;
.source "Version.java"

# interfaces
.implements Landroid/javax/sdp/Field;


# virtual methods
.method public abstract getVersion()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation
.end method

.method public abstract setVersion(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method
