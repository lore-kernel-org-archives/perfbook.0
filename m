Return-Path: <SRS0=6f8h=AU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682809535; x=1685401535;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1OgSgHPMNMfKxRz+JrCiYw9Y0hNElOo4Gr4KQuHyNUQ=;
        b=hqGz/LbzV8aBw1JxVADpGa8pgFaNTDNMqs+rEALHUfVHGbvopfaICaCMOPEe8uOK17
         /VguJDaOVoonBViT+SNMUOm/1Z/ps52S0bE9jpDXk4EmWInsHoL35TNGPN26TtRcEvnv
         lFzMhjvSlCcXNhuD0y9bJNnojbkZ31KjBe/91zpZ7OHjvYhKpBxECAXNoHqn+dCcR35Z
         IpCf2xseOXaXlYLAKR8LTrq7mSIL5AoSY2spHP4D6QLuU37amSvIWFWtWW70sD+p513w
         G2CjDmaabmS986Y4UiZGdSFamDq8biuLZoeKeW1P4T+aU1aum0SgIAIDkVhQSySTIaqu
         X0Ag==
Message-ID: <8e1a521a-7d95-ebf6-e783-6a15c01a43a5@gmail.com>
Date: Sun, 30 Apr 2023 08:05:30 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 1/7] formal/spinhint: Don't use \qco{} for long
 message
Content-Language: en-US
References: <2403fec1-1f05-c8ee-92cd-0350f9714f18@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2403fec1-1f05-c8ee-92cd-0350f9714f18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

\qco{} is intended to be used for short snippets and suppresses line
breaks in its argument by using \nbco{} in its definition.
Commit 88fd12717c61 ("formal/spinhint: Use \qco{} instead of``\co{}''")
applied \qco{} for a long error message.
It causes "Underfull \hbox" of large badness preceding it.

In perfbook-1c.log and perfbook-eb.log:

    Underfull \hbox (badness 10000) in paragraph at lines 277--281
    []\T1/ntxtlf/m/n/10 (+20) If you see a mes-sage from [][][][] say-ing:
     []

In perfbook.log:

    Underfull \hbox (badness 2495) in paragraph at lines 277--281
    []\T1/ntxtlf/m/n/10 (+20) If you see a mes-sage from [][][][] say-ing:
     []

Revert the change and permit line breaks in the middle of the quoted
message.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj38.park@gmail.com>
---
 formal/spinhint.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 9bb5f5749470..16764aef8620 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -275,7 +275,7 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 	10.5\,GB of memory even with the \co{-DCOLLAPSE} flag.
 
 	If you see a message from \co{./pan} saying:
-	\qco{error: max search depth too small}, you need to increase
+	``\co{error: max search depth too small}'', you need to increase
 	the maximum depth by a \co{-mN} option for a complete search.
 	The default is \co{-m10000}.
 
-- 
2.25.1


