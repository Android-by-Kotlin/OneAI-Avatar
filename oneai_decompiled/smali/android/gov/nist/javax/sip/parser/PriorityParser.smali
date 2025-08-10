.class public Landroid/gov/nist/javax/sip/parser/PriorityParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "PriorityParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 59
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "priority"    # Ljava/lang/String;

    .line 51
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 52
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 7
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 99
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "Priority: 8;a\n"

    aput-object v2, v0, v1

    .line 103
    .local v0, "p":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 104
    new-instance v2, Landroid/gov/nist/javax/sip/parser/PriorityParser;

    aget-object v3, v0, v1

    invoke-direct {v2, v3}, Landroid/gov/nist/javax/sip/parser/PriorityParser;-><init>(Ljava/lang/String;)V

    .line 106
    .local v2, "parser":Landroid/gov/nist/javax/sip/parser/PriorityParser;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/PriorityParser;->parse()Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/Priority;

    .line 107
    .local v3, "prio":Landroid/gov/nist/javax/sip/header/Priority;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "encoded = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/Priority;->encode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 103
    .end local v2    # "parser":Landroid/gov/nist/javax/sip/parser/PriorityParser;
    .end local v3    # "prio":Landroid/gov/nist/javax/sip/header/Priority;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 109
    .end local v1    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 69
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/PriorityParser;->debug:Z

    const-string/jumbo v1, "PriorityParser.parse"

    if-eqz v0, :cond_0

    .line 70
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/PriorityParser;->dbg_enter(Ljava/lang/String;)V

    .line 71
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/Priority;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Priority;-><init>()V

    .line 73
    .local v0, "priority":Landroid/gov/nist/javax/sip/header/Priority;
    const/16 v2, 0x821

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/PriorityParser;->headerName(I)V

    .line 75
    const-string/jumbo v2, "Priority"

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/Priority;->setHeaderName(Ljava/lang/String;)V

    .line 77
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/PriorityParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 85
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/PriorityParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->ttokenSafe()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/Priority;->setPriority(Ljava/lang/String;)V

    .line 87
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/PriorityParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 88
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/PriorityParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    nop

    .line 92
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/PriorityParser;->debug:Z

    if-eqz v2, :cond_1

    .line 93
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/PriorityParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 92
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/PriorityParser;->debug:Z

    if-eqz v3, :cond_2

    .line 93
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/PriorityParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v2
.end method
