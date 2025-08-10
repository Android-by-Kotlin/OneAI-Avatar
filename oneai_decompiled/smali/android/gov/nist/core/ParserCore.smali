.class public abstract Landroid/gov/nist/core/ParserCore;
.super Ljava/lang/Object;
.source "ParserCore.java"


# static fields
.field public static final debug:Z

.field static nesting_level:I


# instance fields
.field protected lexer:Landroid/gov/nist/core/LexerCore;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    sget-boolean v0, Landroid/gov/nist/core/Debug;->parserDebug:Z

    sput-boolean v0, Landroid/gov/nist/core/ParserCore;->debug:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected dbg_enter(Ljava/lang/String;)V
    .locals 4
    .param p1, "rule"    # Ljava/lang/String;

    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 113
    .local v0, "stringBuilder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget v2, Landroid/gov/nist/core/ParserCore;->nesting_level:I

    if-ge v1, v2, :cond_0

    .line 114
    const-string v2, ">"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 116
    .end local v1    # "i":I
    :cond_0
    sget-boolean v1, Landroid/gov/nist/core/ParserCore;->debug:Z

    if-eqz v1, :cond_1

    .line 117
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\nlexer buffer = \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/core/ParserCore;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 122
    :cond_1
    sget v1, Landroid/gov/nist/core/ParserCore;->nesting_level:I

    add-int/lit8 v1, v1, 0x1

    sput v1, Landroid/gov/nist/core/ParserCore;->nesting_level:I

    .line 123
    return-void
.end method

.method protected dbg_leave(Ljava/lang/String;)V
    .locals 4
    .param p1, "rule"    # Ljava/lang/String;

    .line 126
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 127
    .local v0, "stringBuilder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget v2, Landroid/gov/nist/core/ParserCore;->nesting_level:I

    if-ge v1, v2, :cond_0

    .line 128
    const-string v2, "<"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 130
    .end local v1    # "i":I
    :cond_0
    sget-boolean v1, Landroid/gov/nist/core/ParserCore;->debug:Z

    if-eqz v1, :cond_1

    .line 131
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\nlexer buffer = \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/core/ParserCore;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 137
    :cond_1
    sget v1, Landroid/gov/nist/core/ParserCore;->nesting_level:I

    add-int/lit8 v1, v1, -0x1

    sput v1, Landroid/gov/nist/core/ParserCore;->nesting_level:I

    .line 138
    return-void
.end method

.method protected nameValue()Landroid/gov/nist/core/NameValue;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 141
    const/16 v0, 0x3d

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/ParserCore;->nameValue(C)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    return-object v0
.end method

