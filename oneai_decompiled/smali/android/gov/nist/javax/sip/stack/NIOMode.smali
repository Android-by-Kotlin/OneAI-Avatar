.class public final enum Landroid/gov/nist/javax/sip/stack/NIOMode;
.super Ljava/lang/Enum;
.source "NIOMode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroid/gov/nist/javax/sip/stack/NIOMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/gov/nist/javax/sip/stack/NIOMode;

.field public static final enum BLOCKING:Landroid/gov/nist/javax/sip/stack/NIOMode;

.field public static final enum NONBLOCKING:Landroid/gov/nist/javax/sip/stack/NIOMode;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 4
    new-instance v0, Landroid/gov/nist/javax/sip/stack/NIOMode;

    const-string v1, "BLOCKING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/NIOMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/NIOMode;->BLOCKING:Landroid/gov/nist/javax/sip/stack/NIOMode;

    new-instance v0, Landroid/gov/nist/javax/sip/stack/NIOMode;

    const-string v1, "NONBLOCKING"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/NIOMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/NIOMode;->NONBLOCKING:Landroid/gov/nist/javax/sip/stack/NIOMode;

    .line 3
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOMode;->BLOCKING:Landroid/gov/nist/javax/sip/stack/NIOMode;

    sget-object v1, Landroid/gov/nist/javax/sip/stack/NIOMode;->NONBLOCKING:Landroid/gov/nist/javax/sip/stack/NIOMode;

    filled-new-array {v0, v1}, [Landroid/gov/nist/javax/sip/stack/NIOMode;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/NIOMode;->$VALUES:[Landroid/gov/nist/javax/sip/stack/NIOMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/NIOMode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 3
    const-class v0, Landroid/gov/nist/javax/sip/stack/NIOMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/NIOMode;

    return-object v0
.end method

.method public static values()[Landroid/gov/nist/javax/sip/stack/NIOMode;
    .locals 1

    .line 3
    sget-object v0, Landroid/gov/nist/javax/sip/stack/NIOMode;->$VALUES:[Landroid/gov/nist/javax/sip/stack/NIOMode;

    invoke-virtual {v0}, [Landroid/gov/nist/javax/sip/stack/NIOMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/gov/nist/javax/sip/stack/NIOMode;

    return-object v0
.end method
