.class public final enum Landroid/gov/nist/javax/sip/stack/ClientAuthType;
.super Ljava/lang/Enum;
.source "ClientAuthType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroid/gov/nist/javax/sip/stack/ClientAuthType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/gov/nist/javax/sip/stack/ClientAuthType;

.field public static final enum Default:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

.field public static final enum Disabled:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

.field public static final enum DisabledAll:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

.field public static final enum Enabled:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

.field public static final enum Want:Landroid/gov/nist/javax/sip/stack/ClientAuthType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 33
    new-instance v0, Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    const-string v1, "Enabled"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/ClientAuthType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Enabled:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    new-instance v0, Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    const-string v1, "Disabled"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/ClientAuthType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Disabled:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    new-instance v0, Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    const-string v1, "DisabledAll"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/ClientAuthType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->DisabledAll:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    new-instance v0, Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    const-string/jumbo v1, "Want"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/ClientAuthType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Want:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    new-instance v0, Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    const-string v1, "Default"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/ClientAuthType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Default:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    .line 32
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Enabled:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    sget-object v1, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Disabled:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    sget-object v2, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->DisabledAll:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    sget-object v3, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Want:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    sget-object v4, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->Default:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    filled-new-array {v0, v1, v2, v3, v4}, [Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->$VALUES:[Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/ClientAuthType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 32
    const-class v0, Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    return-object v0
.end method

.method public static values()[Landroid/gov/nist/javax/sip/stack/ClientAuthType;
    .locals 1

    .line 32
    sget-object v0, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->$VALUES:[Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    invoke-virtual {v0}, [Landroid/gov/nist/javax/sip/stack/ClientAuthType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    return-object v0
.end method
