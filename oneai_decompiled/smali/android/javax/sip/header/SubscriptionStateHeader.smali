.class public interface abstract Landroid/javax/sip/header/SubscriptionStateHeader;
.super Ljava/lang/Object;
.source "SubscriptionStateHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Parameters;
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final ACTIVE:Ljava/lang/String; = "active"

.field public static final DEACTIVATED:Ljava/lang/String; = "deactivated"

.field public static final GIVE_UP:Ljava/lang/String; = "giveup"

.field public static final NAME:Ljava/lang/String; = "Subscription-State"

.field public static final NO_RESOURCE:Ljava/lang/String; = "noresource"

.field public static final PENDING:Ljava/lang/String; = "pending"

.field public static final PROBATION:Ljava/lang/String; = "probation"

.field public static final REJECTED:Ljava/lang/String; = "rejected"

.field public static final TERMINATED:Ljava/lang/String; = "terminated"

.field public static final TIMEOUT:Ljava/lang/String; = "timeout"

.field public static final UNKNOWN:Ljava/lang/String; = "unknown"


# virtual methods
.method public abstract getExpires()I
.end method

.method public abstract getReasonCode()Ljava/lang/String;
.end method

.method public abstract getRetryAfter()I
.end method

.method public abstract getState()Ljava/lang/String;
.end method

.method public abstract setExpires(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract setReasonCode(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
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

.method public abstract setState(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
