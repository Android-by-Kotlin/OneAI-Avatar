.class public Landroid/gov/nist/javax/sdp/parser/PhoneFieldParser;
.super Landroid/gov/nist/javax/sdp/parser/SDPParser;
.source "PhoneFieldParser.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "phoneField"    # Ljava/lang/String;

    .line 45
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/parser/SDPParser;-><init>()V

    .line 46
    new-instance v0, Landroid/gov/nist/javax/sdp/parser/Lexer;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sdp/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/parser/PhoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 47
    return-void
.end method


# virtual methods
.method public getDisplayName(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "rest"    # Ljava/lang/String;

    .line 50
    const/4 v0, 0x0

    .line 53
    .local v0, "retval":Ljava/lang/String;
    :try_start_0
    const-string v1, "("

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 54
    .local v1, "begin":I
    const-string v2, ")"

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 56
    .local v2, "end":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_0

    .line 58
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    move-object v0, v3

    goto :goto_0

    .line 63
    :cond_0
    const-string v4, "<"

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 64
    .local v4, "ind":I
    if-eq v4, v3, :cond_1

    .line 65
    const/4 v3, 0x0

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v3

    .line 73
    .end local v1    # "begin":I
    .end local v2    # "end":I
    .end local v4    # "ind":I
    :cond_1
    :goto_0
    goto :goto_1

    .line 71
    :catch_0
    move-exception v1

    .line 72
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 74
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    return-object v0
.end method

.method public getPhoneNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "rest"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 78
    const/4 v0, 0x0

    .line 81
    .local v0, "phoneNumber":Ljava/lang/String;
    :try_start_0
    const-string v1, "("

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 83
    .local v1, "begin":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 85
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    move-object v0, v2

    goto :goto_0

    .line 89
    :cond_0
    const-string v3, "<"

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 90
    .local v3, "ind":I
    const-string v4, ">"

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 92
    .local v4, "end":I
    if-eq v3, v2, :cond_1

    .line 93
    add-int/lit8 v2, v3, 0x1

    invoke-virtual {p1, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    move-object v0, v2

    goto :goto_0

    .line 96
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v2

    .line 101
    .end local v1    # "begin":I
    .end local v3    # "ind":I
    .end local v4    # "end":I
    :goto_0
    nop

    .line 102
    return-object v0

    .line 99
    :catch_0
    move-exception v1

    .line 100
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/text/ParseException;

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/PhoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sdp/parser/PhoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v4

    invoke-direct {v2, v3, v4}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2
.end method

.method public parse()Landroid/gov/nist/javax/sdp/fields/SDPField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 128
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/parser/PhoneFieldParser;->phoneField()Landroid/gov/nist/javax/sdp/fields/PhoneField;

    move-result-object v0

    return-object v0
.end method

.method public phoneField()Landroid/gov/nist/javax/sdp/fields/PhoneField;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 108
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/PhoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x70

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 109
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/PhoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 110
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/PhoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 111
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/PhoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 113
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/PhoneField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/PhoneField;-><init>()V

    .line 114
    .local v0, "phoneField":Landroid/gov/nist/javax/sdp/fields/PhoneField;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/PhoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v1

    .line 116
    .local v1, "rest":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sdp/parser/PhoneFieldParser;->getDisplayName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 117
    .local v2, "displayName":Ljava/lang/String;
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/PhoneField;->setName(Ljava/lang/String;)V

    .line 118
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/parser/PhoneFieldParser;->getPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 119
    .local v3, "phoneNumber":Ljava/lang/String;
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/PhoneField;->setPhoneNumber(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    return-object v0

    .line 122
    .end local v0    # "phoneField":Landroid/gov/nist/javax/sdp/fields/PhoneField;
    .end local v1    # "rest":Ljava/lang/String;
    .end local v2    # "displayName":Ljava/lang/String;
    .end local v3    # "phoneNumber":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 123
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/text/ParseException;

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/PhoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/PhoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v3

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method
