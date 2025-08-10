.class public Landroid/gov/nist/javax/sip/header/Warning;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "Warning.java"

# interfaces
.implements Landroid/javax/sip/header/WarningHeader;


# static fields
.field private static final serialVersionUID:J = -0x2fa5a26955923b9bL


# instance fields
.field protected agent:Ljava/lang/String;

.field protected code:I

.field protected text:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 69
    const-string/jumbo v0, "Warning"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 70
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 3
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 76
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Warning;->text:Ljava/lang/String;

    const-string v1, " "

    if-eqz v0, :cond_0

    iget v0, p0, Landroid/gov/nist/javax/sip/header/Warning;->code:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/Warning;->agent:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/Warning;->text:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget v0, p0, Landroid/gov/nist/javax/sip/header/Warning;->code:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Warning;->agent:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public getAgent()Ljava/lang/String;
    .locals 1

    .line 100
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Warning;->agent:Ljava/lang/String;

    return-object v0
.end method

.method public getCode()I
    .locals 1

    .line 92
    iget v0, p0, Landroid/gov/nist/javax/sip/header/Warning;->code:I

    return v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .line 108
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Warning;->text:Ljava/lang/String;

    return-object v0
.end method

.method public setAgent(Ljava/lang/String;)V
    .locals 2
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 131
    if-eqz p1, :cond_0

    .line 134
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Warning;->agent:Ljava/lang/String;

    .line 136
    return-void

    .line 132
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "the host parameter in the Warning header is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setCode(I)V
    .locals 3
    .param p1, "code"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 117
    const/16 v0, 0x63

    if-le p1, v0, :cond_0

    const/16 v0, 0x3e8

    if-ge p1, v0, :cond_0

    .line 118
    iput p1, p0, Landroid/gov/nist/javax/sip/header/Warning;->code:I

    .line 123
    return-void

    .line 120
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Code parameter in the Warning header is invalid: code="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setText(Ljava/lang/String;)V
    .locals 3
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 144
    if-eqz p1, :cond_0

    .line 149
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Warning;->text:Ljava/lang/String;

    .line 150
    return-void

    .line 145
    :cond_0
    new-instance v0, Ljava/text/ParseException;

    const-string/jumbo v1, "The text parameter in the Warning header is null"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
