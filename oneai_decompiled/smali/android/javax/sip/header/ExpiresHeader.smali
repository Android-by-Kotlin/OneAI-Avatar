.class public interface abstract Landroid/javax/sip/header/ExpiresHeader;
.super Ljava/lang/Object;
.source "ExpiresHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "Expires"


# virtual methods
.method public abstract getExpires()I
.end method

.method public abstract setExpires(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method
