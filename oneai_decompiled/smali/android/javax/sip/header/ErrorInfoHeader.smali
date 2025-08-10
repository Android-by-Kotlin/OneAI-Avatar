.class public interface abstract Landroid/javax/sip/header/ErrorInfoHeader;
.super Ljava/lang/Object;
.source "ErrorInfoHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Parameters;
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "Error-Info"


# virtual methods
.method public abstract getErrorInfo()Landroid/javax/sip/address/URI;
.end method

.method public abstract getErrorMessage()Ljava/lang/String;
.end method

.method public abstract setErrorInfo(Landroid/javax/sip/address/URI;)V
.end method

.method public abstract setErrorMessage(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
