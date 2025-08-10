.class public Landroid/gov/nist/javax/sip/header/Reason;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "Reason.java"

# interfaces
.implements Landroid/javax/sip/header/ReasonHeader;


# static fields
.field private static final serialVersionUID:J = -0x7b8f262d9617f9acL


# instance fields
.field public final CAUSE:Ljava/lang/String;

.field public final TEXT:Ljava/lang/String;

.field protected protocol:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 128
    const-string/jumbo v0, "Reason"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 62
    const-string/jumbo v0, "text"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Reason;->TEXT:Ljava/lang/String;

    .line 63
    const-string/jumbo v0, "cause"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Reason;->CAUSE:Ljava/lang/String;

    .line 129
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 146
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Reason;->protocol:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Reason;->parameters:Landroid/gov/nist/core/NameValueList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Reason;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 148
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 149
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Reason;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 151
    :cond_0
    return-object p1
.end method

.method public getCause()I
    .locals 1

    .line 71
    const-string/jumbo v0, "cause"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Reason;->getParameterAsInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 137
    const-string/jumbo v0, "Reason"

    return-object v0
.end method

.method public getProtocol()Ljava/lang/String;
    .locals 1

    .line 97
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Reason;->protocol:Ljava/lang/String;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 2

    .line 121
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Reason;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "text"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setCause(I)V
    .locals 3
    .param p1, "cause"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 80
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Reason;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "cause"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 81
    return-void
.end method

.method public setProtocol(Ljava/lang/String;)V
    .locals 0
    .param p1, "protocol"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 89
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Reason;->protocol:Ljava/lang/String;

    .line 90
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 106
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 108
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x22

    if-eq v0, v1, :cond_0

    .line 109
    invoke-static {p1}, Landroid/gov/nist/javax/sip/Utils;->getQuotedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 111
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Reason;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "text"

    invoke-virtual {v0, v1, p1}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 113
    :cond_1
    return-void
.end method
