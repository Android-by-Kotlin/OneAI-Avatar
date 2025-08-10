.class public abstract Landroid/gov/nist/javax/sdp/fields/SDPFieldList;
.super Landroid/gov/nist/javax/sdp/fields/SDPField;
.source "SDPFieldList.java"


# instance fields
.field protected sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/fields/SDPField;-><init>()V

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "fieldName"    # Ljava/lang/String;

    .line 56
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sdp/fields/SDPField;-><init>(Ljava/lang/String;)V

    .line 57
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "classname"    # Ljava/lang/String;

    .line 61
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sdp/fields/SDPField;-><init>(Ljava/lang/String;)V

    .line 62
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-direct {v0, p1, p2}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    .line 63
    return-void
.end method


# virtual methods
.method public add(Landroid/gov/nist/javax/sdp/fields/SDPField;)V
    .locals 1
    .param p1, "h"    # Landroid/gov/nist/javax/sdp/fields/SDPField;

    .line 70
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->add(Landroid/gov/nist/javax/sdp/fields/SDPObject;)V

    .line 71
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 2

    .line 157
    invoke-super {p0}, Landroid/gov/nist/javax/sdp/fields/SDPField;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;

    .line 158
    .local v0, "retval":Landroid/gov/nist/javax/sdp/fields/SDPFieldList;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    if-eqz v1, :cond_0

    .line 159
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    iput-object v1, v0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    .line 160
    :cond_0
    return-object v0
.end method

.method public debugDump()Ljava/lang/String;
    .locals 1

    .line 114
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->debugDump(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public debugDump(I)Ljava/lang/String;
    .locals 4
    .param p1, "indentation"    # I

    .line 99
    const-string v0, ""

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->stringRepresentation:Ljava/lang/String;

    .line 100
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/Indentation;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sdp/fields/Indentation;-><init>(I)V

    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/Indentation;->getIndentation()Ljava/lang/String;

    move-result-object v0

    .line 102
    .local v0, "indent":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 103
    .local v1, "className":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sprint(Ljava/lang/String;)V

    .line 104
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "{"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sprint(Ljava/lang/String;)V

    .line 105
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-virtual {v3, p1}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->debugDump(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sprint(Ljava/lang/String;)V

    .line 106
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "}"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sprint(Ljava/lang/String;)V

    .line 107
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->stringRepresentation:Ljava/lang/String;

    return-object v2
.end method

.method public encode()Ljava/lang/String;
    .locals 4

    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .local v0, "retval":Ljava/lang/StringBuilder;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 87
    .local v1, "li":Ljava/util/ListIterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 88
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/SDPField;

    .line 89
    .local v2, "sdphdr":Landroid/gov/nist/javax/sdp/fields/SDPField;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sdp/fields/SDPField;->encode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .end local v2    # "sdphdr":Landroid/gov/nist/javax/sdp/fields/SDPField;
    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "other"    # Ljava/lang/Object;

    .line 130
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 131
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 132
    return v0

    .line 133
    :cond_1
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;

    .line 134
    .local v1, "that":Landroid/gov/nist/javax/sdp/fields/SDPFieldList;
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    if-nez v2, :cond_3

    .line 135
    iget-object v2, v1, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    if-nez v2, :cond_2

    const/4 v0, 0x1

    :cond_2
    return v0

    .line 136
    :cond_3
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    iget-object v2, v1, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public first()Landroid/gov/nist/javax/sdp/fields/SDPObject;
    .locals 1

    .line 74
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->first()Landroid/gov/nist/core/GenericObject;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/SDPObject;

    return-object v0
.end method

.method public listIterator()Ljava/util/ListIterator;
    .locals 1

    .line 52
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public match(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "template"    # Ljava/lang/Object;

    .line 144
    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 145
    return v0

    .line 146
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 147
    return v2

    .line 148
    :cond_1
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;

    .line 149
    .local v1, "other":Landroid/gov/nist/javax/sdp/fields/SDPFieldList;
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    iget-object v4, v1, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    if-ne v3, v4, :cond_2

    .line 150
    return v0

    .line 151
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    if-nez v0, :cond_3

    .line 152
    return v2

    .line 153
    :cond_3
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    iget-object v2, v1, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->match(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public next()Landroid/gov/nist/javax/sdp/fields/SDPObject;
    .locals 1

    .line 78
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->sdpFields:Landroid/gov/nist/javax/sdp/fields/SDPObjectList;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/SDPObjectList;->next()Landroid/gov/nist/core/GenericObject;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/SDPObject;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 122
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/SDPFieldList;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
