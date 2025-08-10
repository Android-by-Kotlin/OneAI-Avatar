.class public Landroid/gov/nist/javax/sip/header/Require;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "Require.java"

# interfaces
.implements Landroid/javax/sip/header/RequireHeader;


# static fields
.field private static final serialVersionUID:J = -0x33f351927d496d21L


# instance fields
.field protected optionTag:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 58
    const-string/jumbo v0, "Require"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .line 65
    const-string/jumbo v0, "Require"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 66
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Require;->optionTag:Ljava/lang/String;

    .line 67
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 74
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Require;->optionTag:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public getOptionTag()Ljava/lang/String;
    .locals 1

    .line 99
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Require;->optionTag:Ljava/lang/String;

    return-object v0
.end method

.method public setOptionTag(Ljava/lang/String;)V
    .locals 2
    .param p1, "optionTag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 86
    if-eqz p1, :cond_0

    .line 90
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Require;->optionTag:Ljava/lang/String;

    .line 91
    return-void

    .line 87
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, Require, setOptionTag(), the optionTag parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
