.class public Landroid/gov/nist/javax/sdp/parser/SDPAnnounceParser;
.super Landroid/gov/nist/core/ParserCore;
.source "SDPAnnounceParser.java"


# instance fields
.field protected lexer:Landroid/gov/nist/javax/sdp/parser/Lexer;

.field protected sdpMessage:Ljava/util/Vector;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 6
    .param p1, "message"    # Ljava/lang/String;

    .line 54
    invoke-direct {p0}, Landroid/gov/nist/core/ParserCore;-><init>()V

    .line 55
    const/4 v0, 0x0

    .line 56
    .local v0, "start":I
    const/4 v1, 0x0

    .line 59
    .local v1, "line":Ljava/lang/String;
    if-nez p1, :cond_0

    return-void

    .line 60
    :cond_0
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    iput-object v2, p0, Landroid/gov/nist/javax/sdp/parser/SDPAnnounceParser;->sdpMessage:Ljava/util/Vector;

    .line 62
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\r\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 64
    .local v2, "sdpAnnounce":Ljava/lang/String;
    :goto_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_8

    .line 66
    const-string v3, "\n"

    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 67
    .local v3, "lfPos":I
    const-string v4, "\r"

    invoke-virtual {v2, v4, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    .line 69
    .local v4, "crPos":I
    if-ltz v3, :cond_1

    if-gez v4, :cond_1

    .line 71
    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 72
    add-int/lit8 v0, v3, 0x1

    goto :goto_1

    .line 73
    :cond_1
    if-gez v3, :cond_2

    if-ltz v4, :cond_2

    .line 75
    invoke-virtual {v2, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 76
    add-int/lit8 v0, v4, 0x1

    goto :goto_1

    .line 77
    :cond_2
    if-ltz v3, :cond_6

    if-ltz v4, :cond_6

    .line 79
    if-le v3, v4, :cond_4

    .line 81
    invoke-virtual {v2, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 83
    add-int/lit8 v5, v4, 0x1

    if-ne v3, v5, :cond_3

    .line 84
    add-int/lit8 v0, v3, 0x1

    goto :goto_1

    .line 86
    :cond_3
    add-int/lit8 v0, v4, 0x1

    goto :goto_1

    .line 90
    :cond_4
    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 92
    add-int/lit8 v5, v3, 0x1

    if-ne v4, v5, :cond_5

    .line 93
    add-int/lit8 v0, v4, 0x1

    goto :goto_1

    .line 95
    :cond_5
    add-int/lit8 v0, v3, 0x1

    goto :goto_1

    .line 98
    :cond_6
    if-gez v3, :cond_7

    if-gez v4, :cond_7

    .line 99
    goto :goto_2

    .line 101
    :cond_7
    :goto_1
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/SDPAnnounceParser;->sdpMessage:Ljava/util/Vector;

    invoke-virtual {v5, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 102
    .end local v3    # "lfPos":I
    .end local v4    # "crPos":I
    goto :goto_0

    .line 103
    :cond_8
    :goto_2
    return-void
.end method

.method public constructor <init>(Ljava/util/Vector;)V
    .locals 0
    .param p1, "sdpMessage"    # Ljava/util/Vector;

    .line 46
    invoke-direct {p0}, Landroid/gov/nist/core/ParserCore;-><init>()V

    .line 47
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/parser/SDPAnnounceParser;->sdpMessage:Ljava/util/Vector;

    .line 48
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 106
    new-instance v0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;-><init>()V

    .line 107
    .local v0, "retval":Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/SDPAnnounceParser;->sdpMessage:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 108
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/SDPAnnounceParser;->sdpMessage:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 109
    .local v2, "field":Ljava/lang/String;
    invoke-static {v2}, Landroid/gov/nist/javax/sdp/parser/ParserFactory;->createParser(Ljava/lang/String;)Landroid/gov/nist/javax/sdp/parser/SDPParser;

    move-result-object v3

    .line 110
    .local v3, "sdpParser":Landroid/gov/nist/javax/sdp/parser/SDPParser;
    const/4 v4, 0x0

    .line 111
    .local v4, "sdpField":Landroid/gov/nist/javax/sdp/fields/SDPField;
    if-eqz v3, :cond_0

    .line 113
    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/parser/SDPParser;->parse()Landroid/gov/nist/javax/sdp/fields/SDPField;

    move-result-object v4

    .line 115
    :cond_0
    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->addField(Landroid/gov/nist/javax/sdp/fields/SDPField;)V

    .line 107
    .end local v2    # "field":Ljava/lang/String;
    .end local v3    # "sdpParser":Landroid/gov/nist/javax/sdp/parser/SDPParser;
    .end local v4    # "sdpField":Landroid/gov/nist/javax/sdp/fields/SDPField;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 117
    .end local v1    # "i":I
    :cond_1
    return-object v0
.end method
