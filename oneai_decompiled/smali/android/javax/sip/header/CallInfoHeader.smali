.class public interface abstract Landroid/javax/sip/header/CallInfoHeader;
.super Ljava/lang/Object;
.source "CallInfoHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Parameters;
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "Call-Info"


# virtual methods
.method public abstract getInfo()Landroid/javax/sip/address/URI;
.end method

.method public abstract getPurpose()Ljava/lang/String;
.end method

.method public abstract setInfo(Landroid/javax/sip/address/URI;)V
.end method

.method public abstract setPurpose(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
