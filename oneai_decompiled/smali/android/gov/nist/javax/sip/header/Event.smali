.class public Landroid/gov/nist/javax/sip/header/Event;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "Event.java"

# interfaces
.implements Landroid/javax/sip/header/EventHeader;


# static fields
.field private static final serialVersionUID:J = -0x59a0cd7ede813719L


# instance fields
.field protected eventType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 58
    const-string v0, "Event"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 59
    return-void
.end method


# virtual methods
.method public encodeBody()Ljava/lang/String;
    .locals 1

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Event;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 115
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Event;->eventType:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 116
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Event;->eventType:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Event;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 119
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Event;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 122
    :cond_1
    return-object p1
.end method

.method public getEventId()Ljava/lang/String;
    .locals 1

    .line 103
    const-string/jumbo v0, "id"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/Event;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEventType()Ljava/lang/String;
    .locals 1

    .line 81
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Event;->eventType:Ljava/lang/String;

    return-object v0
.end method

.method public match(Landroid/gov/nist/javax/sip/header/Event;)Z
    .locals 3
    .param p1, "matchTarget"    # Landroid/gov/nist/javax/sip/header/Event;

    .line 131
    iget-object v0, p1, Landroid/gov/nist/javax/sip/header/Event;->eventType:Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Event;->eventType:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 132
    return v1

    .line 133
    :cond_0
    iget-object v0, p1, Landroid/gov/nist/javax/sip/header/Event;->eventType:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Event;->eventType:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 134
    return v1

    .line 135
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Event;->eventType:Ljava/lang/String;

    if-nez v0, :cond_2

    iget-object v0, p1, Landroid/gov/nist/javax/sip/header/Event;->eventType:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 136
    return v1

    .line 137
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/Event;->getEventId()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_3

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/header/Event;->getEventId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 138
    return v1

    .line 139
    :cond_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/Event;->getEventId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/header/Event;->getEventId()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_4

    .line 140
    return v1

    .line 141
    :cond_4
    iget-object v0, p1, Landroid/gov/nist/javax/sip/header/Event;->eventType:Ljava/lang/String;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/Event;->eventType:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/Event;->getEventId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/header/Event;->getEventId()Ljava/lang/String;

    move-result-object v2

    if-eq v0, v2, :cond_5

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/Event;->getEventId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/header/Event;->getEventId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    :cond_5
    const/4 v1, 0x1

    :cond_6
    return v1
.end method

.method public setEventId(Ljava/lang/String;)V
    .locals 2
    .param p1, "eventId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 92
    if-eqz p1, :cond_0

    .line 94
    const-string/jumbo v0, "id"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/Event;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    return-void

    .line 93
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, " the eventId parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setEventType(Ljava/lang/String;)V
    .locals 2
    .param p1, "eventType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 70
    if-eqz p1, :cond_0

    .line 72
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Event;->eventType:Ljava/lang/String;

    .line 73
    return-void

    .line 71
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, " the eventType is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
