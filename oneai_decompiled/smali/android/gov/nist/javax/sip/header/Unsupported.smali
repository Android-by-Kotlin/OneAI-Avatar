.class public Landroid/gov/nist/javax/sip/header/Unsupported;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "Unsupported.java"

# interfaces
.implements Landroid/javax/sip/header/UnsupportedHeader;


# static fields
.field private static final serialVersionUID:J = -0x2268a6084c766aa7L


# instance fields
.field protected optionTag:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 57
    const-string/jumbo v0, "Unsupported"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "ot"    # Ljava/lang/String;

    .line 64
    const-string/jumbo v0, "Unsupported"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 65
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Unsupported;->optionTag:Ljava/lang/String;

    .line 66
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 73
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Unsupported;->optionTag:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public getOptionTag()Ljava/lang/String;
    .locals 1

    .line 80
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Unsupported;->optionTag:Ljava/lang/String;

    return-object v0
.end method

.method public setOptionTag(Ljava/lang/String;)V
    .locals 2
    .param p1, "o"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 88
    if-eqz p1, :cond_0

    .line 92
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Unsupported;->optionTag:Ljava/lang/String;

    .line 93
    return-void

    .line 89
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception,  Unsupported, setOptionTag(), The option tag parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
