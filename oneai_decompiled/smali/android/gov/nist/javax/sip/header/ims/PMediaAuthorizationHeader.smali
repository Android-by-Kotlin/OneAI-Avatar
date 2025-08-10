.class public interface abstract Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorizationHeader;
.super Ljava/lang/Object;
.source "PMediaAuthorizationHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "P-Media-Authorization"


# virtual methods
.method public abstract getToken()Ljava/lang/String;
.end method

.method public abstract setMediaAuthorizationToken(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method
