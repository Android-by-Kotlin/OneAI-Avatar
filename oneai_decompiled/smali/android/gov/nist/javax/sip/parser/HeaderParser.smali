.class public Landroid/gov/nist/javax/sip/parser/HeaderParser;
.super Landroid/gov/nist/javax/sip/parser/Parser;
.source "HeaderParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 2
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 159
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/Parser;-><init>()V

    .line 160
    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 161
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const-string/jumbo v1, "command_keywordLexer"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->selectLexer(Ljava/lang/String;)V

    .line 162
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "header"    # Ljava/lang/String;

    .line 155
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/Parser;-><init>()V

    .line 156
    new-instance v0, Landroid/gov/nist/javax/sip/parser/Lexer;

    const-string/jumbo v1, "command_keywordLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sip/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 157
    return-void
.end method


# virtual methods
.method protected date()Ljava/util/Calendar;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 83
    :try_start_0
    const-string v0, "GMT"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 84
    .local v0, "retval":Ljava/util/Calendar;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v1

    .line 85
    .local v1, "s1":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 86
    .local v2, "day":I
    if-lez v2, :cond_c

    const/16 v3, 0x1f

    if-gt v2, v3, :cond_c

    .line 88
    const/4 v3, 0x5

    invoke-virtual {v0, v3, v2}, Ljava/util/Calendar;->set(II)V

    .line 89
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0x20

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 90
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->ttoken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    .line 91
    .local v4, "month":Ljava/lang/String;
    const-string/jumbo v6, "jan"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    const/4 v7, 0x1

    const/4 v8, 0x2

    if-eqz v6, :cond_0

    .line 92
    const/4 v3, 0x0

    invoke-virtual {v0, v8, v3}, Ljava/util/Calendar;->set(II)V

    goto/16 :goto_0

    .line 93
    :cond_0
    const-string/jumbo v6, "feb"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 94
    invoke-virtual {v0, v8, v7}, Ljava/util/Calendar;->set(II)V

    goto/16 :goto_0

    .line 95
    :cond_1
    const-string/jumbo v6, "mar"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 96
    invoke-virtual {v0, v8, v8}, Ljava/util/Calendar;->set(II)V

    goto/16 :goto_0

    .line 97
    :cond_2
    const-string/jumbo v6, "apr"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 98
    const/4 v3, 0x3

    invoke-virtual {v0, v8, v3}, Ljava/util/Calendar;->set(II)V

    goto/16 :goto_0

    .line 99
    :cond_3
    const-string/jumbo v6, "may"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 100
    const/4 v3, 0x4

    invoke-virtual {v0, v8, v3}, Ljava/util/Calendar;->set(II)V

    goto :goto_0

    .line 101
    :cond_4
    const-string/jumbo v6, "jun"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 102
    invoke-virtual {v0, v8, v3}, Ljava/util/Calendar;->set(II)V

    goto :goto_0

    .line 103
    :cond_5
    const-string/jumbo v3, "jul"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 104
    const/4 v3, 0x6

    invoke-virtual {v0, v8, v3}, Ljava/util/Calendar;->set(II)V

    goto :goto_0

    .line 105
    :cond_6
    const-string/jumbo v3, "aug"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 106
    const/4 v3, 0x7

    invoke-virtual {v0, v8, v3}, Ljava/util/Calendar;->set(II)V

    goto :goto_0

    .line 107
    :cond_7
    const-string/jumbo v3, "sep"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 108
    const/16 v3, 0x8

    invoke-virtual {v0, v8, v3}, Ljava/util/Calendar;->set(II)V

    goto :goto_0

    .line 109
    :cond_8
    const-string/jumbo v3, "oct"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 110
    const/16 v3, 0x9

    invoke-virtual {v0, v8, v3}, Ljava/util/Calendar;->set(II)V

    goto :goto_0

    .line 111
    :cond_9
    const-string/jumbo v3, "nov"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 112
    const/16 v3, 0xa

    invoke-virtual {v0, v8, v3}, Ljava/util/Calendar;->set(II)V

    goto :goto_0

    .line 113
    :cond_a
    const-string/jumbo v3, "dec"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 114
    const/16 v3, 0xb

    invoke-virtual {v0, v8, v3}, Ljava/util/Calendar;->set(II)V

    .line 116
    :cond_b
    :goto_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 117
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v3

    .line 118
    .local v3, "s2":Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 119
    .local v5, "yr":I
    invoke-virtual {v0, v7, v5}, Ljava/util/Calendar;->set(II)V

    .line 120
    return-object v0

    .line 87
    .end local v3    # "s2":Ljava/lang/String;
    .end local v4    # "month":Ljava/lang/String;
    .end local v5    # "yr":I
    :cond_c
    const-string v3, "Bad day "

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v3

    throw v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    .end local v0    # "retval":Ljava/util/Calendar;
    .end local v1    # "s1":Ljava/lang/String;
    .end local v2    # "day":I
    :catch_0
    move-exception v0

    .line 123
    .local v0, "ex":Ljava/lang/Exception;
    const-string/jumbo v1, "bad date field"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v1

    throw v1
