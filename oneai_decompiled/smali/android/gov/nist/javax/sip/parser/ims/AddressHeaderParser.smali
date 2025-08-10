.class abstract Landroid/gov/nist/javax/sip/parser/ims/AddressHeaderParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "AddressHeaderParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 49
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 50
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "buffer"    # Ljava/lang/String;

    .line 53
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 54
    return-void
.end method


# virtual methods
.method protected parse(Landroid/gov/nist/javax/sip/header/ims/AddressHeaderIms;)V
    .locals 3
    .param p1, "addressHeader"    # Landroid/gov/nist/javax/sip/header/ims/AddressHeaderIms;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 58
    const-string v0, "AddressParametersParser.parse"

    const-string v1, "AddressHeaderParser.parse"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/AddressHeaderParser;->dbg_enter(Ljava/lang/String;)V

    .line 60
    :try_start_0
    new-instance v1, Landroid/gov/nist/javax/sip/parser/AddressParser;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/ims/AddressHeaderParser;->getLexer()Landroid/gov/nist/javax/sip/parser/Lexer;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/gov/nist/javax/sip/parser/AddressParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 61
    .local v1, "addressParser":Landroid/gov/nist/javax/sip/parser/AddressParser;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/parser/AddressParser;->address(Z)Landroid/gov/nist/javax/sip/address/AddressImpl;

    move-result-object v2

    .line 62
    .local v2, "addr":Landroid/gov/nist/javax/sip/address/AddressImpl;
    invoke-virtual {p1, v2}, Landroid/gov/nist/javax/sip/header/ims/AddressHeaderIms;->setAddress(Landroid/javax/sip/address/Address;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    .end local v1    # "addressParser":Landroid/gov/nist/javax/sip/parser/AddressParser;
    .end local v2    # "addr":Landroid/gov/nist/javax/sip/address/AddressImpl;
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ims/AddressHeaderParser;->dbg_leave(Ljava/lang/String;)V

    .line 69
    nop

    .line 70
    return-void

    .line 68
    :catchall_0
    move-exception v1

    goto :goto_0

    .line 65
    :catch_0
    move-exception v1

    .line 66
    .local v1, "ex":Ljava/text/ParseException;
    nop

    .end local p1    # "addressHeader":Landroid/gov/nist/javax/sip/header/ims/AddressHeaderIms;
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    .end local v1    # "ex":Ljava/text/ParseException;
    .restart local p1    # "addressHeader":Landroid/gov/nist/javax/sip/header/ims/AddressHeaderIms;
    :goto_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ims/AddressHeaderParser;->dbg_leave(Ljava/lang/String;)V

    throw v1
.end method
