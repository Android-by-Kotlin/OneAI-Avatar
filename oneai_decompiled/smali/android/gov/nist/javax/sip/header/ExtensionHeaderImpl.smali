.class public Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "ExtensionHeaderImpl.java"

# interfaces
.implements Landroid/javax/sip/header/ExtensionHeader;


# static fields
.field private static final serialVersionUID:J = -0x78a704c29fbbc6b9L


# instance fields
.field protected value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 56
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>()V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "headerName"    # Ljava/lang/String;

    .line 60
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 61
    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .locals 2

    .line 108
    new-instance v0, Ljava/lang/StringBuffer;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;->headerName:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encodeBody()Ljava/lang/String;
    .locals 1

    .line 128
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;->getHeaderValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 120
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;->encodeBody()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public getHeaderValue()Ljava/lang/String;
    .locals 5

    .line 84
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;->value:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 85
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;->value:Ljava/lang/String;

    return-object v0

    .line 87
    :cond_0
    const/4 v0, 0x0

    .line 90
    .local v0, "encodedHdr":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;->encode()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 93
    nop

    .line 94
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .local v1, "buffer":Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    const/4 v3, 0x0

    if-lez v2, :cond_1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    const/16 v4, 0x3a

    if-eq v2, v4, :cond_1

    .line 96
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 98
    :cond_1
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 99
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;->value:Ljava/lang/String;

    .line 100
    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;->value:Ljava/lang/String;

    return-object v2

    .line 91
    .end local v1    # "buffer":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v1

    .line 92
    .local v1, "ex":Ljava/lang/Exception;
    const/4 v2, 0x0

    return-object v2
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "headerName"    # Ljava/lang/String;

    .line 69
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;->headerName:Ljava/lang/String;

    .line 70
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .line 76
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;->value:Ljava/lang/String;

    .line 77
    return-void
.end method
