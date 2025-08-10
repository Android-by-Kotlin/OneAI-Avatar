.class public interface abstract Landroid/javax/sip/address/TelURL;
.super Ljava/lang/Object;
.source "TelURL.java"

# interfaces
.implements Landroid/javax/sip/address/URI;
.implements Landroid/javax/sip/header/Parameters;


# virtual methods
.method public abstract getIsdnSubAddress()Ljava/lang/String;
.end method

.method public abstract getPhoneContext()Ljava/lang/String;
.end method

.method public abstract getPhoneNumber()Ljava/lang/String;
.end method

.method public abstract getPostDial()Ljava/lang/String;
.end method

.method public abstract isGlobal()Z
.end method

.method public abstract setGlobal(Z)V
.end method

.method public abstract setIsdnSubAddress(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setPhoneContext(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setPhoneNumber(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setPostDial(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract toString()Ljava/lang/String;
.end method
