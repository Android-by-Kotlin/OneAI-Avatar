.class public Landroid/javax/sip/InvalidArgumentException;
.super Ljava/lang/Exception;
.source "InvalidArgumentException.java"


# instance fields
.field protected m_Cause:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 79
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/javax/sip/InvalidArgumentException;->m_Cause:Ljava/lang/Throwable;

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 45
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 79
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/javax/sip/InvalidArgumentException;->m_Cause:Ljava/lang/Throwable;

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .line 57
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 79
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/javax/sip/InvalidArgumentException;->m_Cause:Ljava/lang/Throwable;

    .line 58
    iput-object p2, p0, Landroid/javax/sip/InvalidArgumentException;->m_Cause:Ljava/lang/Throwable;

    .line 59
    return-void
.end method


# virtual methods
.method public getCause()Ljava/lang/Throwable;
    .locals 1

    .line 71
    iget-object v0, p0, Landroid/javax/sip/InvalidArgumentException;->m_Cause:Ljava/lang/Throwable;

    return-object v0
.end method
