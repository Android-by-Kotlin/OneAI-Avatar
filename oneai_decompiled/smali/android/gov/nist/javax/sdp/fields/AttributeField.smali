.class public Landroid/gov/nist/javax/sdp/fields/AttributeField;
.super Landroid/gov/nist/javax/sdp/fields/SDPField;
.source "AttributeField.java"

# interfaces
.implements Landroid/javax/sdp/Attribute;


# instance fields
.field protected attribute:Landroid/gov/nist/core/NameValue;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 52
    const-string/jumbo v0, "a="

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sdp/fields/SDPField;-><init>(Ljava/lang/String;)V

    .line 53
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 177
    invoke-super {p0}, Landroid/gov/nist/javax/sdp/fields/SDPField;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 178
    .local v0, "retval":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/AttributeField;->attribute:Landroid/gov/nist/core/NameValue;

    if-eqz v1, :cond_0

    .line 179
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/AttributeField;->attribute:Landroid/gov/nist/core/NameValue;

    invoke-virtual {v1}, Landroid/gov/nist/core/NameValue;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/core/NameValue;

    iput-object v1, v0, Landroid/gov/nist/javax/sdp/fields/AttributeField;->attribute:Landroid/gov/nist/core/NameValue;

    .line 180
    :cond_0
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 3

    .line 67
    const-string/jumbo v0, "a="

    .line 68
    .local v0, "encoded_string":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/AttributeField;->attribute:Landroid/gov/nist/core/NameValue;

    if-eqz v1, :cond_0

    .line 69
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/AttributeField;->attribute:Landroid/gov/nist/core/NameValue;

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->encode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 70
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "that"    # Ljava/lang/Object;

    .line 184
    instance-of v0, p1, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 185
    :cond_0
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 186
    .local v0, "other":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    .line 188
    .local v2, "equalNames":Z
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/core/NameValue;->getValueAsObject()Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x1

    if-eqz v3, :cond_1

    .line 189
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/core/NameValue;->getValueAsObject()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v5

    invoke-virtual {v5}, Landroid/gov/nist/core/NameValue;->getValueAsObject()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    .local v3, "equalValues":Z
    goto :goto_0

    .line 191
    .end local v3    # "equalValues":Z
    :cond_1
    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/core/NameValue;->getValueAsObject()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_2

    move v3, v4

    goto :goto_0

    :cond_2
    move v3, v1

    .line 194
    .restart local v3    # "equalValues":Z
    :goto_0
    if-eqz v2, :cond_3

    if-eqz v3, :cond_3

    move v1, v4

    :cond_3
    return v1
.end method

.method public getAttribute()Landroid/gov/nist/core/NameValue;
    .locals 1

    .line 48
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/AttributeField;->attribute:Landroid/gov/nist/core/NameValue;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 82
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 83
    .local v0, "nameValue":Landroid/gov/nist/core/NameValue;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 84
    return-object v1

    .line 86
    :cond_0
    invoke-virtual {v0}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v2

    .line 87
    .local v2, "name":Ljava/lang/String;
    if-nez v2, :cond_1

    .line 88
    return-object v1

    .line 90
    :cond_1
    return-object v2
.end method

.method public getValue()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 132
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 133
    .local v0, "nameValue":Landroid/gov/nist/core/NameValue;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 134
    return-object v1

    .line 136
    :cond_0
    invoke-virtual {v0}, Landroid/gov/nist/core/NameValue;->getValueAsObject()Ljava/lang/Object;

    move-result-object v2

    .line 137
    .local v2, "value":Ljava/lang/Object;
    if-nez v2, :cond_1

    .line 138
    return-object v1

    .line 139
    :cond_1
    instance-of v1, v2, Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 140
    move-object v1, v2

    check-cast v1, Ljava/lang/String;

    return-object v1

    .line 142
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public hasValue()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 115
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 116
    .local v0, "nameValue":Landroid/gov/nist/core/NameValue;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 117
    return v1

    .line 119
    :cond_0
    invoke-virtual {v0}, Landroid/gov/nist/core/NameValue;->getValueAsObject()Ljava/lang/Object;

    move-result-object v2

    .line 120
    .local v2, "value":Ljava/lang/Object;
    if-nez v2, :cond_1

    .line 121
    return v1

    .line 123
    :cond_1
    const/4 v1, 0x1

    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 199
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 200
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->encode()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0

    .line 199
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Attribute is null cannot compute hashCode "

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setAttribute(Landroid/gov/nist/core/NameValue;)V
    .locals 2
    .param p1, "a"    # Landroid/gov/nist/core/NameValue;

    .line 58
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/AttributeField;->attribute:Landroid/gov/nist/core/NameValue;

    .line 59
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/AttributeField;->attribute:Landroid/gov/nist/core/NameValue;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValue;->setSeparator(Ljava/lang/String;)V

    .line 60
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 99
    if-eqz p1, :cond_1

    .line 102
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 103
    .local v0, "nameValue":Landroid/gov/nist/core/NameValue;
    if-nez v0, :cond_0

    .line 104
    new-instance v1, Landroid/gov/nist/core/NameValue;

    invoke-direct {v1}, Landroid/gov/nist/core/NameValue;-><init>()V

    move-object v0, v1

    .line 105
    :cond_0
    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValue;->setName(Ljava/lang/String;)V

    .line 106
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->setAttribute(Landroid/gov/nist/core/NameValue;)V

    .line 108
    .end local v0    # "nameValue":Landroid/gov/nist/core/NameValue;
    return-void

    .line 100
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The name is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 151
    if-eqz p1, :cond_1

    .line 154
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 155
    .local v0, "nameValue":Landroid/gov/nist/core/NameValue;
    if-nez v0, :cond_0

    .line 156
    new-instance v1, Landroid/gov/nist/core/NameValue;

    invoke-direct {v1}, Landroid/gov/nist/core/NameValue;-><init>()V

    move-object v0, v1

    .line 157
    :cond_0
    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValue;->setValueAsObject(Ljava/lang/Object;)V

    .line 158
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->setAttribute(Landroid/gov/nist/core/NameValue;)V

    .line 160
    .end local v0    # "nameValue":Landroid/gov/nist/core/NameValue;
    return-void

    .line 152
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The value is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setValueAllowNull(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 169
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 170
    .local v0, "nameValue":Landroid/gov/nist/core/NameValue;
    if-nez v0, :cond_0

    .line 171
    new-instance v1, Landroid/gov/nist/core/NameValue;

    invoke-direct {v1}, Landroid/gov/nist/core/NameValue;-><init>()V

    move-object v0, v1

    .line 172
    :cond_0
    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValue;->setValueAsObject(Ljava/lang/Object;)V

    .line 173
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->setAttribute(Landroid/gov/nist/core/NameValue;)V

    .line 174
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 74
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
