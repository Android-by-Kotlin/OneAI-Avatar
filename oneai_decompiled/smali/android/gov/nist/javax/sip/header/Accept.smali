.class public final Landroid/gov/nist/javax/sip/header/Accept;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "Accept.java"

# interfaces
.implements Landroid/javax/sip/header/AcceptHeader;


# static fields
.field private static final serialVersionUID:J = -0x6d2a503d84e287e7L


# instance fields
.field protected mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 62
    const-string v0, "Accept"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 63
    return-void
.end method


# virtual methods
.method public allowsAllContentSubTypes()Z
    .locals 3

    .line 82
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 83
    return v1

    .line 85
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/MediaRange;->getSubtype()Ljava/lang/String;

    move-result-object v0

    const-string v2, "*"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public allowsAllContentTypes()Z
    .locals 3

    .line 70
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 71
    return v1

    .line 73
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/header/MediaRange;->type:Ljava/lang/String;

    const-string v2, "*"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public clone()Ljava/lang/Object;
    .locals 2

    .line 195
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/Accept;

    .line 196
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/Accept;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    if-eqz v1, :cond_0

    .line 197
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/MediaRange;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/MediaRange;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    .line 198
    :cond_0
    return-object v0
.end method

.method protected encodeBody()Ljava/lang/String;
    .locals 1

    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Accept;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 96
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    if-eqz v0, :cond_0

    .line 97
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/MediaRange;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 98
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->parameters:Landroid/gov/nist/core/NameValueList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 99
    const/16 v0, 0x3b

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 100
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 102
    :cond_1
    return-object p1
.end method

.method public getContentSubType()Ljava/lang/String;
    .locals 1

    .line 126
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    if-nez v0, :cond_0

    .line 127
    const/4 v0, 0x0

    return-object v0

    .line 129
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/MediaRange;->getSubtype()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .line 116
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    if-nez v0, :cond_0

    .line 117
    const/4 v0, 0x0

    return-object v0

    .line 119
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/MediaRange;->getType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMediaRange()Landroid/gov/nist/javax/sip/header/MediaRange;
    .locals 1

    .line 109
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    return-object v0
.end method

.method public getQValue()F
    .locals 1

    .line 137
    const-string/jumbo v0, "q"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Accept;->getParameterAsFloat(Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public hasQValue()Z
    .locals 1

    .line 145
    const-string/jumbo v0, "q"

    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->hasParameter(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public removeQValue()V
    .locals 1

    .line 153
    const-string/jumbo v0, "q"

    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->removeParameter(Ljava/lang/String;)V

    .line 154
    return-void
.end method

.method public setContentSubType(Ljava/lang/String;)V
    .locals 1
    .param p1, "subtype"    # Ljava/lang/String;

    .line 160
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    if-nez v0, :cond_0

    .line 161
    new-instance v0, Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/MediaRange;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    .line 162
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/MediaRange;->setSubtype(Ljava/lang/String;)V

    .line 163
    return-void
.end method

.method public setContentType(Ljava/lang/String;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .line 169
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    if-nez v0, :cond_0

    .line 170
    new-instance v0, Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/MediaRange;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    .line 171
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/MediaRange;->setType(Ljava/lang/String;)V

    .line 172
    return-void
.end method

.method public setMediaRange(Landroid/gov/nist/javax/sip/header/MediaRange;)V
    .locals 0
    .param p1, "m"    # Landroid/gov/nist/javax/sip/header/MediaRange;

    .line 191
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Accept;->mediaRange:Landroid/gov/nist/javax/sip/header/MediaRange;

    .line 192
    return-void
.end method

.method public setQValue(F)V
    .locals 2
    .param p1, "qValue"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 180
    const/high16 v0, -0x40800000    # -1.0f

    cmpl-float v0, p1, v0

    const-string/jumbo v1, "q"

    if-nez v0, :cond_0

    .line 181
    invoke-super {p0, v1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->removeParameter(Ljava/lang/String;)V

    .line 182
    :cond_0
    invoke-super {p0, v1, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->setParameter(Ljava/lang/String;F)V

    .line 184
    return-void
.end method
