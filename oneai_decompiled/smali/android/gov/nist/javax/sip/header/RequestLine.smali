.class public Landroid/gov/nist/javax/sip/header/RequestLine;
.super Landroid/gov/nist/javax/sip/header/SIPObject;
.source "RequestLine.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/header/SipRequestLine;


# static fields
.field private static final serialVersionUID:J = -0x2d9bbb31060a5df9L


# instance fields
.field protected method:Ljava/lang/String;

.field protected sipVersion:Ljava/lang/String;

.field protected uri:Landroid/gov/nist/javax/sip/address/GenericURI;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 63
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/SIPObject;-><init>()V

    .line 64
    const-string/jumbo v0, "SIP/2.0"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/address/GenericURI;Ljava/lang/String;)V
    .locals 1
    .param p1, "requestURI"    # Landroid/gov/nist/javax/sip/address/GenericURI;
    .param p2, "method"    # Ljava/lang/String;

    .line 99
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/SIPObject;-><init>()V

    .line 100
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    .line 101
    iput-object p2, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->method:Ljava/lang/String;

    .line 102
    const-string/jumbo v0, "SIP/2.0"

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    .line 103
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 218
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/SIPObject;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/RequestLine;

    .line 219
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/RequestLine;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    if-eqz v1, :cond_0

    .line 220
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/address/GenericURI;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/address/GenericURI;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/RequestLine;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    .line 221
    :cond_0
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 1

    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/RequestLine;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 77
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->method:Ljava/lang/String;

    const-string v1, " "

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->method:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    if-eqz v0, :cond_1

    .line 82
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/GenericURI;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 83
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    const-string v0, "\r\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "other"    # Ljava/lang/Object;

    .line 191
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 192
    return v0

    .line 193
    :cond_0
    const/4 v1, 0x1

    if-ne p0, p1, :cond_1

    .line 194
    return v1

    .line 195
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 196
    return v0

    .line 198
    :cond_2
    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sip/header/RequestLine;

    .line 199
    .local v2, "that":Landroid/gov/nist/javax/sip/header/RequestLine;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->method:Ljava/lang/String;

    if-nez v3, :cond_3

    .line 200
    iget-object v3, v2, Landroid/gov/nist/javax/sip/header/RequestLine;->method:Ljava/lang/String;

    if-eqz v3, :cond_4

    .line 201
    return v0

    .line 202
    :cond_3
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->method:Ljava/lang/String;

    iget-object v4, v2, Landroid/gov/nist/javax/sip/header/RequestLine;->method:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 203
    return v0

    .line 204
    :cond_4
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    if-nez v3, :cond_5

    .line 205
    iget-object v3, v2, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    if-eqz v3, :cond_6

    .line 206
    return v0

    .line 207
    :cond_5
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    iget-object v4, v2, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 208
    return v0

    .line 209
    :cond_6
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    if-nez v3, :cond_7

    .line 210
    iget-object v3, v2, Landroid/gov/nist/javax/sip/header/RequestLine;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    if-eqz v3, :cond_8

    .line 211
    return v0

    .line 212
    :cond_7
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    iget-object v4, v2, Landroid/gov/nist/javax/sip/header/RequestLine;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/address/GenericURI;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 213
    return v0

    .line 214
    :cond_8
    return v1
.end method

.method public getMethod()Ljava/lang/String;
    .locals 1

    .line 109
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->method:Ljava/lang/String;

    return-object v0
.end method

.method public getSipVersion()Ljava/lang/String;
    .locals 1

    .line 116
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getUri()Landroid/gov/nist/javax/sip/address/GenericURI;
    .locals 1

    .line 94
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    return-object v0
.end method

.method public bridge synthetic getUri()Landroid/javax/sip/address/URI;
    .locals 1

    .line 41
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/RequestLine;->getUri()Landroid/gov/nist/javax/sip/address/GenericURI;

    move-result-object v0

    return-object v0
.end method

.method public getVersionMajor()Ljava/lang/String;
    .locals 5

    .line 144
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 145
    const/4 v0, 0x0

    return-object v0

    .line 146
    :cond_0
    const/4 v0, 0x0

    .line 147
    .local v0, "major":Ljava/lang/String;
    const/4 v1, 0x0

    .line 148
    .local v1, "slash":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_5

    .line 149
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x2e

    if-ne v3, v4, :cond_1

    .line 150
    goto :goto_2

    .line 151
    :cond_1
    if-eqz v1, :cond_3

    .line 152
    if-nez v0, :cond_2

    .line 153
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 155
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 157
    :cond_3
    :goto_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x2f

    if-ne v3, v4, :cond_4

    .line 158
    const/4 v1, 0x1

    .line 148
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 160
    .end local v2    # "i":I
    :cond_5
    :goto_2
    return-object v0
.end method

.method public getVersionMinor()Ljava/lang/String;
    .locals 5

    .line 167
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 168
    const/4 v0, 0x0

    return-object v0

    .line 169
    :cond_0
    const/4 v0, 0x0

    .line 170
    .local v0, "minor":Ljava/lang/String;
    const/4 v1, 0x0

    .line 171
    .local v1, "dot":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_4

    .line 172
    if-eqz v1, :cond_2

    .line 173
    if-nez v0, :cond_1

    .line 174
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 176
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 178
    :cond_2
    :goto_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x2e

    if-ne v3, v4, :cond_3

    .line 179
    const/4 v1, 0x1

    .line 171
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 181
    .end local v2    # "i":I
    :cond_4
    return-object v0
.end method

.method public setMethod(Ljava/lang/String;)V
    .locals 0
    .param p1, "method"    # Ljava/lang/String;

    .line 130
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->method:Ljava/lang/String;

    .line 131
    return-void
.end method

.method public setSipVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "version"    # Ljava/lang/String;

    .line 137
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->sipVersion:Ljava/lang/String;

    .line 138
    return-void
.end method

.method public setUri(Landroid/javax/sip/address/URI;)V
    .locals 1
    .param p1, "uri"    # Landroid/javax/sip/address/URI;

    .line 123
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/address/GenericURI;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/RequestLine;->uri:Landroid/gov/nist/javax/sip/address/GenericURI;

    .line 124
    return-void
.end method
