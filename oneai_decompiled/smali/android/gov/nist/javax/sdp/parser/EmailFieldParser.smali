.class public Landroid/gov/nist/javax/sdp/parser/EmailFieldParser;
.super Landroid/gov/nist/javax/sdp/parser/SDPParser;
.source "EmailFieldParser.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "emailField"    # Ljava/lang/String;

    .line 44
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/parser/SDPParser;-><init>()V

    .line 45
    new-instance v0, Landroid/gov/nist/javax/sdp/parser/Lexer;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sdp/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/parser/EmailFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 46
    return-void
.end method


# virtual methods
.method public emailField()Landroid/gov/nist/javax/sdp/fields/EmailField;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 130
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/EmailFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 131
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/EmailFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 132
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/EmailFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 133
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/EmailFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 135
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/EmailField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/EmailField;-><init>()V

    .line 136
    .local v0, "emailField":Landroid/gov/nist/javax/sdp/fields/EmailField;
    new-instance v1, Landroid/gov/nist/javax/sdp/fields/EmailAddress;

    invoke-direct {v1}, Landroid/gov/nist/javax/sdp/fields/EmailAddress;-><init>()V

    .line 138
    .local v1, "emailAddress":Landroid/gov/nist/javax/sdp/fields/EmailAddress;
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/EmailFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v2

    .line 140
    .local v2, "rest":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sdp/parser/EmailFieldParser;->getDisplayName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 141
    .local v3, "displayName":Ljava/lang/String;
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sdp/fields/EmailAddress;->setDisplayName(Ljava/lang/String;)V

    .line 142
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sdp/parser/EmailFieldParser;->getEmail(Ljava/lang/String;)Landroid/gov/nist/javax/sdp/fields/Email;

    move-result-object v4

    .line 143
    .local v4, "email":Landroid/gov/nist/javax/sdp/fields/Email;
    invoke-virtual {v1, v4}, Landroid/gov/nist/javax/sdp/fields/EmailAddress;->setEmail(Landroid/gov/nist/javax/sdp/fields/Email;)V

    .line 145
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/fields/EmailField;->setEmailAddress(Landroid/gov/nist/javax/sdp/fields/EmailAddress;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    return-object v0

    .line 147
    .end local v0    # "emailField":Landroid/gov/nist/javax/sdp/fields/EmailField;
    .end local v1    # "emailAddress":Landroid/gov/nist/javax/sdp/fields/EmailAddress;
    .end local v2    # "rest":Ljava/lang/String;
    .end local v3    # "displayName":Ljava/lang/String;
    .end local v4    # "email":Landroid/gov/nist/javax/sdp/fields/Email;
    :catch_0
    move-exception v0

    .line 148
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/text/ParseException;

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/EmailFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/EmailFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v3

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public getDisplayName(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "rest"    # Ljava/lang/String;

    .line 49
    const/4 v0, 0x0

    .line 52
    .local v0, "retval":Ljava/lang/String;
    :try_start_0
    const-string v1, "("

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 53
    .local v1, "begin":I
    const-string v2, ")"

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 55
    .local v2, "end":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_0

    .line 57
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    move-object v0, v3

    goto :goto_0

    .line 62
    :cond_0
    const-string v4, "<"

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 63
    .local v4, "ind":I
    if-eq v4, v3, :cond_1

    .line 64
    const/4 v3, 0x0

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v3

    .line 72
    .end local v1    # "begin":I
    .end local v2    # "end":I
    .end local v4    # "ind":I
    :cond_1
    :goto_0
    goto :goto_1

    .line 70
    :catch_0
    move-exception v1

    .line 71
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 73
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    return-object v0
.end method

.method public getEmail(Ljava/lang/String;)Landroid/gov/nist/javax/sdp/fields/Email;
    .locals 8
    .param p1, "rest"    # Ljava/lang/String;

    .line 77
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/Email;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/Email;-><init>()V

    .line 80
    .local v0, "email":Landroid/gov/nist/javax/sdp/fields/Email;
    :try_start_0
    const-string v1, "("

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .local v1, "begin":I
    const-string v2, "@"

    const/4 v3, 0x0

    const/4 v4, -0x1

    if-eq v1, v4, :cond_1

    .line 84
    :try_start_1
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 85
    .local v5, "emailTemp":Ljava/lang/String;
    invoke-virtual {v5, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 86
    .local v2, "i":I
    if-eq v2, v4, :cond_0

    .line 87
    invoke-virtual {v5, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/Email;->setUserName(Ljava/lang/String;)V

    .line 88
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {v5, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/Email;->setHostName(Ljava/lang/String;)V

    .line 92
    .end local v2    # "i":I
    .end local v5    # "emailTemp":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 96
    :cond_1
    const-string v5, "<"

    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    .line 97
    .local v5, "ind":I
    const-string v6, ">"

    invoke-virtual {p1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    .line 99
    .local v6, "end":I
    if-eq v5, v4, :cond_3

    .line 100
    add-int/lit8 v7, v5, 0x1

    invoke-virtual {p1, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 101
    .local v7, "emailTemp":Ljava/lang/String;
    invoke-virtual {v7, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 102
    .restart local v2    # "i":I
    if-eq v2, v4, :cond_2

    .line 103
    invoke-virtual {v7, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/Email;->setUserName(Ljava/lang/String;)V

    .line 104
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {v7, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/Email;->setHostName(Ljava/lang/String;)V

    .line 109
    .end local v2    # "i":I
    .end local v7    # "emailTemp":Ljava/lang/String;
    :cond_2
    goto :goto_0

    .line 110
    :cond_3
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 111
    .restart local v2    # "i":I
    const-string v7, "\n"

    invoke-virtual {p1, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    .line 112
    .local v7, "j":I
    if-eq v2, v4, :cond_4

    .line 113
    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/Email;->setUserName(Ljava/lang/String;)V

    .line 114
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/Email;->setHostName(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 123
    .end local v1    # "begin":I
    .end local v2    # "i":I
    .end local v5    # "ind":I
    .end local v6    # "end":I
    .end local v7    # "j":I
    :cond_4
    :goto_0
    goto :goto_1

    .line 121
    :catch_0
    move-exception v1

    .line 122
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 124
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    return-object v0
.end method

.method public parse()Landroid/gov/nist/javax/sdp/fields/SDPField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 153
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/parser/EmailFieldParser;->emailField()Landroid/gov/nist/javax/sdp/fields/EmailField;

    move-result-object v0

    return-object v0
.end method
