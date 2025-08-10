.class public interface abstract Landroid/javax/sdp/Connection;
.super Ljava/lang/Object;
.source "Connection.java"

# interfaces
.implements Landroid/javax/sdp/Field;


# static fields
.field public static final IN:Ljava/lang/String; = "IN"

.field public static final IP4:Ljava/lang/String; = "IP4"

.field public static final IP6:Ljava/lang/String; = "IP6"


# virtual methods
.method public abstract getAddress()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation
.end method

.method public abstract getAddressType()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation
.end method

.method public abstract getNetworkType()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation
.end method

.method public abstract setAddress(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract setAddressType(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract setNetworkType(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method
