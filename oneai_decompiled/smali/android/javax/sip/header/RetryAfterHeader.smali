.class public interface abstract Landroid/javax/sip/header/RetryAfterHeader;
.super Ljava/lang/Object;
.source "RetryAfterHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Header;
.implements Landroid/javax/sip/header/Parameters;


# static fields
.field public static final NAME:Ljava/lang/String; = "Retry-After"


# virtual methods
.method public abstract getComment()Ljava/lang/String;
.end method

.method public abstract getDuration()I
.end method

.method public abstract getRetryAfter()I
.end method

.method public abstract setComment(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setDuration(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract setRetryAfter(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method
