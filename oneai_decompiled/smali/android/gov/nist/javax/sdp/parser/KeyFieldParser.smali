.class public Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;
.super Landroid/gov/nist/javax/sdp/parser/SDPParser;
.source "KeyFieldParser.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "keyField"    # Ljava/lang/String;

    .line 41
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/parser/SDPParser;-><init>()V

    .line 42
    new-instance v0, Landroid/gov/nist/javax/sdp/parser/Lexer;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sdp/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 43
    return-void
.end method


# virtual methods
.method public keyField()Landroid/gov/nist/javax/sdp/fields/KeyField;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 47
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x6b

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 48
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 49
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 50
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 52
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/KeyField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/KeyField;-><init>()V

    .line 54
    .local v0, "keyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    new-instance v1, Landroid/gov/nist/core/NameValue;

    invoke-direct {v1}, Landroid/gov/nist/core/NameValue;-><init>()V

    .line 56
    .local v1, "nameValue":Landroid/gov/nist/core/NameValue;
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->markInputPosition()I

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 58
    .local v2, "ptr":I
    :try_start_1
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0x3a

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->getNextToken(C)Ljava/lang/String;

    move-result-object v3

    .line 59
    .local v3, "name":Ljava/lang/String;
    iget-object v4, p0, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 60
    iget-object v4, p0, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v4

    .line 61
    .local v4, "value":Ljava/lang/String;
    new-instance v5, Landroid/gov/nist/core/NameValue;

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v1, v5

    .line 70
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    goto :goto_0

    .line 62
    :catch_0
    move-exception v3

    .line 63
    .local v3, "ex":Ljava/text/ParseException;
    :try_start_2
    iget-object v4, p0, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4, v2}, Landroid/gov/nist/core/LexerCore;->rewindInputPosition(I)V

    .line 64
    iget-object v4, p0, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v4

    .line 65
    .local v4, "rest":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 69
    new-instance v5, Landroid/gov/nist/core/NameValue;

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {v5, v6, v7}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v1, v5

    .line 71
    .end local v3    # "ex":Ljava/text/ParseException;
    .end local v4    # "rest":Ljava/lang/String;
    :goto_0
    invoke-virtual {v1}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/KeyField;->setType(Ljava/lang/String;)V

    .line 72
    invoke-virtual {v1}, Landroid/gov/nist/core/NameValue;->getValueAsObject()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/KeyField;->setKeyData(Ljava/lang/String;)V

    .line 73
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 75
    return-object v0

    .line 66
    .restart local v3    # "ex":Ljava/text/ParseException;
    .restart local v4    # "rest":Ljava/lang/String;
    :cond_0
    new-instance v5, Ljava/text/ParseException;

    iget-object v6, p0, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v7

    invoke-direct {v5, v6, v7}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v5
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 76
    .end local v0    # "keyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    .end local v1    # "nameValue":Landroid/gov/nist/core/NameValue;
    .end local v2    # "ptr":I
    .end local v3    # "ex":Ljava/text/ParseException;
    .end local v4    # "rest":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/text/ParseException;

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v3

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public parse()Landroid/gov/nist/javax/sdp/fields/SDPField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 82
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/parser/KeyFieldParser;->keyField()Landroid/gov/nist/javax/sdp/fields/KeyField;

    move-result-object v0

    return-object v0
.end method
