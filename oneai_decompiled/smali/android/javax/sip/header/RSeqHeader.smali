.class public interface abstract Landroid/javax/sip/header/RSeqHeader;
.super Ljava/lang/Object;
.source "RSeqHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "RSeq"


# virtual methods
.method public abstract getSequenceNumber()I
.end method

.method public abstract setSequenceNumber(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method
