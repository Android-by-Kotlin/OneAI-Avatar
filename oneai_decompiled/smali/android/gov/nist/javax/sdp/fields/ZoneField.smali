.class public Landroid/gov/nist/javax/sdp/fields/ZoneField;
.super Landroid/gov/nist/javax/sdp/fields/SDPField;
.source "ZoneField.java"

# interfaces
.implements Landroid/javax/sdp/TimeZoneAdjustment;


# instance fields
.field protected zoneAdjustments:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 56
    const-string/jumbo v0, "z="

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sdp/fields/SDPField;-><init>(Ljava/lang/String;)V

    .line 57
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/fields/ZoneField;->zoneAdjustments:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    .line 58
    return-void
.end method


# virtual methods
.method public addZoneAdjustment(Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;)V
    .locals 1
    .param p1, "za"    # Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;

    .line 65
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/ZoneField;->zoneAdjustments:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->add(Landroid/gov/nist/javax/sdp/fields/SDPObject;)V

    .line 66
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 2

    .line 183
    invoke-super {p0}, Landroid/gov/nist/javax/sdp/fields/SDPField;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/ZoneField;

    .line 184
    .local v0, "retval":Landroid/gov/nist/javax/sdp/fields/ZoneField;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ZoneField;->zoneAdjustments:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    if-eqz v1, :cond_0

    .line 185
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ZoneField;->zoneAdjustments:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    iput-object v1, v0, Landroid/gov/nist/javax/sdp/fields/ZoneField;->zoneAdjustments:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    .line 186
    :cond_0
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 5

    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "z="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .local v0, "retval":Ljava/lang/StringBuilder;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ZoneField;->zoneAdjustments:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 83
    .local v1, "li":Ljava/util/ListIterator;
    const/4 v2, 0x0

    .line 84
    .local v2, "num":I
    :goto_0
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 85
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;

    .line 86
    .local v3, "za":Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;
    if-lez v2, :cond_0

    .line 87
    const-string v4, " "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    :cond_0
    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->encode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    nop

    .end local v3    # "za":Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;
    add-int/lit8 v2, v2, 0x1

    .line 90
    goto :goto_0

    .line 91
    :cond_1
    const-string v3, "\r\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getTypedTime()Z
    .locals 1

    .line 179
    const/4 v0, 0x0

    return v0
.end method

.method public getZoneAdjustments()Landroid/gov/nist/javax/sdp/fields/SDPObjectList;
    .locals 1

    .line 74
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/ZoneField;->zoneAdjustments:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    return-object v0
.end method

.method public getZoneAdjustments(Z)Ljava/util/Hashtable;
    .locals 8
    .param p1, "create"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 104
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    .line 105
    .local v0, "result":Ljava/util/Hashtable;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/ZoneField;->getZoneAdjustments()Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    move-result-object v1

    .line 107
    .local v1, "zoneAdjustments":Landroid/gov/nist/javax/sdp/fields/SDPObjectList;
    if-nez v1, :cond_1

    .line 108
    if-eqz p1, :cond_0

    .line 109
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    return-object v2

    .line 111
    :cond_0
    const/4 v2, 0x0

    return-object v2

    .line 113
    :cond_1
    :goto_0
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->next()Landroid/gov/nist/core/GenericObject;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;

    move-object v3, v2

    .local v3, "zone":Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;
    if-eqz v2, :cond_2

    .line 114
    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->getTime()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 115
    .local v2, "l":Ljava/lang/Long;
    invoke-virtual {v2}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    .line 116
    .local v4, "time":Ljava/lang/Integer;
    new-instance v5, Ljava/util/Date;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->getTime()J

    move-result-wide v6

    invoke-direct {v5, v6, v7}, Ljava/util/Date;-><init>(J)V

    .line 117
    .local v5, "date":Ljava/util/Date;
    invoke-virtual {v0, v5, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .end local v2    # "l":Ljava/lang/Long;
    .end local v4    # "time":Ljava/lang/Integer;
    .end local v5    # "date":Ljava/util/Date;
    goto :goto_0

    .line 119
    :cond_2
    return-object v0
.end method

.method public setTypedTime(Z)V
    .locals 0
    .param p1, "typedTime"    # Z

    .line 163
    return-void
.end method

.method public setZoneAdjustments(Ljava/util/Hashtable;)V
    .locals 6
    .param p1, "map"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 130
    if-eqz p1, :cond_2

    .line 133
    invoke-virtual {p1}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 134
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    .line 135
    .local v1, "o":Ljava/lang/Object;
    instance-of v2, v1, Ljava/util/Date;

    if-eqz v2, :cond_0

    .line 136
    move-object v2, v1

    check-cast v2, Ljava/util/Date;

    .line 137
    .local v2, "date":Ljava/util/Date;
    new-instance v3, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;

    invoke-direct {v3}, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;-><init>()V

    .line 138
    .local v3, "zone":Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;
    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->setTime(J)V

    .line 139
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sdp/fields/ZoneField;->addZoneAdjustment(Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;)V

    .line 140
    .end local v2    # "date":Ljava/util/Date;
    .end local v3    # "zone":Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;
    nop

    .line 142
    .end local v1    # "o":Ljava/lang/Object;
    goto :goto_0

    .line 141
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_0
    new-instance v2, Landroid/javax/sdp/SdpException;

    const-string/jumbo v3, "The map is not well-formated "

    invoke-direct {v2, v3}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 144
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "o":Ljava/lang/Object;
    :cond_1
    return-void

    .line 131
    :cond_2
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The map is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
