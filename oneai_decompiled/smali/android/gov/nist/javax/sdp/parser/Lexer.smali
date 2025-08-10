.class public Landroid/gov/nist/javax/sdp/parser/Lexer;
.super Landroid/gov/nist/core/LexerCore;
.source "Lexer.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "lexerName"    # Ljava/lang/String;
    .param p2, "buffer"    # Ljava/lang/String;

    .line 31
    invoke-direct {p0, p1, p2}, Landroid/gov/nist/core/LexerCore;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    return-void
.end method

.method public static getFieldName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "line"    # Ljava/lang/String;

    .line 39
    const-string v0, "="

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 40
    .local v0, "i":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 41
    const/4 v1, 0x0

    return-object v1

    .line 43
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public selectLexer(Ljava/lang/String;)V
    .locals 0
    .param p1, "lexerName"    # Ljava/lang/String;

    .line 36
    return-void
.end method
