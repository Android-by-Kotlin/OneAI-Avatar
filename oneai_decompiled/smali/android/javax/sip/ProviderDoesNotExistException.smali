.class public Landroid/javax/sip/ProviderDoesNotExistException;
.super Landroid/javax/sip/SipException;
.source "ProviderDoesNotExistException.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Landroid/javax/sip/SipException;-><init>()V

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .line 67
    invoke-direct {p0, p1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .line 91
    invoke-direct {p0, p1, p2}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 93
    return-void
.end method
