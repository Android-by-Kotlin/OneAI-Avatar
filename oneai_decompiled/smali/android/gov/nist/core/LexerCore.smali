.class public Landroid/gov/nist/core/LexerCore;
.super Landroid/gov/nist/core/StringTokenizer;
.source "LexerCore.java"


# static fields
.field public static final ALPHA:I = 0x1003

.field static final ALPHADIGIT_VALID_CHARS:C = '\ufffd'

.field static final ALPHA_VALID_CHARS:C = '\uffff'

.field public static final AND:I = 0x26

.field public static final AT:I = 0x40

.field public static final BACKSLASH:I = 0x5c

.field public static final BACK_QUOTE:I = 0x60

.field public static final BAR:I = 0x7c

.field public static final COLON:I = 0x3a

.field public static final DIGIT:I = 0x1002

.field static final DIGIT_VALID_CHARS:C = '\ufffe'

.field public static final DOLLAR:I = 0x24

.field public static final DOT:I = 0x2e

.field public static final DOUBLEQUOTE:I = 0x22

.field public static final END:I = 0x1000

.field public static final EQUALS:I = 0x3d

.field public static final EXCLAMATION:I = 0x21

.field public static final GREATER_THAN:I = 0x3e

.field public static final HAT:I = 0x5e

.field public static final HT:I = 0x9

.field public static final ID:I = 0xfff

.field public static final ID_NO_WHITESPACE:I = 0xffd

.field public static final IPV6:I = 0x1004

.field public static final LESS_THAN:I = 0x3c

.field public static final LPAREN:I = 0x28

.field public static final L_CURLY:I = 0x7b

.field public static final L_SQUARE_BRACKET:I = 0x5b

.field public static final MINUS:I = 0x2d

.field public static final NULL:I = 0x0

.field public static final PERCENT:I = 0x25

.field public static final PLUS:I = 0x2b

.field public static final POUND:I = 0x23

.field public static final QUESTION:I = 0x3f

.field public static final QUOTE:I = 0x27

.field public static final RPAREN:I = 0x29

.field public static final R_CURLY:I = 0x7d

.field public static final R_SQUARE_BRACKET:I = 0x5d

.field public static final SAFE:I = 0xffe

.field public static final SEMICOLON:I = 0x3b

.field public static final SLASH:I = 0x2f

.field public static final SP:I = 0x20

.field public static final STAR:I = 0x2a

.field public static final START:I = 0x800

.field public static final TILDE:I = 0x7e

.field public static final UNDERSCORE:I = 0x5f

.field public static final WHITESPACE:I = 0x1001

.field protected static final globalSymbolTable:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected static final lexerTables:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field protected currentLexer:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected currentLexerName:Ljava/lang/String;

.field protected currentMatch:Landroid/gov/nist/core/Token;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 98
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Landroid/gov/nist/core/LexerCore;->globalSymbolTable:Ljava/util/concurrent/ConcurrentHashMap;

    .line 99
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Landroid/gov/nist/core/LexerCore;->lexerTables:Ljava/util/concurrent/ConcurrentHashMap;

    .line 100
    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .line 136
    invoke-direct {p0}, Landroid/gov/nist/core/StringTokenizer;-><init>()V

    .line 137
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/core/LexerCore;->currentLexer:Ljava/util/Map;

    .line 138
    const-string/jumbo v0, "charLexer"

    iput-object v0, p0, Landroid/gov/nist/core/LexerCore;->currentLexerName:Ljava/lang/String;

    .line 139
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "lexerName"    # Ljava/lang/String;
    .param p2, "buffer"    # Ljava/lang/String;

    .line 144
    invoke-direct {p0, p2}, Landroid/gov/nist/core/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 145
    iput-object p1, p0, Landroid/gov/nist/core/LexerCore;->currentLexerName:Ljava/lang/String;

    .line 146
    return-void
.end method

