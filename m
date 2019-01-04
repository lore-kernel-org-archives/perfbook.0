Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Hku/D19VhsUG5QzHZeZjbrrvPIOJgGZwqHaF3W/cEWM=;
        b=bLzBuwF+VmNlZyqG/7m+9ItLuppCH3th1LnES7BJX8dXpHBvCqeSCdRdwNfTo3iR1O
         W0Ov16qYmWLyAT+3u/x2n/hrgck7BTV4p62czbl4rCRKsWNFPhPfzqZoHF9dt05UPk+7
         3imN3BaoVMYyxoNJzS7/pLlEBjmbRP3W6XyWTCFCpBfVPm7SLVkESfsvbUETlBEVGURi
         Bu0J9I36dmFh0VQZw9h5lRH4tuSFBnPwQuINkKbm/vFFuTYzzBlyubE7hoXUp0f/rIKT
         Ucc37Mrehmyv4KZeIv6KjZ/nGWjSbEpwfE53PKAMDR6OOJqPjFvX09D4VQRFDOO+ZgZq
         fAcQ==
Subject: [PATCH 1/2] datastruct/hash: Tweak indent of folded line in snippet
References: <20181226150018.GY4170@linux.ibm.com>
 <d7db020f-b296-97b6-3c2c-5ff31ca142ab@gmail.com>
 <c80b3564-ce7c-8ebe-23a4-6cf6d584dfa0@gmail.com>
 <20181231210307.GU4170@linux.ibm.com>
 <6ebd05a2-62be-478f-ab47-78862824072e@gmail.com>
 <20190101180025.GY4170@linux.ibm.com>
 <3fa9dcca-14d0-876d-fdcb-5db7eff3a97b@gmail.com>
 <20190102171848.GA4170@linux.ibm.com> <20190102191822.GA30360@linux.ibm.com>
 <a9847c9c-a7ca-5bf7-6936-7a68203c4fd2@gmail.com>
 <20190103172145.GG4170@linux.ibm.com>
 <69a2dffb-056c-29e3-fdfb-df61b705d416@gmail.com>
 <faebf12a-02f1-df23-574c-8efe0385038c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <175d530e-1ec5-abed-a07f-209eba35e048@gmail.com>
Date: Sat, 5 Jan 2019 00:39:56 +0900
MIME-Version: 1.0
In-Reply-To: <faebf12a-02f1-df23-574c-8efe0385038c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 426fa84ef7b5c6d0200dbd79d213e02ae31badad Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 4 Jan 2019 23:40:14 +0900
Subject: [PATCH 1/2] datastruct/hash: Tweak indent of folded line in snippet

For a folded line to be properly indented in the Listing environment,
it has to have the same number of tab characters as the previous
line in the code. If the folded line has a deeper indent to align
with some construct of the previous line, remaining indent depth
should be represented by space characters.

Apply this rule to the function prototype of resize_lock_mod().
In this case, as the previous line doesn't have any tab characters,
space characters should be used for all of its indent.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/datastruct/hash/hash_resize.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
index 475a2ab..57c75c1 100644
--- a/CodeSamples/datastruct/hash/hash_resize.c
+++ b/CodeSamples/datastruct/hash/hash_resize.c
@@ -163,7 +163,7 @@ static void hashtab_unlock_lookup(struct hashtab *htp_master, void *key)
 /* Update-side lock/unlock functions. */
 static void						//\lnlbl{lock:b}
 resize_lock_mod(struct hashtab *htp_master, void *key,
-		struct ht_lock_state *lsp)
+                struct ht_lock_state *lsp)
 {
 	long b;
 	struct ht *htp;
-- 
2.7.4


