.class public interface abstract Landroid/javax/sdp/URI;
.super Ljava/lang/Object;
.source "URI.java"

# interfaces
.implements Landroid/javax/sdp/Field;


# virtual methods
.method public abstract get()Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation
.end method

.method public abstract set(Ljava/net/URL;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method
