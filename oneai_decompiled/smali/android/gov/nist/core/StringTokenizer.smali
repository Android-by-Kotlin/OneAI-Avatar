.class public Landroid/gov/nist/core/StringTokenizer;
.super Ljava/lang/Object;
.source "StringTokenizer.java"


# instance fields
.field protected buffer:[C

.field protected bufferLen:I

.field protected ptr:I

.field protected savedPtr:I


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "buffer"    # Ljava/lang/String;

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/StringTokenizer;->buffer:[C

    .line 54
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Landroid/gov/nist/core/StringTokenizer;->bufferLen:I

    .line 55
    const/4 v0, 0x0

    iput v0, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    .line 56
    return-void
.end method

.method public static getSDPFieldName(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "line"    # Ljava/lang/String;

    .line 192
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 193
    return-object v0

    .line 194
    :cond_0
    const/4 v1, 0x0

    .line 196
    .local v1, "fieldName":Ljava/lang/String;
    :try_start_0
    const-string v2, "="

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 197
    .local v2, "begin":I
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    .end local v1    # "fieldName":Ljava/lang/String;
    .end local v2    # "begin":I
    .local v0, "fieldName":Ljava/lang/String;
    nop

    .line 201
    return-object v0

    .line 198
    .end local v0    # "fieldName":Ljava/lang/String;
    .restart local v1    # "fieldName":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 199
    .local v2, "e":Ljava/lang/IndexOutOfBoundsException;
    return-object v0
.end method

.method public static isAlpha(C)Z
    .locals 3
    .param p0, "ch"    # C

    .line 83
    const/16 v0, 0x7f

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-gt p0, v0, :cond_3

    .line 84
    const/16 v0, 0x61

    if-lt p0, v0, :cond_0

    const/16 v0, 0x7a

    if-le p0, v0, :cond_1

    :cond_0
    const/16 v0, 0x41

    if-lt p0, v0, :cond_2

    const/16 v0, 0x5a

    if-gt p0, v0, :cond_2

    :cond_1
    move v1, v2

    :cond_2
    return v1

    .line 87
    :cond_3
    invoke-static {p0}, Ljava/lang/Character;->isLowerCase(C)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {p0}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v0

    if-eqz v0, :cond_5

    :cond_4
    move v1, v2

    :cond_5
    return v1
.end method

.method public static isAlphaDigit(C)Z
    .locals 3
    .param p0, "ch"    # C

    .line 101
    const/16 v0, 0x7f

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-gt p0, v0, :cond_4

    .line 102
    const/16 v0, 0x61

    if-lt p0, v0, :cond_0

    const/16 v0, 0x7a

    if-le p0, v0, :cond_2

    :cond_0
    const/16 v0, 0x41

    if-lt p0, v0, :cond_1

    const/16 v0, 0x5a

    if-le p0, v0, :cond_2

    :cond_1
    const/16 v0, 0x39

    if-gt p0, v0, :cond_3

    const/16 v0, 0x30

    if-lt p0, v0, :cond_3

    :cond_2
    move v1, v2

    :cond_3
    return v1

    .line 107
    :cond_4
    invoke-static {p0}, Ljava/lang/Character;->isLowerCase(C)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-static {p0}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-static {p0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v0

    if-eqz v0, :cond_6

    :cond_5
    move v1, v2

    :cond_6
    return v1
.end method

.method public static isDigit(C)Z
    .locals 1
    .param p0, "ch"    # C

    .line 92
    const/16 v0, 0x7f

    if-gt p0, v0, :cond_1

    .line 93
    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    const/16 v0, 0x30

    if-lt p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 96
    :cond_1
    invoke-static {p0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v0

    return v0
.end method

.method public static isHexDigit(C)Z
    .locals 1
    .param p0, "ch"    # C

    .line 77
    const/16 v0, 0x41

    if-lt p0, v0, :cond_0

    const/16 v0, 0x46

    if-le p0, v0, :cond_2

    :cond_0
    const/16 v0, 0x61

    if-lt p0, v0, :cond_1

    const/16 v0, 0x66

    if-le p0, v0, :cond_2

    :cond_1
    invoke-static {p0}, Landroid/gov/nist/core/StringTokenizer;->isDigit(C)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    const/4 v0, 0x1

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public consume()V
    .locals 1

    .line 155
    iget v0, p0, Landroid/gov/nist/core/StringTokenizer;->savedPtr:I

    iput v0, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    .line 156
    return-void
.end method

.method public consume(I)V
    .locals 1
    .param p1, "k"    # I

    .line 159
    iget v0, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    add-int/2addr v0, p1

    iput v0, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    .line 160
    return-void
.end method

.method public getLine()Ljava/lang/String;
    .locals 4

    .line 114
    iget v0, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    .line 115
    .local v0, "startIdx":I
    :goto_0
    iget v1, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    iget v2, p0, Landroid/gov/nist/core/StringTokenizer;->bufferLen:I

    const/16 v3, 0xa

    if-ge v1, v2, :cond_0

    iget-object v1, p0, Landroid/gov/nist/core/StringTokenizer;->buffer:[C

    iget v2, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    aget-char v1, v1, v2

    if-eq v1, v3, :cond_0

    .line 116
    iget v1, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    goto :goto_0

    .line 118
    :cond_0
    iget v1, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    iget v2, p0, Landroid/gov/nist/core/StringTokenizer;->bufferLen:I

    if-ge v1, v2, :cond_1

    iget-object v1, p0, Landroid/gov/nist/core/StringTokenizer;->buffer:[C

    iget v2, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    aget-char v1, v1, v2

    if-ne v1, v3, :cond_1

    .line 119
    iget v1, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    .line 121
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/core/StringTokenizer;->buffer:[C

    iget v2, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    sub-int/2addr v2, v0

    invoke-static {v1, v0, v2}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getLines()Ljava/util/Vector;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Vector<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 165
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 166
    .local v0, "result":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_0
    invoke-virtual {p0}, Landroid/gov/nist/core/StringTokenizer;->hasMoreChars()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 167
    invoke-virtual {p0}, Landroid/gov/nist/core/StringTokenizer;->getLine()Ljava/lang/String;

    move-result-object v1

    .line 168
    .local v1, "line":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 169
    .end local v1    # "line":Ljava/lang/String;
    goto :goto_0

    .line 170
    :cond_0
    return-object v0
.end method

.method public getNextChar()C
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 146
    iget v0, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    iget v1, p0, Landroid/gov/nist/core/StringTokenizer;->bufferLen:I

    if-ge v0, v1, :cond_0

    .line 151
    iget-object v0, p0, Landroid/gov/nist/core/StringTokenizer;->buffer:[C

    iget v1, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    aget-char v0, v0, v1

    return v0

    .line 147
    :cond_0
    new-instance v0, Ljava/text/ParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Landroid/gov/nist/core/StringTokenizer;->buffer:[C

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " getNextChar: End of buffer"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public getNextToken(C)Ljava/lang/String;
    .locals 5
    .param p1, "delim"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 176
    iget v0, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    .line 178
    .local v0, "startIdx":I
    :goto_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/StringTokenizer;->lookAhead(I)C

    move-result v2

    .line 179
    .local v2, "la":C
    if-ne v2, p1, :cond_0

    .line 180
    nop

    .line 185
    .end local v2    # "la":C
    iget-object v1, p0, Landroid/gov/nist/core/StringTokenizer;->buffer:[C

    iget v2, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    sub-int/2addr v2, v0

    invoke-static {v1, v0, v2}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 181
    .restart local v2    # "la":C
    :cond_0
    if-eqz v2, :cond_1

    .line 183
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/StringTokenizer;->consume(I)V

    .line 184
    .end local v2    # "la":C
    goto :goto_0

    .line 182
    .restart local v2    # "la":C
    :cond_1
    new-instance v3, Ljava/text/ParseException;

    const-string v4, "EOL reached"

    invoke-direct {v3, v4, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v3
.end method

.method public hasMoreChars()Z
    .locals 2

    .line 73
    iget v0, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    iget v1, p0, Landroid/gov/nist/core/StringTokenizer;->bufferLen:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public lookAhead()C
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 132
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/StringTokenizer;->lookAhead(I)C

    move-result v0

    return v0
.end method

.method public lookAhead(I)C
    .locals 2
    .param p1, "k"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 138
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/core/StringTokenizer;->buffer:[C

    iget v1, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    add-int/2addr v1, p1

    aget-char v0, v0, v1
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 140
    :catch_0
    move-exception v0

    .line 141
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    const/4 v1, 0x0

    return v1
.end method

.method public nextToken()Ljava/lang/String;
    .locals 3

    .line 59
    iget v0, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    .line 61
    .local v0, "startIdx":I
    :goto_0
    iget v1, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    iget v2, p0, Landroid/gov/nist/core/StringTokenizer;->bufferLen:I

    if-ge v1, v2, :cond_1

    .line 62
    iget-object v1, p0, Landroid/gov/nist/core/StringTokenizer;->buffer:[C

    iget v2, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    aget-char v1, v1, v2

    .line 63
    .local v1, "c":C
    iget v2, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    .line 64
    const/16 v2, 0xa

    if-ne v1, v2, :cond_0

    .line 65
    goto :goto_1

    .line 67
    .end local v1    # "c":C
    :cond_0
    goto :goto_0

    .line 69
    :cond_1
    :goto_1
    iget-object v1, p0, Landroid/gov/nist/core/StringTokenizer;->buffer:[C

    iget v2, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    sub-int/2addr v2, v0

    invoke-static {v1, v0, v2}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public peekLine()Ljava/lang/String;
    .locals 2

    .line 125
    iget v0, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    .line 126
    .local v0, "curPos":I
    invoke-virtual {p0}, Landroid/gov/nist/core/StringTokenizer;->getLine()Ljava/lang/String;

    move-result-object v1

    .line 127
    .local v1, "retval":Ljava/lang/String;
    iput v0, p0, Landroid/gov/nist/core/StringTokenizer;->ptr:I

    .line 128
    return-object v1
.end method
