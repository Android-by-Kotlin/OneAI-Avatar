.class public Landroid/gov/nist/javax/sdp/fields/RepeatField;
.super Landroid/gov/nist/javax/sdp/fields/SDPField;
.source "RepeatField.java"

# interfaces
.implements Landroid/javax/sdp/RepeatTime;


# static fields
.field private static final serialVersionUID:J = -0x5907dc1d34ec901bL


# instance fields
.field protected activeDuration:Landroid/gov/nist/javax/sdp/fields/TypedTime;

.field protected offsets:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

.field protected repeatInterval:Landroid/gov/nist/javax/sdp/fields/TypedTime;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 53
    const-string/jumbo v0, "r="

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sdp/fields/SDPField;-><init>(Ljava/lang/String;)V

    .line 54
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->offsets:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    .line 55
    return-void
.end method


# virtual methods
.method public addOffset(Landroid/gov/nist/javax/sdp/fields/TypedTime;)V
    .locals 1
    .param p1, "offset"    # Landroid/gov/nist/javax/sdp/fields/TypedTime;

    .line 66
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->offsets:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->add(Landroid/gov/nist/javax/sdp/fields/SDPObject;)V

    .line 67
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 2

    .line 206
    invoke-super {p0}, Landroid/gov/nist/javax/sdp/fields/SDPField;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/RepeatField;

    .line 207
    .local v0, "retval":Landroid/gov/nist/javax/sdp/fields/RepeatField;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->repeatInterval:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    if-eqz v1, :cond_0

    .line 208
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->repeatInterval:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/TypedTime;

    iput-object v1, v0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->repeatInterval:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    .line 209
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->activeDuration:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    if-eqz v1, :cond_1

    .line 210
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->activeDuration:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/TypedTime;

    iput-object v1, v0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->activeDuration:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    .line 211
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->offsets:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    if-eqz v1, :cond_2

    .line 212
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->offsets:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    iput-object v1, v0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->offsets:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    .line 213
    :cond_2
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 6

    .line 191
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 192
    .local v0, "retval":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "r="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->repeatInterval:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->encode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->activeDuration:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->encode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->offsets:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 197
    .local v1, "li":Ljava/util/ListIterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 198
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sdp/fields/TypedTime;

    .line 199
    .local v3, "off":Landroid/gov/nist/javax/sdp/fields/TypedTime;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->encode()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .end local v3    # "off":Landroid/gov/nist/javax/sdp/fields/TypedTime;
    goto :goto_0

    .line 201
    :cond_0
    const-string v2, "\r\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getActiveDuration()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 104
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->activeDuration:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    if-nez v0, :cond_0

    .line 105
    const/4 v0, -0x1

    return v0

    .line 107
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->activeDuration:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->getTime()I

    move-result v0

    return v0
.end method

.method public getOffsetArray()[I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 132
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/RepeatField;->getOffsets()Ljava/util/LinkedList;

    move-result-object v0

    .line 133
    .local v0, "linkedList":Ljava/util/LinkedList;
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v1

    new-array v1, v1, [I

    .line 134
    .local v1, "result":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 135
    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sdp/fields/TypedTime;

    .line 136
    .local v3, "typedTime":Landroid/gov/nist/javax/sdp/fields/TypedTime;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->getTime()I

    move-result v4

    aput v4, v1, v2

    .line 134
    .end local v3    # "typedTime":Landroid/gov/nist/javax/sdp/fields/TypedTime;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 138
    .end local v2    # "i":I
    :cond_0
    return-object v1
.end method

.method public getOffsets()Ljava/util/LinkedList;
    .locals 1

    .line 70
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->offsets:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    return-object v0
.end method

.method public getRepeatInterval()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 78
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->repeatInterval:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    if-nez v0, :cond_0

    .line 79
    const/4 v0, -0x1

    return v0

    .line 81
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->repeatInterval:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->getTime()I

    move-result v0

    return v0
.end method

.method public getTypedTime()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 170
    const/4 v0, 0x1

    return v0
.end method

.method public setActiveDuration(I)V
    .locals 2
    .param p1, "activeDuration"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 116
    if-ltz p1, :cond_1

    .line 119
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->activeDuration:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    if-nez v0, :cond_0

    .line 120
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/TypedTime;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/TypedTime;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->activeDuration:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    .line 121
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->activeDuration:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 123
    return-void

    .line 117
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The active Duration is <0"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setActiveDuration(Landroid/gov/nist/javax/sdp/fields/TypedTime;)V
    .locals 0
    .param p1, "duration"    # Landroid/gov/nist/javax/sdp/fields/TypedTime;

    .line 62
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->activeDuration:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    .line 63
    return-void
.end method

.method public setOffsetArray([I)V
    .locals 3
    .param p1, "offsets"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 148
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 149
    new-instance v1, Landroid/gov/nist/javax/sdp/fields/TypedTime;

    invoke-direct {v1}, Landroid/gov/nist/javax/sdp/fields/TypedTime;-><init>()V

    .line 150
    .local v1, "typedTime":Landroid/gov/nist/javax/sdp/fields/TypedTime;
    aget v2, p1, v0

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 151
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/fields/RepeatField;->addOffset(Landroid/gov/nist/javax/sdp/fields/TypedTime;)V

    .line 148
    .end local v1    # "typedTime":Landroid/gov/nist/javax/sdp/fields/TypedTime;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 154
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method public setRepeatInterval(I)V
    .locals 2
    .param p1, "repeatInterval"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 90
    if-ltz p1, :cond_1

    .line 93
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->repeatInterval:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    if-nez v0, :cond_0

    .line 94
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/TypedTime;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/TypedTime;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->repeatInterval:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    .line 95
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->repeatInterval:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 97
    return-void

    .line 91
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The repeat interval is <0"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRepeatInterval(Landroid/gov/nist/javax/sdp/fields/TypedTime;)V
    .locals 0
    .param p1, "interval"    # Landroid/gov/nist/javax/sdp/fields/TypedTime;

    .line 58
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/RepeatField;->repeatInterval:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    .line 59
    return-void
.end method

.method public setTypedTime(Z)V
    .locals 0
    .param p1, "typedTime"    # Z

    .line 188
    return-void
.end method
