Return-Path: <SRS0=y49c=M5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=CQ51X8R8dxgy9vva4BNsIvJd/Pa1xdHdNc4Rk4iUH2U=;
        b=LE8+gKxMkqSC/dn0IZjebdCI0H7BGsK9o44QwDC1VVIvzKP5O8534ORPFJ3sx7TAvq
         LuAtVadKu4rktQ98WT69kfHjCAepAYoIYUB+EaHumlqz26IU76Kp5el+txD/iejMJkx2
         oHid5SkQbin8f2XaLT6jNwON3uhJfD9igjINH5b+/TJTnVpJvWx/cWZ3LORuwhzo+wq1
         UCM0Idx5QIYFyICoymruAd7ao4g4KWYuTBPH3TatMXhNfQjal01aRz1ahCWRbPmgIuLA
         ffa4Qaq1WBGfZbcQR3Oq4RP/iIq1csmSb8yES7MwoVQG/4IlC8ACdZiy++RJNNZD7nDM
         jQVg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] datastruct: Allow 'breaklines' in hash_resize() for
 ebook-size builds
Message-ID: <f04cd86d-59d0-93ea-dfdf-a617dba03950@gmail.com>
Date: Fri, 6 Aug 2021 11:44:21 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Balbir Singh <bsingharora@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This code snippet already has the special tabsize of 6 for 1c and 2c builds.
However, it is too wide for ebook-size builds.
As a workaround, add "breaklines=true" in the option list and permit folding
of long lines.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Balbir Singh <bsingharora@gmail.com>
---
 CodeSamples/datastruct/hash/hash_resize.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
index 6e450e3c..d084264f 100644
--- a/CodeSamples/datastruct/hash/hash_resize.c
+++ b/CodeSamples/datastruct/hash/hash_resize.c
@@ -276,7 +276,7 @@ void hashtab_del(struct ht_elem *htep,			//\lnlbl{del:b}
 }							//\lnlbl{del:e}
 //\end{snippet}
 
-//\begin{snippet}[labelbase=ln:datastruct:hash_resize:resize,commandchars=\\\@\$,tabsize=6]
+//\begin{snippet}[labelbase=ln:datastruct:hash_resize:resize,commandchars=\\\@\$,tabsize=6,breaklines=true]
 /* Resize a hash table. */
 int hashtab_resize(struct hashtab *htp_master,
                    unsigned long nbuckets,
-- 
2.17.1


