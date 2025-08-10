.class public interface abstract Landroid/javax/sip/header/ServerHeader;
.super Ljava/lang/Object;
.source "ServerHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "Server"


# virtual methods
.method public abstract getProduct()Ljava/util/ListIterator;
.end method

.method public abstract setProduct(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
