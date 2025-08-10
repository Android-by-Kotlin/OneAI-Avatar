.class public interface abstract Landroid/javax/sip/header/ViaHeader;
.super Ljava/lang/Object;
.source "ViaHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Parameters;
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "Via"


# virtual methods
.method public abstract equals(Ljava/lang/Object;)Z
.end method

.method public abstract getBranch()Ljava/lang/String;
.end method

.method public abstract getHost()Ljava/lang/String;
.end method

.method public abstract getMAddr()Ljava/lang/String;
.end method

.method public abstract getPort()I
.end method

.method public abstract getProtocol()Ljava/lang/String;
.end method

.method public abstract getRPort()I
.end method

.method public abstract getReceived()Ljava/lang/String;
.end method

.method public abstract getTTL()I
.end method

.method public abstract getTransport()Ljava/lang/String;
.end method

.method public abstract setBranch(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setHost(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setMAddr(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setPort(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract setProtocol(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setRPort()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract setReceived(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setTTL(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract setTransport(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
