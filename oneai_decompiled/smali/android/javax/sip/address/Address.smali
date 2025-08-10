.class public interface abstract Landroid/javax/sip/address/Address;
.super Ljava/lang/Object;
.source "Address.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# virtual methods
.method public abstract clone()Ljava/lang/Object;
.end method

.method public abstract equals(Ljava/lang/Object;)Z
.end method

.method public abstract getDisplayName()Ljava/lang/String;
.end method

.method public abstract getURI()Landroid/javax/sip/address/URI;
.end method

.method public abstract hashCode()I
.end method

.method public abstract isWildcard()Z
.end method

.method public abstract setDisplayName(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setURI(Landroid/javax/sip/address/URI;)V
.end method

.method public abstract toString()Ljava/lang/String;
.end method
