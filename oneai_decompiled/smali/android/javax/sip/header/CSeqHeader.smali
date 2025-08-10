.class public interface abstract Landroid/javax/sip/header/CSeqHeader;
.super Ljava/lang/Object;
.source "CSeqHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "CSeq"


# virtual methods
.method public abstract equals(Ljava/lang/Object;)Z
.end method

.method public abstract getMethod()Ljava/lang/String;
.end method

.method public abstract getSeqNumber()J
.end method

.method public abstract getSequenceNumber()I
.end method

.method public abstract setMethod(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setSeqNumber(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract setSequenceNumber(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method
