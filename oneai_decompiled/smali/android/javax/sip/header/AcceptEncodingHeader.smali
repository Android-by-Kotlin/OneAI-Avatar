.class public interface abstract Landroid/javax/sip/header/AcceptEncodingHeader;
.super Ljava/lang/Object;
.source "AcceptEncodingHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Parameters;
.implements Landroid/javax/sip/header/Encoding;
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "Accept-Encoding"


# virtual methods
.method public abstract getQValue()F
.end method

.method public abstract setQValue(F)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method
