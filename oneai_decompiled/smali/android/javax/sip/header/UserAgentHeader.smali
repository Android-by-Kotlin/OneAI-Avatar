.class public interface abstract Landroid/javax/sip/header/UserAgentHeader;
.super Ljava/lang/Object;
.source "UserAgentHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "User-Agent"


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
