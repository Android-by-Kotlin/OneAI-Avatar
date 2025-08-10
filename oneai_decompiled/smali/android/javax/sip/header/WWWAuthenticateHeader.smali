.class public interface abstract Landroid/javax/sip/header/WWWAuthenticateHeader;
.super Ljava/lang/Object;
.source "WWWAuthenticateHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Parameters;
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "WWW-Authenticate"


# virtual methods
.method public abstract getAlgorithm()Ljava/lang/String;
.end method

.method public abstract getDomain()Ljava/lang/String;
.end method

.method public abstract getNonce()Ljava/lang/String;
.end method

.method public abstract getOpaque()Ljava/lang/String;
.end method

.method public abstract getQop()Ljava/lang/String;
.end method

.method public abstract getRealm()Ljava/lang/String;
.end method

.method public abstract getScheme()Ljava/lang/String;
.end method

.method public abstract getURI()Landroid/javax/sip/address/URI;
.end method

.method public abstract isStale()Z
.end method

.method public abstract setAlgorithm(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setDomain(Ljava/lang/String;)V
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

.method public abstract setScheme(Ljava/lang/String;)V
.end method

.method public abstract setStale(Z)V
.end method

.method public abstract setURI(Landroid/javax/sip/address/URI;)V
.end method
