.class Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;
.super Ljava/lang/Object;
.source "CredentialsCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache$TimeoutTask;
    }
.end annotation


# instance fields
.field private authorizationHeaders:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Landroid/javax/sip/header/AuthorizationHeader;",
            ">;>;"
        }
    .end annotation
.end field

.field private timer:Landroid/gov/nist/javax/sip/stack/timers/SipTimer;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/timers/SipTimer;)V
    .locals 1
    .param p1, "timer"    # Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;->authorizationHeaders:Ljava/util/concurrent/ConcurrentHashMap;

    .line 57
    iput-object p1, p0, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;->timer:Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    .line 58
    return-void
.end method

.method static synthetic access$000(Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1
    .param p0, "x0"    # Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;

    .line 21
    iget-object v0, p0, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;->authorizationHeaders:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method


# virtual methods
.method cacheAuthorizationHeader(Ljava/lang/String;Landroid/javax/sip/header/AuthorizationHeader;I)V
    .locals 6
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "authorization"    # Landroid/javax/sip/header/AuthorizationHeader;
    .param p3, "cacheTime"    # I

    .line 71
    invoke-interface {p2}, Landroid/javax/sip/header/AuthorizationHeader;->getUsername()Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "user":Ljava/lang/String;
    if-eqz p1, :cond_5

    .line 73
    if-eqz p2, :cond_4

    .line 75
    iget-object v1, p0, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;->authorizationHeaders:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 76
    .local v1, "authHeaders":Ljava/util/List;, "Ljava/util/List<Landroid/javax/sip/header/AuthorizationHeader;>;"
    if-nez v1, :cond_0

    .line 77
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    move-object v1, v2

    .line 78
    iget-object v2, p0, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;->authorizationHeaders:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 80
    :cond_0
    invoke-interface {p2}, Landroid/javax/sip/header/AuthorizationHeader;->getRealm()Ljava/lang/String;

    move-result-object v2

    .line 81
    .local v2, "realm":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v3

    .local v3, "li":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/javax/sip/header/AuthorizationHeader;>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/ListIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 82
    invoke-interface {v3}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/javax/sip/header/AuthorizationHeader;

    .line 83
    .local v4, "authHeader":Landroid/javax/sip/header/AuthorizationHeader;
    invoke-interface {v4}, Landroid/javax/sip/header/AuthorizationHeader;->getRealm()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 84
    invoke-interface {v3}, Ljava/util/ListIterator;->remove()V

    .line 86
    .end local v4    # "authHeader":Landroid/javax/sip/header/AuthorizationHeader;
    :cond_1
    goto :goto_0

    .line 89
    .end local v2    # "realm":Ljava/lang/String;
    .end local v3    # "li":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/javax/sip/header/AuthorizationHeader;>;"
    :cond_2
    :goto_1
    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    new-instance v2, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache$TimeoutTask;

    invoke-direct {v2, p0, p1, v0}, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache$TimeoutTask;-><init>(Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .local v2, "timeoutTask":Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache$TimeoutTask;
    const/4 v3, -0x1

    if-eq p3, v3, :cond_3

    .line 93
    iget-object v3, p0, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;->timer:Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    mul-int/lit16 v4, p3, 0x3e8

    int-to-long v4, v4

    invoke-interface {v3, v2, v4, v5}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    .line 96
    :cond_3
    return-void

    .line 73
    .end local v1    # "authHeaders":Ljava/util/List;, "Ljava/util/List<Landroid/javax/sip/header/AuthorizationHeader;>;"
    .end local v2    # "timeoutTask":Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache$TimeoutTask;
    :cond_4
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Null authorization domain"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 72
    :cond_5
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Call ID is null!"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method getCachedAuthorizationHeaders(Ljava/lang/String;)Ljava/util/Collection;
    .locals 2
    .param p1, "callid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection<",
            "Landroid/javax/sip/header/AuthorizationHeader;",
            ">;"
        }
    .end annotation

    .line 111
    if-eqz p1, :cond_0

    .line 113
    iget-object v0, p0, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;->authorizationHeaders:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    return-object v0

    .line 112
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null arg!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeAuthenticationHeader(Ljava/lang/String;)V
    .locals 1
    .param p1, "callId"    # Ljava/lang/String;

    .line 123
    iget-object v0, p0, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;->authorizationHeaders:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    return-void
.end method
