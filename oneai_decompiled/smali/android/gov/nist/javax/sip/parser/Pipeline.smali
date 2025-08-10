.class public Landroid/gov/nist/javax/sip/parser/Pipeline;
.super Ljava/io/InputStream;
.source "Pipeline.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;,
        Landroid/gov/nist/javax/sip/parser/Pipeline$MyTimer;
    }
.end annotation


# instance fields
.field private buffList:Ljava/util/LinkedList;

.field private currentBuffer:Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;

.field private isClosed:Z

.field private myTimerTask:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

.field private pipe:Ljava/io/InputStream;

.field private readTimeout:I

.field private timer:Landroid/gov/nist/javax/sip/stack/timers/SipTimer;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;ILandroid/gov/nist/javax/sip/stack/timers/SipTimer;)V
    .locals 1
    .param p1, "pipe"    # Ljava/io/InputStream;
    .param p2, "readTimeout"    # I
    .param p3, "timer"    # Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    .line 132
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 135
    iput-object p3, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->timer:Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    .line 136
    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->pipe:Ljava/io/InputStream;

    .line 137
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->buffList:Ljava/util/LinkedList;

    .line 138
    iput p2, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->readTimeout:I

    .line 139
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 163
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->isClosed:Z

    .line 164
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->buffList:Ljava/util/LinkedList;

    monitor-enter v0

    .line 165
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->buffList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 166
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 169
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->pipe:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 170
    return-void

    .line 166
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public isClosed()Z
    .locals 1

    .line 211
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->isClosed:Z

    return v0
.end method

.method public read()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 174
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->buffList:Ljava/util/LinkedList;

    monitor-enter v0

    .line 175
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->currentBuffer:Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->currentBuffer:Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;

    iget v1, v1, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;->ptr:I

    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->currentBuffer:Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;

    iget v3, v3, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;->length:I

    if-ge v1, v3, :cond_1

    .line 177
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->currentBuffer:Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;->getNextByte()I

    move-result v1

    .line 178
    .local v1, "retval":I
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->currentBuffer:Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;

    iget v3, v3, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;->ptr:I

    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->currentBuffer:Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;

    iget v4, v4, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;->length:I

    if-ne v3, v4, :cond_0

    .line 179
    iput-object v2, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->currentBuffer:Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;

    .line 180
    :cond_0
    monitor-exit v0

    return v1

    .line 183
    .end local v1    # "retval":I
    :cond_1
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->isClosed:Z

    const/4 v3, -0x1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->buffList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 184
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v3

    .line 187
    :cond_2
    :try_start_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->buffList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 188
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->buffList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    .line 190
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->buffList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->isClosed:Z
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_2

    .line 191
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    return v3

    .line 193
    :cond_3
    :try_start_3
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->buffList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;

    iput-object v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->currentBuffer:Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;

    .line 194
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->currentBuffer:Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;->getNextByte()I

    move-result v1

    .line 195
    .restart local v1    # "retval":I
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->currentBuffer:Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;

    iget v3, v3, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;->ptr:I

    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->currentBuffer:Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;

    iget v4, v4, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;->length:I

    if-ne v3, v4, :cond_4

    .line 196
    iput-object v2, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->currentBuffer:Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/util/NoSuchElementException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 197
    :cond_4
    :try_start_4
    monitor-exit v0

    return v1

    .line 200
    .end local v1    # "retval":I
    :catch_0
    move-exception v1

    .line 201
    .local v1, "ex":Ljava/util/NoSuchElementException;
    invoke-virtual {v1}, Ljava/util/NoSuchElementException;->printStackTrace()V

    .line 202
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v1}, Ljava/util/NoSuchElementException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 198
    .end local v1    # "ex":Ljava/util/NoSuchElementException;
    :catch_1
    move-exception v1

    .line 199
    .local v1, "ex":Ljava/lang/InterruptedException;
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 204
    .end local v1    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v1
.end method

.method public startTimer()V
    .locals 4

    .line 117
    iget v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->readTimeout:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 118
    return-void

    .line 121
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/parser/Pipeline$MyTimer;

    invoke-direct {v0, p0, p0}, Landroid/gov/nist/javax/sip/parser/Pipeline$MyTimer;-><init>(Landroid/gov/nist/javax/sip/parser/Pipeline;Landroid/gov/nist/javax/sip/parser/Pipeline;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->myTimerTask:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    .line 122
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->timer:Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->myTimerTask:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    iget v2, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->readTimeout:I

    int-to-long v2, v2

    invoke-interface {v0, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    .line 123
    return-void
.end method

.method public stopTimer()V
    .locals 2

    .line 126
    iget v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->readTimeout:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 127
    return-void

    .line 128
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->myTimerTask:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    if-eqz v0, :cond_1

    .line 129
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->timer:Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->myTimerTask:Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;

    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 130
    :cond_1
    return-void
.end method

.method public write([B)V
    .locals 3
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 153
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->isClosed:Z

    if-nez v0, :cond_0

    .line 155
    new-instance v0, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;

    array-length v1, p1

    invoke-direct {v0, p0, p1, v1}, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;-><init>(Landroid/gov/nist/javax/sip/parser/Pipeline;[BI)V

    .line 156
    .local v0, "buff":Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->buffList:Ljava/util/LinkedList;

    monitor-enter v1

    .line 157
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->buffList:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 158
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->buffList:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 159
    monitor-exit v1

    .line 160
    return-void

    .line 159
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 154
    .end local v0    # "buff":Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Closed!!"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public write([BII)V
    .locals 3
    .param p1, "bytes"    # [B
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 142
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->isClosed:Z

    if-nez v0, :cond_0

    .line 144
    new-instance v0, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;

    invoke-direct {v0, p0, p1, p3}, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;-><init>(Landroid/gov/nist/javax/sip/parser/Pipeline;[BI)V

    .line 145
    .local v0, "buff":Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;
    iput p2, v0, Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;->ptr:I

    .line 146
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->buffList:Ljava/util/LinkedList;

    monitor-enter v1

    .line 147
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->buffList:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 148
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/Pipeline;->buffList:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 149
    monitor-exit v1

    .line 150
    return-void

    .line 149
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 143
    .end local v0    # "buff":Landroid/gov/nist/javax/sip/parser/Pipeline$Buffer;
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Closed!!"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
