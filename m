Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5t4qteU2gvIfhTq2SuVyFe5FC03e8zuog9IJJ3lDomU=;
 b=Xp02IKDbky6ugwcgs3ohd78XrBk/0eXaIzXfkyAqWIIGcxmiHD4bM1+mZevFPCkbkU
 x/SJmo7VxEWzLRNW7UGislM/5+cPGYf65Ix86SW99BFzZrMJwHerFaELcW7RV3iF2mMg
 kzRFB211iRz35DaI6i88tFlAE/aA6eiwNHXQN1HJJlfe0a3Ds7JEpTnwnaDLX3fY/hls
 LwSXtCnRAt6Wcpfa4j2eg4pGhok2xm8PnZM25usJjaAoLVv3vY4TKAmt7+e43fY0H8K3
 YMMt6ojnUcAInyUkErkudfkvctCzz/9/k1GQIiMFdZBUZaupJ8Q7AZrKzYRYH5kRX148
 fZMw==
Subject: [PATCH 1/3] hyphen2endash.sh: Add patterns for 'nn-mm days' and
 'nn-mm sheets'
References: <2495dd31-1b4c-99e2-46aa-dc55671007ff@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2d2364ff-c8c9-40ab-62d3-a116700ff022@gmail.com>
Date: Sat, 4 Nov 2017 10:39:42 +0900
MIME-Version: 1.0
In-Reply-To: <2495dd31-1b4c-99e2-46aa-dc55671007ff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 844896af3fefe18c0e4dd32bdf6be2c9d8a776f8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 2 Nov 2017 22:42:14 +0900
Subject: [PATCH 1/3] hyphen2endash.sh: Add patterns for 'nn-mm days' and 'nn-mm sheets'

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/hyphen2endash.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utilities/hyphen2endash.sh b/utilities/hyphen2endash.sh
index 29e3896..1586804 100644
--- a/utilities/hyphen2endash.sh
+++ b/utilities/hyphen2endash.sh
@@ -23,6 +23,10 @@
 # nn-mm~microsecond -> nn--mm~microsecond
 # nn-mm~millisecond -> nn--mm~millisecond
 # nn-mm~\emp -> nn--mm~\emp
+# nn-mm days -> nn--mm~days
+# nn-mm~days -> nn--mm~days
+# nn-mm sheets -> nn--mm~sheets
+# nn-mm~sheets -> nn--mm~sheets
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -54,6 +58,8 @@ cat $1 |
 	    -e 's/\([0-9]\+\)-\([0-9]\+\)~microsecond/\1--\2~microsecond/g' \
 	    -e 's/\([0-9]\+\)-\([0-9]\+\)~millisecond/\1--\2~millisecond/g' \
 	    -e 's/\([0-9]\+\)-\([0-9]\+\)~\\emp/\1--\2~\\emp/g' \
+	    -e 's/\([0-9]\+\)-\([0-9]\+\)[ ~]days/\1--\2~days/g' \
+	    -e 's/\([0-9]\+\)-\([0-9]\+\)[ ~]sheets/\1--\2~sheets/g' \
 	    -e 's/\/\* Lines~\([0-9]\+\)--\([0-9]\+\) \*\//\/\* Lines \1-\2 \*\//g'

 # Last pattern is to preserve "Lines n-m" in comments within code snippet
-- 
2.7.4


