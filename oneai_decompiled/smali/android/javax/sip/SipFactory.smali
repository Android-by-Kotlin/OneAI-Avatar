.class public Landroid/javax/sip/SipFactory;
.super Ljava/lang/Object;
.source "SipFactory.java"


# static fields
.field private static myFactory:Landroid/javax/sip/SipFactory;


# instance fields
.field private addressFactory:Landroid/javax/sip/address/AddressFactory;

.field private headerFactory:Landroid/javax/sip/header/HeaderFactory;

.field private messageFactory:Landroid/javax/sip/message/MessageFactory;

.field private pathName:Ljava/lang/String;

.field private sipStackByName:Ljava/util/Hashtable;

.field private final sipStackList:Ljava/util/LinkedList;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 352
    const/4 v0, 0x0

    sput-object v0, Landroid/javax/sip/SipFactory;->myFactory:Landroid/javax/sip/SipFactory;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 332
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 337
    const-string/jumbo v0, "gov.nist"

    iput-object v0, p0, Landroid/javax/sip/SipFactory;->pathName:Ljava/lang/String;

    .line 346
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/javax/sip/SipFactory;->messageFactory:Landroid/javax/sip/message/MessageFactory;

    .line 348
    iput-object v0, p0, Landroid/javax/sip/SipFactory;->headerFactory:Landroid/javax/sip/header/HeaderFactory;

    .line 350
    iput-object v0, p0, Landroid/javax/sip/SipFactory;->addressFactory:Landroid/javax/sip/address/AddressFactory;

    .line 357
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Landroid/javax/sip/SipFactory;->sipStackList:Ljava/util/LinkedList;

    .line 333
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Landroid/javax/sip/SipFactory;->sipStackByName:Ljava/util/Hashtable;

    .line 334
    return-void
.end method

.method private createSipFactory(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .param p1, "objectClassName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/PeerUnavailableException;
        }
    .end annotation

    .line 274
    const-string v0, "."

    if-eqz p1, :cond_0

    .line 278
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/javax/sip/SipFactory;->getPathName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 283
    .local v1, "peerObjectClass":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 284
    .local v0, "newPeerObject":Ljava/lang/Object;
    return-object v0

    .line 285
    .end local v0    # "newPeerObject":Ljava/lang/Object;
    .end local v1    # "peerObjectClass":Ljava/lang/Class;
    :catch_0
    move-exception v1

    .line 286
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "The Peer Factory: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/javax/sip/SipFactory;->getPathName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " could not be instantiated. Ensure the Path Name has been set."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 291
    .local v0, "errmsg":Ljava/lang/String;
    new-instance v2, Landroid/javax/sip/PeerUnavailableException;

    invoke-direct {v2, v0, v1}, Landroid/javax/sip/PeerUnavailableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 275
    .end local v0    # "errmsg":Ljava/lang/String;
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0
.end method

