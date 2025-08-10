.class Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache$TimeoutTask;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "CredentialsCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TimeoutTask"
.end annotation


# instance fields
.field callId:Ljava/lang/String;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;

.field userName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p2, "userName"    # Ljava/lang/String;
    .param p3, "callId"    # Ljava/lang/String;

    .line 37
    iput-object p1, p0, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache$TimeoutTask;->this$0:Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 38
    iput-object p3, p0, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache$TimeoutTask;->callId:Ljava/lang/String;

    .line 39
    iput-object p2, p0, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache$TimeoutTask;->userName:Ljava/lang/String;

    .line 40
    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 1

    .line 44
    const/4 v0, 0x0

    return-object v0
.end method

.method public runTask()V
    .locals 2

    .line 48
    iget-object v0, p0, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache$TimeoutTask;->this$0:Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;

    invoke-static {v0}, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;->access$000(Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache$TimeoutTask;->callId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    return-void
.end method
