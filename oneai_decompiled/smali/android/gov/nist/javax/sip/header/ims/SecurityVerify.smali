.class public Landroid/gov/nist/javax/sip/header/ims/SecurityVerify;
.super Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;
.source "SecurityVerify.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/header/ims/SecurityVerifyHeader;
.implements Landroid/javax/sip/header/ExtensionHeader;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 61
    const-string/jumbo v0, "Security-Verify"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;-><init>(Ljava/lang/String;)V

    .line 63
    return-void
.end method


# virtual methods
.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 68
    new-instance v0, Ljava/text/ParseException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
