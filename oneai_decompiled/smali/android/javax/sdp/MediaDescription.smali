.class public interface abstract Landroid/javax/sdp/MediaDescription;
.super Ljava/lang/Object;
.source "MediaDescription.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;


# virtual methods
.method public abstract addAttribute(Landroid/gov/nist/javax/sdp/fields/AttributeField;)V
.end method

.method public abstract addDynamicPayloads(Ljava/util/Vector;Ljava/util/Vector;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract getAttribute(Ljava/lang/String;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation
.end method

.method public abstract getAttributes(Z)Ljava/util/Vector;
.end method

.method public abstract getBandwidth(Ljava/lang/String;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation
.end method

.method public abstract getBandwidths(Z)Ljava/util/Vector;
.end method

.method public abstract getConnection()Landroid/javax/sdp/Connection;
.end method

.method public abstract getInfo()Landroid/javax/sdp/Info;
.end method

.method public abstract getKey()Landroid/javax/sdp/Key;
.end method

.method public abstract getMedia()Landroid/javax/sdp/Media;
.end method

.method public abstract getMimeParameters()Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract getMimeTypes()Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract getPreconditionFields()Ljava/util/Vector;
.end method

.method public abstract removeAttribute(Ljava/lang/String;)V
.end method

.method public abstract removeBandwidth(Ljava/lang/String;)V
.end method

.method public abstract setAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract setAttributes(Ljava/util/Vector;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract setBandwidth(Ljava/lang/String;I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract setBandwidths(Ljava/util/Vector;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract setConnection(Landroid/javax/sdp/Connection;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract setInfo(Landroid/javax/sdp/Info;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract setKey(Landroid/javax/sdp/Key;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract setMedia(Landroid/javax/sdp/Media;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract setPreconditionFields(Ljava/util/Vector;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation
.end method

.method public abstract setPreconditions(Landroid/gov/nist/javax/sdp/fields/PreconditionFields;)V
.end method
