.class public interface abstract Landroid/javax/sip/header/MaxForwardsHeader;
.super Ljava/lang/Object;
.source "MaxForwardsHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "Max-Forwards"


# virtual methods
.method public abstract decrementMaxForwards()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/header/TooManyHopsException;
        }
    .end annotation
.end method

.method public abstract equals(Ljava/lang/Object;)Z
.end method

.method public abstract getMaxForwards()I
.end method

.method public abstract setMaxForwards(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method
