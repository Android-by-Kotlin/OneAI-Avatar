.class public Landroid/javax/sip/ObjectInUseException;
.super Landroid/javax/sip/SipException;
.source "ObjectInUseException.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 54
    invoke-direct {p0}, Landroid/javax/sip/SipException;-><init>()V

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .line 74
    invoke-direct {p0, p1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .line 76
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .line 98
    invoke-direct {p0, p1, p2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 100
    return-void
.end method
