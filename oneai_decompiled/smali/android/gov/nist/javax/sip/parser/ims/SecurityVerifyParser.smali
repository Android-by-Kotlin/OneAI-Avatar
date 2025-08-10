.class public Landroid/gov/nist/javax/sip/parser/ims/SecurityVerifyParser;
.super Landroid/gov/nist/javax/sip/parser/ims/SecurityAgreeParser;
.source "SecurityVerifyParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 58
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ims/SecurityAgreeParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "security"    # Ljava/lang/String;

    .line 53
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ims/SecurityAgreeParser;-><init>(Ljava/lang/String;)V

    .line 54
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 64
    const-string/jumbo v0, "SecuriryVerify parse"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ims/SecurityVerifyParser;->dbg_enter(Ljava/lang/String;)V

    .line 67
    const/16 v1, 0x85b

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/SecurityVerifyParser;->headerName(I)V

    .line 68
    new-instance v1, Landroid/gov/nist/javax/sip/header/ims/SecurityVerify;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/ims/SecurityVerify;-><init>()V

    .line 69
    .local v1, "secVerify":Landroid/gov/nist/javax/sip/header/ims/SecurityVerify;
    invoke-super {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/SecurityAgreeParser;->parse(Landroid/gov/nist/javax/sip/header/ims/SecurityAgree;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/header/ims/SecurityVerifyList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    .local v2, "secVerifyList":Landroid/gov/nist/javax/sip/header/ims/SecurityVerifyList;
    nop

    .line 74
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ims/SecurityVerifyParser;->dbg_leave(Ljava/lang/String;)V

    return-object v2

    .end local v1    # "secVerify":Landroid/gov/nist/javax/sip/header/ims/SecurityVerify;
    .end local v2    # "secVerifyList":Landroid/gov/nist/javax/sip/header/ims/SecurityVerifyList;
    :catchall_0
    move-exception v1

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ims/SecurityVerifyParser;->dbg_leave(Ljava/lang/String;)V

    throw v1
.end method
