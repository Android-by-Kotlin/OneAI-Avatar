.class public Landroid/javax/sip/SipException;
.super Ljava/lang/Exception;
.source "SipException.java"


# instance fields
.field protected m_Cause:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 56
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 120
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/javax/sip/SipException;->m_Cause:Ljava/lang/Throwable;

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 76
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 120
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/javax/sip/SipException;->m_Cause:Ljava/lang/Throwable;

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .line 97
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 120
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/javax/sip/SipException;->m_Cause:Ljava/lang/Throwable;

    .line 98
    iput-object p2, p0, Landroid/javax/sip/SipException;->m_Cause:Ljava/lang/Throwable;

    .line 99
    return-void
.end method


# virtual methods
.method public getCause()Ljava/lang/Throwable;
    .locals 1

    .line 112
    iget-object v0, p0, Landroid/javax/sip/SipException;->m_Cause:Ljava/lang/Throwable;

    return-object v0
.end method
