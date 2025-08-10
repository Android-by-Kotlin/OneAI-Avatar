.class public final Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;
.super Ljava/lang/Object;
.source "PipelinedMsgParser.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;,
        Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;
    }
.end annotation


# static fields
.field private static final CRLF:Ljava/lang/String; = "\r\n"

.field private static logger:Landroid/gov/nist/core/StackLogger;

.field private static uid:I


# instance fields
.field isRunning:Z

.field private maxMessageSize:I

.field private messagesOrderingMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;",
            ">;"
        }
    .end annotation
.end field

.field private mythread:Ljava/lang/Thread;

.field private rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

.field protected sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

.field private sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

.field private sizeCounter:I

.field private smp:Landroid/gov/nist/javax/sip/parser/MessageParser;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 84
    const-class v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    .line 111
    const/4 v0, 0x0

    sput v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->uid:I

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->smp:Landroid/gov/nist/javax/sip/parser/MessageParser;

    .line 101
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->messagesOrderingMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 102
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->isRunning:Z

    .line 109
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/parser/Pipeline;)V
    .locals 6
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "in"    # Landroid/gov/nist/javax/sip/parser/Pipeline;

    .line 165
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/parser/SIPMessageListener;Landroid/gov/nist/javax/sip/parser/Pipeline;ZI)V

    .line 166
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/parser/SIPMessageListener;Landroid/gov/nist/javax/sip/parser/Pipeline;I)V
    .locals 6
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "mhandler"    # Landroid/gov/nist/javax/sip/parser/SIPMessageListener;
    .param p3, "in"    # Landroid/gov/nist/javax/sip/parser/Pipeline;
    .param p4, "maxMsgSize"    # I

    .line 154
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/parser/SIPMessageListener;Landroid/gov/nist/javax/sip/parser/Pipeline;ZI)V

    .line 155
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/parser/SIPMessageListener;Landroid/gov/nist/javax/sip/parser/Pipeline;ZI)V
    .locals 3
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "sipMessageListener"    # Landroid/gov/nist/javax/sip/parser/SIPMessageListener;
    .param p3, "in"    # Landroid/gov/nist/javax/sip/parser/Pipeline;
    .param p4, "debug"    # Z
    .param p5, "maxMessageSize"    # I

    .line 131
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;-><init>()V

    .line 132
    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 133
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageParserFactory()Landroid/gov/nist/javax/sip/parser/MessageParserFactory;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/gov/nist/javax/sip/parser/MessageParserFactory;->createMessageParser(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)Landroid/gov/nist/javax/sip/parser/MessageParser;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->smp:Landroid/gov/nist/javax/sip/parser/MessageParser;

    .line 134
    iput-object p2, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    .line 135
    iput-object p3, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

    .line 136
    iput p5, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->maxMessageSize:I

    .line 137
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->mythread:Ljava/lang/Thread;

    .line 138
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->mythread:Ljava/lang/Thread;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "PipelineThread-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->getNewUid()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 140
    return-void
.end method

