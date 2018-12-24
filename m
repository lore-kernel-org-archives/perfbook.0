Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DQjmkmNcLUTEr7VP9637z320xay5NKSRMxUc1joBSUs=;
        b=IHG90lkbghZmxLdIvPNz6qFC9wKZvXrrDGd106nPipFslPkPVomdsrioMs6wNo8pbW
         v0KuMj3SB6un32bJEGttDEy3wNETwrPYFfv2ddY8KfDGYrbPrx5WoxJPCz9btwGkZQqA
         HCQoO1Cz5E4sxy7XXVszllNQ+qYlqhE6cILNr+09k9xtp8izFrJoltL6WCsN9C/HJozJ
         Az8qmYXv7CbpOomu4/zjtc8P3Ci2aIS7v70CEYesm41O9PJfCHGgEW6sdGed67BpytXG
         XPTQCK94/XanymgY0Ni1tTw9vQ6Z230gzRDejjWMi6yP9NfnPLctMa/g1IDqoKLBeKKV
         f3Pg==
Subject: [PATCH 10/11] Use wider tabsize for snippet in 'listing*'
References: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7d7c1650-ee2b-b207-f65b-b7fc4af72bf7@gmail.com>
Date: Tue, 25 Dec 2018 00:04:53 +0900
MIME-Version: 1.0
In-Reply-To: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From deac40976c6104677a6ede3b13f8aa4361ecabbd Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 23 Dec 2018 23:46:38 +0900
Subject: [PATCH 10/11] Use wider tabsize for snippet in 'listing*'

tabsize=6 looks good for this particular listing.
tabsize=8 is too wide for 1c layout.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/datastruct/hash/hash_resize.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
index 285075e..662bb90 100644
--- a/CodeSamples/datastruct/hash/hash_resize.c
+++ b/CodeSamples/datastruct/hash/hash_resize.c
@@ -262,7 +262,7 @@ void hashtab_del(struct hashtab *htp_master,		//\lnlbl{del:b}
 }							//\lnlbl{del:e}
 //\end{snippet}
 
-//\begin{snippet}[labelbase=ln:datastruct:hash_resize:resize,commandchars=\\\@\$]
+//\begin{snippet}[labelbase=ln:datastruct:hash_resize:resize,commandchars=\\\@\$,tabsize=6]
 /* Resize a hash table. */
 int hashtab_resize(struct hashtab *htp_master,
                    unsigned long nbuckets, void *hash_private,
-- 
2.7.4


