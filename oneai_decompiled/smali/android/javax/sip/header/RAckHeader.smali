.class public interface abstract Landroid/javax/sip/header/RAckHeader;
.super Ljava/lang/Object;
.source "RAckHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "RAck"


# virtual methods
.method public abstract getCSeqNumber()I
.end method

.method public abstract getMethod()Ljava/lang/String;
.end method

.method public abstract getRSeqNumber()I
.end method

.method public abstract setCSeqNumber(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract setMethod(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setRSeqNumber(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method