.method static synthetic access$000(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    .line 83
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    return-object v0
.end method

.method static synthetic access$100()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 83
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method

.method static synthetic access$200(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    .line 83
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->messagesOrderingMap:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method static synthetic access$300(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)Ljava/lang/Thread;
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    .line 83
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->mythread:Ljava/lang/Thread;

    return-object v0
.end method

.method private cleanMessageOrderingMap()V
    .locals 3

    .line 661
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->messagesOrderingMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 662
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->messagesOrderingMap:Ljava/util/concurrent/ConcurrentHashMap;

    monitor-enter v0

    .line 663
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->messagesOrderingMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 664
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 665
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 666
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "cleaned the messagesOrderingMap "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " threadname "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->mythread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 667
    :cond_0
    return-void

    .line 664
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private static declared-synchronized getNewUid()I
    .locals 3

    const-class v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    monitor-enter v0

    .line 114
    :try_start_0
    sget v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->uid:I

    add-int/lit8 v2, v1, 0x1

    sput v2, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->uid:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    .line 114
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private readLine(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 12
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 209
    const/4 v0, 0x0

    .line 210
    .local v0, "counter":I
    const/16 v1, 0x400

    .line 211
    .local v1, "increment":I
    move v2, v1

    .line 212
    .local v2, "bufferSize":I
    new-array v3, v2, [B

    .line 214
    .local v3, "lineBuffer":[B
    const/4 v4, 0x2

    new-array v4, v4, [B

    .line 215
    .local v4, "crlfBuffer":[B
    const/4 v5, 0x0

    .line 218
    .local v5, "crlfCounter":I
    :goto_0
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v6

    .line 219
    .local v6, "i":I
    const/4 v7, -0x1

    if-eq v6, v7, :cond_8

    .line 222
    and-int/lit16 v7, v6, 0xff

    int-to-char v7, v7

    .line 224
    .local v7, "ch":C
    iget v8, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->maxMessageSize:I

    const/4 v9, 0x1

    if-lez v8, :cond_1

    .line 225
    iget v8, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sizeCounter:I

    sub-int/2addr v8, v9

    iput v8, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sizeCounter:I

    .line 226
    iget v8, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sizeCounter:I

    if-lez v8, :cond_0

    goto :goto_1

    .line 227
    :cond_0
    new-instance v8, Ljava/io/IOException;

    const-string v9, "Max size exceeded!"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 229
    :cond_1
    :goto_1
    const/16 v8, 0xd

    if-eq v7, v8, :cond_2

    .line 230
    add-int/lit8 v8, v0, 0x1

    .end local v0    # "counter":I
    .local v8, "counter":I
    and-int/lit16 v10, v6, 0xff

    int-to-byte v10, v10

    aput-byte v10, v3, v0

    move v0, v8

    goto :goto_2

    .line 231
    .end local v8    # "counter":I
    .restart local v0    # "counter":I
    :cond_2
    if-nez v0, :cond_3

    .line 232
    add-int/lit8 v10, v5, 0x1

    .end local v5    # "crlfCounter":I
    .local v10, "crlfCounter":I
    aput-byte v8, v4, v5

    move v5, v10

    .line 234
    .end local v10    # "crlfCounter":I
    .restart local v5    # "crlfCounter":I
    :cond_3
    :goto_2
    const/16 v8, 0xa

    const/4 v10, 0x0

    if-ne v7, v8, :cond_6

    .line 235
    if-ne v0, v9, :cond_4

    if-lez v5, :cond_4

    .line 236
    add-int/lit8 v11, v5, 0x1

    .end local v5    # "crlfCounter":I
    .local v11, "crlfCounter":I
    aput-byte v8, v4, v5

    move v5, v11

    .line 249
    .end local v6    # "i":I
    .end local v7    # "ch":C
    .end local v11    # "crlfCounter":I
    .restart local v5    # "crlfCounter":I
    :cond_4
    const-string/jumbo v6, "UTF-8"

    if-ne v0, v9, :cond_5

    if-lez v5, :cond_5

    .line 250
    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v4, v10, v5, v6}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    return-object v7

    .line 252
    :cond_5
    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v3, v10, v0, v6}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    return-object v7

    .line 241
    .restart local v6    # "i":I
    .restart local v7    # "ch":C
    :cond_6
    if-ne v0, v2, :cond_7

    .line 242
    add-int v8, v2, v1

    new-array v8, v8, [B

    .line 243
    .local v8, "tempBuffer":[B
    invoke-static {v3, v10, v8, v10, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 244
    add-int/2addr v2, v1

    .line 245
    move-object v3, v8

    .line 248
    .end local v6    # "i":I
    .end local v7    # "ch":C
    .end local v8    # "tempBuffer":[B
    :cond_7
    goto :goto_0

    .line 220
    .restart local v6    # "i":I
    :cond_8
    new-instance v7, Ljava/io/IOException;

    const-string v8, "End of stream"

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7
.end method


# virtual methods
.method protected clone()Ljava/lang/Object;
    .locals 3

    .line 181
    new-instance v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;-><init>()V

    .line 183
    .local v0, "p":Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

    .line 184
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    .line 185
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 186
    .local v1, "mythread":Ljava/lang/Thread;
    const-string/jumbo v2, "PipelineThread"

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 187
    return-object v0
.end method

.method public close()V
    .locals 4

    .line 634
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->isRunning:Z

    .line 635
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 636
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Closing pipelinedmsgparser "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " threadname "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->mythread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 638
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/Pipeline;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 643
    goto :goto_0

    .line 639
    :catch_0
    move-exception v0

    .line 640
    .local v0, "ex":Ljava/io/IOException;
    sget-object v2, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 641
    sget-object v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Couldn\'t close the rawInputStream "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " threadname "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->mythread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " already closed ? "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/parser/Pipeline;->isClosed()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 644
    .end local v0    # "ex":Ljava/io/IOException;
    :cond_1
    :goto_0
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->getPostParseExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 645
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->cleanMessageOrderingMap()V

    .line 646
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->mythread:Ljava/lang/Thread;

    monitor-enter v0

    .line 647
    :try_start_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->mythread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 650
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->mythread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 651
    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 653
    :cond_2
    :goto_1
    return-void
.end method

.method public processInput()V
    .locals 1

    .line 172
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->mythread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 173
    return-void
.end method

.method public run()V
    .locals 18

    .line 329
    move-object/from16 v1, p0

    iget-object v2, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

    .line 330
    .local v2, "inputStream":Landroid/gov/nist/javax/sip/parser/Pipeline;
    sget-object v3, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    .line 335
    .local v3, "stackLogger":Landroid/gov/nist/core/StackLogger;
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->isRunning:Z

    .line 336
    :goto_0
    iget-boolean v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->isRunning:Z

    if-eqz v0, :cond_2a

    .line 337
    iget v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->maxMessageSize:I

    iput v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sizeCounter:I

    .line 339
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object v4, v0

    .line 341
    .local v4, "inputBuffer":Ljava/lang/StringBuilder;
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v5, 0x20

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    if-eqz v0, :cond_0

    .line 342
    :try_start_1
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v6, "Starting to parse."

    invoke-interface {v0, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 593
    .end local v4    # "inputBuffer":Ljava/lang/StringBuilder;
    :catchall_0
    move-exception v0

    move-object/from16 v17, v3

    move-object v3, v0

    goto/16 :goto_1e

    .line 346
    .restart local v4    # "inputBuffer":Ljava/lang/StringBuilder;
    :cond_0
    :goto_1
    const/4 v6, 0x0

    .line 347
    .local v6, "line2":Ljava/lang/String;
    const/4 v0, 0x0

    move v7, v0

    .line 350
    .local v7, "isPreviousLineCRLF":Z
    :goto_2
    const-wide/32 v8, 0xfa00

    :try_start_2
    invoke-direct {v1, v2}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    move-object v10, v0

    .line 352
    .local v10, "line1":Ljava/lang/String;
    const-string v0, "\n"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_d
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    if-eqz v0, :cond_2

    .line 353
    :try_start_3
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 354
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v11, "Discarding blank line"

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 356
    :cond_1
    goto :goto_2

    .line 387
    .end local v10    # "line1":Ljava/lang/String;
    :catch_0
    move-exception v0

    move-object/from16 v17, v3

    goto/16 :goto_17

    .line 357
    .restart local v10    # "line1":Ljava/lang/String;
    :cond_2
    :try_start_4
    const-string v0, "\r\n"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_d
    .catchall {:try_start_4 .. :try_end_4} :catchall_5

    if-eqz v0, :cond_7

    .line 358
    if-eqz v7, :cond_4

    .line 361
    :try_start_5
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 362
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v11, "KeepAlive Double CRLF received, sending single CRLF as defined per RFC 5626 Section 4.4.1"

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 363
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v11, "~~~ setting isPreviousLineCRLF=false"

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 366
    :cond_3
    const/4 v7, 0x0

    .line 369
    :try_start_6
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/parser/SIPMessageListener;->sendSingleCLRF()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 372
    goto :goto_3

    .line 370
    :catch_1
    move-exception v0

    .line 371
    .local v0, "e":Ljava/lang/Exception;
    :try_start_7
    sget-object v11, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v12, "A problem occured while trying to send a single CLRF in response to a double CLRF"

    invoke-interface {v11, v12, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 373
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_3
    goto :goto_2

    .line 375
    :cond_4
    const/4 v7, 0x1

    .line 376
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 377
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v11, "Received CRLF"

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 379
    :cond_5
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    if-eqz v0, :cond_6

    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    instance-of v0, v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    if-eqz v0, :cond_6

    .line 381
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    check-cast v0, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/ConnectionOrientedMessageChannel;->cancelPingKeepAliveTimeoutTaskIfStarted()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 384
    :cond_6
    goto :goto_2

    .line 386
    :cond_7
    nop

    .line 412
    :try_start_8
    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/Pipeline;->startTimer()V

    .line 415
    const/4 v0, 0x0

    .line 416
    .local v0, "bytesRead":I
    sget-object v11, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v11, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v11
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    if-eqz v11, :cond_8

    .line 417
    :try_start_9
    sget-object v11, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v12, "Reading Input stream."

    invoke-interface {v11, v12}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 421
    :cond_8
    move-object v11, v6

    move v6, v0

    .end local v0    # "bytesRead":I
    .local v6, "bytesRead":I
    .local v11, "line2":Ljava/lang/String;
    :goto_4
    :try_start_a
    invoke-direct {v1, v2}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    move-object v11, v0

    .line 422
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v6, v0

    .line 423
    iget v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->maxMessageSize:I
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    if-lez v0, :cond_a

    :try_start_b
    iget v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->maxMessageSize:I

    div-int/lit8 v0, v0, 0x2

    if-gt v6, v0, :cond_9

    goto :goto_5

    :cond_9
    new-instance v0, Ljava/io/IOException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "Pre-content-length headers size exceeded. The size of the message of the headers prior to Content-Length is too large. This must be an invalid message. Limit is MAX_MESSAGE_SIZE/2="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget v13, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->maxMessageSize:I

    div-int/lit8 v13, v13, 0x2

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v0, v12}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v2    # "inputStream":Landroid/gov/nist/javax/sip/parser/Pipeline;
    .end local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .end local v4    # "inputBuffer":Ljava/lang/StringBuilder;
    .end local v6    # "bytesRead":I
    .end local v7    # "isPreviousLineCRLF":Z
    .end local v10    # "line1":Ljava/lang/String;
    .end local v11    # "line2":Ljava/lang/String;
    throw v0
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_2
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 427
    .restart local v2    # "inputStream":Landroid/gov/nist/javax/sip/parser/Pipeline;
    .restart local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .restart local v4    # "inputBuffer":Ljava/lang/StringBuilder;
    .restart local v6    # "bytesRead":I
    .restart local v7    # "isPreviousLineCRLF":Z
    .restart local v10    # "line1":Ljava/lang/String;
    .restart local v11    # "line2":Ljava/lang/String;
    :catch_2
    move-exception v0

    move-object/from16 v17, v3

    goto/16 :goto_12

    .line 424
    :cond_a
    :goto_5
    :try_start_c
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v12, ""

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_a
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    if-eqz v0, :cond_1f

    .line 426
    nop

    .line 453
    :try_start_d
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/Pipeline;->stopTimer()V

    .line 454
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    .line 457
    const/4 v8, 0x0

    .line 460
    .local v8, "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :try_start_e
    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0
    :try_end_e
    .catch Ljava/text/ParseException; {:try_start_e .. :try_end_e} :catch_9
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    if-eqz v0, :cond_b

    .line 461
    :try_start_f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "About to parse : "

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_f
    .catch Ljava/text/ParseException; {:try_start_f .. :try_end_f} :catch_3
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    .line 465
    :cond_b
    :try_start_10
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v9, "UTF-8"

    invoke-virtual {v0, v9}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_10
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_10 .. :try_end_10} :catch_4
    .catch Ljava/text/ParseException; {:try_start_10 .. :try_end_10} :catch_3
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    .line 469
    .local v0, "inputBufferBytes":[B
    goto :goto_6

    .line 475
    .end local v0    # "inputBufferBytes":[B
    :catch_3
    move-exception v0

    move-object/from16 v17, v3

    goto/16 :goto_11

    .line 466
    :catch_4
    move-exception v0

    .line 468
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    :try_start_11
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    move-object v0, v9

    .line 470
    .local v0, "inputBufferBytes":[B
    :goto_6
    iget-object v9, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->smp:Landroid/gov/nist/javax/sip/parser/MessageParser;

    iget-object v12, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    const/4 v13, 0x0

    invoke-interface {v9, v0, v13, v13, v12}, Landroid/gov/nist/javax/sip/parser/MessageParser;->parseSIPMessage([BZZLandroid/gov/nist/javax/sip/parser/ParseExceptionListener;)Landroid/gov/nist/javax/sip/message/SIPMessage;

    move-result-object v9
    :try_end_11
    .catch Ljava/text/ParseException; {:try_start_11 .. :try_end_11} :catch_9
    .catchall {:try_start_11 .. :try_end_11} :catchall_5

    move-object v8, v9

    .line 471
    if-nez v8, :cond_c

    .line 472
    :try_start_12
    iget-object v9, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

    invoke-virtual {v9}, Landroid/gov/nist/javax/sip/parser/Pipeline;->stopTimer()V
    :try_end_12
    .catch Ljava/text/ParseException; {:try_start_12 .. :try_end_12} :catch_3
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    .line 473
    goto/16 :goto_0

    .line 482
    .end local v0    # "inputBufferBytes":[B
    :cond_c
    nop

    .line 484
    :try_start_13
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_5

    if-eqz v0, :cond_d

    .line 485
    :try_start_14
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v9, "Completed parsing message"

    invoke-interface {v0, v9}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_0

    .line 487
    :cond_d
    :try_start_15
    const-string v0, "Content-Length"

    invoke-virtual {v8, v0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeaderAsFormattedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v9, v0

    .line 488
    .local v9, "clString":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v12, 0x1e

    if-gt v0, v12, :cond_1d

    .line 489
    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getContentLength()Landroid/javax/sip/header/ContentLengthHeader;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/ContentLength;
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_5

    move-object v12, v0

    .line 493
    .local v12, "cl":Landroid/gov/nist/javax/sip/header/ContentLength;
    const/4 v0, 0x0

    .line 494
    .local v0, "contentLength":I
    if-eqz v12, :cond_e

    .line 495
    :try_start_16
    invoke-virtual {v12}, Landroid/gov/nist/javax/sip/header/ContentLength;->getContentLength()I

    move-result v13
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_0

    move v0, v13

    goto :goto_7

    .line 497
    :cond_e
    const/4 v0, 0x0

    move v13, v0

    .line 500
    .end local v0    # "contentLength":I
    .local v13, "contentLength":I
    :goto_7
    :try_start_17
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_5

    if-eqz v0, :cond_f

    .line 501
    :try_start_18
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Content length = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v0, v14}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_0

    .line 504
    :cond_f
    :try_start_19
    iget v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->maxMessageSize:I
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_5

    if-lez v0, :cond_11

    :try_start_1a
    iget v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->maxMessageSize:I

    if-gt v13, v0, :cond_10

    goto :goto_8

    :cond_10
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Max content size Exceeded! :"

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v14, " allowed max size is "

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v14, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->maxMessageSize:I

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .end local v2    # "inputStream":Landroid/gov/nist/javax/sip/parser/Pipeline;
    .end local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    throw v0

    .line 506
    .restart local v2    # "inputStream":Landroid/gov/nist/javax/sip/parser/Pipeline;
    .restart local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :cond_11
    :goto_8
    if-nez v13, :cond_12

    .line 507
    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/message/SIPMessage;->removeContent()V
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_0

    goto :goto_c

    .line 508
    :cond_12
    :try_start_1b
    iget v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->maxMessageSize:I
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_5

    if-eqz v0, :cond_13

    :try_start_1c
    iget v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sizeCounter:I
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_0

    if-ge v13, v0, :cond_16

    .line 510
    :cond_13
    :try_start_1d
    new-array v0, v13, [B
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_5

    move-object v14, v0

    .line 511
    .local v14, "message_body":[B
    const/4 v0, 0x0

    move v15, v0

    .line 512
    .local v15, "nread":I
    :goto_9
    if-ge v15, v13, :cond_15

    .line 519
    :try_start_1e
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/Pipeline;->startTimer()V
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_0

    .line 522
    sub-int v0, v13, v15

    :try_start_1f
    invoke-virtual {v2, v14, v15, v0}, Landroid/gov/nist/javax/sip/parser/Pipeline;->read([BII)I

    move-result v0
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_1f} :catch_5
    .catchall {:try_start_1f .. :try_end_1f} :catchall_1

    .line 524
    .local v0, "readlength":I
    if-lez v0, :cond_14

    .line 525
    add-int/2addr v15, v0

    .line 534
    .end local v0    # "readlength":I
    :try_start_20
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/Pipeline;->stopTimer()V

    .line 535
    nop

    .line 534
    goto :goto_9

    .restart local v0    # "readlength":I
    :cond_14
    iget-object v5, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/parser/Pipeline;->stopTimer()V
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_0

    goto :goto_b

    .end local v0    # "readlength":I
    :catchall_1
    move-exception v0

    goto :goto_a

    .line 529
    :catch_5
    move-exception v0

    move-object v5, v0

    move-object v0, v5

    .line 530
    .local v0, "ex":Ljava/io/IOException;
    :try_start_21
    const-string v5, "Exception Reading Content"

    invoke-interface {v3, v5, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_1

    .line 534
    :try_start_22
    iget-object v5, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/parser/Pipeline;->stopTimer()V

    goto :goto_b

    .end local v0    # "ex":Ljava/io/IOException;
    :goto_a
    iget-object v5, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

    invoke-virtual {v5}, Landroid/gov/nist/javax/sip/parser/Pipeline;->stopTimer()V

    .end local v2    # "inputStream":Landroid/gov/nist/javax/sip/parser/Pipeline;
    .end local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    throw v0
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_0

    .line 537
    .restart local v2    # "inputStream":Landroid/gov/nist/javax/sip/parser/Pipeline;
    .restart local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :cond_15
    :goto_b
    :try_start_23
    invoke-virtual {v8, v14}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setMessageContent([B)V

    .line 541
    .end local v14    # "message_body":[B
    .end local v15    # "nread":I
    :cond_16
    :goto_c
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_5

    if-eqz v0, :cond_1c

    .line 543
    :try_start_24
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->getPostParseExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_24} :catch_8
    .catchall {:try_start_24 .. :try_end_24} :catchall_5

    if-nez v0, :cond_19

    .line 549
    :try_start_25
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    if-eqz v0, :cond_17

    .line 550
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    invoke-interface {v0, v8}, Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;->beforeMessage(Landroid/javax/sip/message/Message;)V

    .line 552
    :cond_17
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    invoke-interface {v0, v8}, Landroid/gov/nist/javax/sip/parser/SIPMessageListener;->processMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V

    .line 553
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    if-eqz v0, :cond_18

    .line 554
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    invoke-interface {v0, v8}, Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;->afterMessage(Landroid/javax/sip/message/Message;)V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_25} :catch_6
    .catchall {:try_start_25 .. :try_end_25} :catchall_0

    move-object/from16 v17, v3

    goto :goto_e

    .line 553
    :cond_18
    move-object/from16 v17, v3

    goto :goto_e

    .line 585
    :catch_6
    move-exception v0

    move-object/from16 v17, v3

    goto :goto_f

    .line 564
    :cond_19
    :try_start_26
    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v0

    .line 566
    .local v0, "callId":Ljava/lang/String;
    iget-object v5, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->messagesOrderingMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v5, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_26} :catch_8
    .catchall {:try_start_26 .. :try_end_26} :catchall_5

    .line 567
    .local v5, "orderingStructure":Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
    if-nez v5, :cond_1b

    .line 568
    :try_start_27
    new-instance v14, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;

    invoke-direct {v14, v1}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;-><init>(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;)V

    .line 569
    .local v14, "newCallIDOrderingStructure":Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
    iget-object v15, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->messagesOrderingMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v15, v0, v14}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;

    move-object v5, v15

    .line 570
    if-nez v5, :cond_1b

    .line 571
    move-object v5, v14

    .line 572
    const/16 v15, 0x20

    invoke-interface {v3, v15}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v15

    if-eqz v15, :cond_1a

    .line 573
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v16, v5

    .end local v5    # "orderingStructure":Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
    .local v16, "orderingStructure":Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
    const-string/jumbo v5, "new CallIDOrderingStructure added for message "

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_27} :catch_6
    .catchall {:try_start_27 .. :try_end_27} :catchall_0

    goto :goto_d

    .line 572
    .end local v16    # "orderingStructure":Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
    .restart local v5    # "orderingStructure":Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
    :cond_1a
    move-object/from16 v16, v5

    .line 577
    .end local v5    # "orderingStructure":Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
    .end local v14    # "newCallIDOrderingStructure":Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
    .restart local v16    # "orderingStructure":Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
    :goto_d
    move-object/from16 v5, v16

    .end local v16    # "orderingStructure":Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
    .restart local v5    # "orderingStructure":Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
    :cond_1b
    move-object v14, v5

    .line 581
    .local v14, "callIDOrderingStructure":Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
    :try_start_28
    invoke-virtual {v14}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;->getMessagesForCallID()Ljava/util/Queue;

    move-result-object v15

    invoke-interface {v15, v8}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 583
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->getPostParseExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v15
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_28} :catch_8
    .catchall {:try_start_28 .. :try_end_28} :catchall_5

    move-object/from16 v17, v3

    .end local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .local v17, "stackLogger":Landroid/gov/nist/core/StackLogger;
    :try_start_29
    new-instance v3, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;

    invoke-direct {v3, v1, v14, v0}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$Dispatch;-><init>(Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;Ljava/lang/String;)V

    invoke-interface {v15, v3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_29} :catch_7
    .catchall {:try_start_29 .. :try_end_29} :catchall_4

    .line 589
    .end local v0    # "callId":Ljava/lang/String;
    .end local v5    # "orderingStructure":Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
    .end local v14    # "callIDOrderingStructure":Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser$CallIDOrderingStructure;
    :goto_e
    goto :goto_10

    .line 585
    :catch_7
    move-exception v0

    goto :goto_f

    .end local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .restart local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :catch_8
    move-exception v0

    move-object/from16 v17, v3

    .line 588
    .end local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .local v0, "ex":Ljava/lang/Exception;
    .restart local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :goto_f
    goto/16 :goto_1c

    .line 541
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .restart local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :cond_1c
    move-object/from16 v17, v3

    .line 591
    .end local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .end local v4    # "inputBuffer":Ljava/lang/StringBuilder;
    .end local v6    # "bytesRead":I
    .end local v7    # "isPreviousLineCRLF":Z
    .end local v8    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    .end local v9    # "clString":Ljava/lang/String;
    .end local v10    # "line1":Ljava/lang/String;
    .end local v11    # "line2":Ljava/lang/String;
    .end local v12    # "cl":Landroid/gov/nist/javax/sip/header/ContentLength;
    .end local v13    # "contentLength":I
    .restart local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :goto_10
    move-object/from16 v3, v17

    goto/16 :goto_0

    .line 488
    .end local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .restart local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .restart local v4    # "inputBuffer":Ljava/lang/StringBuilder;
    .restart local v6    # "bytesRead":I
    .restart local v7    # "isPreviousLineCRLF":Z
    .restart local v8    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    .restart local v9    # "clString":Ljava/lang/String;
    .restart local v10    # "line1":Ljava/lang/String;
    .restart local v11    # "line2":Ljava/lang/String;
    :cond_1d
    move-object/from16 v17, v3

    .end local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .restart local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :try_start_2a
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Bad content lenght header "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .end local v2    # "inputStream":Landroid/gov/nist/javax/sip/parser/Pipeline;
    .end local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    throw v0

    .line 475
    .end local v9    # "clString":Ljava/lang/String;
    .restart local v2    # "inputStream":Landroid/gov/nist/javax/sip/parser/Pipeline;
    .restart local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :catch_9
    move-exception v0

    move-object/from16 v17, v3

    .line 477
    .end local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .local v0, "ex":Ljava/text/ParseException;
    .restart local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :goto_11
    sget-object v3, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v5, 0x20

    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 478
    sget-object v3, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Detected a parsing issue "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, " "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 481
    :cond_1e
    move-object/from16 v3, v17

    goto/16 :goto_0

    .line 449
    .end local v0    # "ex":Ljava/text/ParseException;
    .end local v8    # "sipMessage":Landroid/gov/nist/javax/sip/message/SIPMessage;
    .end local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .restart local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :cond_1f
    move-object/from16 v17, v3

    .end local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .restart local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    const/16 v5, 0x20

    goto/16 :goto_4

    .line 427
    .end local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .restart local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :catch_a
    move-exception v0

    move-object/from16 v17, v3

    .end local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .restart local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :goto_12
    move-object v3, v0

    .line 430
    .local v3, "ex":Ljava/io/IOException;
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->getPostParseExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    if-eqz v0, :cond_21

    iget-boolean v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->isRunning:Z

    if-eqz v0, :cond_21

    .line 431
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v5, 0x20

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_20

    .line 432
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "waiting for messagesOrderingMap "

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v12, " threadname "

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v12, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->mythread:Ljava/lang/Thread;

    invoke-virtual {v12}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 433
    :cond_20
    iget-object v5, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->messagesOrderingMap:Ljava/util/concurrent/ConcurrentHashMap;

    monitor-enter v5
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_4

    .line 435
    :try_start_2b
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->messagesOrderingMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, v8, v9}, Ljava/lang/Object;->wait(J)V
    :try_end_2b
    .catch Ljava/lang/InterruptedException; {:try_start_2b .. :try_end_2b} :catch_b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_2

    goto :goto_13

    .line 437
    :catchall_2
    move-exception v0

    goto :goto_14

    .line 436
    :catch_b
    move-exception v0

    :goto_13
    nop

    .line 437
    :try_start_2c
    monitor-exit v5
    :try_end_2c
    .catchall {:try_start_2c .. :try_end_2c} :catchall_2

    .line 438
    :try_start_2d
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v5, 0x20

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 439
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "got notified for messagesOrderingMap "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v8, " threadname "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v8, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->mythread:Ljava/lang/Thread;

    invoke-virtual {v8}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_4

    goto :goto_15

    .line 437
    :goto_14
    :try_start_2e
    monitor-exit v5
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_2

    .end local v2    # "inputStream":Landroid/gov/nist/javax/sip/parser/Pipeline;
    .end local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :try_start_2f
    throw v0

    .line 441
    .restart local v2    # "inputStream":Landroid/gov/nist/javax/sip/parser/Pipeline;
    .restart local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :cond_21
    :goto_15
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/Pipeline;->stopTimer()V

    .line 442
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v5, 0x20

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 443
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "thread ending for threadname "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v8, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->mythread:Ljava/lang/Thread;

    invoke-virtual {v8}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 445
    :cond_22
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v5, 0x20

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 446
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->logStackTrace(I)V
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_4

    .line 594
    :cond_23
    :try_start_30
    invoke-direct/range {p0 .. p0}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->cleanMessageOrderingMap()V

    .line 595
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/Pipeline;->isClosed()Z

    move-result v0

    if-nez v0, :cond_24

    .line 596
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/Pipeline;->close()V
    :try_end_30
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_30} :catch_c

    .line 600
    :cond_24
    goto :goto_16

    .line 598
    :catch_c
    move-exception v0

    .line 599
    .local v0, "e":Ljava/io/IOException;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 600
    .end local v0    # "e":Ljava/io/IOException;
    :goto_16
    return-void

    .line 387
    .end local v10    # "line1":Ljava/lang/String;
    .end local v11    # "line2":Ljava/lang/String;
    .end local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .local v3, "stackLogger":Landroid/gov/nist/core/StackLogger;
    .local v6, "line2":Ljava/lang/String;
    :catch_d
    move-exception v0

    move-object/from16 v17, v3

    .end local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .restart local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :goto_17
    move-object v3, v0

    .line 390
    .local v3, "ex":Ljava/io/IOException;
    :try_start_31
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->getPostParseExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    if-eqz v0, :cond_26

    iget-boolean v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->isRunning:Z

    if-eqz v0, :cond_26

    .line 391
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v5, 0x20

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 392
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "waiting for messagesOrderingMap "

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v10, " threadname "

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v10, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->mythread:Ljava/lang/Thread;

    invoke-virtual {v10}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 393
    :cond_25
    iget-object v5, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->messagesOrderingMap:Ljava/util/concurrent/ConcurrentHashMap;

    monitor-enter v5
    :try_end_31
    .catchall {:try_start_31 .. :try_end_31} :catchall_4

    .line 395
    :try_start_32
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->messagesOrderingMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, v8, v9}, Ljava/lang/Object;->wait(J)V
    :try_end_32
    .catch Ljava/lang/InterruptedException; {:try_start_32 .. :try_end_32} :catch_e
    .catchall {:try_start_32 .. :try_end_32} :catchall_3

    goto :goto_18

    .line 397
    :catchall_3
    move-exception v0

    goto :goto_19

    .line 396
    :catch_e
    move-exception v0

    :goto_18
    nop

    .line 397
    :try_start_33
    monitor-exit v5
    :try_end_33
    .catchall {:try_start_33 .. :try_end_33} :catchall_3

    .line 398
    :try_start_34
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v5, 0x20

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 399
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "got notified for messagesOrderingMap "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v8, " threadname "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v8, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->mythread:Ljava/lang/Thread;

    invoke-virtual {v8}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_34
    .catchall {:try_start_34 .. :try_end_34} :catchall_4

    goto :goto_1a

    .line 397
    :goto_19
    :try_start_35
    monitor-exit v5
    :try_end_35
    .catchall {:try_start_35 .. :try_end_35} :catchall_3

    .end local v2    # "inputStream":Landroid/gov/nist/javax/sip/parser/Pipeline;
    .end local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :try_start_36
    throw v0

    .line 401
    .restart local v2    # "inputStream":Landroid/gov/nist/javax/sip/parser/Pipeline;
    .restart local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :cond_26
    :goto_1a
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->rawInputStream:Landroid/gov/nist/javax/sip/parser/Pipeline;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/Pipeline;->stopTimer()V

    .line 402
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v5, 0x20

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 403
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "thread ending for threadname "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v8, v1, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->mythread:Ljava/lang/Thread;

    invoke-virtual {v8}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 405
    :cond_27
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v5, 0x20

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 406
    sget-object v0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->logStackTrace(I)V
    :try_end_36
    .catchall {:try_start_36 .. :try_end_36} :catchall_4

    .line 594
    :cond_28
    :try_start_37
    invoke-direct/range {p0 .. p0}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->cleanMessageOrderingMap()V

    .line 595
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/Pipeline;->isClosed()Z

    move-result v0

    if-nez v0, :cond_29

    .line 596
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/Pipeline;->close()V
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_37} :catch_f

    .line 600
    :cond_29
    goto :goto_1b

    .line 598
    :catch_f
    move-exception v0

    .line 599
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 600
    .end local v0    # "e":Ljava/io/IOException;
    :goto_1b
    return-void

    .line 593
    .end local v3    # "ex":Ljava/io/IOException;
    .end local v4    # "inputBuffer":Ljava/lang/StringBuilder;
    .end local v6    # "line2":Ljava/lang/String;
    .end local v7    # "isPreviousLineCRLF":Z
    :catchall_4
    move-exception v0

    move-object v3, v0

    goto :goto_1e

    .line 336
    .end local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .local v3, "stackLogger":Landroid/gov/nist/core/StackLogger;
    :cond_2a
    move-object/from16 v17, v3

    .line 594
    .end local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .restart local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :goto_1c
    :try_start_38
    invoke-direct/range {p0 .. p0}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->cleanMessageOrderingMap()V

    .line 595
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/Pipeline;->isClosed()Z

    move-result v0

    if-nez v0, :cond_2b

    .line 596
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/Pipeline;->close()V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_38} :catch_10

    .line 600
    :cond_2b
    goto :goto_1d

    .line 598
    :catch_10
    move-exception v0

    .line 599
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 601
    .end local v0    # "e":Ljava/io/IOException;
    nop

    .line 602
    :goto_1d
    return-void

    .line 593
    .end local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .restart local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :catchall_5
    move-exception v0

    move-object/from16 v17, v3

    move-object v3, v0

    .line 594
    .end local v3    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    .restart local v17    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    :goto_1e
    :try_start_39
    invoke-direct/range {p0 .. p0}, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->cleanMessageOrderingMap()V

    .line 595
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/Pipeline;->isClosed()Z

    move-result v0

    if-nez v0, :cond_2c

    .line 596
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/Pipeline;->close()V
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_39} :catch_11

    .line 600
    :cond_2c
    goto :goto_1f

    .line 598
    :catch_11
    move-exception v0

    .line 599
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 600
    .end local v0    # "e":Ljava/io/IOException;
    :goto_1f
    throw v3
.end method

.method public setMessageListener(Landroid/gov/nist/javax/sip/parser/SIPMessageListener;)V
    .locals 0
    .param p1, "mlistener"    # Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    .line 200
    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/PipelinedMsgParser;->sipMessageListener:Landroid/gov/nist/javax/sip/parser/SIPMessageListener;

    .line 201
    return-void
.end method