.end method

.method protected headerName(I)V
    .locals 2
    .param p1, "tok"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 185
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 186
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 187
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 188
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 189
    return-void
.end method

.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 170
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->getNextToken(C)Ljava/lang/String;

    move-result-object v0

    .line 171
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 172
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getLine()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 175
    .local v1, "body":Ljava/lang/String;
    new-instance v2, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;

    invoke-direct {v2, v0}, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;-><init>(Ljava/lang/String;)V

    .line 176
    .local v2, "retval":Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;
    invoke-virtual {v2, v1}, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;->setValue(Ljava/lang/String;)V

    .line 177
    return-object v2
.end method

.method protected time(Ljava/util/Calendar;)V
    .locals 5
    .param p1, "calendar"    # Ljava/util/Calendar;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 133
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v0

    .line 134
    .local v0, "s":Ljava/lang/String;
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 135
    .local v1, "hour":I
    const/16 v2, 0xb

    invoke-virtual {p1, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 136
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x3a

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 137
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v2

    move-object v0, v2

    .line 138
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 139
    .local v2, "min":I
    const/16 v4, 0xc

    invoke-virtual {p1, v4, v2}, Ljava/util/Calendar;->set(II)V

    .line 140
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 141
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v3

    move-object v0, v3

    .line 142
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 143
    .local v3, "sec":I
    const/16 v4, 0xd

    invoke-virtual {p1, v4, v3}, Ljava/util/Calendar;->set(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 147
    .end local v0    # "s":Ljava/lang/String;
    .end local v1    # "hour":I
    .end local v2    # "min":I
    .end local v3    # "sec":I
    nop

    .line 149
    return-void

    .line 144
    :catch_0
    move-exception v0

    .line 145
    .local v0, "ex":Ljava/lang/Exception;
    const-string/jumbo v1, "error processing time "

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v1

    throw v1
.end method

.method protected wkday()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 50
    const-string/jumbo v0, "wkday"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->dbg_enter(Ljava/lang/String;)V

    .line 52
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/HeaderParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->ttoken()Ljava/lang/String;

    move-result-object v1

    .line 53
    .local v1, "tok":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 55
    .local v2, "id":Ljava/lang/String;
    const-string v3, "Mon"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_0

    .line 56
    nop

    .line 72
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->dbg_leave(Ljava/lang/String;)V

    const/4 v0, 0x2

    return v0

    .line 57
    :cond_0
    :try_start_1
    const-string/jumbo v3, "Tue"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v3, :cond_1

    .line 58
    nop

    .line 72
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->dbg_leave(Ljava/lang/String;)V

    const/4 v0, 0x3

    return v0

    .line 59
    :cond_1
    :try_start_2
    const-string/jumbo v3, "Wed"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v3, :cond_2

    .line 60
    nop

    .line 72
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->dbg_leave(Ljava/lang/String;)V

    const/4 v0, 0x4

    return v0

    .line 61
    :cond_2
    :try_start_3
    const-string/jumbo v3, "Thu"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v3, :cond_3

    .line 62
    nop

    .line 72
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->dbg_leave(Ljava/lang/String;)V

    const/4 v0, 0x5

    return v0

    .line 63
    :cond_3
    :try_start_4
    const-string v3, "Fri"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v3, :cond_4

    .line 64
    nop

    .line 72
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->dbg_leave(Ljava/lang/String;)V

    const/4 v0, 0x6

    return v0

    .line 65
    :cond_4
    :try_start_5
    const-string/jumbo v3, "Sat"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v3, :cond_5

    .line 66
    nop

    .line 72
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->dbg_leave(Ljava/lang/String;)V

    const/4 v0, 0x7

    return v0

    .line 67
    :cond_5
    :try_start_6
    const-string/jumbo v3, "Sun"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    if-eqz v3, :cond_6

    .line 68
    nop

    .line 72
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->dbg_leave(Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0

    .line 70
    :cond_6
    :try_start_7
    const-string/jumbo v3, "bad wkday"

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v3

    throw v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 72
    .end local v1    # "tok":Ljava/lang/String;
    .end local v2    # "id":Ljava/lang/String;
    :catchall_0
    move-exception v1

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->dbg_leave(Ljava/lang/String;)V

    throw v1
.end method
