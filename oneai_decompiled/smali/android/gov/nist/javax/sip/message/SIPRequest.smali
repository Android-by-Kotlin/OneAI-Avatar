.class public Landroid/gov/nist/javax/sip/message/SIPRequest;
.super Landroid/gov/nist/javax/sip/message/SIPMessage;
.source "SIPRequest.java"

# interfaces
.implements Landroid/javax/sip/message/Request;
.implements Landroid/gov/nist/javax/sip/message/RequestExt;


# static fields
.field private static final DEFAULT_TRANSPORT:Ljava/lang/String; = "udp"

.field private static final DEFAULT_USER:Ljava/lang/String; = "ip"

.field protected static final headersToIncludeInResponse:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final nameTable:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = 0x2ea3ad0be6d281afL

.field private static final targetRefreshMethods:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private transient inviteTransaction:Ljava/lang/Object;

.field private transient messageChannel:Ljava/lang/Object;

.field protected requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

.field private transient transactionPointer:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 120
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->targetRefreshMethods:Ljava/util/Set;

    .line 128
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    sput-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->nameTable:Ljava/util/Map;

    .line 130
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    sput-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->headersToIncludeInResponse:Ljava/util/Set;

    .line 137
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->targetRefreshMethods:Ljava/util/Set;

    const-string v1, "INVITE"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 138
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->targetRefreshMethods:Ljava/util/Set;

    const-string/jumbo v2, "UPDATE"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 139
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->targetRefreshMethods:Ljava/util/Set;

    const-string/jumbo v3, "SUBSCRIBE"

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 140
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->targetRefreshMethods:Ljava/util/Set;

    const-string v4, "NOTIFY"

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 141
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->targetRefreshMethods:Ljava/util/Set;

    const-string/jumbo v5, "REFER"

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 143
    invoke-static {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->putName(Ljava/lang/String;)V

    .line 144
    const-string v0, "BYE"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->putName(Ljava/lang/String;)V

    .line 145
    const-string v0, "CANCEL"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->putName(Ljava/lang/String;)V

    .line 146
    const-string v0, "ACK"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->putName(Ljava/lang/String;)V

    .line 147
    const-string/jumbo v0, "PRACK"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->putName(Ljava/lang/String;)V

    .line 148
    const-string v1, "INFO"

    invoke-static {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->putName(Ljava/lang/String;)V

    .line 149
    const-string v1, "MESSAGE"

    invoke-static {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->putName(Ljava/lang/String;)V

    .line 150
    invoke-static {v4}, Landroid/gov/nist/javax/sip/message/SIPRequest;->putName(Ljava/lang/String;)V

    .line 151
    const-string v1, "OPTIONS"

    invoke-static {v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->putName(Ljava/lang/String;)V

    .line 152
    invoke-static {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->putName(Ljava/lang/String;)V

    .line 153
    const-string/jumbo v0, "PUBLISH"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->putName(Ljava/lang/String;)V

    .line 154
    invoke-static {v5}, Landroid/gov/nist/javax/sip/message/SIPRequest;->putName(Ljava/lang/String;)V

    .line 155
    const-string/jumbo v0, "REGISTER"

    invoke-static {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->putName(Ljava/lang/String;)V

    .line 156
    invoke-static {v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->putName(Ljava/lang/String;)V

    .line 157
    invoke-static {v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->putName(Ljava/lang/String;)V

    .line 159
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->headersToIncludeInResponse:Ljava/util/Set;

    const-string v1, "From"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 160
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->headersToIncludeInResponse:Ljava/util/Set;

    const-string/jumbo v1, "To"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 161
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->headersToIncludeInResponse:Ljava/util/Set;

    const-string/jumbo v1, "Via"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 162
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->headersToIncludeInResponse:Ljava/util/Set;

    const-string/jumbo v1, "Record-Route"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 163
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->headersToIncludeInResponse:Ljava/util/Set;

    const-string v1, "Call-ID"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 164
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->headersToIncludeInResponse:Ljava/util/Set;

    const-string v1, "CSeq"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 165
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->headersToIncludeInResponse:Ljava/util/Set;

    const-string/jumbo v1, "Timestamp"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 166
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 221
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;-><init>()V

    .line 222
    return-void
.end method

.method public static getCannonicalName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "method"    # Ljava/lang/String;

    .line 191
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->nameTable:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 192
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->nameTable:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 194
    :cond_0
    return-object p0
.end method

.method public static isDialogCreating(Ljava/lang/String;)Z
    .locals 1
    .param p0, "ucaseMethod"    # Ljava/lang/String;

    .line 179
    invoke-static {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogCreated(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isTargetRefresh(Ljava/lang/String;)Z
    .locals 1
    .param p0, "ucaseMethod"    # Ljava/lang/String;

    .line 172
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->targetRefreshMethods:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static putName(Ljava/lang/String;)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 133
    sget-object v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->nameTable:Ljava/util/Map;

    invoke-interface {v0, p0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    return-void
.end method


# virtual methods
.method public checkHeaders()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 250
    const-string v0, "Missing a required header : "

    .line 254
    .local v0, "prefix":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_f

    .line 257
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v1

    if-eqz v1, :cond_e

    .line 261
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    if-eqz v1, :cond_d

    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/CallID;->getCallId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_d

    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/CallID;->getCallId()Ljava/lang/String;

    move-result-object v1

    const-string v3, ""

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    .line 265
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v1

    if-eqz v1, :cond_c

    .line 268
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getViaHeaders()Landroid/gov/nist/javax/sip/header/ViaList;

    move-result-object v1

    if-eqz v1, :cond_b

    .line 271
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMaxForwards()Landroid/javax/sip/header/MaxForwardsHeader;

    move-result-object v1

    if-eqz v1, :cond_a

    .line 275
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v1

    if-eqz v1, :cond_9

    .line 278
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v3, "NOTIFY"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v3, "Event"

    if-eqz v1, :cond_2

    .line 279
    const-string/jumbo v1, "Subscription-State"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 284
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFromHeader()Landroid/javax/sip/header/FromHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/FromHeader;->getTag()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getToHeader()Landroid/javax/sip/header/ToHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/ToHeader;->getTag()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 287
    :cond_0
    new-instance v1, Ljava/text/ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 280
    :cond_1
    new-instance v3, Ljava/text/ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 290
    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v4, "PUBLISH"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 296
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v1

    if-eqz v1, :cond_3

    goto :goto_0

    .line 297
    :cond_3
    new-instance v1, Ljava/text/ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 311
    :cond_4
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    .line 312
    .local v1, "method":Ljava/lang/String;
    invoke-static {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogCreated(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 313
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getContactHeader()Landroid/gov/nist/javax/sip/header/Contact;

    move-result-object v3

    if-nez v3, :cond_6

    .line 317
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getToTag()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_5

    goto :goto_1

    .line 318
    :cond_5
    new-instance v3, Ljava/text/ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "Contact"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 366
    :cond_6
    :goto_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    if-eqz v3, :cond_8

    if-eqz v1, :cond_8

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_8

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/header/CSeqHeader;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_7

    goto :goto_2

    .line 369
    :cond_7
    new-instance v3, Ljava/text/ParseException;

    const-string v4, "CSEQ method mismatch with  Request-Line "

    invoke-direct {v3, v4, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 373
    :cond_8
    :goto_2
    return-void

    .line 276
    .end local v1    # "method":Ljava/lang/String;
    :cond_9
    new-instance v1, Ljava/text/ParseException;

    const-string v3, "No via header in request! "

    invoke-direct {v1, v3, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 272
    :cond_a
    new-instance v1, Ljava/text/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Max-Forwards"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 269
    :cond_b
    new-instance v1, Ljava/text/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "Via"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 266
    :cond_c
    new-instance v1, Ljava/text/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "From"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 263
    :cond_d
    new-instance v1, Ljava/text/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Call-ID"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 258
    :cond_e
    new-instance v1, Ljava/text/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "To"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 255
    :cond_f
    new-instance v1, Ljava/text/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "CSeq"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public cleanUp()V
    .locals 0

    .line 1071
    invoke-super {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->cleanUp()V

    .line 1072
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 2

    .line 539
    invoke-super {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 542
    .local v0, "retval":Landroid/gov/nist/javax/sip/message/SIPRequest;
    const/4 v1, 0x0

    iput-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->transactionPointer:Ljava/lang/Object;

    .line 543
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    if-eqz v1, :cond_0

    .line 544
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/RequestLine;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/RequestLine;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    .line 546
    :cond_0
    return-object v0
.end method

.method public createAckRequest(Landroid/gov/nist/javax/sip/header/To;)Landroid/gov/nist/javax/sip/message/SIPRequest;
    .locals 4
    .param p1, "responseToHeader"    # Landroid/gov/nist/javax/sip/header/To;

    .line 828
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 831
    .local v0, "newRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    const-string v1, "ACK"

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setMethod(Ljava/lang/String;)V

    .line 835
    const-string/jumbo v2, "Route"

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->removeHeader(Ljava/lang/String;)V

    .line 838
    const-string/jumbo v2, "Proxy-Authorization"

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->removeHeader(Ljava/lang/String;)V

    .line 840
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->removeContent()V

    .line 843
    const-string v2, "Content-Type"

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->removeHeader(Ljava/lang/String;)V

    .line 850
    :try_start_0
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v2

    invoke-interface {v2, v1}, Landroid/javax/sip/header/CSeqHeader;->setMethod(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 852
    goto :goto_0

    .line 851
    :catch_0
    move-exception v1

    .line 853
    :goto_0
    if-eqz p1, :cond_0

    .line 854
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setTo(Landroid/javax/sip/header/ToHeader;)V

    .line 857
    :cond_0
    const-string v1, "Contact"

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->removeHeader(Ljava/lang/String;)V

    .line 858
    const-string v1, "Expires"

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->removeHeader(Ljava/lang/String;)V

    .line 859
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getViaHeaders()Landroid/gov/nist/javax/sip/header/ViaList;

    move-result-object v1

    .line 865
    .local v1, "via":Landroid/gov/nist/javax/sip/header/ViaList;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/ViaList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_1

    .line 866
    const/4 v2, 0x2

    .local v2, "i":I
    :goto_1
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/ViaList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 867
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/header/ViaList;->remove(I)Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 866
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 871
    .end local v2    # "i":I
    :cond_1
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultUserAgentHeader()Landroid/javax/sip/header/UserAgentHeader;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 872
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultUserAgentHeader()Landroid/javax/sip/header/UserAgentHeader;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 875
    :cond_2
    return-object v0
.end method

.method public createCancelRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 767
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string v1, "INVITE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 781
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;-><init>()V

    .line 782
    .local v0, "cancel":Landroid/gov/nist/javax/sip/message/SIPRequest;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/RequestLine;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setRequestLine(Landroid/gov/nist/javax/sip/header/RequestLine;)V

    .line 783
    const-string v1, "CANCEL"

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setMethod(Ljava/lang/String;)V

    .line 784
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/CallID;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/header/Header;

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 785
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->toHeader:Landroid/gov/nist/javax/sip/header/To;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/To;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/header/Header;

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 786
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->cSeqHeader:Landroid/gov/nist/javax/sip/header/CSeq;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/CSeq;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/header/Header;

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 788
    :try_start_0
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v2

    invoke-interface {v2, v1}, Landroid/javax/sip/header/CSeqHeader;->setMethod(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 791
    goto :goto_0

    .line 789
    :catch_0
    move-exception v1

    .line 790
    .local v1, "e":Ljava/text/ParseException;
    invoke-virtual {v1}, Ljava/text/ParseException;->printStackTrace()V

    .line 792
    .end local v1    # "e":Ljava/text/ParseException;
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->fromHeader:Landroid/gov/nist/javax/sip/header/From;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/From;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/javax/sip/header/Header;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 794
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/Via;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/javax/sip/header/Header;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->addFirst(Landroid/javax/sip/header/Header;)V

    .line 795
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->maxForwardsHeader:Landroid/gov/nist/javax/sip/header/MaxForwards;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/MaxForwards;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/javax/sip/header/Header;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 801
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRouteHeaders()Landroid/gov/nist/javax/sip/header/RouteList;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 802
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRouteHeaders()Landroid/gov/nist/javax/sip/header/RouteList;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/RouteList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 804
    :cond_0
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultUserAgentHeader()Landroid/javax/sip/header/UserAgentHeader;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 805
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultUserAgentHeader()Landroid/javax/sip/header/UserAgentHeader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 808
    :cond_1
    return-object v0

    .line 768
    .end local v0    # "cancel":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :cond_2
    new-instance v0, Landroid/javax/sip/SipException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Attempt to create CANCEL for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final createErrorAck(Landroid/gov/nist/javax/sip/header/To;)Landroid/gov/nist/javax/sip/message/SIPRequest;
    .locals 3
    .param p1, "responseToHeader"    # Landroid/gov/nist/javax/sip/header/To;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;,
            Ljava/text/ParseException;
        }
    .end annotation

    .line 903
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;-><init>()V

    .line 904
    .local v0, "newRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/RequestLine;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setRequestLine(Landroid/gov/nist/javax/sip/header/RequestLine;)V

    .line 905
    const-string v1, "ACK"

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setMethod(Ljava/lang/String;)V

    .line 906
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/CallID;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/header/Header;

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 907
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->maxForwardsHeader:Landroid/gov/nist/javax/sip/header/MaxForwards;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/MaxForwards;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/header/Header;

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 910
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->fromHeader:Landroid/gov/nist/javax/sip/header/From;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/From;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/header/Header;

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 911
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/header/To;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/header/Header;

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 912
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/Via;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/header/Header;

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->addFirst(Landroid/javax/sip/header/Header;)V

    .line 913
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->cSeqHeader:Landroid/gov/nist/javax/sip/header/CSeq;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/CSeq;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/header/Header;

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 914
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v2

    invoke-interface {v2, v1}, Landroid/javax/sip/header/CSeqHeader;->setMethod(Ljava/lang/String;)V

    .line 921
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRouteHeaders()Landroid/gov/nist/javax/sip/header/RouteList;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 922
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRouteHeaders()Landroid/gov/nist/javax/sip/header/RouteList;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/RouteList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/gov/nist/javax/sip/header/SIPHeaderList;)V

    .line 924
    :cond_0
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultUserAgentHeader()Landroid/javax/sip/header/UserAgentHeader;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 925
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultUserAgentHeader()Landroid/javax/sip/header/UserAgentHeader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 928
    :cond_1
    return-object v0
.end method

.method public createResponse(I)Landroid/gov/nist/javax/sip/message/SIPResponse;
    .locals 2
    .param p1, "statusCode"    # I

    .line 649
    invoke-static {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getReasonPhrase(I)Ljava/lang/String;

    move-result-object v0

    .line 650
    .local v0, "reasonPhrase":Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->createResponse(ILjava/lang/String;)Landroid/gov/nist/javax/sip/message/SIPResponse;

    move-result-object v1

    return-object v1
.end method

.method public createResponse(ILjava/lang/String;)Landroid/gov/nist/javax/sip/message/SIPResponse;
    .locals 6
    .param p1, "statusCode"    # I
    .param p2, "reasonPhrase"    # Ljava/lang/String;

    .line 676
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;-><init>()V

    .line 678
    .local v0, "newResponse":Landroid/gov/nist/javax/sip/message/SIPResponse;
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setStatusCode(I)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_1

    .line 681
    nop

    .line 682
    if-eqz p2, :cond_0

    .line 683
    invoke-virtual {v0, p2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setReasonPhrase(Ljava/lang/String;)V

    goto :goto_0

    .line 685
    :cond_0
    invoke-static {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getReasonPhrase(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setReasonPhrase(Ljava/lang/String;)V

    .line 710
    :goto_0
    sget-object v1, Landroid/gov/nist/javax/sip/message/SIPRequest;->headersToIncludeInResponse:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 711
    .local v2, "headerName":Ljava/lang/String;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->headerTable:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 712
    .local v3, "nextHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    if-eqz v3, :cond_2

    .line 713
    instance-of v4, v3, Landroid/gov/nist/javax/sip/header/RecordRouteList;

    if-eqz v4, :cond_1

    instance-of v4, v3, Landroid/gov/nist/javax/sip/header/RecordRouteList;

    if-eqz v4, :cond_2

    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->mustCopyRR(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 715
    :cond_1
    :try_start_1
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/SIPHeader;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sip/header/SIPHeader;

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/message/SIPResponse;->attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;Z)V
    :try_end_1
    .catch Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException; {:try_start_1 .. :try_end_1} :catch_0

    .line 718
    goto :goto_2

    .line 716
    :catch_0
    move-exception v4

    .line 717
    .local v4, "e":Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;->printStackTrace()V

    .line 721
    .end local v2    # "headerName":Ljava/lang/String;
    .end local v3    # "nextHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    .end local v4    # "e":Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;
    :cond_2
    :goto_2
    goto :goto_1

    .line 723
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_3
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultServerHeader()Landroid/javax/sip/header/ServerHeader;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 724
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultServerHeader()Landroid/javax/sip/header/ServerHeader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 735
    :cond_4
    invoke-static {}, Landroid/gov/nist/javax/sip/message/MessageFactoryImpl;->getDefaultServerHeader()Landroid/javax/sip/header/ServerHeader;

    move-result-object v1

    .line 736
    .local v1, "server":Landroid/javax/sip/header/ServerHeader;
    if-eqz v1, :cond_5

    .line 737
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setHeader(Landroid/javax/sip/header/Header;)V

    .line 739
    :cond_5
    return-object v0

    .line 679
    .end local v1    # "server":Landroid/javax/sip/header/ServerHeader;
    :catch_1
    move-exception v1

    .line 680
    .local v1, "ex":Ljava/text/ParseException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bad code "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public debugDump()Ljava/lang/String;
    .locals 2

    .line 233
    invoke-super {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->debugDump()Ljava/lang/String;

    move-result-object v0

    .line 234
    .local v0, "superstring":Ljava/lang/String;
    const-string v1, ""

    iput-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->stringRepresentation:Ljava/lang/String;

    .line 235
    const-class v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->sprint(Ljava/lang/String;)V

    .line 236
    const-string/jumbo v1, "{"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->sprint(Ljava/lang/String;)V

    .line 237
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    if-eqz v1, :cond_0

    .line 238
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/RequestLine;->debugDump()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->sprint(Ljava/lang/String;)V

    .line 239
    :cond_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->sprint(Ljava/lang/String;)V

    .line 240
    const-string/jumbo v1, "}"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->sprint(Ljava/lang/String;)V

    .line 241
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->stringRepresentation:Ljava/lang/String;

    return-object v1
.end method

.method public encode()Ljava/lang/String;
    .locals 2

    .line 497
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    if-eqz v0, :cond_0

    .line 498
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setRequestLineDefaults()V

    .line 499
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/RequestLine;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-super {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .local v0, "retval":Ljava/lang/String;
    goto :goto_0

    .line 500
    .end local v0    # "retval":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->isNullRequest()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 501
    const-string v0, "\r\n\r\n"

    .restart local v0    # "retval":Ljava/lang/String;
    goto :goto_0

    .line 503
    .end local v0    # "retval":Ljava/lang/String;
    :cond_1
    invoke-super {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encode()Ljava/lang/String;

    move-result-object v0

    .line 505
    .restart local v0    # "retval":Ljava/lang/String;
    :goto_0
    return-object v0
.end method

.method public encodeAsBytes(Ljava/lang/String;)[B
    .locals 6
    .param p1, "transport"    # Ljava/lang/String;

    .line 610
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->isNullRequest()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 612
    const-string v0, "\r\n\r\n"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    return-object v0

    .line 613
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 614
    new-array v0, v1, [B

    return-object v0

    .line 617
    :cond_1
    const/4 v0, 0x0

    .line 618
    .local v0, "rlbytes":[B
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    if-eqz v2, :cond_2

    .line 620
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/RequestLine;->encode()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "UTF-8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v2

    .line 623
    goto :goto_0

    .line 621
    :catch_0
    move-exception v2

    .line 622
    .local v2, "ex":Ljava/io/UnsupportedEncodingException;
    invoke-static {v2}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 625
    .end local v2    # "ex":Ljava/io/UnsupportedEncodingException;
    :cond_2
    :goto_0
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 626
    .local v2, "superbytes":[B
    array-length v3, v0

    array-length v4, v2

    add-int/2addr v3, v4

    new-array v3, v3, [B

    .line 627
    .local v3, "retval":[B
    array-length v4, v0

    invoke-static {v0, v1, v3, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 628
    array-length v4, v0

    array-length v5, v2

    invoke-static {v2, v1, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 629
    return-object v3
.end method

.method public encodeMessage(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 512
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    if-eqz v0, :cond_0

    .line 513
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setRequestLineDefaults()V

    .line 514
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/RequestLine;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 515
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->encodeSIPHeaders(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 516
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->isNullRequest()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 517
    const-string v0, "\r\n\r\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 519
    :cond_1
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->encodeSIPHeaders(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 520
    :goto_0
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .line 555
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 556
    return v1

    .line 557
    :cond_0
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 558
    .local v0, "that":Landroid/gov/nist/javax/sip/message/SIPRequest;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    iget-object v3, v0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/header/RequestLine;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public getFirstLine()Ljava/lang/String;
    .locals 1

    .line 961
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    if-nez v0, :cond_0

    .line 962
    const/4 v0, 0x0

    return-object v0

    .line 964
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/RequestLine;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getInviteTransaction()Ljava/lang/Object;
    .locals 1

    .line 1066
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->inviteTransaction:Ljava/lang/Object;

    return-object v0
.end method

.method public getMergeId()Ljava/lang/String;
    .locals 6

    .line 1039
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFromTag()Ljava/lang/String;

    move-result-object v0

    .line 1040
    .local v0, "fromTag":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->cSeqHeader:Landroid/gov/nist/javax/sip/header/CSeq;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/CSeq;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1041
    .local v1, "cseq":Ljava/lang/String;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->callIdHeader:Landroid/gov/nist/javax/sip/header/CallID;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/header/CallID;->getCallId()Ljava/lang/String;

    move-result-object v2

    .line 1045
    .local v2, "callId":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v3

    invoke-interface {v3}, Landroid/javax/sip/address/URI;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1047
    .local v3, "requestUri":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 1048
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 1051
    :cond_0
    const/4 v4, 0x0

    return-object v4
.end method

.method public getMessageAsEncodedStrings()Ljava/util/LinkedList;
    .locals 2

    .line 568
    invoke-super {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getMessageAsEncodedStrings()Ljava/util/LinkedList;

    move-result-object v0

    .line 569
    .local v0, "retval":Ljava/util/LinkedList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    if-eqz v1, :cond_0

    .line 570
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setRequestLineDefaults()V

    .line 571
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/RequestLine;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 573
    :cond_0
    return-object v0
.end method

.method public getMessageChannel()Ljava/lang/Object;
    .locals 1

    .line 1017
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->messageChannel:Ljava/lang/Object;

    return-object v0
.end method

.method public getMethod()Ljava/lang/String;
    .locals 1

    .line 483
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    if-nez v0, :cond_0

    .line 484
    const/4 v0, 0x0

    return-object v0

    .line 486
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRequestLine()Landroid/gov/nist/javax/sip/header/RequestLine;
    .locals 1

    .line 204
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    return-object v0
.end method

.method public getRequestURI()Landroid/javax/sip/address/URI;
    .locals 1

    .line 422
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    if-nez v0, :cond_0

    .line 423
    const/4 v0, 0x0

    return-object v0

    .line 425
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/RequestLine;->getUri()Landroid/gov/nist/javax/sip/address/GenericURI;

    move-result-object v0

    return-object v0
.end method

.method public getSIPVersion()Ljava/lang/String;
    .locals 1

    .line 984
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/RequestLine;->getSipVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTransaction()Ljava/lang/Object;
    .locals 1

    .line 995
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->transactionPointer:Ljava/lang/Object;

    return-object v0
.end method

.method public getViaHost()Ljava/lang/String;
    .locals 2

    .line 937
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getViaHeaders()Landroid/gov/nist/javax/sip/header/ViaList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/ViaList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/Via;

    .line 938
    .local v0, "via":Landroid/gov/nist/javax/sip/header/Via;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getHost()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getViaPort()I
    .locals 2

    .line 948
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getViaHeaders()Landroid/gov/nist/javax/sip/header/ViaList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/ViaList;->getFirst()Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/Via;

    .line 949
    .local v0, "via":Landroid/gov/nist/javax/sip/header/Via;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->hasPort()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 950
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getPort()I

    move-result v1

    return v1

    .line 952
    :cond_0
    const/16 v1, 0x13c4

    return v1
.end method

.method public match(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "matchObj"    # Ljava/lang/Object;

    .line 586
    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 587
    return v0

    .line 588
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 589
    return v2

    .line 590
    :cond_1
    if-ne p1, p0, :cond_2

    .line 591
    return v0

    .line 592
    :cond_2
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 593
    .local v1, "that":Landroid/gov/nist/javax/sip/message/SIPRequest;
    iget-object v3, v1, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    .line 594
    .local v3, "rline":Landroid/gov/nist/javax/sip/header/RequestLine;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    if-nez v4, :cond_3

    if-eqz v3, :cond_3

    .line 595
    return v2

    .line 596
    :cond_3
    iget-object v4, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    if-ne v4, v3, :cond_4

    .line 597
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->match(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 598
    :cond_4
    iget-object v4, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    iget-object v5, v1, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v4, v5}, Landroid/gov/nist/javax/sip/header/RequestLine;->match(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->match(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    goto :goto_0

    :cond_5
    move v0, v2

    :goto_0
    return v0
.end method

.method protected final mustCopyRR(I)Z
    .locals 2
    .param p1, "code"    # I

    .line 745
    const/16 v0, 0x64

    const/4 v1, 0x0

    if-le p1, v0, :cond_1

    const/16 v0, 0x12c

    if-ge p1, v0, :cond_1

    .line 746
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->isDialogCreating(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getToTag()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    .line 747
    :cond_1
    return v1
.end method

.method protected setDefaults()V
    .locals 4

    .line 381
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    if-nez v0, :cond_0

    .line 382
    return-void

    .line 383
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    .line 385
    .local v0, "method":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 386
    return-void

    .line 387
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/RequestLine;->getUri()Landroid/gov/nist/javax/sip/address/GenericURI;

    move-result-object v1

    .line 388
    .local v1, "u":Landroid/gov/nist/javax/sip/address/GenericURI;
    if-nez v1, :cond_2

    .line 389
    return-void

    .line 390
    :cond_2
    const-string/jumbo v2, "REGISTER"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "INVITE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_4

    .line 391
    :cond_3
    instance-of v2, v1, Landroid/gov/nist/javax/sip/address/SipUri;

    if-eqz v2, :cond_4

    .line 392
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sip/address/SipUri;

    .line 393
    .local v2, "sipUri":Landroid/gov/nist/javax/sip/address/SipUri;
    const-string/jumbo v3, "ip"

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/address/SipUri;->setUserParam(Ljava/lang/String;)V

    .line 395
    :try_start_0
    const-string/jumbo v3, "udp"

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/address/SipUri;->setTransportParam(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 397
    goto :goto_0

    .line 396
    :catch_0
    move-exception v3

    .line 400
    .end local v2    # "sipUri":Landroid/gov/nist/javax/sip/address/SipUri;
    :cond_4
    :goto_0
    return-void
.end method

.method public setInviteTransaction(Ljava/lang/Object;)V
    .locals 0
    .param p1, "inviteTransaction"    # Ljava/lang/Object;

    .line 1059
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->inviteTransaction:Ljava/lang/Object;

    .line 1060
    return-void
.end method

.method public setMessageChannel(Ljava/lang/Object;)V
    .locals 0
    .param p1, "messageChannel"    # Ljava/lang/Object;

    .line 1027
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->messageChannel:Ljava/lang/Object;

    .line 1028
    return-void
.end method

.method public setMethod(Ljava/lang/String;)V
    .locals 2
    .param p1, "method"    # Ljava/lang/String;

    .line 455
    if-eqz p1, :cond_2

    .line 457
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    if-nez v0, :cond_0

    .line 458
    new-instance v0, Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/RequestLine;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    .line 465
    :cond_0
    invoke-static {p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCannonicalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 466
    .local v0, "meth":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/header/RequestLine;->setMethod(Ljava/lang/String;)V

    .line 468
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->cSeqHeader:Landroid/gov/nist/javax/sip/header/CSeq;

    if-eqz v1, :cond_1

    .line 470
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->cSeqHeader:Landroid/gov/nist/javax/sip/header/CSeq;

    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/header/CSeq;->setMethod(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 472
    goto :goto_0

    .line 471
    :catch_0
    move-exception v1

    .line 474
    :cond_1
    :goto_0
    return-void

    .line 456
    .end local v0    # "meth":Ljava/lang/String;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "null method"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRequestLine(Landroid/gov/nist/javax/sip/header/RequestLine;)V
    .locals 0
    .param p1, "requestLine"    # Landroid/gov/nist/javax/sip/header/RequestLine;

    .line 214
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    .line 215
    return-void
.end method

.method protected setRequestLineDefaults()V
    .locals 3

    .line 406
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    .line 407
    .local v0, "method":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 408
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/CSeq;

    .line 409
    .local v1, "cseq":Landroid/gov/nist/javax/sip/header/CSeq;
    if-eqz v1, :cond_0

    .line 410
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/CSeq;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCannonicalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 411
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/header/RequestLine;->setMethod(Ljava/lang/String;)V

    .line 414
    .end local v1    # "cseq":Landroid/gov/nist/javax/sip/header/CSeq;
    :cond_0
    return-void
.end method

.method public setRequestURI(Landroid/javax/sip/address/URI;)V
    .locals 2
    .param p1, "uri"    # Landroid/javax/sip/address/URI;

    .line 438
    if-eqz p1, :cond_1

    .line 441
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    if-nez v0, :cond_0

    .line 442
    new-instance v0, Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/RequestLine;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    .line 444
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/address/GenericURI;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/RequestLine;->setUri(Landroid/javax/sip/address/URI;)V

    .line 445
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->nullRequest:Z

    .line 446
    return-void

    .line 439
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null request URI"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSIPVersion(Ljava/lang/String;)V
    .locals 3
    .param p1, "sipVersion"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 973
    if-eqz p1, :cond_0

    const-string/jumbo v0, "SIP/2.0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 975
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->requestLine:Landroid/gov/nist/javax/sip/header/RequestLine;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/RequestLine;->setSipVersion(Ljava/lang/String;)V

    .line 976
    return-void

    .line 974
    :cond_0
    new-instance v0, Ljava/text/ParseException;

    const-string/jumbo v1, "sipVersion"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public setTransaction(Ljava/lang/Object;)V
    .locals 0
    .param p1, "transaction"    # Ljava/lang/Object;

    .line 1004
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/SIPRequest;->transactionPointer:Ljava/lang/Object;

    .line 1005
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 528
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
