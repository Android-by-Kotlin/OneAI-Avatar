.class Landroid/gov/nist/javax/sip/parser/StringMsgParser$1ParserThread;
.super Ljava/lang/Object;
.source "StringMsgParser.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/gov/nist/javax/sip/parser/StringMsgParser;->main([Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ParserThread"
.end annotation


# instance fields
.field messages:[Ljava/lang/String;


# direct methods
.method public constructor <init>([Ljava/lang/String;)V
    .locals 0
    .param p1, "messagesToParse"    # [Ljava/lang/String;

    .line 568
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 569
    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/StringMsgParser$1ParserThread;->messages:[Ljava/lang/String;

    .line 570
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 573
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/StringMsgParser$1ParserThread;->messages:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 574
    new-instance v1, Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;-><init>()V

    .line 576
    .local v1, "smp":Landroid/gov/nist/javax/sip/parser/StringMsgParser;
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/StringMsgParser$1ParserThread;->messages:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual {v1, v2, v5, v3, v4}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->parseSIPMessage([BZZLandroid/gov/nist/javax/sip/parser/ParseExceptionListener;)Landroid/gov/nist/javax/sip/message/SIPMessage;

    move-result-object v2

    .line 578
    .local v2, "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " i = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " branchId = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v5

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 584
    .end local v2    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    goto :goto_1

    .line 582
    :catch_0
    move-exception v2

    .line 573
    .end local v1    # "smp":Landroid/gov/nist/javax/sip/parser/StringMsgParser;
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 589
    .end local v0    # "i":I
    :cond_0
    return-void
.end method
