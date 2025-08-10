.class public interface abstract Landroid/javax/sip/header/AcceptHeader;
.super Ljava/lang/Object;
.source "AcceptHeader.java"

# interfaces
.implements Landroid/javax/sip/header/MediaType;
.implements Landroid/javax/sip/header/Parameters;
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "Accept"


# virtual methods
.method public abstract allowsAllContentSubTypes()Z
.end method

.method public abstract allowsAllContentTypes()Z
.end method

.method public abstract getQValue()F
.end method

.method public abstract setQValue(F)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method
