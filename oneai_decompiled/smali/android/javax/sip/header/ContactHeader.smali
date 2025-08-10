.class public interface abstract Landroid/javax/sip/header/ContactHeader;
.super Ljava/lang/Object;
.source "ContactHeader.java"

# interfaces
.implements Landroid/javax/sip/header/HeaderAddress;
.implements Landroid/javax/sip/header/Parameters;
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "Contact"


# virtual methods
.method public abstract getExpires()I
.end method

.method public abstract getQValue()F
.end method

.method public abstract isWildCard()Z
.end method

.method public abstract setExpires(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract setQValue(F)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract setWildCard()V
.end method
