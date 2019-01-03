Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0ibAHU5yRrq4SJSJYaA3qzDQviAY8bxLop+dnDlzzDo=;
 b=u0695zrzh+P4TWSfh+yEPmWAhfiKAckUDn+Etk7VC9LwMoGcevcPXBCcnx1za8Cv97
 wC0Xrtmxwg+SE8l+qjB4UdVDiPs2Y+qwqiKuFblkjbX5D0t3azKyTM3dbQW8o2ck/yjA
 axptWsfY/aN5Mdd3dGQQq0frKKmaJ02esEAo/nL+KOvq/esxzlx/QXwusUd/weFJmfhe
 mtK0SPCdi8oJehjoZvIXvOVBtZcNWWzi4OMD3o9zD4hjONts4jTXO6p0knkHv+ab8PfW
 7KgB9G5bSfcTBYBt/3W9xQO+z3GWexLIOVxTOM2k+isIzRUNRi7RnAzSiWXwSDjxm0tX
 PTIQ==
References: <1e5209af-3c37-fb23-6c95-e3103b211076@gmail.com>
 <5a07540a-7bf0-e0fc-9a02-9eb2314506d6@gmail.com>
 <20181226150018.GY4170@linux.ibm.com>
 <d7db020f-b296-97b6-3c2c-5ff31ca142ab@gmail.com>
 <c80b3564-ce7c-8ebe-23a4-6cf6d584dfa0@gmail.com>
 <20181231210307.GU4170@linux.ibm.com>
 <6ebd05a2-62be-478f-ab47-78862824072e@gmail.com>
 <20190101180025.GY4170@linux.ibm.com>
 <3fa9dcca-14d0-876d-fdcb-5db7eff3a97b@gmail.com>
 <20190102171848.GA4170@linux.ibm.com> <20190102191822.GA30360@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] datastruct/hash: Tweak appearance of updated code in snippet
Message-ID: <a9847c9c-a7ca-5bf7-6936-7a68203c4fd2@gmail.com>
Date: Fri, 4 Jan 2019 00:57:06 +0900
MIME-Version: 1.0
In-Reply-To: <20190102191822.GA30360@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ae50debbf06ad674e4941b55764b02c776484509 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 4 Jan 2019 00:19:26 +0900
Subject: [PATCH] datastruct/hash: Tweak appearance of updated code in snippet

Now that "[" and "]" are used within the code, "commandchars" should
avoid them.

Also wrap a line which has become too wide for the 2c layout.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I'm in the middle of reading the updated code.

I'm sure you are working on the update of Section 10.4.2.
Because of the code change, there are quite a few broken refs
and duplicated labels at the moment.

This commit just takes care of the vanishing "[" and "]" in
Listing 10.11.

Fixing labels is left for your update.

        Thanks, Akira
--
 CodeSamples/datastruct/hash/hash_resize.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
index bb0a6f4..7392455 100644
--- a/CodeSamples/datastruct/hash/hash_resize.c
+++ b/CodeSamples/datastruct/hash/hash_resize.c
@@ -154,10 +154,11 @@ static void hashtab_unlock_lookup(struct hashtab *htp_master, void *key)
 	rcu_read_unlock();
 }

-//\begin{snippet}[labelbase=ln:datastruct:hash_resize:lock_unlock_mod,commandchars=\\\[\]]
+//\begin{snippet}[labelbase=ln:datastruct:hash_resize:lock_unlock_mod,commandchars=\\\@\$]
 /* Update-side lock/unlock functions. */
 static void						//\lnlbl{lock:b}
-resize_lock_mod(struct hashtab *htp_master, void *key, struct ht_bucket *ls[2])
+resize_lock_mod(struct hashtab *htp_master, void *key,
+                struct ht_bucket *ls[2])
 {
 	long b;
 	struct ht *htp;
-- 
2.7.4