.method private createStack(Ljava/util/Properties;)Landroid/javax/sip/SipStack;
    .locals 7
    .param p1, "properties"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/PeerUnavailableException;
        }
    .end annotation

    .line 302
    const-string v0, ".javax.sip.SipStackImpl"

    const/4 v1, 0x1

    :try_start_0
    new-array v2, v1, [Ljava/lang/Class;

    .line 303
    .local v2, "paramTypes":[Ljava/lang/Class;
    const-string/jumbo v3, "java.util.Properties"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    .line 305
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/javax/sip/SipFactory;->getPathName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    .line 310
    .local v3, "sipStackConstructor":Ljava/lang/reflect/Constructor;
    new-array v1, v1, [Ljava/lang/Object;

    .line 311
    .local v1, "conArgs":[Ljava/lang/Object;
    aput-object p1, v1, v4

    .line 314
    invoke-virtual {v3, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/javax/sip/SipStack;

    .line 315
    .local v4, "sipStack":Landroid/javax/sip/SipStack;
    iget-object v5, p0, Landroid/javax/sip/SipFactory;->sipStackList:Ljava/util/LinkedList;

    invoke-virtual {v5, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 316
    const-string/jumbo v5, "android.javax.sip.STACK_NAME"

    invoke-virtual {p1, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 317
    .local v5, "name":Ljava/lang/String;
    iget-object v6, p0, Landroid/javax/sip/SipFactory;->sipStackByName:Ljava/util/Hashtable;

    invoke-virtual {v6, v5, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 318
    return-object v4

    .line 319
    .end local v1    # "conArgs":[Ljava/lang/Object;
    .end local v2    # "paramTypes":[Ljava/lang/Class;
    .end local v3    # "sipStackConstructor":Ljava/lang/reflect/Constructor;
    .end local v4    # "sipStack":Landroid/javax/sip/SipStack;
    .end local v5    # "name":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 320
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "The Peer SIP Stack: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/javax/sip/SipFactory;->getPathName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " could not be instantiated. Ensure the Path Name has been set."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 324
    .local v0, "errmsg":Ljava/lang/String;
    new-instance v2, Landroid/javax/sip/PeerUnavailableException;

    invoke-direct {v2, v0, v1}, Landroid/javax/sip/PeerUnavailableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static declared-synchronized getInstance()Landroid/javax/sip/SipFactory;
    .locals 2

    const-class v0, Landroid/javax/sip/SipFactory;

    monitor-enter v0

    .line 112
    :try_start_0
    sget-object v1, Landroid/javax/sip/SipFactory;->myFactory:Landroid/javax/sip/SipFactory;

    if-nez v1, :cond_0

    .line 113
    new-instance v1, Landroid/javax/sip/SipFactory;

    invoke-direct {v1}, Landroid/javax/sip/SipFactory;-><init>()V

    sput-object v1, Landroid/javax/sip/SipFactory;->myFactory:Landroid/javax/sip/SipFactory;

    .line 115
    :cond_0
    sget-object v1, Landroid/javax/sip/SipFactory;->myFactory:Landroid/javax/sip/SipFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 111
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method


# virtual methods
.method public createAddressFactory()Landroid/javax/sip/address/AddressFactory;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/PeerUnavailableException;
        }
    .end annotation

    .line 212
    iget-object v0, p0, Landroid/javax/sip/SipFactory;->addressFactory:Landroid/javax/sip/address/AddressFactory;

    if-nez v0, :cond_0

    .line 213
    const-string/jumbo v0, "javax.sip.address.AddressFactoryImpl"

    invoke-direct {p0, v0}, Landroid/javax/sip/SipFactory;->createSipFactory(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/address/AddressFactory;

    iput-object v0, p0, Landroid/javax/sip/SipFactory;->addressFactory:Landroid/javax/sip/address/AddressFactory;

    .line 215
    :cond_0
    iget-object v0, p0, Landroid/javax/sip/SipFactory;->addressFactory:Landroid/javax/sip/address/AddressFactory;

    return-object v0
.end method

.method public createHeaderFactory()Landroid/javax/sip/header/HeaderFactory;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/PeerUnavailableException;
        }
    .end annotation

    .line 196
    iget-object v0, p0, Landroid/javax/sip/SipFactory;->headerFactory:Landroid/javax/sip/header/HeaderFactory;

    if-nez v0, :cond_0

    .line 197
    const-string/jumbo v0, "javax.sip.header.HeaderFactoryImpl"

    invoke-direct {p0, v0}, Landroid/javax/sip/SipFactory;->createSipFactory(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/header/HeaderFactory;

    iput-object v0, p0, Landroid/javax/sip/SipFactory;->headerFactory:Landroid/javax/sip/header/HeaderFactory;

    .line 199
    :cond_0
    iget-object v0, p0, Landroid/javax/sip/SipFactory;->headerFactory:Landroid/javax/sip/header/HeaderFactory;

    return-object v0
.end method

.method public createMessageFactory()Landroid/javax/sip/message/MessageFactory;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/PeerUnavailableException;
        }
    .end annotation

    .line 181
    iget-object v0, p0, Landroid/javax/sip/SipFactory;->messageFactory:Landroid/javax/sip/message/MessageFactory;

    if-nez v0, :cond_0

    .line 182
    const-string/jumbo v0, "javax.sip.message.MessageFactoryImpl"

    invoke-direct {p0, v0}, Landroid/javax/sip/SipFactory;->createSipFactory(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/message/MessageFactory;

    iput-object v0, p0, Landroid/javax/sip/SipFactory;->messageFactory:Landroid/javax/sip/message/MessageFactory;

    .line 184
    :cond_0
    iget-object v0, p0, Landroid/javax/sip/SipFactory;->messageFactory:Landroid/javax/sip/message/MessageFactory;

    return-object v0
.end method

.method public declared-synchronized createSipStack(Ljava/util/Properties;)Landroid/javax/sip/SipStack;
    .locals 4
    .param p1, "properties"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/PeerUnavailableException;
        }
    .end annotation

    monitor-enter p0

    .line 142
    :try_start_0
    const-string/jumbo v0, "android.javax.sip.IP_ADDRESS"

    invoke-virtual {p1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 143
    .local v0, "ipAddress":Ljava/lang/String;
    const-string/jumbo v1, "android.javax.sip.STACK_NAME"

    invoke-virtual {p1, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 144
    .local v1, "name":Ljava/lang/String;
    if-eqz v1, :cond_4

    .line 149
    if-nez v0, :cond_1

    .line 150
    iget-object v2, p0, Landroid/javax/sip/SipFactory;->sipStackByName:Ljava/util/Hashtable;

    invoke-virtual {v2, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/SipStack;

    .line 151
    .local v2, "mySipStack":Landroid/javax/sip/SipStack;
    if-nez v2, :cond_0

    .line 152
    invoke-direct {p0, p1}, Landroid/javax/sip/SipFactory;->createStack(Ljava/util/Properties;)Landroid/javax/sip/SipStack;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v2, v3

    .line 154
    .end local p0    # "this":Landroid/javax/sip/SipFactory;
    :cond_0
    monitor-exit p0

    return-object v2

    .line 159
    .end local v2    # "mySipStack":Landroid/javax/sip/SipStack;
    :cond_1
    const/4 v2, 0x0

    .line 160
    .local v2, "i":I
    const/4 v2, 0x0

    :goto_0
    :try_start_1
    iget-object v3, p0, Landroid/javax/sip/SipFactory;->sipStackList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 161
    iget-object v3, p0, Landroid/javax/sip/SipFactory;->sipStackList:Ljava/util/LinkedList;

    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/javax/sip/SipStack;

    invoke-interface {v3}, Landroid/javax/sip/SipStack;->getIPAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 162
    iget-object v3, p0, Landroid/javax/sip/SipFactory;->sipStackList:Ljava/util/LinkedList;

    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/javax/sip/SipStack;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v3

    .line 160
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 165
    :cond_3
    :try_start_2
    invoke-direct {p0, p1}, Landroid/javax/sip/SipFactory;->createStack(Ljava/util/Properties;)Landroid/javax/sip/SipStack;

    move-result-object v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v3

    .line 144
    .end local v2    # "i":I
    :cond_4
    :try_start_3
    new-instance v2, Landroid/javax/sip/PeerUnavailableException;

    const-string v3, "Missing android.javax.sip.STACK_NAME property"

    invoke-direct {v2, v3}, Landroid/javax/sip/PeerUnavailableException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 141
    .end local v0    # "ipAddress":Ljava/lang/String;
    .end local v1    # "name":Ljava/lang/String;
    .end local p1    # "properties":Ljava/util/Properties;
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p1
.end method

.method public getPathName()Ljava/lang/String;
    .locals 1

    .line 245
    iget-object v0, p0, Landroid/javax/sip/SipFactory;->pathName:Ljava/lang/String;

    return-object v0
.end method

.method public resetFactory()V
    .locals 1

    .line 258
    iget-object v0, p0, Landroid/javax/sip/SipFactory;->sipStackList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 259
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/javax/sip/SipFactory;->messageFactory:Landroid/javax/sip/message/MessageFactory;

    .line 260
    iput-object v0, p0, Landroid/javax/sip/SipFactory;->headerFactory:Landroid/javax/sip/header/HeaderFactory;

    .line 261
    iput-object v0, p0, Landroid/javax/sip/SipFactory;->addressFactory:Landroid/javax/sip/address/AddressFactory;

    .line 262
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Landroid/javax/sip/SipFactory;->sipStackByName:Ljava/util/Hashtable;

    .line 263
    const-string/jumbo v0, "gov.nist"

    iput-object v0, p0, Landroid/javax/sip/SipFactory;->pathName:Ljava/lang/String;

    .line 264
    return-void
.end method

.method public setPathName(Ljava/lang/String;)V
    .locals 0
    .param p1, "pathName"    # Ljava/lang/String;

    .line 231
    iput-object p1, p0, Landroid/javax/sip/SipFactory;->pathName:Ljava/lang/String;

    .line 232
    return-void
.end method
