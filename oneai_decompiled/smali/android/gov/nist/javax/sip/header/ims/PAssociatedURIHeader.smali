.class public interface abstract Landroid/gov/nist/javax/sip/header/ims/PAssociatedURIHeader;
.super Ljava/lang/Object;
.source "PAssociatedURIHeader.java"

# interfaces
.implements Landroid/javax/sip/header/HeaderAddress;
.implements Landroid/javax/sip/header/Parameters;
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "P-Associated-URI"


# virtual methods
.method public abstract getAssociatedURI()Landroid/javax/sip/address/URI;
.end method

.method public abstract setAssociatedURI(Landroid/javax/sip/address/URI;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation
.end method
