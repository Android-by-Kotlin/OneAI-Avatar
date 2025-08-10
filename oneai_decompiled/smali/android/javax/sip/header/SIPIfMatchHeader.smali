.class public interface abstract Landroid/javax/sip/header/SIPIfMatchHeader;
.super Ljava/lang/Object;
.source "SIPIfMatchHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "SIP-If-Match"


# virtual methods
.method public abstract getETag()Ljava/lang/String;
.end method

.method public abstract setETag(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
