.class public Landroid/gov/nist/javax/sip/MergedSystemProperties;
.super Ljava/util/Properties;
.source "MergedSystemProperties.java"


# static fields
.field private static final serialVersionUID:J = -0x6df3a284b2fd227fL


# instance fields
.field private parent:Ljava/util/Properties;


# direct methods
.method public constructor <init>(Ljava/util/Properties;)V
    .locals 0
    .param p1, "props"    # Ljava/util/Properties;

    .line 19
    invoke-direct {p0}, Ljava/util/Properties;-><init>()V

    .line 20
    iput-object p1, p0, Landroid/gov/nist/javax/sip/MergedSystemProperties;->parent:Ljava/util/Properties;

    .line 21
    return-void
.end method


# virtual methods
.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .line 136
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MergedSystemProperties;->parent:Ljava/util/Properties;

    invoke-virtual {v0, p1}, Ljava/util/Properties;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .line 115
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 116
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 117
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MergedSystemProperties;->parent:Ljava/util/Properties;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .line 108
    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 109
    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 110
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MergedSystemProperties;->parent:Ljava/util/Properties;

    invoke-virtual {v0, p1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .line 102
    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 103
    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 104
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MergedSystemProperties;->parent:Ljava/util/Properties;

    invoke-virtual {v0, p1, p2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public list(Ljava/io/PrintStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/PrintStream;

    .line 24
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MergedSystemProperties;->parent:Ljava/util/Properties;

    invoke-virtual {v0, p1}, Ljava/util/Properties;->list(Ljava/io/PrintStream;)V

    .line 25
    return-void
.end method

.method public list(Ljava/io/PrintWriter;)V
    .locals 1
    .param p1, "out"    # Ljava/io/PrintWriter;

    .line 29
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MergedSystemProperties;->parent:Ljava/util/Properties;

    invoke-virtual {v0, p1}, Ljava/util/Properties;->list(Ljava/io/PrintWriter;)V

    .line 30
    return-void
.end method

.method public declared-synchronized load(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "inStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 35
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MergedSystemProperties;->parent:Ljava/util/Properties;

    invoke-virtual {v0, p1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    monitor-exit p0

    return-void

    .line 34
    .end local p0    # "this":Landroid/gov/nist/javax/sip/MergedSystemProperties;
    .end local p1    # "inStream":Ljava/io/InputStream;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized load(Ljava/io/Reader;)V
    .locals 2
    .param p1, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 41
    :try_start_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not implemented for Java 5 compatibility"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    .end local p0    # "this":Landroid/gov/nist/javax/sip/MergedSystemProperties;
    .end local p1    # "reader":Ljava/io/Reader;
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public declared-synchronized loadFromXML(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/InvalidPropertiesFormatException;
        }
    .end annotation

    monitor-enter p0

    .line 48
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MergedSystemProperties;->parent:Ljava/util/Properties;

    invoke-virtual {v0, p1}, Ljava/util/Properties;->loadFromXML(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    monitor-exit p0

    return-void

    .line 47
    .end local p0    # "this":Landroid/gov/nist/javax/sip/MergedSystemProperties;
    .end local p1    # "in":Ljava/io/InputStream;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public propertyNames()Ljava/util/Enumeration;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration<",
            "*>;"
        }
    .end annotation

    .line 54
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MergedSystemProperties;->parent:Ljava/util/Properties;

    invoke-virtual {v0}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized save(Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "comments"    # Ljava/lang/String;

    monitor-enter p0

    .line 60
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MergedSystemProperties;->parent:Ljava/util/Properties;

    invoke-virtual {v0, p1, p2}, Ljava/util/Properties;->save(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    monitor-exit p0

    return-void

    .line 59
    .end local p0    # "this":Landroid/gov/nist/javax/sip/MergedSystemProperties;
    .end local p1    # "out":Ljava/io/OutputStream;
    .end local p2    # "comments":Ljava/lang/String;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    monitor-enter p0

    .line 66
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MergedSystemProperties;->parent:Ljava/util/Properties;

    invoke-virtual {v0, p1, p2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 66
    .end local p0    # "this":Landroid/gov/nist/javax/sip/MergedSystemProperties;
    .end local p1    # "key":Ljava/lang/String;
    .end local p2    # "value":Ljava/lang/String;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public store(Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "comments"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MergedSystemProperties;->parent:Ljava/util/Properties;

    invoke-virtual {v0, p1, p2}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 73
    return-void
.end method

.method public store(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 2
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "comments"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not implemented for Java 5 compatibility"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public declared-synchronized storeToXML(Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 1
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "comment"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 92
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MergedSystemProperties;->parent:Ljava/util/Properties;

    invoke-virtual {v0, p1, p2}, Ljava/util/Properties;->storeToXML(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    monitor-exit p0

    return-void

    .line 91
    .end local p0    # "this":Landroid/gov/nist/javax/sip/MergedSystemProperties;
    .end local p1    # "os":Ljava/io/OutputStream;
    .end local p2    # "comment":Ljava/lang/String;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized storeToXML(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "comment"    # Ljava/lang/String;
    .param p3, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 85
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/MergedSystemProperties;->parent:Ljava/util/Properties;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/Properties;->storeToXML(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    monitor-exit p0

    return-void

    .line 84
    .end local p0    # "this":Landroid/gov/nist/javax/sip/MergedSystemProperties;
    .end local p1    # "os":Ljava/io/OutputStream;
    .end local p2    # "comment":Ljava/lang/String;
    .end local p3    # "encoding":Ljava/lang/String;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public stringPropertyNames()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 98
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not implemented for Java 5 compatibility"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/util/Properties;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/MergedSystemProperties;->parent:Ljava/util/Properties;

    invoke-virtual {v1}, Ljava/util/Properties;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