.method public static charAsString(C)Ljava/lang/String;
    .locals 1
    .param p0, "ch"    # C

    .line 721
    invoke-static {p0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final isTokenChar(C)Z
    .locals 2
    .param p0, "c"    # C

    .line 328
    invoke-static {p0}, Landroid/gov/nist/core/LexerCore;->isAlphaDigit(C)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 329
    :cond_0
    sparse-switch p0, :sswitch_data_0

    .line 343
    const/4 v0, 0x0

    return v0

    .line 341
    :sswitch_0
    return v1

    :sswitch_data_0
    .sparse-switch
        0x21 -> :sswitch_0
        0x25 -> :sswitch_0
        0x27 -> :sswitch_0
        0x2a -> :sswitch_0
        0x2b -> :sswitch_0
        0x2d -> :sswitch_0
        0x2e -> :sswitch_0
        0x5f -> :sswitch_0
        0x60 -> :sswitch_0
        0x7e -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public SPorHT()V
    .locals 3

    .line 307
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 308
    .local v1, "c":C
    :goto_0
    const/16 v2, 0x20

    if-eq v1, v2, :cond_1

    const/16 v2, 0x9

    if-ne v1, v2, :cond_0

    goto :goto_1

    .line 314
    .end local v1    # "c":C
    :cond_0
    goto :goto_2

    .line 309
    .restart local v1    # "c":C
    :cond_1
    :goto_1
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 310
    invoke-virtual {p0, v0}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move v1, v2

    goto :goto_0

    .line 312
    .end local v1    # "c":C
    :catch_0
    move-exception v0

    .line 315
    :goto_2
    return-void
.end method

.method protected addKeyword(Ljava/lang/String;I)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I

    .line 103
    invoke-static {p1}, Landroid/gov/nist/javax/sip/Utils;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 106
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 107
    .local v0, "val":Ljava/lang/Integer;
    iget-object v1, p0, Landroid/gov/nist/core/LexerCore;->currentLexer:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v1, Landroid/gov/nist/core/LexerCore;->globalSymbolTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    return-void
.end method

.method public byteStringNoComma()Ljava/lang/String;
    .locals 3

    .line 704
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 707
    .local v0, "retval":Ljava/lang/StringBuilder;
    :goto_0
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 708
    .local v1, "next":C
    const/16 v2, 0xa

    if-eq v1, v2, :cond_1

    const/16 v2, 0x2c

    if-ne v1, v2, :cond_0

    .line 709
    goto :goto_1

    .line 711
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 712
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 714
    nop

    .end local v1    # "next":C
    goto :goto_0

    .line 716
    :cond_1
    :goto_1
    goto :goto_2

    .line 715
    :catch_0
    move-exception v1

    .line 717
    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public byteStringNoSemicolon()Ljava/lang/String;
    .locals 3

    .line 657
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 660
    .local v0, "retval":Ljava/lang/StringBuilder;
    :goto_0
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 662
    .local v1, "next":C
    if-eqz v1, :cond_1

    const/16 v2, 0xa

    if-eq v1, v2, :cond_1

    const/16 v2, 0x3b

    if-eq v1, v2, :cond_1

    const/16 v2, 0x2c

    if-ne v1, v2, :cond_0

    .line 663
    goto :goto_1

    .line 665
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 666
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 668
    nop

    .end local v1    # "next":C
    goto :goto_0

    .line 671
    :cond_1
    :goto_1
    nop

    .line 672
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 669
    :catch_0
    move-exception v1

    .line 670
    .local v1, "ex":Ljava/text/ParseException;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public byteStringNoSlash()Ljava/lang/String;
    .locals 3

    .line 681
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 684
    .local v0, "retval":Ljava/lang/StringBuilder;
    :goto_0
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 686
    .local v1, "next":C
    if-eqz v1, :cond_1

    const/16 v2, 0xa

    if-eq v1, v2, :cond_1

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_0

    .line 687
    goto :goto_1

    .line 689
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 690
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 692
    nop

    .end local v1    # "next":C
    goto :goto_0

    .line 695
    :cond_1
    :goto_1
    nop

    .line 696
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 693
    :catch_0
    move-exception v1

    .line 694
    .local v1, "ex":Ljava/text/ParseException;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public charAsString(I)Ljava/lang/String;
    .locals 3
    .param p1, "nchars"    # I

    .line 728
    iget-object v0, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    iget v1, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    add-int/lit8 v2, p1, -0x1

    invoke-static {v0, v1, v2}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public comment()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 626
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 627
    .local v0, "retval":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    const/16 v2, 0x28

    if-eq v1, v2, :cond_0

    .line 628
    const/4 v1, 0x0

    return-object v1

    .line 629
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 631
    :goto_0
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->getNextChar()C

    move-result v1

    .line 632
    .local v1, "next":C
    const/16 v2, 0x29

    if-ne v1, v2, :cond_1

    .line 633
    nop

    .line 650
    .end local v1    # "next":C
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 634
    .restart local v1    # "next":C
    :cond_1
    if-eqz v1, :cond_4

    .line 638
    const/16 v2, 0x5c

    if-ne v1, v2, :cond_3

    .line 639
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 640
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->getNextChar()C

    move-result v1

    .line 641
    if-eqz v1, :cond_2

    .line 645
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 642
    :cond_2
    new-instance v2, Ljava/text/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " : unexpected EOL"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    invoke-direct {v2, v3, v4}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 647
    :cond_3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 649
    .end local v1    # "next":C
    :goto_1
    goto :goto_0

    .line 635
    .restart local v1    # "next":C
    :cond_4
    new-instance v2, Ljava/text/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " :unexpected EOL"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    invoke-direct {v2, v3, v4}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2
.end method

.method public consumeValidChars([C)V
    .locals 8
    .param p1, "validChars"    # [C

    .line 560
    array-length v0, p1

    .line 562
    .local v0, "validCharsLength":I
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 563
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    .line 564
    .local v2, "nextChar":C
    const/4 v3, 0x0

    .line 565
    .local v3, "isValid":Z
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    const/4 v5, 0x1

    if-ge v4, v0, :cond_2

    .line 566
    aget-char v6, p1, v4

    .line 567
    .local v6, "validChar":C
    packed-switch v6, :pswitch_data_0

    .line 578
    if-ne v2, v6, :cond_0

    move v7, v5

    goto :goto_2

    .line 569
    :pswitch_0
    invoke-static {v2}, Landroid/gov/nist/core/LexerCore;->isAlpha(C)Z

    move-result v7

    move v3, v7

    .line 570
    goto :goto_3

    .line 572
    :pswitch_1
    invoke-static {v2}, Landroid/gov/nist/core/LexerCore;->isDigit(C)Z

    move-result v7

    move v3, v7

    .line 573
    goto :goto_3

    .line 575
    :pswitch_2
    invoke-static {v2}, Landroid/gov/nist/core/LexerCore;->isAlphaDigit(C)Z

    move-result v7

    move v3, v7

    .line 576
    goto :goto_3

    .line 578
    :cond_0
    move v7, v1

    :goto_2
    move v3, v7

    .line 580
    :goto_3
    if-eqz v3, :cond_1

    .line 581
    goto :goto_4

    .line 565
    .end local v6    # "validChar":C
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 584
    .end local v4    # "i":I
    :cond_2
    :goto_4
    if-eqz v3, :cond_3

    .line 585
    invoke-virtual {p0, v5}, Landroid/gov/nist/core/LexerCore;->consume(I)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 590
    .end local v2    # "nextChar":C
    .end local v3    # "isValid":Z
    goto :goto_0

    .line 593
    :cond_3
    goto :goto_5

    .line 591
    :catch_0
    move-exception v1

    .line 594
    :goto_5
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xfffd
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public createParseException()Ljava/text/ParseException;
    .locals 3

    .line 834
    new-instance v0, Ljava/text/ParseException;

    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    return-object v0
.end method

.method public getBuffer()Ljava/lang/String;
    .locals 1

    .line 828
    iget-object v0, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    invoke-static {v0}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNextId()Ljava/lang/String;
    .locals 1

    .line 162
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->ttoken()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNextIdNoWhiteSpace()Ljava/lang/String;
    .locals 1

    .line 172
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->ttokenNoWhiteSpace()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNextIp()Ljava/lang/String;
    .locals 1

    .line 168
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->tIpv6address()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNextToken()Landroid/gov/nist/core/Token;
    .locals 1

    .line 177
    iget-object v0, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    return-object v0
.end method

.method public getPtr()I
    .locals 1

    .line 822
    iget v0, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    return v0
.end method

.method public getRest()Ljava/lang/String;
    .locals 4

    .line 776
    iget v0, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    iget v1, p0, Landroid/gov/nist/core/LexerCore;->bufferLen:I

    if-le v0, v1, :cond_0

    .line 777
    const/4 v0, 0x0

    return-object v0

    .line 778
    :cond_0
    iget v0, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    iget v1, p0, Landroid/gov/nist/core/LexerCore;->bufferLen:I

    if-ne v0, v1, :cond_1

    const-string v0, ""

    return-object v0

    .line 779
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    iget v1, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    iget v2, p0, Landroid/gov/nist/core/LexerCore;->bufferLen:I

    iget v3, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    sub-int/2addr v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getString(C)Ljava/lang/String;
    .locals 7
    .param p1, "c"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 787
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 789
    .local v0, "retval":Ljava/lang/StringBuilder;
    :goto_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    .line 793
    .local v2, "next":C
    const-string/jumbo v3, "unexpected EOL"

    if-eqz v2, :cond_3

    .line 797
    const/4 v4, 0x1

    if-ne v2, p1, :cond_0

    .line 798
    invoke-virtual {p0, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 799
    nop

    .line 816
    .end local v2    # "next":C
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 800
    .restart local v2    # "next":C
    :cond_0
    const/16 v5, 0x5c

    if-ne v2, v5, :cond_2

    .line 801
    invoke-virtual {p0, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 802
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 803
    .local v1, "nextchar":C
    if-eqz v1, :cond_1

    .line 808
    invoke-virtual {p0, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 809
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 811
    .end local v1    # "nextchar":C
    goto :goto_1

    .line 804
    .restart local v1    # "nextchar":C
    :cond_1
    new-instance v4, Ljava/text/ParseException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget v5, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    invoke-direct {v4, v3, v5}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 812
    .end local v1    # "nextchar":C
    :cond_2
    invoke-virtual {p0, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 813
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 815
    .end local v2    # "next":C
    :goto_1
    goto :goto_0

    .line 794
    .restart local v2    # "next":C
    :cond_3
    new-instance v1, Ljava/text/ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    invoke-direct {v1, v3, v4}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public lookupToken(I)Ljava/lang/String;
    .locals 2
    .param p1, "value"    # I

    .line 113
    const/16 v0, 0x800

    if-le p1, v0, :cond_0

    .line 114
    sget-object v0, Landroid/gov/nist/core/LexerCore;->globalSymbolTable:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 116
    :cond_0
    int-to-char v0, p1

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    .line 117
    .local v0, "ch":Ljava/lang/Character;
    invoke-virtual {v0}, Ljava/lang/Character;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public markInputPosition()I
    .locals 1

    .line 762
    iget v0, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    return v0
.end method

.method public match(I)Landroid/gov/nist/core/Token;
    .locals 5
    .param p1, "tok"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 222
    sget-boolean v0, Landroid/gov/nist/core/Debug;->parserDebug:Z

    if-eqz v0, :cond_0

    .line 223
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "match "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/gov/nist/core/Debug;->println(Ljava/lang/String;)V

    .line 225
    :cond_0
    const/16 v0, 0x800

    const/16 v1, 0x1000

    if-le p1, v0, :cond_8

    if-ge p1, v1, :cond_8

    .line 226
    const-string v0, "\nID expected"

    const/16 v1, 0xfff

    if-ne p1, v1, :cond_2

    .line 228
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->startsId()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 230
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->getNextId()Ljava/lang/String;

    move-result-object v0

    .line 231
    .local v0, "id":Ljava/lang/String;
    new-instance v2, Landroid/gov/nist/core/Token;

    invoke-direct {v2}, Landroid/gov/nist/core/Token;-><init>()V

    iput-object v2, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    .line 232
    iget-object v2, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    iput-object v0, v2, Landroid/gov/nist/core/Token;->tokenValue:Ljava/lang/String;

    .line 233
    iget-object v2, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    iput v1, v2, Landroid/gov/nist/core/Token;->tokenType:I

    .line 234
    .end local v0    # "id":Ljava/lang/String;
    goto/16 :goto_1

    .line 229
    :cond_1
    new-instance v1, Ljava/text/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget v2, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    invoke-direct {v1, v0, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 234
    :cond_2
    const/16 v1, 0xffe

    if-ne p1, v1, :cond_4

    .line 235
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->startsSafeToken()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 237
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->ttokenSafe()Ljava/lang/String;

    move-result-object v0

    .line 238
    .restart local v0    # "id":Ljava/lang/String;
    new-instance v2, Landroid/gov/nist/core/Token;

    invoke-direct {v2}, Landroid/gov/nist/core/Token;-><init>()V

    iput-object v2, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    .line 239
    iget-object v2, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    iput-object v0, v2, Landroid/gov/nist/core/Token;->tokenValue:Ljava/lang/String;

    .line 240
    iget-object v2, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    iput v1, v2, Landroid/gov/nist/core/Token;->tokenType:I

    .line 241
    .end local v0    # "id":Ljava/lang/String;
    goto/16 :goto_1

    .line 236
    :cond_3
    new-instance v1, Ljava/text/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget v2, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    invoke-direct {v1, v0, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 241
    :cond_4
    const/16 v0, 0xffd

    if-ne p1, v0, :cond_6

    .line 242
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->startsIdNoWhiteSpace()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 244
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->getNextIdNoWhiteSpace()Ljava/lang/String;

    move-result-object v1

    .line 245
    .local v1, "id":Ljava/lang/String;
    new-instance v2, Landroid/gov/nist/core/Token;

    invoke-direct {v2}, Landroid/gov/nist/core/Token;-><init>()V

    iput-object v2, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    .line 246
    iget-object v2, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    iput-object v1, v2, Landroid/gov/nist/core/Token;->tokenValue:Ljava/lang/String;

    .line 247
    iget-object v2, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    iput v0, v2, Landroid/gov/nist/core/Token;->tokenType:I

    .line 248
    .end local v1    # "id":Ljava/lang/String;
    goto/16 :goto_1

    .line 243
    :cond_5
    new-instance v0, Ljava/text/ParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\nID no white space expected"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 249
    :cond_6
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->getNextId()Ljava/lang/String;

    move-result-object v0

    .line 250
    .local v0, "nexttok":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/core/LexerCore;->currentLexer:Ljava/util/Map;

    invoke-static {v0}, Landroid/gov/nist/javax/sip/Utils;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 252
    .local v1, "cur":Ljava/lang/Integer;
    if-eqz v1, :cond_7

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, p1, :cond_7

    .line 256
    new-instance v2, Landroid/gov/nist/core/Token;

    invoke-direct {v2}, Landroid/gov/nist/core/Token;-><init>()V

    iput-object v2, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    .line 257
    iget-object v2, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    iput-object v0, v2, Landroid/gov/nist/core/Token;->tokenValue:Ljava/lang/String;

    .line 258
    iget-object v2, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    iput p1, v2, Landroid/gov/nist/core/Token;->tokenType:I

    .line 259
    .end local v0    # "nexttok":Ljava/lang/String;
    .end local v1    # "cur":Ljava/lang/Integer;
    goto/16 :goto_1

    .line 253
    .restart local v0    # "nexttok":Ljava/lang/String;
    .restart local v1    # "cur":Ljava/lang/Integer;
    :cond_7
    new-instance v2, Ljava/text/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\nUnexpected Token : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    invoke-direct {v2, v3, v4}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 260
    .end local v0    # "nexttok":Ljava/lang/String;
    .end local v1    # "cur":Ljava/lang/Integer;
    :cond_8
    const/4 v0, 0x0

    const/4 v2, 0x1

    if-le p1, v1, :cond_e

    .line 262
    invoke-virtual {p0, v0}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v0

    .line 263
    .local v0, "next":C
    const/16 v1, 0x1002

    if-ne p1, v1, :cond_a

    .line 264
    invoke-static {v0}, Landroid/gov/nist/core/LexerCore;->isDigit(C)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 266
    new-instance v1, Landroid/gov/nist/core/Token;

    invoke-direct {v1}, Landroid/gov/nist/core/Token;-><init>()V

    iput-object v1, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    .line 267
    iget-object v1, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Landroid/gov/nist/core/Token;->tokenValue:Ljava/lang/String;

    .line 269
    iget-object v1, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    iput p1, v1, Landroid/gov/nist/core/Token;->tokenType:I

    .line 270
    invoke-virtual {p0, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    goto :goto_0

    .line 265
    :cond_9
    new-instance v1, Ljava/text/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\nExpecting DIGIT"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 272
    :cond_a
    const/16 v1, 0x1003

    if-ne p1, v1, :cond_c

    .line 273
    invoke-static {v0}, Landroid/gov/nist/core/LexerCore;->isAlpha(C)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 275
    new-instance v1, Landroid/gov/nist/core/Token;

    invoke-direct {v1}, Landroid/gov/nist/core/Token;-><init>()V

    iput-object v1, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    .line 276
    iget-object v1, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Landroid/gov/nist/core/Token;->tokenValue:Ljava/lang/String;

    .line 278
    iget-object v1, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    iput p1, v1, Landroid/gov/nist/core/Token;->tokenType:I

    .line 279
    invoke-virtual {p0, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    goto :goto_0

    .line 274
    :cond_b
    new-instance v1, Ljava/text/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\nExpecting ALPHA"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 281
    :cond_c
    const/16 v1, 0x1004

    if-ne p1, v1, :cond_d

    .line 282
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->getNextIp()Ljava/lang/String;

    move-result-object v2

    .line 283
    .local v2, "ip":Ljava/lang/String;
    new-instance v3, Landroid/gov/nist/core/Token;

    invoke-direct {v3}, Landroid/gov/nist/core/Token;-><init>()V

    iput-object v3, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    .line 284
    iget-object v3, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    iput-object v2, v3, Landroid/gov/nist/core/Token;->tokenValue:Ljava/lang/String;

    .line 285
    iget-object v3, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    iput v1, v3, Landroid/gov/nist/core/Token;->tokenType:I

    .line 287
    .end local v0    # "next":C
    .end local v2    # "ip":Ljava/lang/String;
    :cond_d
    :goto_0
    goto :goto_1

    .line 289
    :cond_e
    int-to-char v1, p1

    .line 290
    .local v1, "ch":C
    invoke-virtual {p0, v0}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v0

    .line 291
    .restart local v0    # "next":C
    if-ne v0, v1, :cond_f

    .line 296
    invoke-virtual {p0, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 302
    .end local v0    # "next":C
    .end local v1    # "ch":C
    :goto_1
    iget-object v0, p0, Landroid/gov/nist/core/LexerCore;->currentMatch:Landroid/gov/nist/core/Token;

    return-object v0

    .line 298
    .restart local v0    # "next":C
    .restart local v1    # "ch":C
    :cond_f
    new-instance v2, Ljava/text/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\nExpecting  >>>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "<<< got >>>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "<<<"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    invoke-direct {v2, v3, v4}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2
.end method

.method public number()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 737
    iget v0, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    .line 739
    .local v0, "startIdx":I
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    invoke-static {v2}, Landroid/gov/nist/core/LexerCore;->isDigit(C)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 744
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 746
    :goto_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    .line 747
    .local v3, "next":C
    invoke-static {v3}, Landroid/gov/nist/core/LexerCore;->isDigit(C)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 748
    invoke-virtual {p0, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 751
    .end local v3    # "next":C
    goto :goto_0

    .line 752
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    iget v2, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    sub-int/2addr v2, v0

    invoke-static {v1, v0, v2}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 740
    :cond_1
    new-instance v2, Ljava/text/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": Unexpected token at "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget v3, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    invoke-direct {v2, v1, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    .end local v0    # "startIdx":I
    throw v2
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 753
    .restart local v0    # "startIdx":I
    :catch_0
    move-exception v1

    .line 754
    .local v1, "ex":Ljava/text/ParseException;
    iget-object v2, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    iget v3, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    sub-int/2addr v3, v0

    invoke-static {v2, v0, v3}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public peekNextId()Ljava/lang/String;
    .locals 3

    .line 152
    iget v0, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    .line 153
    .local v0, "oldPtr":I
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->ttoken()Ljava/lang/String;

    move-result-object v1

    .line 154
    .local v1, "retval":Ljava/lang/String;
    iget v2, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    iput v2, p0, Landroid/gov/nist/core/LexerCore;->savedPtr:I

    .line 155
    iput v0, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    .line 156
    return-object v1
.end method

.method public peekNextToken()Landroid/gov/nist/core/Token;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 184
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/LexerCore;->peekNextToken(I)[Landroid/gov/nist/core/Token;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0
.end method

.method public peekNextToken(I)[Landroid/gov/nist/core/Token;
    .locals 8
    .param p1, "ntokens"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 188
    iget v0, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    .line 189
    .local v0, "old":I
    new-array v1, p1, [Landroid/gov/nist/core/Token;

    .line 190
    .local v1, "retval":[Landroid/gov/nist/core/Token;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, p1, :cond_4

    .line 191
    new-instance v3, Landroid/gov/nist/core/Token;

    invoke-direct {v3}, Landroid/gov/nist/core/Token;-><init>()V

    .line 192
    .local v3, "tok":Landroid/gov/nist/core/Token;
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->startsId()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 193
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->ttoken()Ljava/lang/String;

    move-result-object v4

    .line 194
    .local v4, "id":Ljava/lang/String;
    iput-object v4, v3, Landroid/gov/nist/core/Token;->tokenValue:Ljava/lang/String;

    .line 195
    invoke-static {v4}, Landroid/gov/nist/javax/sip/Utils;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 196
    .local v5, "idUppercase":Ljava/lang/String;
    iget-object v6, p0, Landroid/gov/nist/core/LexerCore;->currentLexer:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 197
    iget-object v6, p0, Landroid/gov/nist/core/LexerCore;->currentLexer:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    .line 198
    .local v6, "type":Ljava/lang/Integer;
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iput v7, v3, Landroid/gov/nist/core/Token;->tokenType:I

    .line 199
    .end local v6    # "type":Ljava/lang/Integer;
    goto :goto_1

    .line 200
    :cond_0
    const/16 v6, 0xfff

    iput v6, v3, Landroid/gov/nist/core/Token;->tokenType:I

    .line 201
    .end local v4    # "id":Ljava/lang/String;
    .end local v5    # "idUppercase":Ljava/lang/String;
    :goto_1
    goto :goto_2

    .line 202
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->getNextChar()C

    move-result v4

    .line 203
    .local v4, "nextChar":C
    invoke-static {v4}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Landroid/gov/nist/core/Token;->tokenValue:Ljava/lang/String;

    .line 204
    invoke-static {v4}, Landroid/gov/nist/core/LexerCore;->isAlpha(C)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 205
    const/16 v5, 0x1003

    iput v5, v3, Landroid/gov/nist/core/Token;->tokenType:I

    goto :goto_2

    .line 206
    :cond_2
    invoke-static {v4}, Landroid/gov/nist/core/LexerCore;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 207
    const/16 v5, 0x1002

    iput v5, v3, Landroid/gov/nist/core/Token;->tokenType:I

    goto :goto_2

    .line 209
    :cond_3
    iput v4, v3, Landroid/gov/nist/core/Token;->tokenType:I

    .line 211
    .end local v4    # "nextChar":C
    :goto_2
    aput-object v3, v1, v2

    .line 190
    .end local v3    # "tok":Landroid/gov/nist/core/Token;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 213
    .end local v2    # "i":I
    :cond_4
    iget v2, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    iput v2, p0, Landroid/gov/nist/core/LexerCore;->savedPtr:I

    .line 214
    iput v0, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    .line 215
    return-object v1
.end method

.method public quotedString()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 601
    iget v0, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    .line 602
    .local v0, "startIdx":I
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v3, 0x22

    if-eq v2, v3, :cond_0

    .line 603
    const/4 v1, 0x0

    return-object v1

    .line 604
    :cond_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 606
    :goto_0
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->getNextChar()C

    move-result v2

    .line 607
    .local v2, "next":C
    if-ne v2, v3, :cond_1

    .line 609
    nop

    .line 618
    .end local v2    # "next":C
    iget-object v2, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    iget v3, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    sub-int/2addr v3, v0

    sub-int/2addr v3, v1

    invoke-static {v2, v0, v3}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 610
    .restart local v2    # "next":C
    :cond_1
    if-eqz v2, :cond_3

    .line 614
    const/16 v4, 0x5c

    if-ne v2, v4, :cond_2

    .line 615
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 617
    .end local v2    # "next":C
    :cond_2
    goto :goto_0

    .line 611
    .restart local v2    # "next":C
    :cond_3
    new-instance v1, Ljava/text/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    invoke-static {v4}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " :unexpected EOL"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    invoke-direct {v1, v3, v4}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public rewindInputPosition(I)V
    .locals 0
    .param p1, "position"    # I

    .line 769
    iput p1, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    .line 770
    return-void
.end method

.method public selectLexer(Ljava/lang/String;)V
    .locals 0
    .param p1, "lexerName"    # Ljava/lang/String;

    .line 133
    iput-object p1, p0, Landroid/gov/nist/core/LexerCore;->currentLexerName:Ljava/lang/String;

    .line 134
    return-void
.end method

.method public startsId()Z
    .locals 2

    .line 349
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 350
    .local v1, "nextChar":C
    invoke-static {v1}, Landroid/gov/nist/core/LexerCore;->isTokenChar(C)Z

    move-result v0
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 351
    .end local v1    # "nextChar":C
    :catch_0
    move-exception v1

    .line 352
    .local v1, "ex":Ljava/text/ParseException;
    return v0
.end method

.method public startsIdNoWhiteSpace()Z
    .locals 3

    .line 358
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 359
    .local v1, "nextChar":C
    const/16 v2, 0x20

    if-eq v1, v2, :cond_0

    const/16 v2, 0x9

    if-eq v1, v2, :cond_0

    const/16 v2, 0xa

    if-eq v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    .line 360
    .end local v1    # "nextChar":C
    :catch_0
    move-exception v1

    .line 361
    .local v1, "ex":Ljava/text/ParseException;
    return v0
.end method

.method public startsSafeToken()Z
    .locals 4

    .line 367
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 368
    .local v1, "nextChar":C
    invoke-static {v1}, Landroid/gov/nist/core/LexerCore;->isAlphaDigit(C)Z

    move-result v2
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 369
    return v3

    .line 372
    :cond_0
    sparse-switch v1, :sswitch_data_0

    .line 400
    return v0

    .line 398
    :sswitch_0
    return v3

    .line 403
    .end local v1    # "nextChar":C
    :catch_0
    move-exception v1

    .line 404
    .local v1, "ex":Ljava/text/ParseException;
    return v0

    :sswitch_data_0
    .sparse-switch
        0x21 -> :sswitch_0
        0x22 -> :sswitch_0
        0x23 -> :sswitch_0
        0x24 -> :sswitch_0
        0x25 -> :sswitch_0
        0x27 -> :sswitch_0
        0x2a -> :sswitch_0
        0x2b -> :sswitch_0
        0x2d -> :sswitch_0
        0x2e -> :sswitch_0
        0x2f -> :sswitch_0
        0x3a -> :sswitch_0
        0x3b -> :sswitch_0
        0x3d -> :sswitch_0
        0x3f -> :sswitch_0
        0x40 -> :sswitch_0
        0x5b -> :sswitch_0
        0x5d -> :sswitch_0
        0x5e -> :sswitch_0
        0x5f -> :sswitch_0
        0x60 -> :sswitch_0
        0x7b -> :sswitch_0
        0x7c -> :sswitch_0
        0x7d -> :sswitch_0
        0x7e -> :sswitch_0
    .end sparse-switch
.end method

.method public tIpv6address()Ljava/lang/String;
    .locals 5

    .line 427
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    iget v1, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    iget-object v2, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    array-length v2, v2

    iget v3, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    sub-int/2addr v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v0

    .line 428
    .local v0, "hostName":Ljava/lang/String;
    new-instance v1, Landroid/gov/nist/core/HostNameParser;

    invoke-direct {v1, v0}, Landroid/gov/nist/core/HostNameParser;-><init>(Ljava/lang/String;)V

    .line 429
    .local v1, "hnp":Landroid/gov/nist/core/HostNameParser;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/HostNameParser;->hostPort(Z)Landroid/gov/nist/core/HostPort;

    move-result-object v2

    .line 430
    .local v2, "hp":Landroid/gov/nist/core/HostPort;
    invoke-virtual {v2}, Landroid/gov/nist/core/HostPort;->getHost()Landroid/gov/nist/core/Host;

    move-result-object v3

    iget-object v3, v3, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    .line 431
    .local v3, "length":I
    invoke-virtual {p0, v3}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 432
    invoke-virtual {v2}, Landroid/gov/nist/core/HostPort;->getHost()Landroid/gov/nist/core/Host;

    move-result-object v4

    iget-object v4, v4, Landroid/gov/nist/core/Host;->hostname:Ljava/lang/String;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v4

    .line 433
    .end local v0    # "hostName":Ljava/lang/String;
    .end local v1    # "hnp":Landroid/gov/nist/core/HostNameParser;
    .end local v2    # "hp":Landroid/gov/nist/core/HostPort;
    .end local v3    # "length":I
    :catch_0
    move-exception v0

    .line 434
    .local v0, "ex":Ljava/text/ParseException;
    const/4 v1, 0x0

    return-object v1
.end method

.method public ttoken()Ljava/lang/String;
    .locals 3

    .line 409
    iget v0, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    .line 411
    .local v0, "startIdx":I
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 412
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 413
    .local v1, "nextChar":C
    invoke-static {v1}, Landroid/gov/nist/core/LexerCore;->isTokenChar(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 414
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 418
    .end local v1    # "nextChar":C
    goto :goto_0

    .line 419
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    iget v2, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    sub-int/2addr v2, v0

    invoke-static {v1, v0, v2}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 420
    :catch_0
    move-exception v1

    .line 421
    .local v1, "ex":Ljava/text/ParseException;
    const/4 v2, 0x0

    return-object v2
.end method

.method public ttokenGenValue()Ljava/lang/String;
    .locals 4

    .line 507
    iget v0, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    .line 509
    .local v0, "startIdx":I
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 510
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 511
    .local v1, "nextChar":C
    invoke-static {v1}, Landroid/gov/nist/core/LexerCore;->isAlphaDigit(C)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 512
    invoke-virtual {p0, v3}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    goto :goto_2

    .line 515
    :cond_0
    const/4 v2, 0x0

    .line 516
    .local v2, "isValidChar":Z
    sparse-switch v1, :sswitch_data_0

    goto :goto_1

    .line 540
    :sswitch_0
    const/4 v2, 0x1

    .line 542
    :goto_1
    if-eqz v2, :cond_1

    .line 543
    invoke-virtual {p0, v3}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 549
    .end local v1    # "nextChar":C
    .end local v2    # "isValidChar":Z
    :goto_2
    goto :goto_0

    .line 550
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    iget v2, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    sub-int/2addr v2, v0

    invoke-static {v1, v0, v2}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 551
    :catch_0
    move-exception v1

    .line 552
    .local v1, "ex":Ljava/text/ParseException;
    const/4 v2, 0x0

    return-object v2

    nop

    :sswitch_data_0
    .sparse-switch
        0x21 -> :sswitch_0
        0x22 -> :sswitch_0
        0x23 -> :sswitch_0
        0x24 -> :sswitch_0
        0x25 -> :sswitch_0
        0x27 -> :sswitch_0
        0x2a -> :sswitch_0
        0x2b -> :sswitch_0
        0x2d -> :sswitch_0
        0x2e -> :sswitch_0
        0x2f -> :sswitch_0
        0x3a -> :sswitch_0
        0x3f -> :sswitch_0
        0x40 -> :sswitch_0
        0x5b -> :sswitch_0
        0x5d -> :sswitch_0
        0x5e -> :sswitch_0
        0x5f -> :sswitch_0
        0x60 -> :sswitch_0
        0x7b -> :sswitch_0
        0x7c -> :sswitch_0
        0x7d -> :sswitch_0
        0x7e -> :sswitch_0
    .end sparse-switch
.end method

.method public ttokenNoWhiteSpace()Ljava/lang/String;
    .locals 3

    .line 439
    iget v0, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    .line 441
    .local v0, "startIdx":I
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 442
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 443
    .local v1, "nextChar":C
    const/16 v2, 0x20

    if-eq v1, v2, :cond_1

    const/16 v2, 0xa

    if-eq v1, v2, :cond_1

    const/16 v2, 0x9

    if-ne v1, v2, :cond_0

    .line 444
    goto :goto_1

    .line 446
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 448
    .end local v1    # "nextChar":C
    goto :goto_0

    .line 449
    :cond_1
    :goto_1
    iget-object v1, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    iget v2, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    sub-int/2addr v2, v0

    invoke-static {v1, v0, v2}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 450
    :catch_0
    move-exception v1

    .line 451
    .local v1, "ex":Ljava/text/ParseException;
    const/4 v2, 0x0

    return-object v2
.end method

.method public ttokenSafe()Ljava/lang/String;
    .locals 4

    .line 456
    iget v0, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    .line 458
    .local v0, "startIdx":I
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 459
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 460
    .local v1, "nextChar":C
    invoke-static {v1}, Landroid/gov/nist/core/LexerCore;->isAlphaDigit(C)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 461
    invoke-virtual {p0, v3}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    goto :goto_2

    .line 464
    :cond_0
    const/4 v2, 0x0

    .line 465
    .local v2, "isValidChar":Z
    sparse-switch v1, :sswitch_data_0

    goto :goto_1

    .line 490
    :sswitch_0
    const/4 v2, 0x1

    .line 492
    :goto_1
    if-eqz v2, :cond_1

    .line 493
    invoke-virtual {p0, v3}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 499
    .end local v1    # "nextChar":C
    .end local v2    # "isValidChar":Z
    :goto_2
    goto :goto_0

    .line 500
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/core/LexerCore;->buffer:[C

    iget v2, p0, Landroid/gov/nist/core/LexerCore;->ptr:I

    sub-int/2addr v2, v0

    invoke-static {v1, v0, v2}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 501
    :catch_0
    move-exception v1

    .line 502
    .local v1, "ex":Ljava/text/ParseException;
    const/4 v2, 0x0

    return-object v2

    nop

    :sswitch_data_0
    .sparse-switch
        0x21 -> :sswitch_0
        0x22 -> :sswitch_0
        0x23 -> :sswitch_0
        0x24 -> :sswitch_0
        0x25 -> :sswitch_0
        0x27 -> :sswitch_0
        0x2a -> :sswitch_0
        0x2b -> :sswitch_0
        0x2d -> :sswitch_0
        0x2e -> :sswitch_0
        0x2f -> :sswitch_0
        0x3a -> :sswitch_0
        0x3b -> :sswitch_0
        0x3f -> :sswitch_0
        0x40 -> :sswitch_0
        0x5b -> :sswitch_0
        0x5d -> :sswitch_0
        0x5e -> :sswitch_0
        0x5f -> :sswitch_0
        0x60 -> :sswitch_0
        0x7b -> :sswitch_0
        0x7c -> :sswitch_0
        0x7d -> :sswitch_0
        0x7e -> :sswitch_0
    .end sparse-switch
.end method
