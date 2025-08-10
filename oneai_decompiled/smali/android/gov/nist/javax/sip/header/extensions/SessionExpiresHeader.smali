.class public interface abstract Landroid/gov/nist/javax/sip/header/extensions/SessionExpiresHeader;
.super Ljava/lang/Object;
.source "SessionExpiresHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Parameters;
.implements Landroid/javax/sip/header/Header;
.implements Landroid/javax/sip/header/ExtensionHeader;


# static fields
.field public static final NAME:Ljava/lang/String; = "Session-Expires"


# virtual methods
.method public abstract getExpires()I
.end method

.method public abstract getRefresher()Ljava/lang/String;
.end method

.method public abstract setExpires(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract setRefresher(Ljava/lang/String;)V
.end method
