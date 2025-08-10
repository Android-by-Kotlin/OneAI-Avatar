.class public Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;
.super Ljava/lang/Object;
.source "MediaDescriptionImpl.java"

# interfaces
.implements Landroid/javax/sdp/MediaDescription;


# instance fields
.field protected attributeFields:Ljava/util/Vector;

.field protected bandwidthFields:Ljava/util/Vector;

.field protected connectionField:Landroid/gov/nist/javax/sdp/fields/ConnectionField;

.field protected informationField:Landroid/gov/nist/javax/sdp/fields/InformationField;

.field protected keyField:Landroid/gov/nist/javax/sdp/fields/KeyField;

.field protected mediaField:Landroid/gov/nist/javax/sdp/fields/MediaField;

.field protected preconditionFields:Landroid/gov/nist/javax/sdp/fields/PreconditionFields;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    .line 120
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    .line 123
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->preconditionFields:Landroid/gov/nist/javax/sdp/fields/PreconditionFields;

    .line 124
    return-void
.end method


# virtual methods
.method public addAttribute(Landroid/gov/nist/javax/sdp/fields/AttributeField;)V
    .locals 1
    .param p1, "af"    # Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 202
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 203
    return-void
.end method

.method public addBandwidthField(Landroid/gov/nist/javax/sdp/fields/BandwidthField;)V
    .locals 1
    .param p1, "b"    # Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    .line 171
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 172
    return-void
.end method