.method protected nameValue(C)Landroid/gov/nist/core/NameValue;
    .locals 11
    .param p1, "separator"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 49
    sget-boolean v0, Landroid/gov/nist/core/ParserCore;->debug:Z

    const-string/jumbo v1, "nameValue"

    if-eqz v0, :cond_0

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/ParserCore;->dbg_enter(Ljava/lang/String;)V

    .line 52
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/core/ParserCore;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0xfff

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 53
    iget-object v0, p0, Landroid/gov/nist/core/ParserCore;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v0

    .line 55
    .local v0, "name":Landroid/gov/nist/core/Token;
    iget-object v3, p0, Landroid/gov/nist/core/ParserCore;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    const/4 v3, 0x0

    .line 61
    .local v3, "quoted":Z
    const/4 v4, 0x0

    :try_start_1
    iget-object v5, p0, Landroid/gov/nist/core/ParserCore;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v5
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    .local v5, "la":C
    const/4 v6, 0x1

    const-string v7, ""

    if-ne v5, p1, :cond_7

    .line 64
    :try_start_2
    iget-object v8, p0, Landroid/gov/nist/core/ParserCore;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v8, v6}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 65
    iget-object v6, p0, Landroid/gov/nist/core/ParserCore;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 66
    const/4 v6, 0x0

    .line 67
    .local v6, "str":Ljava/lang/String;
    const/4 v8, 0x0

    .line 68
    .local v8, "isFlag":Z
    iget-object v9, p0, Landroid/gov/nist/core/ParserCore;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v9, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v9

    .line 69
    .local v9, "c":C
    const/16 v10, 0x22

    if-ne v9, v10, :cond_1

    .line 70
    iget-object v2, p0, Landroid/gov/nist/core/ParserCore;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->quotedString()Ljava/lang/String;

    move-result-object v2

    .line 71
    .end local v6    # "str":Ljava/lang/String;
    .local v2, "str":Ljava/lang/String;
    const/4 v3, 0x1

    goto :goto_1

    .line 72
    .end local v2    # "str":Ljava/lang/String;
    .restart local v6    # "str":Ljava/lang/String;
    :cond_1
    const/16 v10, 0x5b

    if-ne v9, v10, :cond_3

    .line 73
    iget-object v2, p0, Landroid/gov/nist/core/ParserCore;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v10, 0x1004

    invoke-virtual {v2, v10}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 74
    iget-object v2, p0, Landroid/gov/nist/core/ParserCore;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v2

    .line 75
    .local v2, "value":Landroid/gov/nist/core/Token;
    iget-object v10, v2, Landroid/gov/nist/core/Token;->tokenValue:Ljava/lang/String;

    move-object v6, v10

    .line 78
    if-nez v6, :cond_2

    .line 79
    move-object v6, v7

    .line 80
    const/4 v7, 0x1

    move-object v2, v6

    move v8, v7

    .end local v8    # "isFlag":Z
    .local v7, "isFlag":Z
    goto :goto_0

    .line 78
    .end local v7    # "isFlag":Z
    .restart local v8    # "isFlag":Z
    :cond_2
    move-object v2, v6

    .line 82
    .end local v6    # "str":Ljava/lang/String;
    .local v2, "str":Ljava/lang/String;
    :goto_0
    goto :goto_1

    .line 83
    .end local v2    # "str":Ljava/lang/String;
    .restart local v6    # "str":Ljava/lang/String;
    :cond_3
    iget-object v10, p0, Landroid/gov/nist/core/ParserCore;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v10, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 84
    iget-object v2, p0, Landroid/gov/nist/core/ParserCore;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v2

    .line 85
    .local v2, "value":Landroid/gov/nist/core/Token;
    iget-object v10, v2, Landroid/gov/nist/core/Token;->tokenValue:Ljava/lang/String;

    move-object v6, v10

    .line 88
    if-nez v6, :cond_4

    .line 89
    move-object v6, v7

    .line 90
    const/4 v8, 0x1

    move-object v2, v6

    goto :goto_1

    .line 88
    :cond_4
    move-object v2, v6

    .line 93
    .end local v6    # "str":Ljava/lang/String;
    .local v2, "str":Ljava/lang/String;
    :goto_1
    new-instance v6, Landroid/gov/nist/core/NameValue;

    iget-object v7, v0, Landroid/gov/nist/core/Token;->tokenValue:Ljava/lang/String;

    invoke-direct {v6, v7, v2, v8}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 94
    .local v6, "nv":Landroid/gov/nist/core/NameValue;
    if-eqz v3, :cond_5

    invoke-virtual {v6}, Landroid/gov/nist/core/NameValue;->setQuotedValue()V
    :try_end_2
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 95
    :cond_5
    nop

    .line 105
    sget-boolean v4, Landroid/gov/nist/core/ParserCore;->debug:Z

    if-eqz v4, :cond_6

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/ParserCore;->dbg_leave(Ljava/lang/String;)V

    :cond_6
    return-object v6

    .line 98
    .end local v2    # "str":Ljava/lang/String;
    .end local v6    # "nv":Landroid/gov/nist/core/NameValue;
    .end local v8    # "isFlag":Z
    .end local v9    # "c":C
    :cond_7
    :try_start_3
    new-instance v2, Landroid/gov/nist/core/NameValue;

    iget-object v8, v0, Landroid/gov/nist/core/Token;->tokenValue:Ljava/lang/String;

    invoke-direct {v2, v8, v7, v6}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;Z)V
    :try_end_3
    .catch Ljava/text/ParseException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 105
    sget-boolean v4, Landroid/gov/nist/core/ParserCore;->debug:Z

    if-eqz v4, :cond_8

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/ParserCore;->dbg_leave(Ljava/lang/String;)V

    :cond_8
    return-object v2

    .line 100
    .end local v3    # "quoted":Z
    .end local v5    # "la":C
    :catch_0
    move-exception v2

    .line 101
    .local v2, "ex":Ljava/text/ParseException;
    :try_start_4
    new-instance v3, Landroid/gov/nist/core/NameValue;

    iget-object v5, v0, Landroid/gov/nist/core/Token;->tokenValue:Ljava/lang/String;

    const/4 v6, 0x0

    invoke-direct {v3, v5, v6, v4}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 105
    sget-boolean v4, Landroid/gov/nist/core/ParserCore;->debug:Z

    if-eqz v4, :cond_9

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/ParserCore;->dbg_leave(Ljava/lang/String;)V

    :cond_9
    return-object v3

    .end local v0    # "name":Landroid/gov/nist/core/Token;
    .end local v2    # "ex":Ljava/text/ParseException;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/core/ParserCore;->debug:Z

    if-eqz v2, :cond_a

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/ParserCore;->dbg_leave(Ljava/lang/String;)V

    :cond_a
    throw v0
.end method

.method protected peekLine(Ljava/lang/String;)V
    .locals 2
    .param p1, "rule"    # Ljava/lang/String;

    .line 147
    sget-boolean v0, Landroid/gov/nist/core/ParserCore;->debug:Z

    if-eqz v0, :cond_0

    .line 148
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/core/ParserCore;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->peekLine()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/gov/nist/core/Debug;->println(Ljava/lang/String;)V

    .line 150
    :cond_0
    return-void
.end method
