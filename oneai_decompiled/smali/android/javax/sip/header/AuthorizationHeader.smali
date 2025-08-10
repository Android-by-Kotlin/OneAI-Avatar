.class public interface abstract Landroid/javax/sip/header/AuthorizationHeader;
.super Ljava/lang/Object;
.source "AuthorizationHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Parameters;
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "Authorization"


# virtual methods
.method public abstract getAlgorithm()Ljava/lang/String;
.end method

.method public abstract getCNonce()Ljava/lang/String;
.end method

.method public abstract getNonce()Ljava/lang/String;
.end method

.method public abstract getNonceCount()I
.end method

.method public abstract getOpaque()Ljava/lang/String;
.end method

.method public abstract getQop()Ljava/lang/String;
.end method

.method public abstract getRealm()Ljava/lang/String;
.end method

.method public abstract getResponse()Ljava/lang/String;
.end method

.method public abstract getScheme()Ljava/lang/String;
.end method

.method public abstract getURI()Landroid/javax/sip/address/URI;
.end method

.method public abstract getUsername()Ljava/lang/String;
.end method

.method public abstract setAlgorithm(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setCNonce(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setNonce(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setNonceCount(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setOpaque(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setQop(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setRealm(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setResponse(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setScheme(Ljava/lang/String;)V
.end method

.method public abstract setURI(Landroid/javax/sip/address/URI;)V
.end method

.method public abstract setUsername(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