.method public addDynamicPayloads(Ljava/util/Vector;Ljava/util/Vector;)V
    .locals 3
    .param p1, "payloadNames"    # Ljava/util/Vector;
    .param p2, "payloadValues"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 702
    if-eqz p1, :cond_3

    if-eqz p2, :cond_3

    .line 705
    invoke-virtual {p1}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p2}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 708
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v0

    invoke-virtual {p2}, Ljava/util/Vector;->size()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 711
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 712
    invoke-virtual {p1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 713
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 714
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {p0, v1, v2}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 711
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 719
    .end local v0    # "i":I
    :cond_0
    return-void

    .line 709
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string v1, " The vector sizes are unequal"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 706
    :cond_2
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string v1, " The vectors are empty"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 703
    :cond_3
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string v1, " The vectors are null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public encode()Ljava/lang/String;
    .locals 4

    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .local v0, "retval":Ljava/lang/StringBuilder;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->mediaField:Landroid/gov/nist/javax/sdp/fields/MediaField;

    if-eqz v1, :cond_0

    .line 71
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->mediaField:Landroid/gov/nist/javax/sdp/fields/MediaField;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/MediaField;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->informationField:Landroid/gov/nist/javax/sdp/fields/InformationField;

    if-eqz v1, :cond_1

    .line 74
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->informationField:Landroid/gov/nist/javax/sdp/fields/InformationField;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/InformationField;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->connectionField:Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    if-eqz v1, :cond_2

    .line 77
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->connectionField:Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    :cond_2
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    if-eqz v1, :cond_4

    .line 80
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 83
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/SDPField;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sdp/fields/SDPField;->encode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 93
    .end local v1    # "i":I
    :cond_3
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->preconditionFields:Landroid/gov/nist/javax/sdp/fields/PreconditionFields;

    if-eqz v1, :cond_4

    .line 94
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->preconditionFields:Landroid/gov/nist/javax/sdp/fields/PreconditionFields;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->getPreconditionSize()I

    move-result v1

    .line 95
    .local v1, "precondSize":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v1, :cond_4

    .line 96
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->preconditionFields:Landroid/gov/nist/javax/sdp/fields/PreconditionFields;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->getPreconditions()Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sdp/fields/SDPField;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/SDPField;->encode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 102
    .end local v1    # "precondSize":I
    .end local v2    # "i":I
    :cond_4
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->keyField:Landroid/gov/nist/javax/sdp/fields/KeyField;

    if-eqz v1, :cond_5

    .line 103
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->keyField:Landroid/gov/nist/javax/sdp/fields/KeyField;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/KeyField;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    :cond_5
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    if-eqz v1, :cond_6

    .line 106
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v1, v2, :cond_6

    .line 107
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/SDPField;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sdp/fields/SDPField;->encode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 111
    .end local v1    # "i":I
    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 474
    if-eqz p1, :cond_2

    .line 475
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 476
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 478
    .local v1, "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 479
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getValueAsObject()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    return-object v2

    .line 475
    .end local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 481
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    return-object v0

    .line 483
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAttributeFields()Ljava/util/Vector;
    .locals 1

    .line 143
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    return-object v0
.end method

.method public getAttributes(Z)Ljava/util/Vector;
    .locals 1
    .param p1, "create"    # Z

    .line 450
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    return-object v0
.end method

.method public getBandwidth(Ljava/lang/String;)I
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 331
    if-eqz p1, :cond_3

    .line 333
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 334
    return v1

    .line 336
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 337
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    .line 339
    .local v2, "bandwidthField":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->getBwtype()Ljava/lang/String;

    move-result-object v3

    .line 340
    .local v3, "type":Ljava/lang/String;
    if-eqz v3, :cond_1

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 341
    invoke-virtual {v2}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->getBandwidth()I

    move-result v1

    return v1

    .line 336
    .end local v2    # "bandwidthField":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    .end local v3    # "type":Ljava/lang/String;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 343
    .end local v0    # "i":I
    :cond_2
    return v1

    .line 332
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null parameter"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getBandwidths(Z)Ljava/util/Vector;
    .locals 1
    .param p1, "create"    # Z

    .line 304
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    return-object v0
.end method

.method public getConnection()Landroid/javax/sdp/Connection;
    .locals 1

    .line 273
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->connectionField:Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    return-object v0
.end method

.method public getConnectionField()Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    .locals 1

    .line 135
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->connectionField:Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    return-object v0
.end method

.method public getDuplexity()Ljava/lang/String;
    .locals 4

    .line 525
    const/4 v0, 0x0

    .line 526
    .local v0, "i":I
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 527
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 529
    .local v1, "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "sendrecv"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "recvonly"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "sendonly"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "inactive"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 526
    .end local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 533
    .restart local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_1
    :goto_1
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 536
    .end local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_2
    const/4 v1, 0x0

    return-object v1
.end method

.method public getInfo()Landroid/javax/sdp/Info;
    .locals 2

    .line 238
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->getInformationField()Landroid/gov/nist/javax/sdp/fields/InformationField;

    move-result-object v0

    .line 239
    .local v0, "informationField":Landroid/gov/nist/javax/sdp/fields/InformationField;
    if-nez v0, :cond_0

    .line 240
    const/4 v1, 0x0

    return-object v1

    .line 242
    :cond_0
    return-object v0
.end method

.method public getInformationField()Landroid/gov/nist/javax/sdp/fields/InformationField;
    .locals 1

    .line 131
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->informationField:Landroid/gov/nist/javax/sdp/fields/InformationField;

    return-object v0
.end method

.method public getKey()Landroid/javax/sdp/Key;
    .locals 1

    .line 414
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->keyField:Landroid/gov/nist/javax/sdp/fields/KeyField;

    if-nez v0, :cond_0

    .line 415
    const/4 v0, 0x0

    return-object v0

    .line 417
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->keyField:Landroid/gov/nist/javax/sdp/fields/KeyField;

    return-object v0
.end method

.method public getKeyField()Landroid/gov/nist/javax/sdp/fields/KeyField;
    .locals 1

    .line 139
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->keyField:Landroid/gov/nist/javax/sdp/fields/KeyField;

    return-object v0
.end method

.method public getMedia()Landroid/javax/sdp/Media;
    .locals 1

    .line 194
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->mediaField:Landroid/gov/nist/javax/sdp/fields/MediaField;

    return-object v0
.end method

.method public getMediaField()Landroid/gov/nist/javax/sdp/fields/MediaField;
    .locals 1

    .line 127
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->mediaField:Landroid/gov/nist/javax/sdp/fields/MediaField;

    return-object v0
.end method

.method public getMimeParameters()Ljava/util/Vector;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 673
    const-string/jumbo v0, "rate"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 674
    .local v0, "rate":Ljava/lang/String;
    const-string/jumbo v1, "ptime"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 675
    .local v1, "ptime":Ljava/lang/String;
    const-string/jumbo v2, "maxptime"

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 676
    .local v2, "maxptime":Ljava/lang/String;
    const-string/jumbo v3, "ftmp"

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 677
    .local v3, "ftmp":Ljava/lang/String;
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 678
    .local v4, "result":Ljava/util/Vector;
    invoke-virtual {v4, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 679
    invoke-virtual {v4, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 680
    invoke-virtual {v4, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 681
    invoke-virtual {v4, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 682
    return-object v4
.end method

.method public getMimeTypes()Ljava/util/Vector;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 628
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->getMedia()Landroid/javax/sdp/Media;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/MediaField;

    .line 629
    .local v0, "mediaField":Landroid/gov/nist/javax/sdp/fields/MediaField;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/MediaField;->getMediaType()Ljava/lang/String;

    move-result-object v1

    .line 630
    .local v1, "type":Ljava/lang/String;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/MediaField;->getProtocol()Ljava/lang/String;

    move-result-object v2

    .line 631
    .local v2, "protocol":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/MediaField;->getMediaFormats(Z)Ljava/util/Vector;

    move-result-object v3

    .line 633
    .local v3, "formats":Ljava/util/Vector;
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 634
    .local v4, "v":Ljava/util/Vector;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v6

    if-ge v5, v6, :cond_2

    .line 635
    const/4 v6, 0x0

    .line 636
    .local v6, "result":Ljava/lang/String;
    const-string/jumbo v7, "RTP/AVP"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const-string v8, "/"

    if-eqz v7, :cond_0

    .line 637
    const-string/jumbo v7, "rtpmap"

    invoke-virtual {p0, v7}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_1

    .line 638
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 643
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 644
    :cond_1
    :goto_1
    invoke-virtual {v4, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 634
    .end local v6    # "result":Ljava/lang/String;
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 646
    .end local v5    # "i":I
    :cond_2
    return-object v4
.end method

.method public getPreconditionFields()Ljava/util/Vector;
    .locals 1

    .line 775
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->preconditionFields:Landroid/gov/nist/javax/sdp/fields/PreconditionFields;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->getPreconditions()Ljava/util/Vector;

    move-result-object v0

    return-object v0
.end method

.method protected hasAttribute(Ljava/lang/String;)Z
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .line 206
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 207
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 209
    .local v1, "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 210
    const/4 v2, 0x1

    return v2

    .line 206
    .end local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 212
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public removeAttribute(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .line 576
    if-eqz p1, :cond_3

    .line 578
    if-eqz p1, :cond_2

    .line 579
    const/4 v0, 0x0

    .line 580
    .local v0, "i":I
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 581
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 583
    .local v1, "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 584
    goto :goto_1

    .line 580
    .end local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 586
    :cond_1
    :goto_1
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 587
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->removeElementAt(I)V

    .line 590
    .end local v0    # "i":I
    :cond_2
    return-void

    .line 577
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null arg!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeBandwidth(Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .line 391
    if-eqz p1, :cond_3

    .line 394
    const/4 v0, 0x0

    .line 395
    .local v0, "i":I
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 396
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    .line 398
    .local v1, "bandwidthField":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->getBwtype()Ljava/lang/String;

    move-result-object v2

    .line 399
    .local v2, "type":Ljava/lang/String;
    if-eqz v2, :cond_0

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 400
    goto :goto_1

    .line 395
    .end local v1    # "bandwidthField":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    .end local v2    # "type":Ljava/lang/String;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 403
    :cond_1
    :goto_1
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 404
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->removeElementAt(I)V

    .line 406
    .end local v0    # "i":I
    :cond_2
    return-void

    .line 392
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null bandwidth type"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 497
    if-eqz p1, :cond_3

    .line 501
    const/4 v0, 0x0

    .line 502
    .local v0, "i":I
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 503
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 505
    .local v1, "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 506
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v2

    .line 507
    .local v2, "nv":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v2, p2}, Landroid/gov/nist/core/NameValue;->setValueAsObject(Ljava/lang/Object;)V

    .line 508
    goto :goto_1

    .line 502
    .end local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    .end local v2    # "nv":Landroid/gov/nist/core/NameValue;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 513
    :cond_1
    :goto_1
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ne v0, v1, :cond_2

    .line 514
    new-instance v1, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    invoke-direct {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;-><init>()V

    .line 515
    .restart local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    new-instance v2, Landroid/gov/nist/core/NameValue;

    invoke-direct {v2, p1, p2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 516
    .restart local v2    # "nv":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->setAttribute(Landroid/gov/nist/core/NameValue;)V

    .line 518
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v3, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 522
    .end local v0    # "i":I
    .end local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    .end local v2    # "nv":Landroid/gov/nist/core/NameValue;
    :cond_2
    return-void

    .line 498
    :cond_3
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameters are null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setAttributeFields(Ljava/util/Vector;)V
    .locals 0
    .param p1, "a"    # Ljava/util/Vector;

    .line 185
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    .line 186
    return-void
.end method

.method public setAttributes(Ljava/util/Vector;)V
    .locals 0
    .param p1, "attributes"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 462
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    .line 463
    return-void
.end method

.method public setBandwidth(Ljava/lang/String;I)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 358
    if-eqz p1, :cond_3

    .line 361
    const/4 v0, 0x0

    .line 362
    .local v0, "i":I
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 363
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    .line 365
    .local v1, "bandwidthField":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->getBwtype()Ljava/lang/String;

    move-result-object v2

    .line 366
    .local v2, "type":Ljava/lang/String;
    if-eqz v2, :cond_0

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 367
    invoke-virtual {v1, p2}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->setBandwidth(I)V

    .line 369
    goto :goto_1

    .line 362
    .end local v1    # "bandwidthField":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    .end local v2    # "type":Ljava/lang/String;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 374
    :cond_1
    :goto_1
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ne v0, v1, :cond_2

    .line 375
    new-instance v1, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    invoke-direct {v1}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;-><init>()V

    .line 376
    .restart local v1    # "bandwidthField":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    invoke-virtual {v1, p1}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->setType(Ljava/lang/String;)V

    .line 377
    invoke-virtual {v1, p2}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->setValue(I)V

    .line 378
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 382
    .end local v0    # "i":I
    .end local v1    # "bandwidthField":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    :cond_2
    return-void

    .line 359
    :cond_3
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The name is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setBandwidths(Ljava/util/Vector;)V
    .locals 2
    .param p1, "bandwidths"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 316
    if-eqz p1, :cond_0

    .line 318
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->bandwidthFields:Ljava/util/Vector;

    .line 319
    return-void

    .line 317
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The vector bandwidths is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setConnection(Landroid/javax/sdp/Connection;)V
    .locals 2
    .param p1, "conn"    # Landroid/javax/sdp/Connection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 286
    if-eqz p1, :cond_1

    .line 288
    instance-of v0, p1, Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    if-eqz v0, :cond_0

    .line 289
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->connectionField:Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    .line 293
    return-void

    .line 292
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "bad implementation"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 287
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The conn is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setConnectionField(Landroid/gov/nist/javax/sdp/fields/ConnectionField;)V
    .locals 0
    .param p1, "c"    # Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    .line 164
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->connectionField:Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    .line 165
    return-void
.end method

.method public setDuplexity(Ljava/lang/String;)V
    .locals 5
    .param p1, "duplexity"    # Ljava/lang/String;

    .line 542
    if-eqz p1, :cond_4

    .line 543
    const/4 v0, 0x0

    .line 544
    .local v0, "i":I
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    const/4 v2, 0x0

    if-ge v0, v1, :cond_2

    .line 545
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 547
    .local v1, "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "sendrecv"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "recvonly"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "sendonly"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v3

    invoke-virtual {v3}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "inactive"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    .line 544
    .end local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 551
    .restart local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_1
    :goto_1
    new-instance v3, Landroid/gov/nist/core/NameValue;

    invoke-direct {v3, p1, v2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v2, v3

    .line 552
    .local v2, "nv":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->setAttribute(Landroid/gov/nist/core/NameValue;)V

    .line 553
    return-void

    .line 558
    .end local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    .end local v2    # "nv":Landroid/gov/nist/core/NameValue;
    :cond_2
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ne v0, v1, :cond_3

    .line 559
    new-instance v1, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    invoke-direct {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;-><init>()V

    .line 560
    .restart local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    new-instance v3, Landroid/gov/nist/core/NameValue;

    invoke-direct {v3, p1, v2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v2, v3

    .line 561
    .restart local v2    # "nv":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->setAttribute(Landroid/gov/nist/core/NameValue;)V

    .line 563
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->attributeFields:Ljava/util/Vector;

    invoke-virtual {v3, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 567
    .end local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    .end local v2    # "nv":Landroid/gov/nist/core/NameValue;
    :cond_3
    return-void

    .line 542
    .end local v0    # "i":I
    :cond_4
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setInfo(Landroid/javax/sdp/Info;)V
    .locals 2
    .param p1, "i"    # Landroid/javax/sdp/Info;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 255
    if-eqz p1, :cond_1

    .line 257
    instance-of v0, p1, Landroid/gov/nist/javax/sdp/fields/InformationField;

    if-eqz v0, :cond_0

    .line 258
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/InformationField;

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->informationField:Landroid/gov/nist/javax/sdp/fields/InformationField;

    .line 261
    return-void

    .line 260
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string v1, "A informationField parameter is required"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 256
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The info is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setInformationField(Landroid/gov/nist/javax/sdp/fields/InformationField;)V
    .locals 0
    .param p1, "i"    # Landroid/gov/nist/javax/sdp/fields/InformationField;

    .line 157
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->informationField:Landroid/gov/nist/javax/sdp/fields/InformationField;

    .line 158
    return-void
.end method

.method public setKey(Landroid/javax/sdp/Key;)V
    .locals 2
    .param p1, "key"    # Landroid/javax/sdp/Key;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 431
    if-eqz p1, :cond_1

    .line 433
    instance-of v0, p1, Landroid/gov/nist/javax/sdp/fields/KeyField;

    if-eqz v0, :cond_0

    .line 434
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/KeyField;

    .line 435
    .local v0, "keyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->setKeyField(Landroid/gov/nist/javax/sdp/fields/KeyField;)V

    .line 436
    .end local v0    # "keyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    nop

    .line 438
    return-void

    .line 437
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string v1, "A keyField parameter is required"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 432
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The key is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setKeyField(Landroid/gov/nist/javax/sdp/fields/KeyField;)V
    .locals 0
    .param p1, "k"    # Landroid/gov/nist/javax/sdp/fields/KeyField;

    .line 178
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->keyField:Landroid/gov/nist/javax/sdp/fields/KeyField;

    .line 179
    return-void
.end method

.method public setMedia(Landroid/javax/sdp/Media;)V
    .locals 2
    .param p1, "media"    # Landroid/javax/sdp/Media;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 224
    if-eqz p1, :cond_1

    .line 226
    instance-of v0, p1, Landroid/gov/nist/javax/sdp/fields/MediaField;

    if-eqz v0, :cond_0

    .line 227
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/MediaField;

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->mediaField:Landroid/gov/nist/javax/sdp/fields/MediaField;

    .line 230
    return-void

    .line 229
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string v1, "A mediaField parameter is required"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 225
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The media is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMediaField(Landroid/gov/nist/javax/sdp/fields/MediaField;)V
    .locals 0
    .param p1, "m"    # Landroid/gov/nist/javax/sdp/fields/MediaField;

    .line 150
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->mediaField:Landroid/gov/nist/javax/sdp/fields/MediaField;

    .line 151
    return-void
.end method

.method public setPreconditionFields(Ljava/util/Vector;)V
    .locals 1
    .param p1, "precondition"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 746
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->preconditionFields:Landroid/gov/nist/javax/sdp/fields/PreconditionFields;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->setPreconditions(Ljava/util/Vector;)V

    .line 747
    return-void
.end method

.method public setPreconditions(Landroid/gov/nist/javax/sdp/fields/PreconditionFields;)V
    .locals 0
    .param p1, "precondition"    # Landroid/gov/nist/javax/sdp/fields/PreconditionFields;

    .line 761
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->preconditionFields:Landroid/gov/nist/javax/sdp/fields/PreconditionFields;

    .line 762
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 115
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
